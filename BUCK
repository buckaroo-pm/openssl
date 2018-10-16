def merge_dicts(x, y): 
  z = x.copy()
  z.update(y)
  return z

cxx_library(
  name = 'apps',
  header_namespace = '',
  compiler_flags = [ 
    '-fPIC', 
    '-m64', 
  ],
  preprocessor_flags = [ 
    '-DOPENSSL_USE_NODELETE', 
    '-DL_ENDIAN', 
    '-DOPENSSL_PIC', 
    '-DOPENSSL_CPUID_OBJ', 
    "-DOPENSSL_IA32_SSE2", 
    "-DOPENSSL_BN_ASM_MONT", 
    "-DOPENSSL_BN_ASM_MONT5", 
    "-DOPENSSL_BN_ASM_GF2m", 
    "-DSHA1_ASM", 
    "-DSHA256_ASM", 
    "-DSHA512_ASM",
    "-DKECCAK1600_ASM", 
    "-DRC4_ASM","-DMD5_ASM",
    "-DAES_ASM","-DVPAES_ASM", 
    "-DBSAES_ASM", 
    "-DGHASH_ASM", 
    "-DECP_NISTZ256_ASM", 
    "-DX25519_ASM", 
    "-DPADLOCK_ASM", 
    '-DPOLY1305_ASM', 
    '-DOPENSSLDIR="/usr/local/ssl"', 
    '-DENGINESDIR="/tmp/openssl/engines-1.1"', 
    '-DNDEBUG', 
  ],
  exported_headers = merge_dicts(subdir_glob([
    ('include', '**/*.h'), 
    ('', 'e_os.h'), 
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  headers = subdir_glob([
    ('', 'apps/**/*.h'), 
  ]),
  srcs = [
    'apps/app_rand.c', 
    'apps/apps.c', 
    'apps/bf_prefix.c', 
    'apps/opt.c', 
    'apps/s_cb.c', 
    'apps/s_socket.c', 
  ],
  linker_flags = [
    '-Wa,--noexecstack', 
  ],
  exported_linker_flags = [
    '-pthread'
  ], 
  visibility = [], 
)

cxx_library(
  name = 'testutil',
  header_namespace= '',
  compiler_flags = [
    '-fPIC', 
    '-m64', 
  ],
  preprocessor_flags = [ 
    "-DOPENSSL_USE_NODELETE","-DL_ENDIAN","-DOPENSSL_PIC","-DOPENSSL_CPUID_OBJ","-DOPENSSL_IA32_SSE2","-DOPENSSL_BN_ASM_MONT","-DOPENSSL_BN_ASM_MONT5","-DOPENSSL_BN_ASM_GF2m","-DSHA1_ASM","-DSHA256_ASM","-DSHA512_ASM","-DKECCAK1600_ASM","-DRC4_ASM","-DMD5_ASM","-DAES_ASM","-DVPAES_ASM","-DBSAES_ASM","-DGHASH_ASM","-DECP_NISTZ256_ASM","-DX25519_ASM","-DPADLOCK_ASM","-DPOLY1305_ASM","-DOPENSSLDIR=\"/usr/local/ssl\"","-DENGINESDIR=\"/tmp/openssl/engines-1.1\"","-DNDEBUG"
  ],
  exported_headers = merge_dicts(subdir_glob([
    ("include", "**/*.h"), 
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  headers = merge_dicts(subdir_glob([
    ('test', '**/*.h'), 
  ]), {
    
  }),
  srcs = glob([
    'test/testutil/*.c', 
  ]),
  linker_flags = ["-Wa,--noexecstack"],
  exported_linker_flags = ["-pthread"],
)

cxx_library(
  name = "crypto",
  header_namespace= '',
  compiler_flags = ["-fPIC","-m64"],
  preprocessor_flags = ["-DOPENSSL_USE_NODELETE","-DL_ENDIAN","-DOPENSSL_PIC","-DOPENSSL_CPUID_OBJ","-DOPENSSL_IA32_SSE2","-DOPENSSL_BN_ASM_MONT","-DOPENSSL_BN_ASM_MONT5","-DOPENSSL_BN_ASM_GF2m","-DSHA1_ASM","-DSHA256_ASM","-DSHA512_ASM","-DKECCAK1600_ASM","-DRC4_ASM","-DMD5_ASM","-DAES_ASM","-DVPAES_ASM","-DBSAES_ASM","-DGHASH_ASM","-DECP_NISTZ256_ASM","-DX25519_ASM","-DPADLOCK_ASM","-DPOLY1305_ASM","-DOPENSSLDIR=\"/usr/local/ssl\"","-DENGINESDIR=\"/tmp/openssl/engines-1.1\"","-DNDEBUG"],
  exported_headers = merge_dicts(subdir_glob([
    ("crypto", "**/*.h"),
    ("crypto", "**/*.c"),
    ("include", "**/*.h"),
    ("crypto/include", "**/*.h"),
    ("crypto/ec/curve448", "**/*.h"),
    ("crypto/ec/curve448/arch_32", "**/*.h"),
    ("crypto/modes", "**/*.h"),
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
    'crypto/include/internal/bn_conf.h': ':gen-crypto-include-internal-bn_conf-h',
    'include/internal/bn_conf.h': ':gen-crypto-include-internal-bn_conf-h',
    'internal/bn_conf.h': ':gen-crypto-include-internal-bn_conf-h',
    'crypto/buildinf.h': ':gen-crypto-buildinf-h',
    'buildinf.h': ':gen-crypto-buildinf-h',
    'crypto/include/internal/dso_conf.h': ':gen-crypto-include-internal-dso_conf-h',
    'include/internal/dso_conf.h': ':gen-crypto-include-internal-dso_conf-h',
    'internal/dso_conf.h': ':gen-crypto-include-internal-dso_conf-h',
  }),
  srcs = glob([
    'crypto/**/*.s', 
    'crypto/**/*.c', 
  ], excludes = [ 
    'crypto/aes/aes_cbc.c', 
    'crypto/aes/aes_core.c', 
    'crypto/aes/aes_x86core.c', 
    'crypto/armcap.c', 
    'crypto/bn/bn_asm.c',
    'crypto/camellia/camellia.c', 
    'crypto/camellia/cmll_cbc.c', 
    'crypto/chacha/chacha_enc.c', 
    'crypto/des/ncbc_enc.c', 
    "crypto/dllmain.c", 
    "crypto/ec/ecp_nistz256_table.c", 
    "crypto/engine/eng_devcrypto.c", 
    "crypto/LPdir_nyi.c", 
    "crypto/LPdir_unix.c", 
    "crypto/LPdir_vms.c", 
    "crypto/LPdir_win.c", 
    "crypto/LPdir_win32.c", 
    "crypto/LPdir_wince.c", 
    "crypto/md2/md2_dgst.c", 
    "crypto/md2/md2_one.c", 
    "crypto/mem_clr.c", 
    "crypto/poly1305/poly1305_base2_44.c", 
    "crypto/poly1305/poly1305_ieee754.c", 
    "crypto/ppccap.c", 
    "crypto/rc4/rc4_enc.c", 
    "crypto/rc4/rc4_skey.c", 
    "crypto/rc5/rc5_ecb.c", 
    "crypto/rc5/rc5_enc.c", 
    "crypto/rc5/rc5_skey.c", 
    "crypto/rc5/rc5cfb64.c", 
    "crypto/rc5/rc5ofb64.c", 
    "crypto/s390xcap.c", 
    "crypto/sha/keccak1600.c", 
    "crypto/sparcv9cap.c", 
    "crypto/whrlpool/wp_block.c", 
  ]) + [
    ':gen-crypto-aes-aes-x86_64-s', 
    ':gen-crypto-aes-aesni-mb-x86_64-s', 
    ':gen-crypto-aes-aesni-sha1-x86_64-s', 
    ':gen-crypto-aes-aesni-sha256-x86_64-s', 
    ':gen-crypto-aes-aesni-x86_64-s', 
    ':gen-crypto-aes-bsaes-x86_64-s', 
    ':gen-crypto-aes-vpaes-x86_64-s', 
    ':gen-crypto-bn-rsaz-avx2-s', 
    ':gen-crypto-bn-rsaz-x86_64-s', 
    ':gen-crypto-bn-x86_64-gf2m-s', 
    ':gen-crypto-bn-x86_64-mont-s', 
    ':gen-crypto-bn-x86_64-mont5-s', 
    ':gen-crypto-camellia-cmll-x86_64-s', 
    ':gen-crypto-chacha-chacha-x86_64-s', 
    ':gen-crypto-ec-ecp_nistz256-x86_64-s', 
    ':gen-crypto-ec-x25519-x86_64-s', 
    ':gen-crypto-md5-md5-x86_64-s', 
    ':gen-crypto-modes-aesni-gcm-x86_64-s', 
    ':gen-crypto-modes-ghash-x86_64-s', 
    ':gen-crypto-poly1305-poly1305-x86_64-s', 
    ':gen-crypto-rc4-rc4-md5-x86_64-s', 
    ':gen-crypto-rc4-rc4-x86_64-s', 
    ':gen-crypto-sha-keccak1600-x86_64-s', 
    ':gen-crypto-sha-sha1-mb-x86_64-s', 
    ':gen-crypto-sha-sha1-x86_64-s', 
    ':gen-crypto-sha-sha256-mb-x86_64-s', 
    ':gen-crypto-sha-sha256-x86_64-s', 
    ':gen-crypto-sha-sha512-x86_64-s', 
    ':gen-crypto-whrlpool-wp-x86_64-s', 
    ':gen-crypto-x86_64cpuid-s', 
  ],
  linker_flags = [
    "-Wl,-znodelete", 
    "-Wl,-Bsymbolic", 
    "-Wa,--noexecstack", 
  ],
  exported_linker_flags = [
    "-pthread", 
    "-ldl", 
  ],
  visibility = [], 
)

cxx_library(
  name = "ssl",
  header_namespace= '',
  compiler_flags = ["-fPIC","-m64"],
  preprocessor_flags = ["-DOPENSSL_USE_NODELETE","-DL_ENDIAN","-DOPENSSL_PIC","-DOPENSSL_CPUID_OBJ","-DOPENSSL_IA32_SSE2","-DOPENSSL_BN_ASM_MONT","-DOPENSSL_BN_ASM_MONT5","-DOPENSSL_BN_ASM_GF2m","-DSHA1_ASM","-DSHA256_ASM","-DSHA512_ASM","-DKECCAK1600_ASM","-DRC4_ASM","-DMD5_ASM","-DAES_ASM","-DVPAES_ASM","-DBSAES_ASM","-DGHASH_ASM","-DECP_NISTZ256_ASM","-DX25519_ASM","-DPADLOCK_ASM","-DPOLY1305_ASM","-DOPENSSLDIR=\"/usr/local/ssl\"","-DENGINESDIR=\"/tmp/openssl/engines-1.1\"","-DNDEBUG"],
  exported_headers = merge_dicts(subdir_glob([
    
  ]), {
    
  }),
  headers = merge_dicts(subdir_glob([
    
  ]), {
    
  }),
  
  srcs = 
  [ (file, []) for file in glob(
      ["ssl/**/*.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wl,-znodelete","-Wl,-Bsymbolic","-Wa,--noexecstack"],
  exported_linker_flags = ["-L.","-pthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)

cxx_library(
  name = "afalg",
  header_namespace= '',
  compiler_flags = ["-fPIC","-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  exported_headers = merge_dicts(subdir_glob([
    
  ]), {
    
  }),
  headers = merge_dicts(subdir_glob([
    
  ]), {
    
  }),
  
  srcs = 
  [ (file, []) for file in glob(
      ["engines/e_afalg.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wl,-znodelete","-Wl,-Bsymbolic","-Wa,--noexecstack"],
  exported_linker_flags = ["-L.","-pthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)

cxx_library(
  name = "capi",
  header_namespace= '',
  compiler_flags = ["-fPIC","-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  exported_headers = merge_dicts(subdir_glob([
    
  ]), {
    
  }),
  headers = merge_dicts(subdir_glob([
    
  ]), {
    
  }),
  
  srcs = 
  [ (file, []) for file in glob(
      ["engines/e_capi.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wl,-znodelete","-Wl,-Bsymbolic","-Wa,--noexecstack"],
  exported_linker_flags = ["-L.","-pthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)

cxx_library(
  name = "dasync",
  header_namespace= '',
  compiler_flags = ["-fPIC","-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  exported_headers = merge_dicts(subdir_glob([
    
  ]), {
    
  }),
  headers = merge_dicts(subdir_glob([
    
  ]), {
    
  }),
  
  srcs = 
  [ (file, []) for file in glob(
      ["engines/e_dasync.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wl,-znodelete","-Wl,-Bsymbolic","-Wa,--noexecstack"],
  exported_linker_flags = ["-L.","-pthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)

cxx_library(
  name = "ossltest",
  header_namespace= '',
  compiler_flags = ["-fPIC","-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  exported_headers = merge_dicts(subdir_glob([
    
  ]), {
    
  }),
  headers = merge_dicts(subdir_glob([
    
  ]), {
    
  }),
  
  srcs = 
  [ (file, []) for file in glob(
      ["engines/e_ossltest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wl,-znodelete","-Wl,-Bsymbolic","-Wa,--noexecstack"],
  exported_linker_flags = ["-L.","-pthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)

cxx_library(
  name = "padlock",
  header_namespace= '',
  compiler_flags = ["-fPIC","-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  exported_headers = merge_dicts(subdir_glob([
    
  ]), {
    
  }),
  headers = merge_dicts(subdir_glob([
    
  ]), {
    
  }),
  
  srcs = 
  [ (file, []) for file in glob(
      ["engines/e_padlock-x86_64.s","engines/e_padlock.c"],
      excludes=[]
   )]
   + [
    ':gen-engines-e_padlock-x86_64-s', 
  ],
  linker_flags = ["-Wl,-znodelete","-Wl,-Bsymbolic","-Wa,--noexecstack"],
  exported_linker_flags = ["-L.","-pthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)
cxx_binary(
  name = "exe-buildtest_conf",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_conf.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_conf-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_conf_api",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_conf_api.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_conf_api-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_crypto",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_crypto.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_crypto-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_ct",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_ct.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_ct-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_des",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_des.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_des-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_dh",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_dh.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_dh-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_dsa",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_dsa.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_dsa-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_dtls1",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_dtls1.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_dtls1-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_e_os2",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_e_os2.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_e_os2-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_ebcdic",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_ebcdic.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_ebcdic-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_ec",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_ec.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_ec-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_ecdh",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_ecdh.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_ecdh-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_ecdsa",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_ecdsa.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_ecdsa-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_engine",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_engine.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_engine-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_evp",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_evp.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_evp-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_hmac",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_hmac.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_hmac-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_idea",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_idea.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_idea-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_kdf",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_kdf.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_kdf-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_lhash",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_lhash.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_lhash-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_md4",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_md4.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_md4-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_md5",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_md5.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_md5-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_mdc2",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_mdc2.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_mdc2-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_modes",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_modes.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_modes-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_obj_mac",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_obj_mac.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_obj_mac-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_objects",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_objects.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_objects-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_ocsp",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_ocsp.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_ocsp-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_opensslv",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_opensslv.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_opensslv-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_ossl_typ",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_ossl_typ.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_ossl_typ-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_pem",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_pem.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_pem-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_pem2",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_pem2.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_pem2-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_pkcs12",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_pkcs12.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_pkcs12-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_pkcs7",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_pkcs7.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_pkcs7-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_rand",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_rand.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_rand-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_rand_drbg",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_rand_drbg.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_rand_drbg-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_rc2",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_rc2.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_rc2-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_rc4",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_rc4.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_rc4-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_ripemd",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_ripemd.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_ripemd-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_rsa",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_rsa.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_rsa-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_safestack",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_safestack.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_safestack-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_seed",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_seed.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_seed-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_sha",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_sha.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_sha-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_srp",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_srp.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_srp-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_srtp",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_srtp.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_srtp-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_ssl",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_ssl.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_ssl-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_ssl2",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_ssl2.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_ssl2-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_stack",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_stack.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_stack-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_store",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_store.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_store-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_symhacks",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_symhacks.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_symhacks-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_tls1",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_tls1.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_tls1-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_ts",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_ts.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_ts-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-ocspapitest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/ocspapitest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-packettest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/packettest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-pbelutest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/pbelutest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-pemtest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/pemtest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-pkey_meth_kdf_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/pkey_meth_kdf_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-pkey_meth_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/pkey_meth_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-poly1305_internal_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/poly1305_internal_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl","-llibcrypto.a"],
  deps = [":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-rc2test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/rc2test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-rc4test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/rc4test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-rc5test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/rc5test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-rdrand_sanitytest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/rdrand_sanitytest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl","-llibcrypto.a"],
  deps = [":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-recordlentest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/recordlentest.c","test/ssltestlib.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-rsa_mp_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/rsa_mp_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-rsa_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/rsa_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-sanitytest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/sanitytest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-secmemtest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/secmemtest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-servername_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/servername_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-shloadtest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'internal/dso_conf.h': ':gen-crypto-include-internal-dso_conf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/shlibloadtest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-siphash_internal_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/siphash_internal_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl","-llibcrypto.a"],
  deps = [":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-sm2_internal_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/sm2_internal_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl","-llibcrypto.a"],
  deps = [":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-sm4_internal_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/sm4_internal_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl","-llibcrypto.a"],
  deps = [":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-srptest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/srptest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-ssl_cert_table_internal_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/ssl_cert_table_internal_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-ssl_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/handshake_helper.c","test/ssl_test.c","test/ssl_test_ctx.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-ssl_test_ctx_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/ssl_test_ctx.c","test/ssl_test_ctx_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-sslapitest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/sslapitest.c","test/ssltestlib.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-sslbuffertest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/sslbuffertest.c","test/ssltestlib.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-sslcorrupttest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/sslcorrupttest.c","test/ssltestlib.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-ssltest_old",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/ssltest_old.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-stack_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/stack_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-sysdefaulttest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/sysdefaulttest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-test_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/test_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-threadstest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/threadstest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-time_offset_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/time_offset_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-tls13ccstest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/ssltestlib.c","test/tls13ccstest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-tls13encryptiontest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/tls13encryptiontest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl","-llibssl.a"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-tls13secretstest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, ["-fPIC","-DOPENSSL_USE_NODELETE","-DL_ENDIAN","-DOPENSSL_PIC","-DOPENSSL_CPUID_OBJ","-DOPENSSL_IA32_SSE2","-DOPENSSL_BN_ASM_MONT","-DOPENSSL_BN_ASM_MONT5","-DOPENSSL_BN_ASM_GF2m","-DSHA1_ASM","-DSHA256_ASM","-DSHA512_ASM","-DKECCAK1600_ASM","-DRC4_ASM","-DMD5_ASM","-DAES_ASM","-DVPAES_ASM","-DBSAES_ASM","-DGHASH_ASM","-DECP_NISTZ256_ASM","-DX25519_ASM","-DPADLOCK_ASM","-DPOLY1305_ASM","-DOPENSSLDIR=\"/usr/local/ssl\"","-DENGINESDIR=\"/tmp/openssl/engines-1.1\""]) for file in glob(
      ["ssl/packet.c","ssl/tls13_enc.c"],
      excludes=[]
   )]
  +

  [ (file, []) for file in glob(
      ["test/tls13secretstest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-uitest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    ("apps", "**/*.h")
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/uitest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":apps",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-v3ext",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/v3ext.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-v3nametest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/v3nametest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-verify_extra_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/verify_extra_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-versions",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/versions.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-wpackettest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/wpackettest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl","-llibssl.a"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-x509_check_cert_pkey_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/x509_check_cert_pkey_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-x509_dup_cert_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/x509_dup_cert_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-x509_internal_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/x509_internal_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl","-llibcrypto.a"],
  deps = [":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-x509_time_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/x509_time_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-x509aux",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/x509aux.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_txt_db",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_txt_db.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_txt_db-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_ui",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_ui.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_ui-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_whrlpool",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_whrlpool.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_whrlpool-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_x509",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_x509.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_x509-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_x509_vfy",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_x509_vfy.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_x509_vfy-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_x509v3",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_x509v3.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_x509v3-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-casttest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/casttest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-chacha_internal_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/chacha_internal_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl","-llibcrypto.a"],
  deps = [":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-cipherbytes_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/cipherbytes_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-cipherlist_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/cipherlist_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-ciphername_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/ciphername_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-clienthellotest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/clienthellotest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-cmsapitest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/cmsapitest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-conf_include_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/conf_include_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-constant_time_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/constant_time_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-crltest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/crltest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-ct_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/ct_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-ctype_internal_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/ctype_internal_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl","-llibcrypto.a"],
  deps = [":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-curve448_internal_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/curve448_internal_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl","-llibcrypto.a"],
  deps = [":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-d2i_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/d2i_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-danetest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/danetest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-destest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/destest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-dhtest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/dhtest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-drbg_cavs_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    ("test", "**/*.h")
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/drbg_cavs_data.c","test/drbg_cavs_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-drbgtest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/drbgtest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-dsatest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/dsatest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-dtls_mtu_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/dtls_mtu_test.c","test/ssltestlib.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-dtlstest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/dtlstest.c","test/ssltestlib.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-dtlsv1listentest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/dtlsv1listentest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-ecdsatest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/ecdsatest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-ecstresstest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/ecstresstest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-ectest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/ectest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-enginetest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/enginetest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-errtest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/errtest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-evp_extra_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/evp_extra_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-evp_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/evp_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-exdatatest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/exdatatest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-exptest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/exptest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-fatalerrtest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/fatalerrtest.c","test/ssltestlib.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-gmdifftest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/gmdifftest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-gosttest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/gosttest.c","test/ssltestlib.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-hmactest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/hmactest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-ideatest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/ideatest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-igetest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/igetest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-lhash_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/lhash_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-md2test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/md2test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-mdc2_internal_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/mdc2_internal_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-mdc2test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/mdc2test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-memleaktest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/memleaktest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-modes_internal_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/modes_internal_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl","-llibcrypto.a"],
  deps = [":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-openssl",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    ("apps", "**/*.h")
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'apps/progs.h': ':gen-apps-progs-h',
'progs.h': ':gen-apps-progs-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["apps/*.c"],
      excludes=["apps/app_rand.c","apps/apps.c","apps/bf_prefix.c","apps/opt.c","apps/s_cb.c","apps/s_socket.c","apps/vms_decc_init.c","apps/vms_term_sock.c","apps/win32_init.c"]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":apps"],
  visibility = []
)

cxx_binary(
  name = "exe-asn1-test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["fuzz/asn1.c","fuzz/test-corpus.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-asn1parse-test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["fuzz/asn1parse.c","fuzz/test-corpus.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-bignum-test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["fuzz/bignum.c","fuzz/test-corpus.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-bndiv-test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["fuzz/bndiv.c","fuzz/test-corpus.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-client-test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["fuzz/client.c","fuzz/test-corpus.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-cms-test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["fuzz/cms.c","fuzz/test-corpus.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-conf-test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["fuzz/conf.c","fuzz/test-corpus.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-crl-test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["fuzz/crl.c","fuzz/test-corpus.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-ct-test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["fuzz/ct.c","fuzz/test-corpus.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-server-test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["fuzz/server.c","fuzz/test-corpus.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-x509-test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["fuzz/test-corpus.c","fuzz/x509.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-aborttest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/aborttest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-afalgtest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/afalgtest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-asn1_encode_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/asn1_encode_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-asn1_internal_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/asn1_internal_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl","-llibcrypto.a"],
  deps = [":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-asn1_string_table_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/asn1_string_table_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-asn1_time_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/asn1_time_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-asynciotest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'include/openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/asynciotest.c","test/ssltestlib.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-asynctest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/asynctest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-bad_dtls_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/bad_dtls_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-bftest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/bftest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-bio_callback_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/bio_callback_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-bio_enc_test",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/bio_enc_test.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-bioprinttest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/bioprinttest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-bntest",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/bntest.c"],
      excludes=[]
   )]
   + [
    
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":crypto",":testutil"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_aes",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_aes.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_aes-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_asn1",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_asn1.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_asn1-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_asn1t",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_asn1t.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_asn1t-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_async",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_async.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_async-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_bio",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_bio.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_bio-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_blowfish",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_blowfish.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_blowfish-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_bn",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_bn.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_bn-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_buffer",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_buffer.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_buffer-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_camellia",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_camellia.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_camellia-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_cast",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_cast.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_cast-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_cmac",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_cmac.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_cmac-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_cms",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_cms.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_cms-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)

cxx_binary(
  name = "exe-buildtest_comp",
  compiler_flags = ["-m64"],
  preprocessor_flags = ["-DNDEBUG"],
  headers = merge_dicts(subdir_glob([
    
  ]), {
    'openssl/opensslconf.h': ':gen-include-openssl-opensslconf-h',
  }),
  srcs = 
  [ (file, []) for file in glob(
      ["test/buildtest_comp.c"],
      excludes=[]
   )]
   + [
    ':gen-test-buildtest_comp-c', 
  ],
  linker_flags = ["-Wa,--noexecstack","-L.","-lpthread","-ldl"],
  deps = [":ssl",":crypto"],
  visibility = []
)
genrule(
    name = 'gen-crypto-include-internal-bn_conf-h', 
    out = 'bn_conf.h', 
    srcs = glob(["./*.pm","util/*.pl","util/perl/*.pm","external/perl/transfer/Text/*.pm","external/perl/Text-Template-1.46/lib/Text/*.pm","crypto/include/internal/*.in"]), 
    cmd = '/usr/bin/perl "-I." -Mconfigdata "util/dofile.pl" \
    "-oMakefile" crypto/include/internal/bn_conf.h.in > $OUT', 
  )

genrule(
    name = 'gen-crypto-include-internal-dso_conf-h', 
    out = 'dso_conf.h', 
    srcs = glob(["./*.pm","util/*.pl","util/perl/*.pm","external/perl/transfer/Text/*.pm","external/perl/Text-Template-1.46/lib/Text/*.pm","crypto/include/internal/*.in"]), 
    cmd = '/usr/bin/perl "-I." -Mconfigdata "util/dofile.pl" \
    "-oMakefile" crypto/include/internal/dso_conf.h.in > $OUT', 
  )

genrule(
    name = 'gen-include-openssl-opensslconf-h', 
    out = 'opensslconf.h', 
    srcs = glob(["./*.pm","util/*.pl","util/perl/*.pm","external/perl/transfer/Text/*.pm","external/perl/Text-Template-1.46/lib/Text/*.pm","include/openssl/*.in"]), 
    cmd = '/usr/bin/perl "-I." -Mconfigdata "util/dofile.pl" \
    "-oMakefile" include/openssl/opensslconf.h.in > $OUT', 
  )

genrule(
    name = 'gen-crypto-aes-aes-x86_64-s', 
    out = 'aes-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/aes/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-aes-aesni-mb-x86_64-s', 
    out = 'aesni-mb-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/aes/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-aes-aesni-sha1-x86_64-s', 
    out = 'aesni-sha1-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/aes/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-aes-aesni-sha256-x86_64-s', 
    out = 'aesni-sha256-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/aes/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-aes-bsaes-x86_64-s', 
    out = 'bsaes-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/aes/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-aes-aesni-x86_64-s', 
    out = 'aesni-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/aes/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-aes-vpaes-x86_64-s', 
    out = 'vpaes-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/aes/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-bn-rsaz-avx2-s', 
    out = 'rsaz-avx2.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/bn/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-bn-rsaz-x86_64-s', 
    out = 'rsaz-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/bn/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-bn-x86_64-gf2m-s', 
    out = 'x86_64-gf2m.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/bn/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-bn-x86_64-mont-s', 
    out = 'x86_64-mont.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/bn/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-bn-x86_64-mont5-s', 
    out = 'x86_64-mont5.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/bn/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-camellia-cmll-x86_64-s', 
    out = 'cmll-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/camellia/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-chacha-chacha-x86_64-s', 
    out = 'chacha-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/chacha/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-buildinf-h', 
    out = 'buildinf.h', 
    srcs = glob(["./*","util/*.pl"]), 
    cmd = '/usr/bin/perl util/mkbuildinf.pl "gcc -fPIC -pthread -m64 -Wa,--noexecstack -Wall -O3 -DOPENSSL_USE_NODELETE -DL_ENDIAN -DOPENSSL_PIC -DOPENSSL_CPUID_OBJ -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DKECCAK1600_ASM -DRC4_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DGHASH_ASM -DECP_NISTZ256_ASM -DX25519_ASM -DPADLOCK_ASM -DPOLY1305_ASM -DNDEBUG" "linux-x86_64" > $OUT', 
  )

genrule(
    name = 'gen-crypto-ec-ecp_nistz256-x86_64-s', 
    out = 'ecp_nistz256-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'cd $SRCSDIR && ./crypto/perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-ec-x25519-x86_64-s', 
    out = 'x25519-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/ec/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-md5-md5-x86_64-s', 
    out = 'md5-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/md5/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-modes-aesni-gcm-x86_64-s', 
    out = 'aesni-gcm-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/modes/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-modes-ghash-x86_64-s', 
    out = 'ghash-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/modes/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-poly1305-poly1305-x86_64-s', 
    out = 'poly1305-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/poly1305/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-rc4-rc4-md5-x86_64-s', 
    out = 'rc4-md5-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/rc4/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-rc4-rc4-x86_64-s', 
    out = 'rc4-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/rc4/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-sha-keccak1600-x86_64-s', 
    out = 'keccak1600-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/sha/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-sha-sha1-mb-x86_64-s', 
    out = 'sha1-mb-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/sha/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-sha-sha1-x86_64-s', 
    out = 'sha1-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/sha/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-sha-sha256-mb-x86_64-s', 
    out = 'sha256-mb-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/sha/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-sha-sha256-x86_64-s', 
    out = 'sha256-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/sha/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-sha-sha512-x86_64-s', 
    out = 'sha512-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/sha/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-whrlpool-wp-x86_64-s', 
    out = 'wp-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/whrlpool/asm/../../perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-crypto-x86_64cpuid-s', 
    out = 'x86_64cpuid.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl crypto/perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-libcrypto-map', 
    out = 'libcrypto.map', 
    srcs = glob(["./*.pm","util/*.(pl|num)","util/perl/OpenSSL/*.pm","include/openssl/*.h","include/internal/*.h"]), 
    cmd = '/usr/bin/perl util/mkdef.pl crypto linux > $OUT', 
  )

genrule(
    name = 'gen-libssl-map', 
    out = 'libssl.map', 
    srcs = glob(["./*.pm","util/*.(pl|num)","util/perl/OpenSSL/*.pm","include/openssl/*.h","include/internal/*.h"]), 
    cmd = '/usr/bin/perl util/mkdef.pl ssl linux > $OUT', 
  )

genrule(
    name = 'gen-engines-e_padlock-x86_64-s', 
    out = 'e_padlock-x86_64.s', 
    srcs = glob(["./*","crypto/perlasm/*.pl"]), 
    cmd = 'perl engines/asm/../../crypto/perlasm/x86_64-xlate.pl elf $OUT', 
  )

genrule(
    name = 'gen-apps-progs-h', 
    out = 'progs.h', 
    srcs = glob(["./*.pm","apps/*.(pl|c)"]), 
    cmd = '/usr/bin/perl apps/progs.pl apps/openssl > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_aes-c', 
    out = 'buildtest_aes.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl aes > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_asn1-c', 
    out = 'buildtest_asn1.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl asn1 > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_asn1t-c', 
    out = 'buildtest_asn1t.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl asn1t > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_async-c', 
    out = 'buildtest_async.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl async > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_bio-c', 
    out = 'buildtest_bio.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl bio > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_blowfish-c', 
    out = 'buildtest_blowfish.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl blowfish > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_bn-c', 
    out = 'buildtest_bn.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl bn > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_buffer-c', 
    out = 'buildtest_buffer.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl buffer > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_camellia-c', 
    out = 'buildtest_camellia.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl camellia > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_cast-c', 
    out = 'buildtest_cast.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl cast > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_cmac-c', 
    out = 'buildtest_cmac.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl cmac > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_cms-c', 
    out = 'buildtest_cms.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl cms > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_comp-c', 
    out = 'buildtest_comp.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl comp > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_conf-c', 
    out = 'buildtest_conf.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl conf > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_conf_api-c', 
    out = 'buildtest_conf_api.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl conf_api > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_crypto-c', 
    out = 'buildtest_crypto.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl crypto > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_ct-c', 
    out = 'buildtest_ct.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl ct > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_des-c', 
    out = 'buildtest_des.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl des > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_dh-c', 
    out = 'buildtest_dh.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl dh > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_dsa-c', 
    out = 'buildtest_dsa.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl dsa > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_dtls1-c', 
    out = 'buildtest_dtls1.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl dtls1 > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_e_os2-c', 
    out = 'buildtest_e_os2.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl e_os2 > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_ebcdic-c', 
    out = 'buildtest_ebcdic.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl ebcdic > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_ec-c', 
    out = 'buildtest_ec.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl ec > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_ecdh-c', 
    out = 'buildtest_ecdh.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl ecdh > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_ecdsa-c', 
    out = 'buildtest_ecdsa.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl ecdsa > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_engine-c', 
    out = 'buildtest_engine.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl engine > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_evp-c', 
    out = 'buildtest_evp.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl evp > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_hmac-c', 
    out = 'buildtest_hmac.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl hmac > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_idea-c', 
    out = 'buildtest_idea.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl idea > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_kdf-c', 
    out = 'buildtest_kdf.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl kdf > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_lhash-c', 
    out = 'buildtest_lhash.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl lhash > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_md4-c', 
    out = 'buildtest_md4.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl md4 > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_md5-c', 
    out = 'buildtest_md5.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl md5 > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_mdc2-c', 
    out = 'buildtest_mdc2.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl mdc2 > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_modes-c', 
    out = 'buildtest_modes.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl modes > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_obj_mac-c', 
    out = 'buildtest_obj_mac.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl obj_mac > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_objects-c', 
    out = 'buildtest_objects.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl objects > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_ocsp-c', 
    out = 'buildtest_ocsp.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl ocsp > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_opensslv-c', 
    out = 'buildtest_opensslv.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl opensslv > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_ossl_typ-c', 
    out = 'buildtest_ossl_typ.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl ossl_typ > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_pem-c', 
    out = 'buildtest_pem.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl pem > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_pem2-c', 
    out = 'buildtest_pem2.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl pem2 > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_pkcs12-c', 
    out = 'buildtest_pkcs12.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl pkcs12 > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_pkcs7-c', 
    out = 'buildtest_pkcs7.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl pkcs7 > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_rand-c', 
    out = 'buildtest_rand.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl rand > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_rand_drbg-c', 
    out = 'buildtest_rand_drbg.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl rand_drbg > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_rc2-c', 
    out = 'buildtest_rc2.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl rc2 > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_rc4-c', 
    out = 'buildtest_rc4.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl rc4 > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_ripemd-c', 
    out = 'buildtest_ripemd.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl ripemd > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_rsa-c', 
    out = 'buildtest_rsa.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl rsa > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_safestack-c', 
    out = 'buildtest_safestack.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl safestack > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_seed-c', 
    out = 'buildtest_seed.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl seed > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_sha-c', 
    out = 'buildtest_sha.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl sha > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_srp-c', 
    out = 'buildtest_srp.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl srp > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_srtp-c', 
    out = 'buildtest_srtp.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl srtp > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_ssl-c', 
    out = 'buildtest_ssl.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl ssl > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_ssl2-c', 
    out = 'buildtest_ssl2.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl ssl2 > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_stack-c', 
    out = 'buildtest_stack.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl stack > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_store-c', 
    out = 'buildtest_store.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl store > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_symhacks-c', 
    out = 'buildtest_symhacks.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl symhacks > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_tls1-c', 
    out = 'buildtest_tls1.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl tls1 > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_ts-c', 
    out = 'buildtest_ts.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl ts > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_txt_db-c', 
    out = 'buildtest_txt_db.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl txt_db > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_ui-c', 
    out = 'buildtest_ui.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl ui > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_whrlpool-c', 
    out = 'buildtest_whrlpool.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl whrlpool > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_x509-c', 
    out = 'buildtest_x509.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl x509 > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_x509_vfy-c', 
    out = 'buildtest_x509_vfy.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl x509_vfy > $OUT', 
  )

genrule(
    name = 'gen-test-buildtest_x509v3-c', 
    out = 'buildtest_x509v3.c', 
    srcs = glob(["./*","test/*.pl"]), 
    cmd = '/usr/bin/perl test/generate_buildtest.pl x509v3 > $OUT', 
  )
