load('//:utils.bzl', 'clean', 'extract_folder')

def make(platform):
  build_srcs = native.glob([
    'apps/**/*',
    'certs/**/*.crl',
    'certs/**/*.pem',
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
    'Makefile.*',
    '*.h',
    '*.info',
  ])

  tools = native.glob([
    'Configure',
    'util/pod2mantest',
    'util/**/*.sh',
    'util/**/*.pl',
  ])

  xcode_developer_dir = native.read_config('apple', 'xcode_developer_dir', '$DEVELOPER_DIR')

  android_ndk = native.read_config('ndk', 'ndk_path', '$ANDROID_NDK')
  ndk_gcc_version = native.read_config('ndk', 'gcc_version', '4.9')

  openssl_dir = native.read_config('openssl', 'openssl_dir', '/usr/local/ssl')

  # TODO: We could query for these
  ndk_toolchains = [
    'x86-' + ndk_gcc_version,
    'x86_64-' + ndk_gcc_version,
    'arm-linux-androideabi-' + ndk_gcc_version,
    'aarch64-linux-android-' + ndk_gcc_version,
  ]

  name = clean('make-' + platform)

  native.genrule(
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
      './Configure no-shared no-asm no-zlib no-tests --install_prefix=$OUT ' + platform,
      'make',
      'make install_sw',
    ]),
    cacheable = False,
  )

  return ':' + name

def platform_headers(make):
  name = clean('openssl-headers-' + make)
  native.prebuilt_cxx_library(
    name = name,
    header_only = True,
    header_namespace = '',
    header_dirs = [ extract_folder(make, 'usr/local/ssl/include') ],
  )
  return ':' + name
