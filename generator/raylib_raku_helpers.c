#include <raylib.h>
#include <stdlib.h>
#include <stdio.h>


Color* init_color(unsigned char r, unsigned char g, unsigned char b, unsigned char a){
    Color* color = malloc(sizeof(Color));
    color->r = r;
    color->g = g;
    color->b = b;
    color->a = a;
    return color;
}

void free_color(Color* color) {
    free(color);
}

Vector3* init_vector3(float x, float y, float z) {
    Vector3* vector3 = malloc(sizeof(Vector3));
    vector3->x = x;
    vector3->y = y;
    vector3->z = z;
    return vector3;
}

Vector4* init_vector4(float x, float y, float z, float w) {
    Vector4* vector4 = malloc(sizeof(Vector4));
    vector4->x = x;
    vector4->y = y;
    vector4->z = z;
    vector4->w = w;
    return vector4;
}

void free_vector3(Vector3* vector3) {
    free(vector3);
}

void free_vector4(Vector4* vector4) {
    free(vector4);
}



