cd ~/master_thesis/cap/libs/build-tcc

emcc ../tcc-wrapper/compile_c_to_hex.c ../tinycc/libtcc.c \
  -I../tinycc \
  -I../tinycc/include \
  -s EXPORTED_RUNTIME_METHODS="['FS','callMain']" \
  -s MODULARIZE=1 \
  -s EXPORT_NAME="createTCC" \
  -s FORCE_FILESYSTEM=1 \
  -s ENVIRONMENT='web' \
  -s ALLOW_MEMORY_GROWTH=1 \
  --preload-file ../tinycc/include/tccdefs.h@/tccdefs.h \
  -o tcc.js


emcc ../tcc-wrapper/compile_c_to_hex.c ../tinycc/libtcc.c \
  -I../tinycc \
  -I../tinycc/include \
  -s EXPORTED_RUNTIME_METHODS="['FS','callMain']" \
  -s MODULARIZE=1 \
  -s EXPORT_NAME="createTCC" \
  -s FORCE_FILESYSTEM=1 \
  -s ENVIRONMENT='web' \
  -s ALLOW_MEMORY_GROWTH=1 \
  --preload-file ../tinycc/include/tccdefs.h@/tinycc-headers/tccdefs.h \
  -o tcc.js


cd ~/master_thesis/cap/libs/build-tcc

emcc ../tcc-wrapper/compile_c_to_hex.c ../tinycc/libtcc.c \
  -I../tinycc \
  -I../tinycc/include \
  -s EXPORTED_RUNTIME_METHODS="['FS','callMain']" \
  -s MODULARIZE=1 \
  -s EXPORT_NAME="createTCC" \
  -s FORCE_FILESYSTEM=1 \
  -s ENVIRONMENT='web' \
  -s ALLOW_MEMORY_GROWTH=1 \
  --preload-file ../tinycc/include/tccdefs.h@/tinycc-headers/tccdefs.h \
  -o tcc.js



cd ~/master_thesis/cap/libs/build-tcc

emcc ../tcc-wrapper/compile_c_to_hex.c ../tinycc/libtcc.c \
  -I../tinycc -I../tinycc/include \
  -s EXPORTED_FUNCTIONS="['_compile_and_get_text', '_malloc', '_free']" \
  -s EXPORTED_RUNTIME_METHODS="['FS', 'ccall', 'cwrap']" \
  -s MODULARIZE=1 \
  -s EXPORT_NAME="createTCC" \
  -s FORCE_FILESYSTEM=1 \
  -s ENVIRONMENT='web' \
  -s ALLOW_MEMORY_GROWTH=1 \
  --preload-file ../tinycc/include/tccdefs.h@/tinycc-headers/tccdefs.h \
  -o tcc.js


emcc ../tcc-wrapper/compile_c_to_hex.c ../tinycc/libtcc.c \
  -I../tinycc -I../tinycc/include \
  -s EXPORTED_FUNCTIONS="['_compile_and_get_text', '_malloc', '_free']" \
  -s EXPORTED_RUNTIME_METHODS="['FS', 'ccall', 'cwrap', 'HEAPU8', 'HEAP32', 'UTF8ToString']" \
  -s MODULARIZE=1 \
  -s EXPORT_NAME="createTCC" \
  -s FORCE_FILESYSTEM=1 \
  -s ENVIRONMENT='web' \
  -s ALLOW_MEMORY_GROWTH=1 \
  --preload-file ../tinycc/include/tccdefs.h@/tinycc-headers/tccdefs.h \
  -o tcc.js



cd ~/master_thesis/cap/libs/build-tcc
emcc ../tcc-wrapper/compile_c_to_hex.c ../tinycc/libtcc.c \
  -I../tinycc -I../tinycc/include \
  -s EXPORTED_FUNCTIONS="['_compile_and_get_text', '_malloc', '_free']" \
  -s EXPORTED_RUNTIME_METHODS="['FS', 'ccall', 'cwrap', 'HEAPU8', 'HEAP32', 'UTF8ToString']" \
  -s MODULARIZE=1 \
  -s EXPORT_NAME="createTCC" \
  -s FORCE_FILESYSTEM=1 \
  -s ENVIRONMENT='web' \
  -s ALLOW_MEMORY_GROWTH=1 \
  --preload-file ../tinycc/include/tccdefs.h@/tinycc-headers/tccdefs.h \
  -o tcc.js



cd ~/master_thesis/cap/libs/build-tcc

emcc ../tcc-wrapper/compile_c_to_hex.c ../tinycc/libtcc.c \
  -I../tinycc -I../tinycc/include \
  -s EXPORTED_FUNCTIONS="['_compile_and_get_text','_extract_symbols', '_malloc', '_free']" \
  -s EXPORTED_RUNTIME_METHODS="['FS', 'ccall', 'cwrap', 'HEAPU8', 'HEAP32']" \
  -s MODULARIZE=1 \
  -s EXPORT_NAME="createTCC" \
  -s FORCE_FILESYSTEM=1 \
  -s ENVIRONMENT='web' \
  -O0 \
  --preload-file ../tinycc/include/tccdefs.h@/tinycc-headers/tccdefs.h \
  -o tcc.js




cd ~/master_thesis/cap/libs/build-tcc

emcc ../tcc-wrapper/compile_c_to_hex.c ../tinycc/libtcc.c \
  -I../tinycc -I../tinycc/include \
  -s EXPORTED_FUNCTIONS="['_compile_and_get_text','_extract_symbols','_malloc','_free']" \
  -s EXPORTED_RUNTIME_METHODS="['FS','ccall','cwrap','HEAPU8','HEAP32']" \
  -s MODULARIZE=1 \
  -s EXPORT_NAME="createTCC" \
  -s EXPORT_ES6=1 \
  -s FORCE_FILESYSTEM=1 \
  -s ENVIRONMENT='web' \
  -s SINGLE_FILE=1 \
  -O0 \
  --preload-file ../tinycc/include/tccdefs.h@/tinycc-headers/tccdefs.h \
  -o tcc.mjs
