load('//:utils.bzl', 'clean', 'extract', 'extract_folder')
load('//:openssl.bzl', 'make', 'platform_headers')

linux_make = make('linux-x86_64')
macos_make = make('darwin64-x86_64-cc')
iphoneos_make = make('ios64-xcrun')
iphonesimulator_make = make('iossimulator-xcrun')
android_x86_make = make('android-x86')
android_x86_64_make = make('android-x86_64')
android_arm_make = make('android-arm')

# On Windows, OpenSSL requires MinGW, but we cannot assume user is in such an environment. 
http_archive(
  name = 'windows-prebuilt-32',
  out = 'out',
  urls = [
    'https://bintray.com/conan-community/conan/download_file?file_path=conan%2FOpenSSL%2F1.0.2p%2Fstable%2Fpackage%2F009a50ddeb47afbc9361cbc63650560c127e1234%2Fconan_package.tgz',
  ],
  type = 'tar.gz',
  sha256 = '9d86facd5b640db5035703aaebfa150f0a4c4e3c75618e958207ac7e472f1288',
)

http_archive(
  name = 'windows-prebuilt-debug',
  out = 'out',
  urls = [
    'https://bintray.com/conan-community/conan/download_file?file_path=conan%2FOpenSSL%2F1.0.2p%2Fstable%2Fpackage%2F0bd0c413b56aaec57c0f222a89b4e565a6729027%2Fconan_package.tgz',
  ],
  type = 'tar.gz',
  sha256 = 'd1c869cf535e530b61fd7d9404f2c441999984dc41a2fe236e030328acfeb867',
)

prebuilt_cxx_library(
  name = 'crypto',
  header_namespace = 'openssl',
  platform_static_lib = [
    ('macos.*', extract(macos_make, 'usr/local/ssl/lib/libcrypto.a')),
    ('linux.*', extract(linux_make, 'usr/local/ssl/lib/libcrypto.a')),
    ('windows.*', extract(':windows-prebuilt-debug', 'lib/libeay32.lib')),
    ('iphoneos.*', extract(iphoneos_make, 'usr/local/ssl/lib/libcrypto.a')),
    ('iphonesimulator.*', extract(iphonesimulator_make, 'usr/local/ssl/lib/libcrypto.a')),
    ('android-x86.*', extract(android_x86_make, 'usr/local/ssl/lib/libcrypto.a')),
    ('android-arm.*', extract(android_arm_make, 'usr/local/ssl/lib/libcrypto.a')),
  ],
  preferred_linkage = 'static',
  exported_post_platform_linker_flags = [
    ('linux.*', [ '-ldl' ]),
    ('windows.*', [ 'Advapi32.lib', 'User32.lib', 'Gdi32.lib' ]),
  ],
)

prebuilt_cxx_library(
  name = 'ssl',
  header_namespace = 'openssl',
  platform_static_lib = [
    ('macos.*', extract(macos_make, 'usr/local/ssl/lib/libssl.a')),
    ('linux.*', extract(linux_make, 'usr/local/ssl/lib/libssl.a')),
    ('windows.*', extract(':windows-prebuilt-debug', 'lib/ssleay32.lib')),
    ('iphoneos.*', extract(iphoneos_make, 'usr/local/ssl/lib/libssl.a')),
    ('iphonesimulator.*', extract(iphonesimulator_make, 'usr/local/ssl/lib/libssl.a')),
    ('android-x86.*', extract(android_x86_make, 'usr/local/ssl/lib/libssl.a')),
    ('android-arm.*', extract(android_arm_make, 'usr/local/ssl/lib/libssl.a')),
  ],
  preferred_linkage = 'static',
)

cxx_library(
  name = 'openssl',
  header_namespace = '',
  platform_deps = [
    ('macos.*', [ platform_headers(macos_make) ]),
    ('linux.*', [ platform_headers(linux_make) ]),
    ('windows.*', [ platform_headers(':windows-prebuilt-debug', 'include') ]),
    ('iphoneos.*', [ platform_headers(iphoneos_make) ]),
    ('iphonesimulator.*', [ platform_headers(iphonesimulator_make) ]),
    ('android-x86.*', [ platform_headers(android_x86_make) ]),
    ('android-arm.*', [ platform_headers(android_arm_make) ]),
  ],
  exported_deps = [
    ':crypto',
    ':ssl',
  ],
  visibility = [
    'PUBLIC',
  ],
)
