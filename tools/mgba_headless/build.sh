#!/usr/bin/env bash
# Build the two macOS tools behind "Play to recover" on a Mac, outside the repo (default: $TMPDIR/frank-build).
#   1. GbaWadUtil (CLI only) from the public GBADoom source, so tools/package_rom_native.py can package ROMs.
#   2. frank_mgba: headless mGBA 0.10.5 (libmgba + Lua 5.4 scripting API, same as Tools > Scripting) that runs
#      creature/tap/oam_tap.lua and scripted input without a window.
# Needs: brew install qtbase lua@5.4 libpng cmake pkgconf. Nothing built here is committed; ROMs/WADs stay out of git.
set -euo pipefail
OUT="${1:-${TMPDIR:-/tmp}/frank-build}"
HERE="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$OUT" && cd "$OUT"

# 1. GbaWadUtil from doomhack/GBADoom@7763f5f (tools/GbaWadUtil, Qt 6 core; the GUI entry point is stubbed out)
[ -d gbadoom ] || { git clone -q https://github.com/doomhack/GBADoom.git gbadoom && git -C gbadoom checkout -q 7763f5f9adf18f83a59093bc1ab786fe2c36591f; }
Q=/opt/homebrew/opt/qtbase; SRC=gbadoom/tools/GbaWadUtil; mkdir -p wadutil && cd wadutil
"$Q/share/qt/libexec/moc" "../$SRC/wadfile.h" -o moc_wadfile.cpp
"$Q/share/qt/libexec/moc" "../$SRC/wadprocessor.h" -o moc_wadprocessor.cpp
printf '#include "gui/gui.h"\nint RunGui(int, char**) { return 2; }\n' > gui_stub.cpp
clang++ -std=c++17 -O2 -DQT_NO_DEBUG -I"../$SRC" -F"$Q/lib" -I"$Q/lib/QtCore.framework/Headers" \
  ../$SRC/{dehacked,gusbank,infotables,main,mapgame,mus2mid,options,sizereport,usedlumps,wadfile,wadprocessor}.cpp \
  moc_wadfile.cpp moc_wadprocessor.cpp gui_stub.cpp -framework QtCore -Wl,-rpath,"$Q/lib" -o GbaWadUtil
ln -sfn "$OUT/gbadoom/GbaWadUtil/data" data   # GbaWadUtil needs data/gbadoom.wad next to it
cd ..

# 2. libmgba 0.10.5 with Lua 5.4 scripting, then the headless runner
[ -d mgba ] || git clone -q --depth 1 --branch 0.10.5 https://github.com/mgba-emu/mgba.git mgba
L=/opt/homebrew/opt/lua@5.4
cmake -S mgba -B mgba/build -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DBUILD_QT=OFF -DBUILD_SDL=OFF \
  -DBUILD_GL=OFF -DBUILD_GLES2=OFF -DBUILD_GLES3=OFF -DBUILD_SHARED=OFF -DBUILD_STATIC=ON -DUSE_FFMPEG=OFF \
  -DUSE_SQLITE3=OFF -DUSE_ELF=OFF -DUSE_EPOXY=OFF -DUSE_LIBZIP=OFF -DUSE_MINIZIP=OFF -DUSE_DISCORD_RPC=OFF \
  -DUSE_EDITLINE=OFF -DM_CORE_GB=OFF -DUSE_LUA=5.4 -DLUA_INCLUDE_DIR=$L/include/lua5.4 \
  -DLUA_LIBRARY=$L/lib/liblua5.4.dylib -DCMAKE_PREFIX_PATH=/opt/homebrew > /dev/null
make -C mgba/build -j8 mgba > /dev/null
clang -O2 -Imgba/include -Imgba/build/include -o frank_mgba "$HERE/frank_mgba.c" mgba/build/libmgba.a \
  $L/lib/liblua5.4.dylib -L/opt/homebrew/lib -lpng -lz -lpthread -framework CoreFoundation
echo "GbaWadUtil: $OUT/wadutil/GbaWadUtil"
echo "WAD:        $OUT/gbadoom/GbaWadUtil/doom1.wad (DOOM1.WAD v1.9 shareware, sha1 5b2e249b...)"
echo "mGBA:       $OUT/frank_mgba ROM.gba SCRIPT.lua [--frames N] [--fast]"
