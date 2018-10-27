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

in_files = glob([
  'include/**/*.in', 
  'crypto/**/*.in', 
  'tools/**/*.in', 
])

def configure(platform): 
  name = clean('configure-' + platform)
  genrule(
    name = name, 
    out = 'out', 
    srcs = in_files + glob([
      '*.h', 
      '*.pm', 
      '*.info', 
      'Configure', 
      'apps/**/*.info', 
      'crypto/**/*.info', 
      'Configurations/**/*.conf', 
      'Configurations/**/*.tmpl', 
      'Configurations/**/*.pl', 
      'Configurations/**/*.pm', 
      'engines/**/*.pl', 
      'engines/**/*.info', 
      'fuzz/**/*.info', 
      'include/**/*.info', 
      'include/openssl/opensslv.h', 
      'util/**/*.pl', 
      'util/**/*.pm', 
      'ssl/**/*.info', 
      'external/**/*.pm', 
      'tools/**/*.info', 
    ]), 
    cmd = ' && '.join([
      'DEVELOPER_DIR="' + xcode_developer_dir + '"', # Set XCode developer directory
      'mkdir -p $OUT', 
      'cp -r $SRCDIR/. $TMP', 
      'cd $TMP', 
      './Configure shared ' + platform, 
    ] + [ 
      'perl "-I." -Mconfigdata "util/dofile.pl" "-oMakefile" ' + x + ' > ' + splitext(x)[0] for x in in_files 
    ] + [ 
      'mkdir -p $OUT/' + dirname(x) + ' && cp $TMP/' + splitext(x)[0] + ' $OUT/' + splitext(x)[0] for x in in_files 
    ] + [
      'perl util/mkbuildinf.pl "compiler: gcc" "' + platform + '" > crypto/buildinf.h', 
      'cp $TMP/crypto/buildinf.h $OUT/crypto/buildinf.h', 
    ]), 
  )
  return ':' + name

configure_linux = configure('linux-x86_64')

def opensslconf(configure):
  name = clean('opensslconf-' + configure)
  prebuilt_cxx_library(
    name = name, 
    header_namespace = '', 
    header_only = True, 
    exported_headers = {
      'openssl/opensslconf.h': extract(configure, 'include/openssl/opensslconf.h'),
    }
  )
  return ':' + name

def crypto_headers(configure):
  return {
    'crypto/buildinf.h': extract(configure, 'crypto/buildinf.h'), 
    'crypto/include/internal/bn_conf.h': extract(configure, 'crypto/include/internal/bn_conf.h'), 
    'crypto/include/internal/dso_conf.h': extract(configure, 'crypto/include/internal/dso_conf.h'), 
  }

cxx_library(
  name = 'crypto',
  header_namespace = '',
  compiler_flags = [
    "-fPIC", 
    "-m64", 
  ],
  preprocessor_flags = [
    "-DNDEBUG", 
    "-DOPENSSL_USE_NODELETE", 
    "-DL_ENDIAN", 
    "-DOPENSSL_PIC",
    '-DOPENSSLDIR="' + openssl_dir + '"',
    '-DENGINESDIR="' + engines_dir + '"',
  ],
  platform_headers = [
    ('^linux.*', crypto_headers(configure_linux))
  ], 
  headers = subdir_glob([
    ("", "*.h"),
    ("include", "**/*.h"),
    ("include/internal", "**/*.h"),
    ("crypto/include", "**/*.h"),
    ("crypto", "**/*.h"),
    ("crypto", "**/*.c"),
    ("crypto/ec/curve448/arch_32", "**/*.h"),
    ("crypto/ec/curve448", "**/*.h"),
    ("crypto/modes", "**/*.h"),
  ]), 
  srcs = glob([
    "crypto/**/*.c", 
  ], excludes = [
    "crypto/aes/aes_x86core.c", 
    "crypto/armcap.c","crypto/bn/asm/x86_64-gcc.c","crypto/bn/rsaz_exp.c", 
    "crypto/des/ncbc_enc.c","crypto/dllmain.c","crypto/ec/ecp_nistz256_table.c", 
    "crypto/ec/ecp_nistz256.c","crypto/engine/eng_devcrypto.c","crypto/LPdir_nyi.c", 
    "crypto/LPdir_unix.c","crypto/LPdir_vms.c","crypto/LPdir_win.c", 
    "crypto/LPdir_win32.c","crypto/LPdir_wince.c","crypto/md2/md2_dgst.c", 
    "crypto/md2/md2_one.c","crypto/poly1305/poly1305_base2_44.c", 
    "crypto/poly1305/poly1305_ieee754.c","crypto/ppccap.c","crypto/rc5/rc5_ecb.c", 
    "crypto/rc5/rc5_enc.c","crypto/rc5/rc5_skey.c","crypto/rc5/rc5cfb64.c", 
    "crypto/rc5/rc5ofb64.c","crypto/s390xcap.c","crypto/sparcv9cap.c"
  ]),
  linker_flags = [
    "-Wl,-znodelete", 
    "-Wl,-Bsymbolic", 
  ],
  exported_linker_flags = [
    "-pthread", 
    "-ldl", 
  ],
  platform_deps = [
    # ('linux.*', [ generated_headers_linux ]), 
  ], 
  visibility = [
    'PUBLIC', 
  ], 
)

linux_preprocessor_flags = [
  "-DOPENSSL_USE_NODELETE",
  "-DL_ENDIAN","-DOPENSSL_PIC",
  "-DOPENSSL_CPUID_OBJ",
  "-DOPENSSL_IA32_SSE2","-DOPENSSL_BN_ASM_MONT",
  "-DOPENSSL_BN_ASM_MONT5","-DOPENSSL_BN_ASM_GF2m",
  "-DSHA1_ASM","-DSHA256_ASM",
  "-DSHA512_ASM","-DKECCAK1600_ASM","-DRC4_ASM","-DMD5_ASM",
  "-DAES_ASM",
  "-DVPAES_ASM","-DBSAES_ASM","-DGHASH_ASM",
  "-DECP_NISTZ256_ASM","-DX25519_ASM",
  "-DPADLOCK_ASM","-DPOLY1305_ASM",
]

cxx_library(
  name = 'ssl',
  header_namespace = '',
  compiler_flags = ["-fPIC","-m64"],
  preprocessor_flags = [
    "-DNDEBUG", 
    '-DOPENSSLDIR="' + openssl_dir + '"',
    '-DENGINESDIR="' + engines_dir + '"',
  ], 
  platform_preprocessor_flags = [
    ('linux.*', linux_preprocessor_flags), 
  ],
  headers = subdir_glob([
    ('', '*.h'),
    ('', 'ssl/**/*.h'),
    ('include', '**/*.h'),
  ]), 
  srcs = glob([
    'ssl/**/*.c', 
  ]),
  linker_flags = [
    "-Wl,-znodelete",
    "-Wl,-Bsymbolic",
    "-Wa,--noexecstack", 
  ],
  exported_linker_flags = [
    "-pthread",
    "-ldl", 
  ],
  deps = [
    ":crypto", 
  ],
  visibility = [
    'PUBLIC', 
  ]
)

cxx_library(
  name = 'openssl', 
  header_namespace = '', 
  exported_headers = subdir_glob([
    ('include', 'openssl/**/*.h'), 
  ]), 
  deps = [
    ':crypto', 
    ':ssl', 
  ], 
  platform_deps = [
    ('linux.*', [ opensslconf(configure_linux) ]), 
  ], 
  visibility = [
    'PUBLIC', 
  ], 
)
