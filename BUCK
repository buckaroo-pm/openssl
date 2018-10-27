from os.path import basename
from os.path import splitext
from os.path import dirname
from hashlib import sha256
import re

def merge_dicts(x, y):
  z = x.copy()
  z.update(y)
  return z

def extract(rule, path):
  name = clean('extract-' + rule + '-' + path)
  genrule(
    name = name,
    out = basename(path),
    cmd = 'cp $(location ' + rule + ')/' + path + ' $OUT',
  )
  return ':' + name

def clean(x):
  return re.sub(r'[:_+\.\/\\]', '-', x.lower()).replace('--', '-')

openssl_dir = read_config('openssl', 'openssl_dir', '/usr/local/ssl')
engines_dir = read_config('openssl', 'engines_dir', '/usr/local/lib/engines-1.1')

xcode_developer_dir = read_config('apple', 'xcode_developer_dir', '/Applications/Xcode.app/Contents/Developer')

def configdata(platform): 
  name = clean('configdata-pm-' + platform)
  genrule(
    name = name, 
    out = 'configdata.pm', 
    srcs = glob([
      '*.info', 
      'Configure', 
      'Configurations/**/*.pl', 
      'Configurations/**/*.conf', 
      'Configurations/**/*.tmpl', 
      'external/**/*.pm', 
      'include/openssl/opensslv.h', 
      'util/**/*.pl', 
      'util/**/*.pm', 
    ]), 
    cmd = ' && '.join([
      'cd $TMP', 
      '$SRCDIR/Configure shared no-asm no-tests no-engine no-deprecated ' + platform, 
      'cp configdata.pm $OUT', 
    ])
  )
  return ':' + name

def buildinf(platform): 
  name = clean('gen-crypto-buildinf-h-' + platform)
  genrule(
    name = name, 
    out = 'buildinf.h', 
    srcs = [
      'util/mkbuildinf.pl', 
    ],
    cmd = 'perl $SRCDIR/util/mkbuildinf.pl \'Buck\' ' + platform + ' > $OUT', 
  )
  return ':' + name

genrule(
  name = 'buildinf-h', 
  out = 'buildinf.h', 
  srcs = [
    'util/mkbuildinf.pl', 
  ],
  cmd = 'perl $SRCDIR/util/mkbuildinf.pl \'Buck\' \'Buck\' > $OUT', 
)

def opensslconf_h(configdata):
  name = clean('opensslconf-h-' + configdata)
  genrule(
    name = name, 
    out = 'opensslconf.h', 
    srcs = glob([
      'external/perl/**/*.pm',
      'external/perl/**/*.in',
      'external/perl/**/*.pl',
      'include/openssl/*.pm',
      'include/openssl/*.in',
      'include/openssl/*.pl',
      'util/**/*.pm',
      'util/**/*.pl',
      '*.pm', 
      '*.in', 
      '*.pl',
    ]), 
    cmd = ' && '.join([
      'cp -r $SRCDIR/. $TMP', 
      'cd $TMP', 
      'cp $(location ' + configdata + ') configdata.pm', 
      'perl -I. -Mconfigdata util/dofile.pl -oMakefile include/openssl/opensslconf.h.in > $OUT', 
    ]), 
  )
  return ':' + name

def opensslconf(configdata):
  name = clean('opensslconf-' + configdata)
  prebuilt_cxx_library(
    name = name, 
    header_namespace = 'openssl', 
    header_only = True, 
    exported_headers = {
      'opensslconf.h': opensslconf_h(y), 
    }, 
  )
  return ':' + name

def bnconf(configdata): 
  name = clean('bn-conf-h-' + configdata) 
  genrule(
    name = name, 
    out = 'bn_conf.h', 
    srcs = glob([
      '*.pm', 
      '*.in', 
      '*.pl', 
      'crypto/include/internal/bn_conf.h.in', 
      'external/**/*.pm', 
      'external/**/*.in', 
      'external/**/*.pl', 
      'util/perl/with_fallback.pm', 
      'util/dofile.pl', 
    ]),
    cmd = ' && '.join([
      'cp -r $SRCDIR/. $TMP', 
      'cd $TMP', 
      'cp $(location ' + configdata + ') configdata.pm', 
      'perl -I. -Mconfigdata util/dofile.pl -oMakefile crypto/include/internal/bn_conf.h.in > $OUT', 
    ]), 
  )
  return ':' + name

def dsoconf(configdata): 
  name = clean('dso-conf-h-' + configdata) 
  genrule(
    name = name, 
    out = 'dso_conf.h', 
    srcs = glob([
      '*.pm', 
      '*.in', 
      '*.pl', 
      'crypto/include/internal/dso_conf.h.in', 
      'external/**/*.pm', 
      'external/**/*.in', 
      'external/**/*.pl', 
      'util/perl/with_fallback.pm', 
      'util/dofile.pl', 
    ]),
    cmd = ' && '.join([
      'cp -r $SRCDIR/. $TMP', 
      'cd $TMP', 
      'cp $(location ' + configdata + ') configdata.pm', 
      'perl -I. -Mconfigdata util/dofile.pl -oMakefile crypto/include/internal/dso_conf.h.in > $OUT', 
    ]), 
  )
  return ':' + name

def crypto_headers(configdata):
  bnconf_platform = bnconf(configdata)
  dsoconf_platform = dsoconf(configdata)
  buildinf = ':buildinf-h'
  name = clean('crypto-headers-' + configdata)
  prebuilt_cxx_library(
    name = name, 
    header_namespace = '', 
    header_only = True, 
    exported_headers = {
      'buildinf.h': buildinf,
      'include/internal/bn_conf.h': dsoconf_platform, 
      'include/internal/dso_conf.h': dsoconf_platform,
      'crypto/buildinf.h': buildinf,
      'crypto/include/internal/dso_conf.h': dsoconf_platform,
      'crypto/include/internal/bn_conf.h': dsoconf_platform, 
      'internal/bn_conf.h': dsoconf_platform,
      'internal/dso_conf.h': dsoconf_platform,
    }, 
  )
  return ':' + name

# Pair of Buck build flavour regex and OpenSSL platform
platforms = [
  ('linux.*', 'linux-x86_64'), 
  ('macos.*', 'darwin64-x86_64-cc'), 
  ('android.*', 'android-x86_64'), 
  ('iphoneos.*', 'ios64-xcrun'), 
  ('iphonesimulator.*', 'iossimulator-xcrun'), 
  ('windows.*', 'VC-WIN64I'), 
  ('nosuchplatform', 'willnotconfigure'), # Used to verify lazyness of platform builds
]

configdatas = [ (x, configdata(y)) for (x, y) in platforms ]
crypto_platform_deps = [ (x, [ opensslconf(y), crypto_headers(y) ]) for (x, y) in configdatas ]
ssl_platform_deps = [ (x, [ ys[0] ]) for (x, ys) in crypto_platform_deps ]

cxx_library(
  name = 'crypto',
  header_namespace = '',
  compiler_flags = [ 
    '-fPIC', 
    '-m64', 
  ],
  preprocessor_flags = [
    '-DOPENSSL_USE_NODELETE', 
    '-DL_ENDIAN', 
    '-DOPENSSL_PIC', 
    '-DOPENSSLDIR="' + openssl_dir + '"', 
    '-DENGINESDIR="' + engines_dir + '"', 
    '-DNDEBUG', 
    '-DOPENSSL_API_COMPAT=0x10100000L', 
  ],
  exported_headers = subdir_glob([
    ('include', '**/*.h'),
  ]),
  headers = subdir_glob([
    ('', '*.h'),
    ('', 'crypto/**/*.h'),
    ('', 'crypto/**/*.c'), 
    ('crypto/ec/curve448', '**/*.h'),
    ('crypto/ec/curve448/arch_32', '**/*.h'),
    ('crypto/modes', '**/*.h'),
    ('crypto/include', '**/*.h'),
  ]),
  srcs = glob([
    'crypto/**/*.c', 
  ], excludes = [
    'crypto/aes/aes_x86core.c','crypto/armcap.c','crypto/bn/asm/x86_64-gcc.c','crypto/bn/rsaz_exp.c',
    'crypto/des/ncbc_enc.c','crypto/dllmain.c','crypto/ec/ecp_nistz256_table.c',
    'crypto/ec/ecp_nistz256.c','crypto/engine/eng_all.c','crypto/engine/eng_cnf.c',
    'crypto/engine/eng_ctrl.c','crypto/engine/eng_devcrypto.c','crypto/engine/eng_dyn.c',
    'crypto/engine/eng_err.c','crypto/engine/eng_fat.c','crypto/engine/eng_init.c',
    'crypto/engine/eng_lib.c','crypto/engine/eng_list.c','crypto/engine/eng_openssl.c',
    'crypto/engine/eng_pkey.c','crypto/engine/eng_rdrand.c','crypto/engine/eng_table.c',
    'crypto/engine/tb_asnmth.c','crypto/engine/tb_cipher.c','crypto/engine/tb_dh.c',
    'crypto/engine/tb_digest.c','crypto/engine/tb_dsa.c','crypto/engine/tb_eckey.c',
    'crypto/engine/tb_pkmeth.c','crypto/engine/tb_rand.c','crypto/engine/tb_rsa.c','crypto/LPdir_nyi.c',
    'crypto/LPdir_unix.c','crypto/LPdir_vms.c','crypto/LPdir_win.c','crypto/LPdir_win32.c',
    'crypto/LPdir_wince.c','crypto/md2/md2_dgst.c','crypto/md2/md2_one.c',
    'crypto/poly1305/poly1305_base2_44.c','crypto/poly1305/poly1305_ieee754.c','crypto/ppccap.c',
    'crypto/rc5/rc5_ecb.c','crypto/rc5/rc5_enc.c','crypto/rc5/rc5_skey.c','crypto/rc5/rc5cfb64.c',
    'crypto/rc5/rc5ofb64.c','crypto/s390xcap.c','crypto/sparcv9cap.c',
  ]),
  linker_flags = [
    '-Wl,-znodelete', 
    '-Wl,-Bsymbolic', 
  ],
  exported_linker_flags = ['-L.','-pthread','-ldl'], 
  platform_deps = crypto_platform_deps, 
  reexport_all_header_dependencies = False, 
  visibility = [
    'PUBLIC', 
  ],
)

cxx_library(
  name = 'ssl',
  header_namespace = '',
  compiler_flags = [
    '-fPIC', 
    '-m64', 
  ],
  preprocessor_flags = [
    '-DOPENSSL_USE_NODELETE', 
    '-DL_ENDIAN', 
    '-DOPENSSL_PIC', 
    '-DOPENSSLDIR="' + openssl_dir + '"', 
    '-DENGINESDIR="' + engines_dir + '"', 
    '-DNDEBUG', 
    '-DOPENSSL_API_COMPAT=0x10100000L', 
  ],
  headers = subdir_glob([
    ('', '*.h'),
    ('', 'ssl/**/*.h'), 
  ]), 
  srcs = glob([
    'ssl/**/*.c', 
  ]), 
  linker_flags = ['-Wl,-znodelete','-Wl,-Bsymbolic'],
  exported_linker_flags = ['-L.','-pthread','-ldl'],
  deps = [
    ':crypto', 
  ],
  platform_deps = ssl_platform_deps, 
  visibility = [
    'PUBLIC', 
  ], 
)

cxx_library(
  name = 'openssl', 
  header_namespace = '', 
  exported_deps = [
    ':crypto', 
    ':ssl', 
  ], 
  visibility = [
    'PUBLIC', 
  ], 
)
