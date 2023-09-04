#!/usr/bin/bash

#Please copy you libraylib.so into here
gcc -c -fPIC raylib_pointerized_wrapper.c raylib_raku_helpers.c
gcc -shared -o libraylib.so.* raylib_raku_helpers.o raylib_pointerized_wrapper.o -lraylib
