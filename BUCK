from os.path import basename
from hashlib import sha256
import re

def clean(x):
  return re.sub(r'[:_+\.\/\\]', '-', x.lower()).replace('--', '-')

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
      'cp -r $SRCDIR/. $TMP', 
      'mkdir -p $OUT', 
      'printenv > $OUT/env', 
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

xcode_developer_dir = read_config('apple', 'xcode_developer_dir', '/Applications/Xcode.app/Contents/Developer')

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
