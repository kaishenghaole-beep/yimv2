# DLL build attempt for YimMenuV2

Date (UTC): 2026-04-01

## Source requested
- https://github.com/YimMenu/YimMenuV2.git

## Commands executed in this environment
1. Unpacked bundled source archive `YimMenuV2-enhanced.zip`.
2. Attempted configure with:
   `cmake -DUSE_CROSSCOMPILER=Zig -DCMAKE_BUILD_TYPE=RelWithDebInfo -S . -B build -G Ninja`
3. Attempted to install missing toolchains:
   `apt-get update && apt-get install -y zig cmake ninja-build`
4. Attempted to download Zig directly:
   `curl -L https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz -o zig.tar.xz`

## Result
- DLL was **not** generated in this sandbox because required toolchain download/install was blocked by outbound proxy restrictions (HTTP 403).

## Build command to run on a machine with Zig installed
```bash
cmake -DUSE_CROSSCOMPILER=Zig -DCMAKE_BUILD_TYPE=RelWithDebInfo -S . -B build -G Ninja
cmake --build ./build --config RelWithDebInfo --target YimMenuV2 --
```

Expected output file:
- `build/libYimMenuV2.dll`
