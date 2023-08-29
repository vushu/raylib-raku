unit module Raylib::Bindings:ver<0.0.1>:auth<zef:vushu>;
use NativeCall;
constant LIBRAYLIB = '/usr/local/lib/libraylib.so';
class Vector2 is export is repr('CStruct') {
   has num32 $.x;
    has num32 $.y;
}
class Vector3 is export is repr('CStruct') {
   has num32 $.x;
    has num32 $.y;
    has num32 $.z;
}
class Vector4 is export is repr('CStruct') {
   has num32 $.x;
    has num32 $.y;
    has num32 $.z;
    has num32 $.w;
}
class Quaternion is Vector4 is export is repr('CStruct') {}
class Matrix is export is repr('CStruct') {
   has num32 $.m0;
    has num32 $.m4;
    has num32 $.m8;
    has num32 $.m12;
    has num32 $.m1;
    has num32 $.m5;
    has num32 $.m9;
    has num32 $.m13;
    has num32 $.m2;
    has num32 $.m6;
    has num32 $.m10;
    has num32 $.m14;
    has num32 $.m3;
    has num32 $.m7;
    has num32 $.m11;
    has num32 $.m15;
}
class Color is export is repr('CStruct') {
   has Str $.r;
    has Str $.g;
    has Str $.b;
    has Str $.a;
}
class Rectangle is export is repr('CStruct') {
   has num32 $.x;
    has num32 $.y;
    has num32 $.width;
    has num32 $.height;
}
class Image is export is repr('CStruct') {
   has Pointer[void] $.data;
    has int32 $.width;
    has int32 $.height;
    has int32 $.mipmaps;
    has int32 $.format;
}
class Texture is export is repr('CStruct') {
   has uint32 $.id;
    has int32 $.width;
    has int32 $.height;
    has int32 $.mipmaps;
    has int32 $.format;
}
class Texture2D is Texture is export is repr('CStruct') {}
class TextureCubemap is Texture is export is repr('CStruct') {}
class RenderTexture is export is repr('CStruct') {
   has uint32 $.id;
    has Texture $.texture;
    has Texture $.depth;
}
class RenderTexture2D is RenderTexture is export is repr('CStruct') {}
class NPatchInfo is export is repr('CStruct') {
   has Rectangle $.source;
    has int32 $.left;
    has int32 $.top;
    has int32 $.right;
    has int32 $.bottom;
    has int32 $.layout;
}
class GlyphInfo is export is repr('CStruct') {
   has int32 $.value;
    has int32 $.offsetX;
    has int32 $.offsetY;
    has int32 $.advanceX;
    has Image $.image;
}
class Font is export is repr('CStruct') {
   has int32 $.baseSize;
    has int32 $.glyphCount;
    has int32 $.glyphPadding;
    has Texture2D $.texture;
    has Pointer[Rectangle] $.recs;
    has Pointer[GlyphInfo] $.glyphs;
}
class Camera3D is export is repr('CStruct') {
   has Vector3 $.position;
    has Vector3 $.target;
    has Vector3 $.up;
    has num32 $.fovy;
    has int32 $.projection;
}
class Camera is Camera3D is export is repr('CStruct') {}
class Camera2D is export is repr('CStruct') {
   has Vector2 $.offset;
    has Vector2 $.target;
    has num32 $.rotation;
    has num32 $.zoom;
}
class Mesh is export is repr('CStruct') {
   has int32 $.vertexCount;
    has int32 $.triangleCount;
    has Pointer[num32] $.vertices;
    has Pointer[num32] $.texcoords;
    has Pointer[num32] $.texcoords2;
    has Pointer[num32] $.normals;
    has Pointer[num32] $.tangents;
    has Pointer[Str] $.colors;
    has Pointer[uint16] $.indices;
    has Pointer[num32] $.animVertices;
    has Pointer[num32] $.animNormals;
    has Pointer[Str] $.boneIds;
    has Pointer[num32] $.boneWeights;
    has uint32 $.vaoId;
    has Pointer[uint32] $.vboId;
}
class Shader is export is repr('CStruct') {
   has uint32 $.id;
    has Pointer[int32] $.locs;
}
class MaterialMap is export is repr('CStruct') {
   has Texture2D $.texture;
    has Color $.color;
    has num32 $.value;
}
class Material is export is repr('CStruct') {
   has Shader $.shader;
    has Pointer[MaterialMap] $.maps;
    has CArray[num32] $.params;
}
class Transform is export is repr('CStruct') {
   has Vector3 $.translation;
    has Quaternion $.rotation;
    has Vector3 $.scale;
}
class BoneInfo is export is repr('CStruct') {
   has CArray[Str] $.name;
    has int32 $.parent;
}
class Model is export is repr('CStruct') {
   has Matrix $.transform;
    has int32 $.meshCount;
    has int32 $.materialCount;
    has Pointer[Mesh] $.meshes;
    has Pointer[Material] $.materials;
    has Pointer[int32] $.meshMaterial;
    has int32 $.boneCount;
    has Pointer[BoneInfo] $.bones;
    has Pointer[Transform] $.bindPose;
}
class ModelAnimation is export is repr('CStruct') {
   has int32 $.boneCount;
    has int32 $.frameCount;
    has Pointer[BoneInfo] $.bones;
    has Pointer[Transform] $.framePoses;
    has CArray[Str] $.name;
}
class Ray is export is repr('CStruct') {
   has Vector3 $.position;
    has Vector3 $.direction;
}
class RayCollision is export is repr('CStruct') {
   has bool $.hit;
    has num32 $.distance;
    has Vector3 $.point;
    has Vector3 $.normal;
}
class BoundingBox is export is repr('CStruct') {
   has Vector3 $.min;
    has Vector3 $.max;
}
class Wave is export is repr('CStruct') {
   has uint32 $.frameCount;
    has uint32 $.sampleRate;
    has uint32 $.sampleSize;
    has uint32 $.channels;
    has Pointer[void] $.data;
}
class rAudioBuffer is export is repr('CStruct') {  has int32 $.dummy;}
class rAudioProcessor is export is repr('CStruct') {  has int32 $.dummy;}
class AudioStream is export is repr('CStruct') {
   has Pointer[rAudioBuffer] $.buffer;
    has Pointer[rAudioProcessor] $.processor;
    has uint32 $.sampleRate;
    has uint32 $.sampleSize;
    has uint32 $.channels;
}
class Sound is export is repr('CStruct') {
   has AudioStream $.stream;
    has uint32 $.frameCount;
}
class Music is export is repr('CStruct') {
   has AudioStream $.stream;
    has uint32 $.frameCount;
    has bool $.looping;
    has int32 $.ctxType;
    has Pointer[void] $.ctxData;
}
class VrDeviceInfo is export is repr('CStruct') {
   has int32 $.hResolution;
    has int32 $.vResolution;
    has num32 $.hScreenSize;
    has num32 $.vScreenSize;
    has num32 $.vScreenCenter;
    has num32 $.eyeToScreenDistance;
    has num32 $.lensSeparationDistance;
    has num32 $.interpupillaryDistance;
    has CArray[num32] $.lensDistortionValues;
    has CArray[num32] $.chromaAbCorrection;
}
class VrStereoConfig is export is repr('CStruct') {
   has CArray[Matrix] $.projection;
    has CArray[Matrix] $.viewOffset;
    has CArray[num32] $.leftLensCenter;
    has CArray[num32] $.rightLensCenter;
    has CArray[num32] $.leftScreenCenter;
    has CArray[num32] $.rightScreenCenter;
    has CArray[num32] $.scale;
    has CArray[num32] $.scaleIn;
}
class FilePathList is export is repr('CStruct') {
   has uint32 $.capacity;
    has uint32 $.count;
    has Pointer[Str] $.paths;
}
enum ConfigFlags is export (
FLAG_VSYNC_HINT => 0x00000040,
 FLAG_FULLSCREEN_MODE => 0x00000002,
 FLAG_WINDOW_RESIZABLE => 0x00000004,
 FLAG_WINDOW_UNDECORATED => 0x00000008,
 FLAG_WINDOW_HIDDEN => 0x00000080,
 FLAG_WINDOW_MINIMIZED => 0x00000200,
 FLAG_WINDOW_MAXIMIZED => 0x00000400,
 FLAG_WINDOW_UNFOCUSED => 0x00000800,
 FLAG_WINDOW_TOPMOST => 0x00001000,
 FLAG_WINDOW_ALWAYS_RUN => 0x00000100,
 FLAG_WINDOW_TRANSPARENT => 0x00000010,
 FLAG_WINDOW_HIGHDPI => 0x00002000,
 FLAG_WINDOW_MOUSE_PASSTHROUGH => 0x00004000,
 FLAG_BORDERLESS_WINDOWED_MODE => 0x00008000,
 FLAG_MSAA_4X_HINT => 0x00000020,
 FLAG_INTERLACED_HINT => 0x00010000,
);
enum TraceLogLevel is export (
LOG_ALL => 0,
 LOG_TRACE => 1,
 LOG_DEBUG => 2,
 LOG_INFO => 3,
 LOG_WARNING => 4,
 LOG_ERROR => 5,
 LOG_FATAL => 6,
 LOG_NONE => 7,
);
enum KeyboardKey is export (
KEY_NULL => 0,
 KEY_APOSTROPHE => 39,
 KEY_COMMA => 44,
 KEY_MINUS => 45,
 KEY_PERIOD => 46,
 KEY_SLASH => 47,
 KEY_ZERO => 48,
 KEY_ONE => 49,
 KEY_TWO => 50,
 KEY_THREE => 51,
 KEY_FOUR => 52,
 KEY_FIVE => 53,
 KEY_SIX => 54,
 KEY_SEVEN => 55,
 KEY_EIGHT => 56,
 KEY_NINE => 57,
 KEY_SEMICOLON => 59,
 KEY_EQUAL => 61,
 KEY_A => 65,
 KEY_B => 66,
 KEY_C => 67,
 KEY_D => 68,
 KEY_E => 69,
 KEY_F => 70,
 KEY_G => 71,
 KEY_H => 72,
 KEY_I => 73,
 KEY_J => 74,
 KEY_K => 75,
 KEY_L => 76,
 KEY_M => 77,
 KEY_N => 78,
 KEY_O => 79,
 KEY_P => 80,
 KEY_Q => 81,
 KEY_R => 82,
 KEY_S => 83,
 KEY_T => 84,
 KEY_U => 85,
 KEY_V => 86,
 KEY_W => 87,
 KEY_X => 88,
 KEY_Y => 89,
 KEY_Z => 90,
 KEY_LEFT_BRACKET => 91,
 KEY_BACKSLASH => 92,
 KEY_RIGHT_BRACKET => 93,
 KEY_GRAVE => 96,
 KEY_SPACE => 32,
 KEY_ESCAPE => 256,
 KEY_ENTER => 257,
 KEY_TAB => 258,
 KEY_BACKSPACE => 259,
 KEY_INSERT => 260,
 KEY_DELETE => 261,
 KEY_RIGHT => 262,
 KEY_LEFT => 263,
 KEY_DOWN => 264,
 KEY_UP => 265,
 KEY_PAGE_UP => 266,
 KEY_PAGE_DOWN => 267,
 KEY_HOME => 268,
 KEY_END => 269,
 KEY_CAPS_LOCK => 280,
 KEY_SCROLL_LOCK => 281,
 KEY_NUM_LOCK => 282,
 KEY_PRINT_SCREEN => 283,
 KEY_PAUSE => 284,
 KEY_F1 => 290,
 KEY_F2 => 291,
 KEY_F3 => 292,
 KEY_F4 => 293,
 KEY_F5 => 294,
 KEY_F6 => 295,
 KEY_F7 => 296,
 KEY_F8 => 297,
 KEY_F9 => 298,
 KEY_F10 => 299,
 KEY_F11 => 300,
 KEY_F12 => 301,
 KEY_LEFT_SHIFT => 340,
 KEY_LEFT_CONTROL => 341,
 KEY_LEFT_ALT => 342,
 KEY_LEFT_SUPER => 343,
 KEY_RIGHT_SHIFT => 344,
 KEY_RIGHT_CONTROL => 345,
 KEY_RIGHT_ALT => 346,
 KEY_RIGHT_SUPER => 347,
 KEY_KB_MENU => 348,
 KEY_KP_0 => 320,
 KEY_KP_1 => 321,
 KEY_KP_2 => 322,
 KEY_KP_3 => 323,
 KEY_KP_4 => 324,
 KEY_KP_5 => 325,
 KEY_KP_6 => 326,
 KEY_KP_7 => 327,
 KEY_KP_8 => 328,
 KEY_KP_9 => 329,
 KEY_KP_DECIMAL => 330,
 KEY_KP_DIVIDE => 331,
 KEY_KP_MULTIPLY => 332,
 KEY_KP_SUBTRACT => 333,
 KEY_KP_ADD => 334,
 KEY_KP_ENTER => 335,
 KEY_KP_EQUAL => 336,
 KEY_BACK => 4,
 KEY_MENU => 82,
 KEY_VOLUME_UP => 24,
 KEY_VOLUME_DOWN => 25,
);
enum MouseButton is export (
MOUSE_BUTTON_LEFT => 0,
 MOUSE_BUTTON_RIGHT => 1,
 MOUSE_BUTTON_MIDDLE => 2,
 MOUSE_BUTTON_SIDE => 3,
 MOUSE_BUTTON_EXTRA => 4,
 MOUSE_BUTTON_FORWARD => 5,
 MOUSE_BUTTON_BACK => 6,
);
enum MouseCursor is export (
MOUSE_CURSOR_DEFAULT => 0,
 MOUSE_CURSOR_ARROW => 1,
 MOUSE_CURSOR_IBEAM => 2,
 MOUSE_CURSOR_CROSSHAIR => 3,
 MOUSE_CURSOR_POINTING_HAND => 4,
 MOUSE_CURSOR_RESIZE_EW => 5,
 MOUSE_CURSOR_RESIZE_NS => 6,
 MOUSE_CURSOR_RESIZE_NWSE => 7,
 MOUSE_CURSOR_RESIZE_NESW => 8,
 MOUSE_CURSOR_RESIZE_ALL => 9,
 MOUSE_CURSOR_NOT_ALLOWED => 10,
);
enum GamepadButton is export (
GAMEPAD_BUTTON_UNKNOWN => 0,
 GAMEPAD_BUTTON_LEFT_FACE_UP => 1,
 GAMEPAD_BUTTON_LEFT_FACE_RIGHT => 2,
 GAMEPAD_BUTTON_LEFT_FACE_DOWN => 3,
 GAMEPAD_BUTTON_LEFT_FACE_LEFT => 4,
 GAMEPAD_BUTTON_RIGHT_FACE_UP => 5,
 GAMEPAD_BUTTON_RIGHT_FACE_RIGHT => 6,
 GAMEPAD_BUTTON_RIGHT_FACE_DOWN => 7,
 GAMEPAD_BUTTON_RIGHT_FACE_LEFT => 8,
 GAMEPAD_BUTTON_LEFT_TRIGGER_1 => 9,
 GAMEPAD_BUTTON_LEFT_TRIGGER_2 => 10,
 GAMEPAD_BUTTON_RIGHT_TRIGGER_1 => 11,
 GAMEPAD_BUTTON_RIGHT_TRIGGER_2 => 12,
 GAMEPAD_BUTTON_MIDDLE_LEFT => 13,
 GAMEPAD_BUTTON_MIDDLE => 14,
 GAMEPAD_BUTTON_MIDDLE_RIGHT => 15,
 GAMEPAD_BUTTON_LEFT_THUMB => 16,
 GAMEPAD_BUTTON_RIGHT_THUMB => 17,
);
enum GamepadAxis is export (
GAMEPAD_AXIS_LEFT_X => 0,
 GAMEPAD_AXIS_LEFT_Y => 1,
 GAMEPAD_AXIS_RIGHT_X => 2,
 GAMEPAD_AXIS_RIGHT_Y => 3,
 GAMEPAD_AXIS_LEFT_TRIGGER => 4,
 GAMEPAD_AXIS_RIGHT_TRIGGER => 5,
);
enum MaterialMapIndex is export (
MATERIAL_MAP_ALBEDO => 0,
 MATERIAL_MAP_METALNESS => 1,
 MATERIAL_MAP_NORMAL => 2,
 MATERIAL_MAP_ROUGHNESS => 3,
 MATERIAL_MAP_OCCLUSION => 4,
 MATERIAL_MAP_EMISSION => 5,
 MATERIAL_MAP_HEIGHT => 6,
 MATERIAL_MAP_CUBEMAP => 7,
 MATERIAL_MAP_IRRADIANCE => 8,
 MATERIAL_MAP_PREFILTER => 9,
 MATERIAL_MAP_BRDF => 10,
);
enum ShaderLocationIndex is export (
SHADER_LOC_VERTEX_POSITION => 0,
 SHADER_LOC_VERTEX_TEXCOORD01 => 1,
 SHADER_LOC_VERTEX_TEXCOORD02 => 2,
 SHADER_LOC_VERTEX_NORMAL => 3,
 SHADER_LOC_VERTEX_TANGENT => 4,
 SHADER_LOC_VERTEX_COLOR => 5,
 SHADER_LOC_MATRIX_MVP => 6,
 SHADER_LOC_MATRIX_VIEW => 7,
 SHADER_LOC_MATRIX_PROJECTION => 8,
 SHADER_LOC_MATRIX_MODEL => 9,
 SHADER_LOC_MATRIX_NORMAL => 10,
 SHADER_LOC_VECTOR_VIEW => 11,
 SHADER_LOC_COLOR_DIFFUSE => 12,
 SHADER_LOC_COLOR_SPECULAR => 13,
 SHADER_LOC_COLOR_AMBIENT => 14,
 SHADER_LOC_MAP_ALBEDO => 15,
 SHADER_LOC_MAP_METALNESS => 16,
 SHADER_LOC_MAP_NORMAL => 17,
 SHADER_LOC_MAP_ROUGHNESS => 18,
 SHADER_LOC_MAP_OCCLUSION => 19,
 SHADER_LOC_MAP_EMISSION => 20,
 SHADER_LOC_MAP_HEIGHT => 21,
 SHADER_LOC_MAP_CUBEMAP => 22,
 SHADER_LOC_MAP_IRRADIANCE => 23,
 SHADER_LOC_MAP_PREFILTER => 24,
 SHADER_LOC_MAP_BRDF => 25,
);
enum ShaderUniformDataType is export (
SHADER_UNIFORM_FLOAT => 0,
 SHADER_UNIFORM_VEC2 => 1,
 SHADER_UNIFORM_VEC3 => 2,
 SHADER_UNIFORM_VEC4 => 3,
 SHADER_UNIFORM_INT => 4,
 SHADER_UNIFORM_IVEC2 => 5,
 SHADER_UNIFORM_IVEC3 => 6,
 SHADER_UNIFORM_IVEC4 => 7,
 SHADER_UNIFORM_SAMPLER2D => 8,
);
enum ShaderAttributeDataType is export (
SHADER_ATTRIB_FLOAT => 0,
 SHADER_ATTRIB_VEC2 => 1,
 SHADER_ATTRIB_VEC3 => 2,
 SHADER_ATTRIB_VEC4 => 3,
);
enum PixelFormat is export (
PIXELFORMAT_UNCOMPRESSED_GRAYSCALE => 1,
 PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA => 1,
 PIXELFORMAT_UNCOMPRESSED_R5G6B5 => 2,
 PIXELFORMAT_UNCOMPRESSED_R8G8B8 => 3,
 PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 => 4,
 PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 => 5,
 PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 => 6,
 PIXELFORMAT_UNCOMPRESSED_R32 => 7,
 PIXELFORMAT_UNCOMPRESSED_R32G32B32 => 8,
 PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 => 9,
 PIXELFORMAT_UNCOMPRESSED_R16 => 10,
 PIXELFORMAT_UNCOMPRESSED_R16G16B16 => 11,
 PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 => 12,
 PIXELFORMAT_COMPRESSED_DXT1_RGB => 13,
 PIXELFORMAT_COMPRESSED_DXT1_RGBA => 14,
 PIXELFORMAT_COMPRESSED_DXT3_RGBA => 15,
 PIXELFORMAT_COMPRESSED_DXT5_RGBA => 16,
 PIXELFORMAT_COMPRESSED_ETC1_RGB => 17,
 PIXELFORMAT_COMPRESSED_ETC2_RGB => 18,
 PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA => 19,
 PIXELFORMAT_COMPRESSED_PVRT_RGB => 20,
 PIXELFORMAT_COMPRESSED_PVRT_RGBA => 21,
 PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA => 22,
 PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA => 23,
);
enum TextureFilter is export (
TEXTURE_FILTER_POINT => 0,
 TEXTURE_FILTER_BILINEAR => 1,
 TEXTURE_FILTER_TRILINEAR => 2,
 TEXTURE_FILTER_ANISOTROPIC_4X => 3,
 TEXTURE_FILTER_ANISOTROPIC_8X => 4,
 TEXTURE_FILTER_ANISOTROPIC_16X => 5,
);
enum TextureWrap is export (
TEXTURE_WRAP_REPEAT => 0,
 TEXTURE_WRAP_CLAMP => 1,
 TEXTURE_WRAP_MIRROR_REPEAT => 2,
 TEXTURE_WRAP_MIRROR_CLAMP => 3,
);
enum CubemapLayout is export (
CUBEMAP_LAYOUT_AUTO_DETECT => 0,
 CUBEMAP_LAYOUT_LINE_VERTICAL => 1,
 CUBEMAP_LAYOUT_LINE_HORIZONTAL => 2,
 CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR => 3,
 CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE => 4,
 CUBEMAP_LAYOUT_PANORAMA => 5,
);
enum FontType is export (
FONT_DEFAULT => 0,
 FONT_BITMAP => 1,
 FONT_SDF => 2,
);
enum BlendMode is export (
BLEND_ALPHA => 0,
 BLEND_ADDITIVE => 1,
 BLEND_MULTIPLIED => 2,
 BLEND_ADD_COLORS => 3,
 BLEND_SUBTRACT_COLORS => 4,
 BLEND_ALPHA_PREMULTIPLY => 5,
 BLEND_CUSTOM => 6,
 BLEND_CUSTOM_SEPARATE => 7,
);
enum Gesture is export (
GESTURE_NONE => 0,
 GESTURE_TAP => 1,
 GESTURE_DOUBLETAP => 2,
 GESTURE_HOLD => 4,
 GESTURE_DRAG => 8,
 GESTURE_SWIPE_RIGHT => 16,
 GESTURE_SWIPE_LEFT => 32,
 GESTURE_SWIPE_UP => 64,
 GESTURE_SWIPE_DOWN => 128,
 GESTURE_PINCH_IN => 256,
 GESTURE_PINCH_OUT => 512,
);
enum CameraMode is export (
CAMERA_CUSTOM => 0,
 CAMERA_FREE => 1,
 CAMERA_ORBITAL => 2,
 CAMERA_FIRST_PERSON => 3,
 CAMERA_THIRD_PERSON => 4,
);
enum CameraProjection is export (
CAMERA_PERSPECTIVE => 0,
 CAMERA_ORTHOGRAPHIC => 1,
);
enum NPatchLayout is export (
NPATCH_NINE_PATCH => 0,
 NPATCH_THREE_PATCH_VERTICAL => 1,
 NPATCH_THREE_PATCH_HORIZONTAL => 2,
);
sub InitWindow (int32 $width, int32 $height, Str $title) is export is native(LIBRAYLIB){ * }
sub WindowShouldClose () of bool is export is native(LIBRAYLIB){ * }
sub CloseWindow () is export is native(LIBRAYLIB){ * }
sub IsWindowReady () of bool is export is native(LIBRAYLIB){ * }
sub IsWindowFullscreen () of bool is export is native(LIBRAYLIB){ * }
sub IsWindowHidden () of bool is export is native(LIBRAYLIB){ * }
sub IsWindowMinimized () of bool is export is native(LIBRAYLIB){ * }
sub IsWindowMaximized () of bool is export is native(LIBRAYLIB){ * }
sub IsWindowFocused () of bool is export is native(LIBRAYLIB){ * }
sub IsWindowResized () of bool is export is native(LIBRAYLIB){ * }
sub IsWindowState (int32 $flag) of bool is export is native(LIBRAYLIB){ * }
sub SetWindowState (int32 $flags) is export is native(LIBRAYLIB){ * }
sub ClearWindowState (int32 $flags) is export is native(LIBRAYLIB){ * }
sub ToggleFullscreen () is export is native(LIBRAYLIB){ * }
sub ToggleBorderlessWindowed () is export is native(LIBRAYLIB){ * }
sub MaximizeWindow () is export is native(LIBRAYLIB){ * }
sub MinimizeWindow () is export is native(LIBRAYLIB){ * }
sub RestoreWindow () is export is native(LIBRAYLIB){ * }
sub SetWindowIcon (Image $image) is export is native(LIBRAYLIB){ * }
sub SetWindowIcons (Pointer[Image] $images, int32 $count) is export is native(LIBRAYLIB){ * }
sub SetWindowTitle (Str $title) is export is native(LIBRAYLIB){ * }
sub SetWindowPosition (int32 $x, int32 $y) is export is native(LIBRAYLIB){ * }
sub SetWindowMonitor (int32 $monitor) is export is native(LIBRAYLIB){ * }
sub SetWindowMinSize (int32 $width, int32 $height) is export is native(LIBRAYLIB){ * }
sub SetWindowSize (int32 $width, int32 $height) is export is native(LIBRAYLIB){ * }
sub SetWindowOpacity (num32 $opacity) is export is native(LIBRAYLIB){ * }
sub SetWindowFocused () is export is native(LIBRAYLIB){ * }
sub GetWindowHandle () is export is native(LIBRAYLIB){ * }
sub GetScreenWidth () of int32 is export is native(LIBRAYLIB){ * }
sub GetScreenHeight () of int32 is export is native(LIBRAYLIB){ * }
sub GetRenderWidth () of int32 is export is native(LIBRAYLIB){ * }
sub GetRenderHeight () of int32 is export is native(LIBRAYLIB){ * }
sub GetMonitorCount () of int32 is export is native(LIBRAYLIB){ * }
sub GetCurrentMonitor () of int32 is export is native(LIBRAYLIB){ * }
sub GetMonitorPosition (int32 $monitor) of Vector2 is export is native(LIBRAYLIB){ * }
sub GetMonitorWidth (int32 $monitor) of int32 is export is native(LIBRAYLIB){ * }
sub GetMonitorHeight (int32 $monitor) of int32 is export is native(LIBRAYLIB){ * }
sub GetMonitorPhysicalWidth (int32 $monitor) of int32 is export is native(LIBRAYLIB){ * }
sub GetMonitorPhysicalHeight (int32 $monitor) of int32 is export is native(LIBRAYLIB){ * }
sub GetMonitorRefreshRate (int32 $monitor) of int32 is export is native(LIBRAYLIB){ * }
sub GetWindowPosition () of Vector2 is export is native(LIBRAYLIB){ * }
sub GetWindowScaleDPI () of Vector2 is export is native(LIBRAYLIB){ * }
sub GetMonitorName (int32 $monitor) of Str is export is native(LIBRAYLIB){ * }
sub SetClipboardText (Str $text) is export is native(LIBRAYLIB){ * }
sub GetClipboardText () of Str is export is native(LIBRAYLIB){ * }
sub EnableEventWaiting () is export is native(LIBRAYLIB){ * }
sub DisableEventWaiting () is export is native(LIBRAYLIB){ * }
sub SwapScreenBuffer () is export is native(LIBRAYLIB){ * }
sub PollInputEvents () is export is native(LIBRAYLIB){ * }
sub WaitTime (num64 $seconds) is export is native(LIBRAYLIB){ * }
sub ShowCursor () is export is native(LIBRAYLIB){ * }
sub HideCursor () is export is native(LIBRAYLIB){ * }
sub IsCursorHidden () of bool is export is native(LIBRAYLIB){ * }
sub EnableCursor () is export is native(LIBRAYLIB){ * }
sub DisableCursor () is export is native(LIBRAYLIB){ * }
sub IsCursorOnScreen () of bool is export is native(LIBRAYLIB){ * }
sub ClearBackground (Color $color) is export is native(LIBRAYLIB){ * }
sub BeginDrawing () is export is native(LIBRAYLIB){ * }
sub EndDrawing () is export is native(LIBRAYLIB){ * }
sub BeginMode2D (Camera2D $camera) is export is native(LIBRAYLIB){ * }
sub EndMode2D () is export is native(LIBRAYLIB){ * }
sub BeginMode3D (Camera3D $camera) is export is native(LIBRAYLIB){ * }
sub EndMode3D () is export is native(LIBRAYLIB){ * }
sub BeginTextureMode (RenderTexture2D $target) is export is native(LIBRAYLIB){ * }
sub EndTextureMode () is export is native(LIBRAYLIB){ * }
sub BeginShaderMode (Shader $shader) is export is native(LIBRAYLIB){ * }
sub EndShaderMode () is export is native(LIBRAYLIB){ * }
sub BeginBlendMode (int32 $mode) is export is native(LIBRAYLIB){ * }
sub EndBlendMode () is export is native(LIBRAYLIB){ * }
sub BeginScissorMode (int32 $x, int32 $y, int32 $width, int32 $height) is export is native(LIBRAYLIB){ * }
sub EndScissorMode () is export is native(LIBRAYLIB){ * }
sub BeginVrStereoMode (VrStereoConfig $config) is export is native(LIBRAYLIB){ * }
sub EndVrStereoMode () is export is native(LIBRAYLIB){ * }
sub LoadVrStereoConfig (VrDeviceInfo $device) of VrStereoConfig is export is native(LIBRAYLIB){ * }
sub UnloadVrStereoConfig (VrStereoConfig $config) is export is native(LIBRAYLIB){ * }
sub LoadShader (Str $vsFileName, Str $fsFileName) of Shader is export is native(LIBRAYLIB){ * }
sub LoadShaderFromMemory (Str $vsCode, Str $fsCode) of Shader is export is native(LIBRAYLIB){ * }
sub IsShaderReady (Shader $shader) of bool is export is native(LIBRAYLIB){ * }
sub GetShaderLocation (Shader $shader, Str $uniformName) of int32 is export is native(LIBRAYLIB){ * }
sub GetShaderLocationAttrib (Shader $shader, Str $attribName) of int32 is export is native(LIBRAYLIB){ * }
sub SetShaderValue (Shader $shader, int32 $locIndex, ) is export is native(LIBRAYLIB){ * }
sub SetShaderValueV (Shader $shader, int32 $locIndex, ) is export is native(LIBRAYLIB){ * }
sub SetShaderValueMatrix (Shader $shader, int32 $locIndex, Matrix $mat) is export is native(LIBRAYLIB){ * }
sub SetShaderValueTexture (Shader $shader, int32 $locIndex, Texture2D $texture) is export is native(LIBRAYLIB){ * }
sub UnloadShader (Shader $shader) is export is native(LIBRAYLIB){ * }
sub GetMouseRay (Vector2 $mousePosition, Camera $camera) of Ray is export is native(LIBRAYLIB){ * }
sub GetCameraMatrix (Camera $camera) of Matrix is export is native(LIBRAYLIB){ * }
sub GetCameraMatrix2D (Camera2D $camera) of Matrix is export is native(LIBRAYLIB){ * }
sub GetWorldToScreen (Vector3 $position, Camera $camera) of Vector2 is export is native(LIBRAYLIB){ * }
sub GetScreenToWorld2D (Vector2 $position, Camera2D $camera) of Vector2 is export is native(LIBRAYLIB){ * }
sub GetWorldToScreenEx (Vector3 $position, Camera $camera, int32 $width, int32 $height) of Vector2 is export is native(LIBRAYLIB){ * }
sub GetWorldToScreen2D (Vector2 $position, Camera2D $camera) of Vector2 is export is native(LIBRAYLIB){ * }
sub SetTargetFPS (int32 $fps) is export is native(LIBRAYLIB){ * }
sub GetFPS () of int32 is export is native(LIBRAYLIB){ * }
sub GetFrameTime () of num32 is export is native(LIBRAYLIB){ * }
sub GetTime () of num64 is export is native(LIBRAYLIB){ * }
sub GetRandomValue (int32 $min, int32 $max) of int32 is export is native(LIBRAYLIB){ * }
sub SetRandomSeed (int32 $seed) is export is native(LIBRAYLIB){ * }
sub TakeScreenshot (Str $fileName) is export is native(LIBRAYLIB){ * }
sub SetConfigFlags (int32 $flags) is export is native(LIBRAYLIB){ * }
sub TraceLog (int32 $logLevel, Str $text, ) is export is native(LIBRAYLIB){ * }
sub SetTraceLogLevel (int32 $logLevel) is export is native(LIBRAYLIB){ * }
sub MemAlloc (int32 $size) is export is native(LIBRAYLIB){ * }
sub MemRealloc () is export is native(LIBRAYLIB){ * }
sub MemFree () is export is native(LIBRAYLIB){ * }
sub OpenURL (Str $url) is export is native(LIBRAYLIB){ * }
sub LoadFileData (Str $fileName, Pointer[int32] $bytesRead) of Str is export is native(LIBRAYLIB){ * }
sub UnloadFileData (Str $data) is export is native(LIBRAYLIB){ * }
sub SaveFileData (Str $fileName, ) of bool is export is native(LIBRAYLIB){ * }
sub ExportDataAsCode (Str $data, int32 $size, Str $fileName) of bool is export is native(LIBRAYLIB){ * }
sub LoadFileText (Str $fileName) of Str is export is native(LIBRAYLIB){ * }
sub UnloadFileText (Str $text) is export is native(LIBRAYLIB){ * }
sub SaveFileText (Str $fileName, Str $text) of bool is export is native(LIBRAYLIB){ * }
sub FileExists (Str $fileName) of bool is export is native(LIBRAYLIB){ * }
sub DirectoryExists (Str $dirPath) of bool is export is native(LIBRAYLIB){ * }
sub IsFileExtension (Str $fileName, Str $ext) of bool is export is native(LIBRAYLIB){ * }
sub GetFileLength (Str $fileName) of int32 is export is native(LIBRAYLIB){ * }
sub GetFileExtension (Str $fileName) of Str is export is native(LIBRAYLIB){ * }
sub GetFileName (Str $filePath) of Str is export is native(LIBRAYLIB){ * }
sub GetFileNameWithoutExt (Str $filePath) of Str is export is native(LIBRAYLIB){ * }
sub GetDirectoryPath (Str $filePath) of Str is export is native(LIBRAYLIB){ * }
sub GetPrevDirectoryPath (Str $dirPath) of Str is export is native(LIBRAYLIB){ * }
sub GetWorkingDirectory () of Str is export is native(LIBRAYLIB){ * }
sub GetApplicationDirectory () of Str is export is native(LIBRAYLIB){ * }
sub ChangeDirectory (Str $dir) of bool is export is native(LIBRAYLIB){ * }
sub IsPathFile (Str $path) of bool is export is native(LIBRAYLIB){ * }
sub LoadDirectoryFiles (Str $dirPath) of FilePathList is export is native(LIBRAYLIB){ * }
sub LoadDirectoryFilesEx (Str $basePath, Str $filter, bool $scanSubdirs) of FilePathList is export is native(LIBRAYLIB){ * }
sub UnloadDirectoryFiles (FilePathList $files) is export is native(LIBRAYLIB){ * }
sub IsFileDropped () of bool is export is native(LIBRAYLIB){ * }
sub LoadDroppedFiles () of FilePathList is export is native(LIBRAYLIB){ * }
sub UnloadDroppedFiles (FilePathList $files) is export is native(LIBRAYLIB){ * }
sub GetFileModTime (Str $fileName) of long is export is native(LIBRAYLIB){ * }
sub CompressData (Str $data, int32 $dataSize, Pointer[int32] $compDataSize) of Str is export is native(LIBRAYLIB){ * }
sub DecompressData (Str $compData, int32 $compDataSize, Pointer[int32] $dataSize) of Str is export is native(LIBRAYLIB){ * }
sub EncodeDataBase64 (Str $data, int32 $dataSize, Pointer[int32] $outputSize) of Str is export is native(LIBRAYLIB){ * }
sub DecodeDataBase64 (Str $data, Pointer[int32] $outputSize) of Str is export is native(LIBRAYLIB){ * }
sub IsKeyPressed (int32 $key) of bool is export is native(LIBRAYLIB){ * }
sub IsKeyPressedRepeat (int32 $key) of bool is export is native(LIBRAYLIB){ * }
sub IsKeyDown (int32 $key) of bool is export is native(LIBRAYLIB){ * }
sub IsKeyReleased (int32 $key) of bool is export is native(LIBRAYLIB){ * }
sub IsKeyUp (int32 $key) of bool is export is native(LIBRAYLIB){ * }
sub SetExitKey (int32 $key) is export is native(LIBRAYLIB){ * }
sub GetKeyPressed () of int32 is export is native(LIBRAYLIB){ * }
sub GetCharPressed () of int32 is export is native(LIBRAYLIB){ * }
sub IsGamepadAvailable (int32 $gamepad) of bool is export is native(LIBRAYLIB){ * }
sub GetGamepadName (int32 $gamepad) of Str is export is native(LIBRAYLIB){ * }
sub IsGamepadButtonPressed (int32 $gamepad, int32 $button) of bool is export is native(LIBRAYLIB){ * }
sub IsGamepadButtonDown (int32 $gamepad, int32 $button) of bool is export is native(LIBRAYLIB){ * }
sub IsGamepadButtonReleased (int32 $gamepad, int32 $button) of bool is export is native(LIBRAYLIB){ * }
sub IsGamepadButtonUp (int32 $gamepad, int32 $button) of bool is export is native(LIBRAYLIB){ * }
sub GetGamepadButtonPressed () of int32 is export is native(LIBRAYLIB){ * }
sub GetGamepadAxisCount (int32 $gamepad) of int32 is export is native(LIBRAYLIB){ * }
sub GetGamepadAxisMovement (int32 $gamepad, int32 $axis) of num32 is export is native(LIBRAYLIB){ * }
sub SetGamepadMappings (Str $mappings) of int32 is export is native(LIBRAYLIB){ * }
sub IsMouseButtonPressed (int32 $button) of bool is export is native(LIBRAYLIB){ * }
sub IsMouseButtonDown (int32 $button) of bool is export is native(LIBRAYLIB){ * }
sub IsMouseButtonReleased (int32 $button) of bool is export is native(LIBRAYLIB){ * }
sub IsMouseButtonUp (int32 $button) of bool is export is native(LIBRAYLIB){ * }
sub GetMouseX () of int32 is export is native(LIBRAYLIB){ * }
sub GetMouseY () of int32 is export is native(LIBRAYLIB){ * }
sub GetMousePosition () of Vector2 is export is native(LIBRAYLIB){ * }
sub GetMouseDelta () of Vector2 is export is native(LIBRAYLIB){ * }
sub SetMousePosition (int32 $x, int32 $y) is export is native(LIBRAYLIB){ * }
sub SetMouseOffset (int32 $offsetX, int32 $offsetY) is export is native(LIBRAYLIB){ * }
sub SetMouseScale (num32 $scaleX, num32 $scaleY) is export is native(LIBRAYLIB){ * }
sub GetMouseWheelMove () of num32 is export is native(LIBRAYLIB){ * }
sub GetMouseWheelMoveV () of Vector2 is export is native(LIBRAYLIB){ * }
sub SetMouseCursor (int32 $cursor) is export is native(LIBRAYLIB){ * }
sub GetTouchX () of int32 is export is native(LIBRAYLIB){ * }
sub GetTouchY () of int32 is export is native(LIBRAYLIB){ * }
sub GetTouchPosition (int32 $index) of Vector2 is export is native(LIBRAYLIB){ * }
sub GetTouchPointId (int32 $index) of int32 is export is native(LIBRAYLIB){ * }
sub GetTouchPointCount () of int32 is export is native(LIBRAYLIB){ * }
sub SetGesturesEnabled (int32 $flags) is export is native(LIBRAYLIB){ * }
sub IsGestureDetected (int32 $gesture) of bool is export is native(LIBRAYLIB){ * }
sub GetGestureDetected () of int32 is export is native(LIBRAYLIB){ * }
sub GetGestureHoldDuration () of num32 is export is native(LIBRAYLIB){ * }
sub GetGestureDragVector () of Vector2 is export is native(LIBRAYLIB){ * }
sub GetGestureDragAngle () of num32 is export is native(LIBRAYLIB){ * }
sub GetGesturePinchVector () of Vector2 is export is native(LIBRAYLIB){ * }
sub GetGesturePinchAngle () of num32 is export is native(LIBRAYLIB){ * }
sub UpdateCamera (Pointer[Camera] $camera, int32 $mode) is export is native(LIBRAYLIB){ * }
sub UpdateCameraPro (Pointer[Camera] $camera, Vector3 $movement, Vector3 $rotation, num32 $zoom) is export is native(LIBRAYLIB){ * }
sub SetShapesTexture (Texture2D $texture, Rectangle $source) is export is native(LIBRAYLIB){ * }
sub DrawPixel (int32 $posX, int32 $posY, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawPixelV (Vector2 $position, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawLine (int32 $startPosX, int32 $startPosY, int32 $endPosX, int32 $endPosY, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawLineV (Vector2 $startPos, Vector2 $endPos, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawLineEx (Vector2 $startPos, Vector2 $endPos, num32 $thick, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawLineBezier (Vector2 $startPos, Vector2 $endPos, num32 $thick, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawLineBezierQuad (Vector2 $startPos, Vector2 $endPos, Vector2 $controlPos, num32 $thick, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawLineBezierCubic (Vector2 $startPos, Vector2 $endPos, Vector2 $startControlPos, Vector2 $endControlPos, num32 $thick, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawLineBSpline (Pointer[Vector2] $points, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawLineCatmullRom (Pointer[Vector2] $points, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawLineStrip (Pointer[Vector2] $points, int32 $pointCount, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawCircle (int32 $centerX, int32 $centerY, num32 $radius, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawCircleSector (Vector2 $center, num32 $radius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawCircleSectorLines (Vector2 $center, num32 $radius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawCircleGradient (int32 $centerX, int32 $centerY, num32 $radius, Color $color1, Color $color2) is export is native(LIBRAYLIB){ * }
sub DrawCircleV (Vector2 $center, num32 $radius, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawCircleLines (int32 $centerX, int32 $centerY, num32 $radius, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawEllipse (int32 $centerX, int32 $centerY, num32 $radiusH, num32 $radiusV, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawEllipseLines (int32 $centerX, int32 $centerY, num32 $radiusH, num32 $radiusV, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawRing (Vector2 $center, num32 $innerRadius, num32 $outerRadius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawRingLines (Vector2 $center, num32 $innerRadius, num32 $outerRadius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawRectangle (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawRectangleV (Vector2 $position, Vector2 $size, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawRectangleRec (Rectangle $rec, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawRectanglePro (Rectangle $rec, Vector2 $origin, num32 $rotation, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawRectangleGradientV (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color1, Color $color2) is export is native(LIBRAYLIB){ * }
sub DrawRectangleGradientH (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color1, Color $color2) is export is native(LIBRAYLIB){ * }
sub DrawRectangleGradientEx (Rectangle $rec, Color $col1, Color $col2, Color $col3, Color $col4) is export is native(LIBRAYLIB){ * }
sub DrawRectangleLines (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawRectangleLinesEx (Rectangle $rec, num32 $lineThick, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawRectangleRounded (Rectangle $rec, num32 $roundness, int32 $segments, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawRectangleRoundedLines (Rectangle $rec, num32 $roundness, int32 $segments, num32 $lineThick, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawTriangle (Vector2 $v1, Vector2 $v2, Vector2 $v3, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawTriangleLines (Vector2 $v1, Vector2 $v2, Vector2 $v3, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawTriangleFan (Pointer[Vector2] $points, int32 $pointCount, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawTriangleStrip (Pointer[Vector2] $points, int32 $pointCount, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawPoly (Vector2 $center, int32 $sides, num32 $radius, num32 $rotation, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawPolyLines (Vector2 $center, int32 $sides, num32 $radius, num32 $rotation, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawPolyLinesEx (Vector2 $center, int32 $sides, num32 $radius, num32 $rotation, num32 $lineThick, Color $color) is export is native(LIBRAYLIB){ * }
sub CheckCollisionRecs (Rectangle $rec1, Rectangle $rec2) of bool is export is native(LIBRAYLIB){ * }
sub CheckCollisionCircles (Vector2 $center1, num32 $radius1, Vector2 $center2, num32 $radius2) of bool is export is native(LIBRAYLIB){ * }
sub CheckCollisionCircleRec (Vector2 $center, num32 $radius, Rectangle $rec) of bool is export is native(LIBRAYLIB){ * }
sub CheckCollisionPointRec (Vector2 $point, Rectangle $rec) of bool is export is native(LIBRAYLIB){ * }
sub CheckCollisionPointCircle (Vector2 $point, Vector2 $center, num32 $radius) of bool is export is native(LIBRAYLIB){ * }
sub CheckCollisionPointTriangle (Vector2 $point, Vector2 $p1, Vector2 $p2, Vector2 $p3) of bool is export is native(LIBRAYLIB){ * }
sub CheckCollisionPointPoly (Vector2 $point, Pointer[Vector2] $points, int32 $pointCount) of bool is export is native(LIBRAYLIB){ * }
sub CheckCollisionLines (Vector2 $startPos1, Vector2 $endPos1, Vector2 $startPos2, Vector2 $endPos2, Pointer[Vector2] $collisionPoint) of bool is export is native(LIBRAYLIB){ * }
sub CheckCollisionPointLine (Vector2 $point, Vector2 $p1, Vector2 $p2, int32 $threshold) of bool is export is native(LIBRAYLIB){ * }
sub GetCollisionRec (Rectangle $rec1, Rectangle $rec2) of Rectangle is export is native(LIBRAYLIB){ * }
sub LoadImage (Str $fileName) of Image is export is native(LIBRAYLIB){ * }
sub LoadImageRaw (Str $fileName, int32 $width, int32 $height, int32 $format, int32 $headerSize) of Image is export is native(LIBRAYLIB){ * }
sub LoadImageAnim (Str $fileName, Pointer[int32] $frames) of Image is export is native(LIBRAYLIB){ * }
sub LoadImageFromMemory (Str $fileType, Str $fileData, int32 $dataSize) of Image is export is native(LIBRAYLIB){ * }
sub LoadImageFromTexture (Texture2D $texture) of Image is export is native(LIBRAYLIB){ * }
sub LoadImageFromScreen () of Image is export is native(LIBRAYLIB){ * }
sub IsImageReady (Image $image) of bool is export is native(LIBRAYLIB){ * }
sub UnloadImage (Image $image) is export is native(LIBRAYLIB){ * }
sub ExportImage (Image $image, Str $fileName) of bool is export is native(LIBRAYLIB){ * }
sub ExportImageToMemory (Image $image, Str $fileType, Pointer[int32] $fileSize) of Str is export is native(LIBRAYLIB){ * }
sub ExportImageAsCode (Image $image, Str $fileName) of bool is export is native(LIBRAYLIB){ * }
sub GenImageColor (int32 $width, int32 $height, Color $color) of Image is export is native(LIBRAYLIB){ * }
sub GenImageGradientLinear (int32 $width, int32 $height, int32 $direction, Color $start, Color $end) of Image is export is native(LIBRAYLIB){ * }
sub GenImageGradientRadial (int32 $width, int32 $height, num32 $density, Color $inner, Color $outer) of Image is export is native(LIBRAYLIB){ * }
sub GenImageGradientSquare (int32 $width, int32 $height, num32 $density, Color $inner, Color $outer) of Image is export is native(LIBRAYLIB){ * }
sub GenImageChecked (int32 $width, int32 $height, int32 $checksX, int32 $checksY, Color $col1, Color $col2) of Image is export is native(LIBRAYLIB){ * }
sub GenImageWhiteNoise (int32 $width, int32 $height, num32 $factor) of Image is export is native(LIBRAYLIB){ * }
sub GenImagePerlinNoise (int32 $width, int32 $height, int32 $offsetX, int32 $offsetY, num32 $scale) of Image is export is native(LIBRAYLIB){ * }
sub GenImageCellular (int32 $width, int32 $height, int32 $tileSize) of Image is export is native(LIBRAYLIB){ * }
sub GenImageText (int32 $width, int32 $height, Str $text) of Image is export is native(LIBRAYLIB){ * }
sub ImageCopy (Image $image) of Image is export is native(LIBRAYLIB){ * }
sub ImageFromImage (Image $image, Rectangle $rec) of Image is export is native(LIBRAYLIB){ * }
sub ImageText (Str $text, int32 $fontSize, Color $color) of Image is export is native(LIBRAYLIB){ * }
sub ImageTextEx (Font $font, Str $text, num32 $fontSize, num32 $spacing, Color $tint) of Image is export is native(LIBRAYLIB){ * }
sub ImageFormat (Pointer[Image] $image, int32 $newFormat) is export is native(LIBRAYLIB){ * }
sub ImageToPOT (Pointer[Image] $image, Color $fill) is export is native(LIBRAYLIB){ * }
sub ImageCrop (Pointer[Image] $image, Rectangle $crop) is export is native(LIBRAYLIB){ * }
sub ImageAlphaCrop (Pointer[Image] $image, num32 $threshold) is export is native(LIBRAYLIB){ * }
sub ImageAlphaClear (Pointer[Image] $image, Color $color, num32 $threshold) is export is native(LIBRAYLIB){ * }
sub ImageAlphaMask (Pointer[Image] $image, Image $alphaMask) is export is native(LIBRAYLIB){ * }
sub ImageAlphaPremultiply (Pointer[Image] $image) is export is native(LIBRAYLIB){ * }
sub ImageBlurGaussian (Pointer[Image] $image, int32 $blurSize) is export is native(LIBRAYLIB){ * }
sub ImageResize (Pointer[Image] $image, int32 $newWidth, int32 $newHeight) is export is native(LIBRAYLIB){ * }
sub ImageResizeNN (Pointer[Image] $image, int32 $newWidth, int32 $newHeight) is export is native(LIBRAYLIB){ * }
sub ImageResizeCanvas (Pointer[Image] $image, int32 $newWidth, int32 $newHeight, int32 $offsetX, int32 $offsetY, Color $fill) is export is native(LIBRAYLIB){ * }
sub ImageMipmaps (Pointer[Image] $image) is export is native(LIBRAYLIB){ * }
sub ImageDither (Pointer[Image] $image, int32 $rBpp, int32 $gBpp, int32 $bBpp, int32 $aBpp) is export is native(LIBRAYLIB){ * }
sub ImageFlipVertical (Pointer[Image] $image) is export is native(LIBRAYLIB){ * }
sub ImageFlipHorizontal (Pointer[Image] $image) is export is native(LIBRAYLIB){ * }
sub ImageRotate (Pointer[Image] $image, int32 $degrees) is export is native(LIBRAYLIB){ * }
sub ImageRotateCW (Pointer[Image] $image) is export is native(LIBRAYLIB){ * }
sub ImageRotateCCW (Pointer[Image] $image) is export is native(LIBRAYLIB){ * }
sub ImageColorTint (Pointer[Image] $image, Color $color) is export is native(LIBRAYLIB){ * }
sub ImageColorInvert (Pointer[Image] $image) is export is native(LIBRAYLIB){ * }
sub ImageColorGrayscale (Pointer[Image] $image) is export is native(LIBRAYLIB){ * }
sub ImageColorContrast (Pointer[Image] $image, num32 $contrast) is export is native(LIBRAYLIB){ * }
sub ImageColorBrightness (Pointer[Image] $image, int32 $brightness) is export is native(LIBRAYLIB){ * }
sub ImageColorReplace (Pointer[Image] $image, Color $color, Color $replace) is export is native(LIBRAYLIB){ * }
sub LoadImageColors (Image $image) of Color is export is native(LIBRAYLIB){ * }
sub LoadImagePalette (Image $image, int32 $maxPaletteSize, Pointer[int32] $colorCount) of Color is export is native(LIBRAYLIB){ * }
sub UnloadImageColors (Pointer[Color] $colors) is export is native(LIBRAYLIB){ * }
sub UnloadImagePalette (Pointer[Color] $colors) is export is native(LIBRAYLIB){ * }
sub GetImageAlphaBorder (Image $image, num32 $threshold) of Rectangle is export is native(LIBRAYLIB){ * }
sub GetImageColor (Image $image, int32 $x, int32 $y) of Color is export is native(LIBRAYLIB){ * }
sub ImageClearBackground (Pointer[Image] $dst, Color $color) is export is native(LIBRAYLIB){ * }
sub ImageDrawPixel (Pointer[Image] $dst, int32 $posX, int32 $posY, Color $color) is export is native(LIBRAYLIB){ * }
sub ImageDrawPixelV (Pointer[Image] $dst, Vector2 $position, Color $color) is export is native(LIBRAYLIB){ * }
sub ImageDrawLine (Pointer[Image] $dst, int32 $startPosX, int32 $startPosY, int32 $endPosX, int32 $endPosY, Color $color) is export is native(LIBRAYLIB){ * }
sub ImageDrawLineV (Pointer[Image] $dst, Vector2 $start, Vector2 $end, Color $color) is export is native(LIBRAYLIB){ * }
sub ImageDrawCircle (Pointer[Image] $dst, int32 $centerX, int32 $centerY, int32 $radius, Color $color) is export is native(LIBRAYLIB){ * }
sub ImageDrawCircleV (Pointer[Image] $dst, Vector2 $center, int32 $radius, Color $color) is export is native(LIBRAYLIB){ * }
sub ImageDrawCircleLines (Pointer[Image] $dst, int32 $centerX, int32 $centerY, int32 $radius, Color $color) is export is native(LIBRAYLIB){ * }
sub ImageDrawCircleLinesV (Pointer[Image] $dst, Vector2 $center, int32 $radius, Color $color) is export is native(LIBRAYLIB){ * }
sub ImageDrawRectangle (Pointer[Image] $dst, int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color) is export is native(LIBRAYLIB){ * }
sub ImageDrawRectangleV (Pointer[Image] $dst, Vector2 $position, Vector2 $size, Color $color) is export is native(LIBRAYLIB){ * }
sub ImageDrawRectangleRec (Pointer[Image] $dst, Rectangle $rec, Color $color) is export is native(LIBRAYLIB){ * }
sub ImageDrawRectangleLines (Pointer[Image] $dst, Rectangle $rec, int32 $thick, Color $color) is export is native(LIBRAYLIB){ * }
sub ImageDraw (Pointer[Image] $dst, Image $src, Rectangle $srcRec, Rectangle $dstRec, Color $tint) is export is native(LIBRAYLIB){ * }
sub ImageDrawText (Pointer[Image] $dst, Str $text, int32 $posX, int32 $posY, int32 $fontSize, Color $color) is export is native(LIBRAYLIB){ * }
sub ImageDrawTextEx (Pointer[Image] $dst, Font $font, Str $text, Vector2 $position, num32 $fontSize, num32 $spacing, Color $tint) is export is native(LIBRAYLIB){ * }
sub LoadTexture (Str $fileName) of Texture2D is export is native(LIBRAYLIB){ * }
sub LoadTextureFromImage (Image $image) of Texture2D is export is native(LIBRAYLIB){ * }
sub LoadTextureCubemap (Image $image, int32 $layout) of TextureCubemap is export is native(LIBRAYLIB){ * }
sub LoadRenderTexture (int32 $width, int32 $height) of RenderTexture2D is export is native(LIBRAYLIB){ * }
sub IsTextureReady (Texture2D $texture) of bool is export is native(LIBRAYLIB){ * }
sub UnloadTexture (Texture2D $texture) is export is native(LIBRAYLIB){ * }
sub IsRenderTextureReady (RenderTexture2D $target) of bool is export is native(LIBRAYLIB){ * }
sub UnloadRenderTexture (RenderTexture2D $target) is export is native(LIBRAYLIB){ * }
sub UpdateTexture (Texture2D $texture, ) is export is native(LIBRAYLIB){ * }
sub UpdateTextureRec (Texture2D $texture, Rectangle $rec, ) is export is native(LIBRAYLIB){ * }
sub GenTextureMipmaps (Pointer[Texture2D] $texture) is export is native(LIBRAYLIB){ * }
sub SetTextureFilter (Texture2D $texture, int32 $filter) is export is native(LIBRAYLIB){ * }
sub SetTextureWrap (Texture2D $texture, int32 $wrap) is export is native(LIBRAYLIB){ * }
sub DrawTexture (Texture2D $texture, int32 $posX, int32 $posY, Color $tint) is export is native(LIBRAYLIB){ * }
sub DrawTextureV (Texture2D $texture, Vector2 $position, Color $tint) is export is native(LIBRAYLIB){ * }
sub DrawTextureEx (Texture2D $texture, Vector2 $position, num32 $rotation, num32 $scale, Color $tint) is export is native(LIBRAYLIB){ * }
sub DrawTextureRec (Texture2D $texture, Rectangle $source, Vector2 $position, Color $tint) is export is native(LIBRAYLIB){ * }
sub DrawTexturePro (Texture2D $texture, Rectangle $source, Rectangle $dest, Vector2 $origin, num32 $rotation, Color $tint) is export is native(LIBRAYLIB){ * }
sub DrawTextureNPatch (Texture2D $texture, NPatchInfo $nPatchInfo, Rectangle $dest, Vector2 $origin, num32 $rotation, Color $tint) is export is native(LIBRAYLIB){ * }
sub Fade (Color $color, num32 $alpha) of Color is export is native(LIBRAYLIB){ * }
sub ColorToInt (Color $color) of int32 is export is native(LIBRAYLIB){ * }
sub ColorNormalize (Color $color) of Vector4 is export is native(LIBRAYLIB){ * }
sub ColorFromNormalized (Vector4 $normalized) of Color is export is native(LIBRAYLIB){ * }
sub ColorToHSV (Color $color) of Vector3 is export is native(LIBRAYLIB){ * }
sub ColorFromHSV (num32 $hue, num32 $saturation, num32 $value) of Color is export is native(LIBRAYLIB){ * }
sub ColorTint (Color $color, Color $tint) of Color is export is native(LIBRAYLIB){ * }
sub ColorBrightness (Color $color, num32 $factor) of Color is export is native(LIBRAYLIB){ * }
sub ColorContrast (Color $color, num32 $contrast) of Color is export is native(LIBRAYLIB){ * }
sub ColorAlpha (Color $color, num32 $alpha) of Color is export is native(LIBRAYLIB){ * }
sub ColorAlphaBlend (Color $dst, Color $src, Color $tint) of Color is export is native(LIBRAYLIB){ * }
sub GetColor (int32 $hexValue) of Color is export is native(LIBRAYLIB){ * }
sub GetPixelColor () of Color is export is native(LIBRAYLIB){ * }
sub SetPixelColor () is export is native(LIBRAYLIB){ * }
sub GetPixelDataSize (int32 $width, int32 $height, int32 $format) of int32 is export is native(LIBRAYLIB){ * }
sub GetFontDefault () of Font is export is native(LIBRAYLIB){ * }
sub LoadFont (Str $fileName) of Font is export is native(LIBRAYLIB){ * }
sub LoadFontEx (Str $fileName, int32 $fontSize, Pointer[int32] $fontChars, int32 $glyphCount) of Font is export is native(LIBRAYLIB){ * }
sub LoadFontFromImage (Image $image, Color $key, int32 $firstChar) of Font is export is native(LIBRAYLIB){ * }
sub LoadFontFromMemory (Str $fileType, Str $fileData, int32 $dataSize, int32 $fontSize, Pointer[int32] $fontChars, int32 $glyphCount) of Font is export is native(LIBRAYLIB){ * }
sub IsFontReady (Font $font) of bool is export is native(LIBRAYLIB){ * }
sub LoadFontData (Str $fileData, int32 $dataSize, int32 $fontSize, Pointer[int32] $fontChars, int32 $glyphCount, int32 $type) of GlyphInfo is export is native(LIBRAYLIB){ * }
sub GenImageFontAtlas (Pointer[GlyphInfo] $chars, Pointer[Rectangle] $recs, int32 $glyphCount, int32 $fontSize, int32 $padding, int32 $packMethod) of Image is export is native(LIBRAYLIB){ * }
sub UnloadFontData (Pointer[GlyphInfo] $chars, int32 $glyphCount) is export is native(LIBRAYLIB){ * }
sub UnloadFont (Font $font) is export is native(LIBRAYLIB){ * }
sub ExportFontAsCode (Font $font, Str $fileName) of bool is export is native(LIBRAYLIB){ * }
sub DrawFPS (int32 $posX, int32 $posY) is export is native(LIBRAYLIB){ * }
sub DrawText (Str $text, int32 $posX, int32 $posY, int32 $fontSize, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawTextEx (Font $font, Str $text, Vector2 $position, num32 $fontSize, num32 $spacing, Color $tint) is export is native(LIBRAYLIB){ * }
sub DrawTextPro (Font $font, Str $text, Vector2 $position, Vector2 $origin, num32 $rotation, num32 $fontSize, num32 $spacing, Color $tint) is export is native(LIBRAYLIB){ * }
sub DrawTextCodepoint (Font $font, int32 $codepoint, Vector2 $position, num32 $fontSize, Color $tint) is export is native(LIBRAYLIB){ * }
sub DrawTextCodepoints (Font $font, Pointer[int32] $codepoints, int32 $count, Vector2 $position, num32 $fontSize, num32 $spacing, Color $tint) is export is native(LIBRAYLIB){ * }
sub SetTextLineSpacing (int32 $spacing) is export is native(LIBRAYLIB){ * }
sub MeasureText (Str $text, int32 $fontSize) of int32 is export is native(LIBRAYLIB){ * }
sub MeasureTextEx (Font $font, Str $text, num32 $fontSize, num32 $spacing) of Vector2 is export is native(LIBRAYLIB){ * }
sub GetGlyphIndex (Font $font, int32 $codepoint) of int32 is export is native(LIBRAYLIB){ * }
sub GetGlyphInfo (Font $font, int32 $codepoint) of GlyphInfo is export is native(LIBRAYLIB){ * }
sub GetGlyphAtlasRec (Font $font, int32 $codepoint) of Rectangle is export is native(LIBRAYLIB){ * }
sub LoadUTF8 (Pointer[int32] $codepoints, int32 $length) of Str is export is native(LIBRAYLIB){ * }
sub UnloadUTF8 (Str $text) is export is native(LIBRAYLIB){ * }
sub LoadCodepoints (Str $text, Pointer[int32] $count) of int32 is export is native(LIBRAYLIB){ * }
sub UnloadCodepoints (Pointer[int32] $codepoints) is export is native(LIBRAYLIB){ * }
sub GetCodepointCount (Str $text) of int32 is export is native(LIBRAYLIB){ * }
sub GetCodepoint (Str $text, Pointer[int32] $codepointSize) of int32 is export is native(LIBRAYLIB){ * }
sub GetCodepointNext (Str $text, Pointer[int32] $codepointSize) of int32 is export is native(LIBRAYLIB){ * }
sub GetCodepointPrevious (Str $text, Pointer[int32] $codepointSize) of int32 is export is native(LIBRAYLIB){ * }
sub CodepointToUTF8 (int32 $codepoint, Pointer[int32] $utf8Size) of Str is export is native(LIBRAYLIB){ * }
sub TextCopy (Str $dst, Str $src) of int32 is export is native(LIBRAYLIB){ * }
sub TextIsEqual (Str $text1, Str $text2) of bool is export is native(LIBRAYLIB){ * }
sub TextLength (Str $text) of int32 is export is native(LIBRAYLIB){ * }
sub TextFormat (Str $text, ) of Str is export is native(LIBRAYLIB){ * }
sub TextSubtext (Str $text, int32 $position, int32 $length) of Str is export is native(LIBRAYLIB){ * }
sub TextReplace (Str $text, Str $replace, Str $by) of Str is export is native(LIBRAYLIB){ * }
sub TextInsert (Str $text, Str $insert, int32 $position) of Str is export is native(LIBRAYLIB){ * }
sub TextJoin (Str $textList, int32 $count, Str $delimiter) of Str is export is native(LIBRAYLIB){ * }
sub TextSplit (Str $text, Str $delimiter, Pointer[int32] $count) of Str is export is native(LIBRAYLIB){ * }
sub TextAppend (Str $text, Str $append, Pointer[int32] $position) is export is native(LIBRAYLIB){ * }
sub TextFindIndex (Str $text, Str $find) of int32 is export is native(LIBRAYLIB){ * }
sub TextToUpper (Str $text) of Str is export is native(LIBRAYLIB){ * }
sub TextToLower (Str $text) of Str is export is native(LIBRAYLIB){ * }
sub TextToPascal (Str $text) of Str is export is native(LIBRAYLIB){ * }
sub TextToInteger (Str $text) of int32 is export is native(LIBRAYLIB){ * }
sub DrawLine3D (Vector3 $startPos, Vector3 $endPos, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawPoint3D (Vector3 $position, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawCircle3D (Vector3 $center, num32 $radius, Vector3 $rotationAxis, num32 $rotationAngle, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawTriangle3D (Vector3 $v1, Vector3 $v2, Vector3 $v3, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawTriangleStrip3D (Pointer[Vector3] $points, int32 $pointCount, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawCube (Vector3 $position, num32 $width, num32 $height, num32 $length, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawCubeV (Vector3 $position, Vector3 $size, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawCubeWires (Vector3 $position, num32 $width, num32 $height, num32 $length, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawCubeWiresV (Vector3 $position, Vector3 $size, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawSphere (Vector3 $centerPos, num32 $radius, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawSphereEx (Vector3 $centerPos, num32 $radius, int32 $rings, int32 $slices, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawSphereWires (Vector3 $centerPos, num32 $radius, int32 $rings, int32 $slices, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawCylinder (Vector3 $position, num32 $radiusTop, num32 $radiusBottom, num32 $height, int32 $slices, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawCylinderEx (Vector3 $startPos, Vector3 $endPos, num32 $startRadius, num32 $endRadius, int32 $sides, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawCylinderWires (Vector3 $position, num32 $radiusTop, num32 $radiusBottom, num32 $height, int32 $slices, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawCylinderWiresEx (Vector3 $startPos, Vector3 $endPos, num32 $startRadius, num32 $endRadius, int32 $sides, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawCapsule (Vector3 $startPos, Vector3 $endPos, num32 $radius, int32 $slices, int32 $rings, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawCapsuleWires (Vector3 $startPos, Vector3 $endPos, num32 $radius, int32 $slices, int32 $rings, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawPlane (Vector3 $centerPos, Vector2 $size, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawRay (Ray $ray, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawGrid (int32 $slices, num32 $spacing) is export is native(LIBRAYLIB){ * }
sub LoadModel (Str $fileName) of Model is export is native(LIBRAYLIB){ * }
sub LoadModelFromMesh (Mesh $mesh) of Model is export is native(LIBRAYLIB){ * }
sub IsModelReady (Model $model) of bool is export is native(LIBRAYLIB){ * }
sub UnloadModel (Model $model) is export is native(LIBRAYLIB){ * }
sub GetModelBoundingBox (Model $model) of BoundingBox is export is native(LIBRAYLIB){ * }
sub DrawModel (Model $model, Vector3 $position, num32 $scale, Color $tint) is export is native(LIBRAYLIB){ * }
sub DrawModelEx (Model $model, Vector3 $position, Vector3 $rotationAxis, num32 $rotationAngle, Vector3 $scale, Color $tint) is export is native(LIBRAYLIB){ * }
sub DrawModelWires (Model $model, Vector3 $position, num32 $scale, Color $tint) is export is native(LIBRAYLIB){ * }
sub DrawModelWiresEx (Model $model, Vector3 $position, Vector3 $rotationAxis, num32 $rotationAngle, Vector3 $scale, Color $tint) is export is native(LIBRAYLIB){ * }
sub DrawBoundingBox (BoundingBox $box, Color $color) is export is native(LIBRAYLIB){ * }
sub DrawBillboard (Camera $camera, Texture2D $texture, Vector3 $position, num32 $size, Color $tint) is export is native(LIBRAYLIB){ * }
sub DrawBillboardRec (Camera $camera, Texture2D $texture, Rectangle $source, Vector3 $position, Vector2 $size, Color $tint) is export is native(LIBRAYLIB){ * }
sub DrawBillboardPro (Camera $camera, Texture2D $texture, Rectangle $source, Vector3 $position, Vector3 $up, Vector2 $size, Vector2 $origin, num32 $rotation, Color $tint) is export is native(LIBRAYLIB){ * }
sub UploadMesh (Pointer[Mesh] $mesh, bool $dynamic) is export is native(LIBRAYLIB){ * }
sub UpdateMeshBuffer (Mesh $mesh, int32 $index, ) is export is native(LIBRAYLIB){ * }
sub UnloadMesh (Mesh $mesh) is export is native(LIBRAYLIB){ * }
sub DrawMesh (Mesh $mesh, Material $material, Matrix $transform) is export is native(LIBRAYLIB){ * }
sub DrawMeshInstanced (Mesh $mesh, Material $material, Pointer[Matrix] $transforms, int32 $instances) is export is native(LIBRAYLIB){ * }
sub ExportMesh (Mesh $mesh, Str $fileName) of bool is export is native(LIBRAYLIB){ * }
sub GetMeshBoundingBox (Mesh $mesh) of BoundingBox is export is native(LIBRAYLIB){ * }
sub GenMeshTangents (Pointer[Mesh] $mesh) is export is native(LIBRAYLIB){ * }
sub GenMeshPoly (int32 $sides, num32 $radius) of Mesh is export is native(LIBRAYLIB){ * }
sub GenMeshPlane (num32 $width, num32 $length, int32 $resX, int32 $resZ) of Mesh is export is native(LIBRAYLIB){ * }
sub GenMeshCube (num32 $width, num32 $height, num32 $length) of Mesh is export is native(LIBRAYLIB){ * }
sub GenMeshSphere (num32 $radius, int32 $rings, int32 $slices) of Mesh is export is native(LIBRAYLIB){ * }
sub GenMeshHemiSphere (num32 $radius, int32 $rings, int32 $slices) of Mesh is export is native(LIBRAYLIB){ * }
sub GenMeshCylinder (num32 $radius, num32 $height, int32 $slices) of Mesh is export is native(LIBRAYLIB){ * }
sub GenMeshCone (num32 $radius, num32 $height, int32 $slices) of Mesh is export is native(LIBRAYLIB){ * }
sub GenMeshTorus (num32 $radius, num32 $size, int32 $radSeg, int32 $sides) of Mesh is export is native(LIBRAYLIB){ * }
sub GenMeshKnot (num32 $radius, num32 $size, int32 $radSeg, int32 $sides) of Mesh is export is native(LIBRAYLIB){ * }
sub GenMeshHeightmap (Image $heightmap, Vector3 $size) of Mesh is export is native(LIBRAYLIB){ * }
sub GenMeshCubicmap (Image $cubicmap, Vector3 $cubeSize) of Mesh is export is native(LIBRAYLIB){ * }
sub LoadMaterials (Str $fileName, Pointer[int32] $materialCount) of Material is export is native(LIBRAYLIB){ * }
sub LoadMaterialDefault () of Material is export is native(LIBRAYLIB){ * }
sub IsMaterialReady (Material $material) of bool is export is native(LIBRAYLIB){ * }
sub UnloadMaterial (Material $material) is export is native(LIBRAYLIB){ * }
sub SetMaterialTexture (Pointer[Material] $material, int32 $mapType, Texture2D $texture) is export is native(LIBRAYLIB){ * }
sub SetModelMeshMaterial (Pointer[Model] $model, int32 $meshId, int32 $materialId) is export is native(LIBRAYLIB){ * }
sub LoadModelAnimations (Str $fileName, Pointer[int32] $animCount) of ModelAnimation is export is native(LIBRAYLIB){ * }
sub UpdateModelAnimation (Model $model, ModelAnimation $anim, int32 $frame) is export is native(LIBRAYLIB){ * }
sub UnloadModelAnimation (ModelAnimation $anim) is export is native(LIBRAYLIB){ * }
sub UnloadModelAnimations (Pointer[ModelAnimation] $animations, int32 $count) is export is native(LIBRAYLIB){ * }
sub IsModelAnimationValid (Model $model, ModelAnimation $anim) of bool is export is native(LIBRAYLIB){ * }
sub CheckCollisionSpheres (Vector3 $center1, num32 $radius1, Vector3 $center2, num32 $radius2) of bool is export is native(LIBRAYLIB){ * }
sub CheckCollisionBoxes (BoundingBox $box1, BoundingBox $box2) of bool is export is native(LIBRAYLIB){ * }
sub CheckCollisionBoxSphere (BoundingBox $box, Vector3 $center, num32 $radius) of bool is export is native(LIBRAYLIB){ * }
sub GetRayCollisionSphere (Ray $ray, Vector3 $center, num32 $radius) of RayCollision is export is native(LIBRAYLIB){ * }
sub GetRayCollisionBox (Ray $ray, BoundingBox $box) of RayCollision is export is native(LIBRAYLIB){ * }
sub GetRayCollisionMesh (Ray $ray, Mesh $mesh, Matrix $transform) of RayCollision is export is native(LIBRAYLIB){ * }
sub GetRayCollisionTriangle (Ray $ray, Vector3 $p1, Vector3 $p2, Vector3 $p3) of RayCollision is export is native(LIBRAYLIB){ * }
sub GetRayCollisionQuad (Ray $ray, Vector3 $p1, Vector3 $p2, Vector3 $p3, Vector3 $p4) of RayCollision is export is native(LIBRAYLIB){ * }
sub InitAudioDevice () is export is native(LIBRAYLIB){ * }
sub CloseAudioDevice () is export is native(LIBRAYLIB){ * }
sub IsAudioDeviceReady () of bool is export is native(LIBRAYLIB){ * }
sub SetMasterVolume (num32 $volume) is export is native(LIBRAYLIB){ * }
sub LoadWave (Str $fileName) of Wave is export is native(LIBRAYLIB){ * }
sub LoadWaveFromMemory (Str $fileType, Str $fileData, int32 $dataSize) of Wave is export is native(LIBRAYLIB){ * }
sub IsWaveReady (Wave $wave) of bool is export is native(LIBRAYLIB){ * }
sub LoadSound (Str $fileName) of Sound is export is native(LIBRAYLIB){ * }
sub LoadSoundFromWave (Wave $wave) of Sound is export is native(LIBRAYLIB){ * }
sub LoadSoundAlias (Sound $source) of Sound is export is native(LIBRAYLIB){ * }
sub IsSoundReady (Sound $sound) of bool is export is native(LIBRAYLIB){ * }
sub UpdateSound (Sound $sound, ) is export is native(LIBRAYLIB){ * }
sub UnloadWave (Wave $wave) is export is native(LIBRAYLIB){ * }
sub UnloadSound (Sound $sound) is export is native(LIBRAYLIB){ * }
sub UnloadSoundAlias (Sound $alias) is export is native(LIBRAYLIB){ * }
sub ExportWave (Wave $wave, Str $fileName) of bool is export is native(LIBRAYLIB){ * }
sub ExportWaveAsCode (Wave $wave, Str $fileName) of bool is export is native(LIBRAYLIB){ * }
sub PlaySound (Sound $sound) is export is native(LIBRAYLIB){ * }
sub StopSound (Sound $sound) is export is native(LIBRAYLIB){ * }
sub PauseSound (Sound $sound) is export is native(LIBRAYLIB){ * }
sub ResumeSound (Sound $sound) is export is native(LIBRAYLIB){ * }
sub IsSoundPlaying (Sound $sound) of bool is export is native(LIBRAYLIB){ * }
sub SetSoundVolume (Sound $sound, num32 $volume) is export is native(LIBRAYLIB){ * }
sub SetSoundPitch (Sound $sound, num32 $pitch) is export is native(LIBRAYLIB){ * }
sub SetSoundPan (Sound $sound, num32 $pan) is export is native(LIBRAYLIB){ * }
sub WaveCopy (Wave $wave) of Wave is export is native(LIBRAYLIB){ * }
sub WaveCrop (Pointer[Wave] $wave, int32 $initSample, int32 $finalSample) is export is native(LIBRAYLIB){ * }
sub WaveFormat (Pointer[Wave] $wave, int32 $sampleRate, int32 $sampleSize, int32 $channels) is export is native(LIBRAYLIB){ * }
sub LoadWaveSamples (Wave $wave) of num32 is export is native(LIBRAYLIB){ * }
sub UnloadWaveSamples (Pointer[num32] $samples) is export is native(LIBRAYLIB){ * }
sub LoadMusicStream (Str $fileName) of Music is export is native(LIBRAYLIB){ * }
sub LoadMusicStreamFromMemory (Str $fileType, Str $data, int32 $dataSize) of Music is export is native(LIBRAYLIB){ * }
sub IsMusicReady (Music $music) of bool is export is native(LIBRAYLIB){ * }
sub UnloadMusicStream (Music $music) is export is native(LIBRAYLIB){ * }
sub PlayMusicStream (Music $music) is export is native(LIBRAYLIB){ * }
sub IsMusicStreamPlaying (Music $music) of bool is export is native(LIBRAYLIB){ * }
sub UpdateMusicStream (Music $music) is export is native(LIBRAYLIB){ * }
sub StopMusicStream (Music $music) is export is native(LIBRAYLIB){ * }
sub PauseMusicStream (Music $music) is export is native(LIBRAYLIB){ * }
sub ResumeMusicStream (Music $music) is export is native(LIBRAYLIB){ * }
sub SeekMusicStream (Music $music, num32 $position) is export is native(LIBRAYLIB){ * }
sub SetMusicVolume (Music $music, num32 $volume) is export is native(LIBRAYLIB){ * }
sub SetMusicPitch (Music $music, num32 $pitch) is export is native(LIBRAYLIB){ * }
sub SetMusicPan (Music $music, num32 $pan) is export is native(LIBRAYLIB){ * }
sub GetMusicTimeLength (Music $music) of num32 is export is native(LIBRAYLIB){ * }
sub GetMusicTimePlayed (Music $music) of num32 is export is native(LIBRAYLIB){ * }
sub LoadAudioStream (int32 $sampleRate, int32 $sampleSize, int32 $channels) of AudioStream is export is native(LIBRAYLIB){ * }
sub IsAudioStreamReady (AudioStream $stream) of bool is export is native(LIBRAYLIB){ * }
sub UnloadAudioStream (AudioStream $stream) is export is native(LIBRAYLIB){ * }
sub UpdateAudioStream (AudioStream $stream, ) is export is native(LIBRAYLIB){ * }
sub IsAudioStreamProcessed (AudioStream $stream) of bool is export is native(LIBRAYLIB){ * }
sub PlayAudioStream (AudioStream $stream) is export is native(LIBRAYLIB){ * }
sub PauseAudioStream (AudioStream $stream) is export is native(LIBRAYLIB){ * }
sub ResumeAudioStream (AudioStream $stream) is export is native(LIBRAYLIB){ * }
sub IsAudioStreamPlaying (AudioStream $stream) of bool is export is native(LIBRAYLIB){ * }
sub StopAudioStream (AudioStream $stream) is export is native(LIBRAYLIB){ * }
sub SetAudioStreamVolume (AudioStream $stream, num32 $volume) is export is native(LIBRAYLIB){ * }
sub SetAudioStreamPitch (AudioStream $stream, num32 $pitch) is export is native(LIBRAYLIB){ * }
sub SetAudioStreamPan (AudioStream $stream, num32 $pan) is export is native(LIBRAYLIB){ * }
sub SetAudioStreamBufferSizeDefault (int32 $size) is export is native(LIBRAYLIB){ * }
