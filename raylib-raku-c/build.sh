#!/usr/bin/bash

current_dir=$(pwd)/
gcc -c -fPIC "$current_dir/generator/raylib_pointerized_wrapper.c" "$current_dir/generator/raylib_allocations.c"
gcc -shared -o "$current_dir/generator/libraylib.so" "$current_dir/generator/raylib_allocations.o" "$current_dir/raylib_pointerized_wrapper.o" -lraylib
