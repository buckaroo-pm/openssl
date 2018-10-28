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

xcode_developer_dir = read_config('apple', 'xcode_developer_dir', '$DEVELOPER_DIR')

android_ndk = read_config('ndk', 'ndk_path', '$ANDROID_NDK')
ndk_gcc_version = read_config('ndk', 'gcc_version', '4.9')

openssl_dir = read_config('openssl', 'openssl_dir', '/usr/local/ssl')

def make(platform): 
  # TODO: We could query for these
  ndk_toolchains = [
    'x86-' + ndk_gcc_version, 
    'x86_64-' + ndk_gcc_version,
    'arm-linux-androideabi-' + ndk_gcc_version, 
    'aarch64-linux-android-' + ndk_gcc_version, 
  ]

  name = clean('make-' + platform)
  genrule(
    name = name,
    out = 'out',
    srcs = build_srcs, 
    cmd = ' && '.join([
      'DEVELOPER_DIR="' + xcode_developer_dir + '"', 
      'ANDROID_NDK="' + android_ndk + '"', 
    ] + [
      'PATH=$ANDROID_NDK/toolchains/' + x + '/prebuilt/linux-x86_64/bin:$PATH' for x in ndk_toolchains
    ] + [
      'PATH=$ANDROID_NDK/toolchains/' + x + '/prebuilt/darwin-x86_64/bin:$PATH' for x in ndk_toolchains
    ] + [
      'cp -r $SRCDIR/. $TMP', 
      'mkdir -p $OUT', 
      'cd $TMP', 
      'chmod +x ' + ' '.join([ '$TMP/' + x for x in tools ]), 
      './Configure no-shared no-asm no-zlib no-tests no-deprecated --prefix=$OUT --openssldir=' + openssl_dir + ' ' + platform, 
      'make -j4', 
      'make install_sw', 
    ])
  )
  return ':' + name

linux_make = make('linux-x86_64')
macos_make = make('darwin64-x86_64-cc')
windows_make = make('VC-WIN64I')
iphoneos_make = make('ios64-xcrun')
iphonesimulator_make = make('iossimulator-xcrun')
android_x86_make = make('android-x86')
android_x86_64_make = make('android-x86_64')
android_arm_make = make('android-arm')

prebuilt_cxx_library(
  name = 'crypto',
  header_namespace = 'openssl',
  platform_static_lib = [
    ('macos.*', extract(macos_make, 'lib/libcrypto.a')), 
    ('linux.*', extract(linux_make, 'lib/libcrypto.a')), 
    ('iphoneos.*', extract(iphoneos_make, 'lib/libcrypto.a')), 
    ('iphonesimulator.*', extract(iphonesimulator_make, 'lib/libcrypto.a')), 
    ('android-x86.*', extract(android_x86_make, 'lib/libcrypto.a')), 
    ('android-arm.*', extract(android_arm_make, 'lib/libcrypto.a')), 
  ], 
  preferred_linkage = 'static', 
)

prebuilt_cxx_library(
  name = 'ssl',
  header_namespace = 'openssl',
  platform_static_lib = [
    ('macos.*', extract(macos_make, 'lib/libssl.a')), 
    ('linux.*', extract(linux_make, 'lib/libssl.a')), 
    ('iphoneos.*', extract(iphoneos_make, 'lib/libssl.a')), 
    ('iphonesimulator.*', extract(iphonesimulator_make, 'lib/libssl.a')), 
    ('android-x86.*', extract(android_x86_make, 'lib/libssl.a')), 
    ('android-arm.*', extract(android_arm_make, 'lib/libssl.a')), 
  ], 
  preferred_linkage = 'static', 
)

def platform_headers(configure):
  name = clean('openssl-headers-' + configure)
  prebuilt_cxx_library(
    name = name,
    header_only = True,
    header_namespace = 'openssl',
    exported_headers = { 
      'opensslconf.h': extract(configure, 'include/openssl/opensslconf.h'), 
    }, 
  )
  return ':' + name

cxx_library(
  name = 'openssl',
  header_namespace = 'openssl',
  exported_headers = subdir_glob([
    ('include/openssl', '**/*.h'), 
  ]), 
  exported_deps = [
    ':crypto', 
    ':ssl', 
  ], 
  platform_deps = [
    ('macos.*', [ platform_headers(macos_make) ]), 
    ('linux.*', [ platform_headers(linux_make) ]), 
    ('windows.*', [ platform_headers(windows_make) ]), 
    ('iphoneos.*', [ platform_headers(iphoneos_make) ]), 
    ('iphonesimulator.*', [ platform_headers(iphonesimulator_make) ]), 
    ('android-x86.*', [ platform_headers(android_x86_make) ]), 
    ('android-arm.*', [ platform_headers(android_arm_make) ]), 
  ], 
  visibility = [
    'PUBLIC',
  ],
)
