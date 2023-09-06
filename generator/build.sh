#!/usr/bin/bash

#Please copy you libraylib.so.x.x.x into here
gcc -c -fPIC raylib_pointerized_wrapper.c raylib_allocations.c
gcc -shared -o libraylib.so.4.5.0 raylib_allocations.o raylib_pointerized_wrapper.o -lraylib
