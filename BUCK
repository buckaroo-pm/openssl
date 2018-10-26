from os.path import basename
from os.path import splitext
from os.path import dirname
from hashlib import sha256
import re

def clean(x):
  return re.sub(r'[:_+\.\/\\]', '-', x.lower()).replace('--', '-')

xcode_developer_dir = read_config('apple', 'xcode_developer_dir', '/Applications/Xcode.app/Contents/Developer')

in_files = glob([
  'include/**/*.in', 
  'crypto/**/*.in', 
])

def conf(platform): 
  name = clean('conf-' + platform)
  genrule(
    name = name, 
    out = 'out', 
    srcs = in_files + glob([
      '*.pm', 
      '*.info', 
      'Configure', 
      'Configurations/**/*.conf', 
      'Configurations/**/*.tmpl', 
      'Configurations/**/*.pl', 
      'Configurations/**/*.pm', 
      'include/openssl/opensslv.h', 
      'util/**/*.pl', 
      'util/**/*.pm', 
      'external/perl/transfer/Text/*.pm', 
      'external/perl/Text-Template-1.46/lib/Text/*.pm', 
    ]), 
    cmd = ' && '.join([
      'DEVELOPER_DIR="' + xcode_developer_dir + '"', # Set XCode developer directory
      'mkdir -p $OUT', 
      'cp -r $SRCDIR/. $TMP', 
      'cd $TMP', 
      './Configure ' + platform, 
    ] + [ 
      'perl "-I." -Mconfigdata "util/dofile.pl" "-oMakefile" ' + x + ' > ' + splitext(x)[0] for x in in_files 
    ] + [ 
      'mkdir -p $OUT/' + dirname(x) + ' && cp $TMP/' + splitext(x)[0] + ' $OUT/' + splitext(x)[0] for x in in_files 
    ]), 
  )
  return ':' + name

def extract(rule, path):
  name = clean('extract-' + rule + '-' + path)
  genrule(
    name = name,
    out = basename(path),
    cmd = 'cp $(location ' + rule + ')/' + path + ' $OUT',
  )
  return ':' + name

build_srcs = glob([
  'apps/**/*',
  'Configurations/**/*',
  'crypto/**/*',
  'demos/**/*',
  'doc/**/*',
  'engines/**/*',
  'external/**/*',
  'fuzz/**/*',
  'include/**/*',
  'krb5/**/*',
  'ms/**/*',
  'os-dep/**/*',
  'pyca-cryptography/**/*',
  'ssl/**/*',
  'test/**/*',
  'tools/**/*',
  'util/**/*',
  'VMS/**/*',
  'LICENSE', 
  'Configure', 
  'config', 
  '*.h', 
  '*.info', 
])

tools = glob([
  'Configure',
  'util/pod2mantest',
  'util/**/*.sh',
  'util/**/*.pl',
])

def configure(platform): 
  name = clean('configure-' + platform)
  genrule(
    name = name,
    out = 'out',
    srcs = build_srcs, 
    cmd = ' && '.join([
      'DEVELOPER_DIR="' + xcode_developer_dir + '"', 
      'cp -r $SRCDIR/. $TMP', 
      'mkdir -p $OUT', 
      'cd $TMP', 
      'chmod +x ' + ' '.join([ '$TMP/' + x for x in tools ]), 
      './Configure shared --prefix=$OUT/build --openssldir=$OUT/build/openssl ' + platform, 
      'make include/openssl/opensslconf.h', 
      'cp -r $TMP/. $OUT', 
    ])
  )
  return ':' + name

def make(platform): 
  name = clean('make-' + platform)
  genrule(
    name = name,
    out = 'out',
    srcs = build_srcs, 
    cmd = ' && '.join([
      'DEVELOPER_DIR="' + xcode_developer_dir + '"', 
      'cp -r $SRCDIR/. $TMP', 
      'mkdir -p $OUT', 
      'cd $TMP', 
      'chmod +x ' + ' '.join([ '$TMP/' + x for x in tools ]), 
      './Configure shared --prefix=$OUT/build --openssldir=$OUT/build/openssl ' + platform, 
      'make -j4', 
      'make install', 
    ])
  )
  return ':' + name

# linux_opensslconf = opensslconf('linux-x86_64')
macos_conf = conf('darwin64-x86_64-cc')
# windows_opensslconf = opensslconf('VC-WIN64I')
# iphoneos_opensslconf = opensslconf('ios64-xcrun')
# iphonesimulator_opensslconf = opensslconf('iossimulator-xcrun')

crypto_folders = [
  'aes', 
  'aria', 
  'asn1', 
  'async', 
  'bf', 
  'bio', 
  'blake2', 
  'bn', 
  'buffer', 
  'camellia', 
  'cast', 
  'chacha', 
  'cmac', 
  'cms', 
  'comp', 
  'conf', 
  'ct', 
  'des', 
  'dh', 
  'dsa', 
  'dso', 
  'ec', 
  'engine', 
  'err', 
  'evp', 
  'hmac', 
  'idea', 
  'include', 
  'kdf', 
  'lhash', 
  'md2', 
  'md4', 
  'md5', 
  'mdc2', 
  'modes', 
  'objects', 
  'ocsp', 
  'pem', 
  'perlasm', 
  'pkcs12', 
  'pkcs7', 
  'poly1305', 
  'rand', 
  'rc2', 
  'rc4', 
  'rc5', 
  'ripemd', 
  'rsa', 
  'seed', 
  'sha', 
  'siphash', 
  'sm2', 
  'sm3', 
  'sm4', 
  'srp', 
  'stack', 
  'store', 
  'ts', 
  'txt_db', 
  'ui', 
  'whrlpool', 
  'x509', 
  'x509v3', 
]

gen_headers_macos = glob([
  'openssl/**/*.in', 
])

cxx_library(
  name = 'crypto2', 
  header_namespace = '', 
  exported_headers = subdir_glob([
    ('include', '**/*.h'), 
    ('crypto/include', '**/*.h'), 
  ]), 
  exported_platform_headers = [
    (
      'macos.*', 
      { 
        'openssl/opensslconf.h': extract(macos_conf, 'include/openssl/opensslconf.h'), 
        'internal/bn_conf.h': extract(macos_conf, 'crypto/include/internal/bn_conf.h'), 
        'internal/dso_conf.h': extract(macos_conf, 'crypto/include/internal/dso_conf.h'), 
      }
    ), 
  ], 
  headers = subdir_glob(
    [ (x + '/include', '**/*.h') for x in crypto_folders ], 
  ), 
  srcs = glob([
    'crypto/**/*.c', 
  ], excludes = glob([
    'crypto/**/*_unix.c', 
    'crypto/**/*_win.c', 
  ])), 
  platform_srcs = [
    ('linux.*', glob([ 'crypto/**/*_unix.c' ])), 
    ('windows.*', glob([ 'crypto/**/*_win.c' ])), 
  ], 
)

linux_make = make('linux-x86_64')
macos_make = make('darwin64-x86_64-cc')
windows_make = make('VC-WIN64I')
iphoneos_make = make('ios64-xcrun')
iphonesimulator_make = make('iossimulator-xcrun')

linux_configure = configure('linux-x86_64')
macos_configure = configure('darwin64-x86_64-cc')
windows_configure = configure('VC-WIN64I')
iphoneos_configure = configure('ios64-xcrun')
iphonesimulator_configure = configure('iossimulator-xcrun')

prebuilt_cxx_library(
  name = 'crypto',
  header_namespace = 'openssl',
  platform_shared_lib = [
    ('macos.*', extract(macos_make, 'build/lib/libcrypto.dylib')), 
    ('linux.*', extract(linux_make, 'build/lib/libcrypto.so')), 
    ('iphoneos.*', extract(iphoneos_make, 'build/lib/libcrypto.dylib')), 
    ('iphonesimulator.*', extract(iphonesimulator_make, 'build/lib/libcrypto.dylib')), 
  ], 
  platform_static_lib = [
    ('macos.*', extract(macos_make, 'build/lib/libcrypto.a')), 
    ('linux.*', extract(linux_make, 'build/lib/libcrypto.a')), 
    ('iphoneos.*', extract(iphoneos_make, 'build/lib/libcrypto.a')), 
    ('iphonesimulator.*', extract(iphonesimulator_make, 'build/lib/libcrypto.a')), 
  ], 
)

prebuilt_cxx_library(
  name = 'ssl',
  header_namespace = 'openssl',
  platform_shared_lib = [
    ('macos.*', extract(macos_make, 'build/lib/libssl.dylib')), 
    ('linux.*', extract(linux_make, 'build/lib/libssl.so')), 
    ('iphoneos.*', extract(iphoneos_make, 'build/lib/libssl.dylib')), 
    ('iphonesimulator.*', extract(iphonesimulator_make, 'build/lib/libssl.dylib')), 
  ], 
  platform_static_lib = [
    ('macos.*', extract(macos_make, 'build/lib/libssl.a')), 
    ('linux.*', extract(linux_make, 'build/lib/libssl.a')), 
    ('iphoneos.*', extract(iphoneos_make, 'build/lib/libssl.a')), 
    ('iphonesimulator.*', extract(iphonesimulator_make, 'build/lib/libssl.a')), 
  ], 
)

prebuilt_cxx_library(
  name = 'openssl',
  header_only = True,
  header_namespace = 'openssl',
  exported_headers = subdir_glob([
    ('include/openssl', '**/*.h'), 
  ]), 
  exported_platform_headers = [
    ('^macos.*', { 'opensslconf.h': extract(macos_configure, 'include/openssl/opensslconf.h') }),
    ('^linux.*', { 'opensslconf.h': extract(linux_configure, 'include/openssl/opensslconf.h') }),
    ('^iphoneos.*', { 'opensslconf.h': extract(iphoneos_configure, 'include/openssl/opensslconf.h') }),
    ('^iphonesimulator.*', { 'opensslconf.h': extract(iphonesimulator_configure, 'include/openssl/opensslconf.h') }),
  ], 
  exported_deps = [
    ':crypto',
    ':ssl',
  ],
  visibility = [
    'PUBLIC',
  ],
)
