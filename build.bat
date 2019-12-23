set CODEHOME=%~dp0
set TARGET=wasm32-unknown-unknown
set BINPATH=target/%TARGET%/release
set BINARY=%BINPATH%/bare_metal_wasm.wasm

cargo build --target %TARGET% --release

%CODEHOME%external\wasm-strip.exe %BINARY%

if not exist "www" mkdir "www"

%CODEHOME%external\wasm-opt.exe -o www/bare_metal_wasm.wasm -Oz %BINARY%

%CODEHOME%external\wasm-objdump.exe -d www/bare_metal_wasm.wasm