# 🔍 Capstone Disassembler in the Browser (WASM)

This project compiles the [Capstone disassembly engine](https://www.capstone-engine.org/) to WebAssembly using Emscripten, enabling disassembly of raw x86 machine code directly in the browser — no installation required.

---

## 🚀 Features

- 🧠 Uses Capstone under the hood
- 🌐 100% runs in the browser (WebAssembly)
- ✍️ Paste raw x86 machine code and disassemble it
- 📦 Portable, local-first, no server backend

---

## 📁 Project Structure





---

## 🛠️ Setup Instructions

### 1. Install Emscripten

git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh

### 2. Clone Capstone and Build it
git clone https://github.com/capstone-engine/capstone.git ~/master_thesis/cap/libs/capstone
mkdir ~/master_thesis/cap/libs/build-capstone
cd ~/master_thesis/cap/libs/build-capstone


v1: works with 32
emcmake cmake ../capstone -DCAPSTONE_BUILD_CSTOOL=OFF -DCMAKE_BUILD_TYPE=Release

v2: works with 64
emcmake cmake ../capstone \
  -DCMAKE_BUILD_TYPE=Release \
  -DCAPSTONE_BUILD_CSTOOL=OFF \
  -DCAPSTONE_ARCHITECTURE_DEFAULT=OFF \
  -DCAPSTONE_X86_SUPPORT=ON



emmake make

### 3. Create C Wrapper
📄 ~/master_thesis/cap/libs/capstone-wrapper/capstone_wrapper.c


### 4. Compile Wrapper to WebAssembly
mkdir ~/master_thesis/cap/libs/build-wrapper
cd ~/master_thesis/cap/libs/build-wrapper

emcc ../capstone-wrapper/capstone_wrapper.c ../build-capstone/libcapstone.a \
  -I../capstone/include \
  -s EXPORTED_FUNCTIONS="['_disasm_x86']" \
  -s EXPORTED_RUNTIME_METHODS="['ccall', 'cwrap']" \
  -s MODULARIZE=1 \
  -s EXPORT_NAME="createCapstoneModule" \
  -o capstone.js

### 5. Create HTML Frontend
📄 ~/master_thesis/cap/assets/index.html

### 6. Run It Locally
cd ~/master_thesis/cap
python3 -m http.server 8000
