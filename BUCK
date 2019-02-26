load('//:utils.bzl', 'clean', 'extract', 'extract_folder')
load('//:openssl.bzl', 'make', 'platform_headers')

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
    ('macos.*', extract(macos_make, 'usr/local/ssl/lib/libcrypto.a')),
    ('linux.*', extract(linux_make, 'usr/local/ssl/lib/libcrypto.a')),
    ('iphoneos.*', extract(iphoneos_make, 'usr/local/ssl/lib/libcrypto.a')),
    ('iphonesimulator.*', extract(iphonesimulator_make, 'usr/local/ssl/lib/libcrypto.a')),
    ('android-x86.*', extract(android_x86_make, 'usr/local/ssl/lib/libcrypto.a')),
    ('android-arm.*', extract(android_arm_make, 'usr/local/ssl/lib/libcrypto.a')),
  ],
  preferred_linkage = 'static',
)

prebuilt_cxx_library(
  name = 'ssl',
  header_namespace = 'openssl',
  platform_static_lib = [
    ('macos.*', extract(macos_make, 'usr/local/ssl/lib/libssl.a')),
    ('linux.*', extract(linux_make, 'usr/local/ssl/lib/libssl.a')),
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
    ('windows.*', [ platform_headers(windows_make) ]),
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
