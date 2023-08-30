unit module Raylib::Bindings:ver<0.0.1>:auth<zef:vushu>;
use NativeCall;
constant LIBRAYLIB = '/usr/local/lib/libraylib.so';
class Vector2 is export is repr('CStruct') is rw {
    has num32 $.x;
    has num32 $.y;
}
class Vector3 is export is repr('CStruct') is rw {
    has num32 $.x;
    has num32 $.y;
    has num32 $.z;
}
class Vector4 is export is repr('CStruct') is rw {
    has num32 $.x;
    has num32 $.y;
    has num32 $.z;
    has num32 $.w;
}
class Quaternion is Vector4 is export is repr('CStruct') is rw {}
class Matrix is export is repr('CStruct') is rw {
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
class Color is export is repr('CStruct') is rw {
    has byte $.r;
    has byte $.g;
    has byte $.b;
    has byte $.a;
}
class Rectangle is export is repr('CStruct') is rw {
    has num32 $.x;
    has num32 $.y;
    has num32 $.width;
    has num32 $.height;
}
class Image is export is repr('CStruct') is rw {
    has Pointer[void] $.data;
    has int32 $.width;
    has int32 $.height;
    has int32 $.mipmaps;
    has int32 $.format;
}
class Texture is export is repr('CStruct') is rw {
    has uint32 $.id;
    has int32 $.width;
    has int32 $.height;
    has int32 $.mipmaps;
    has int32 $.format;
}
class Texture2D is Texture is export is repr('CStruct') is rw {}
class TextureCubemap is Texture is export is repr('CStruct') is rw {}
class RenderTexture is export is repr('CStruct') is rw {
    has uint32 $.id;
    has Texture $.texture;
    has Texture $.depth;
}
class RenderTexture2D is RenderTexture is export is repr('CStruct') is rw {}
class NPatchInfo is export is repr('CStruct') is rw {
    has Rectangle $.source;
    has int32 $.left;
    has int32 $.top;
    has int32 $.right;
    has int32 $.bottom;
    has int32 $.layout;
}
class GlyphInfo is export is repr('CStruct') is rw {
    has int32 $.value;
    has int32 $.offsetX;
    has int32 $.offsetY;
    has int32 $.advanceX;
    has Image $.image;
}
class Font is export is repr('CStruct') is rw {
    has int32 $.baseSize;
    has int32 $.glyphCount;
    has int32 $.glyphPadding;
    has Texture2D $.texture;
    has Pointer[Rectangle] $.recs;
    has Pointer[GlyphInfo] $.glyphs;
}
class Camera3D is export is repr('CStruct') is rw {
    has Vector3 $.position;
    has Vector3 $.target;
    has Vector3 $.up;
    has num32 $.fovy;
    has int32 $.projection;
}
class Camera is Camera3D is export is repr('CStruct') is rw {}
class Camera2D is export is repr('CStruct') is rw {
    has Vector2 $.offset;
    has Vector2 $.target;
    has num32 $.rotation;
    has num32 $.zoom;
}
class Mesh is export is repr('CStruct') is rw {
    has int32 $.vertexCount;
    has int32 $.triangleCount;
    has Pointer[num32] $.vertices;
    has Pointer[num32] $.texcoords;
    has Pointer[num32] $.texcoords2;
    has Pointer[num32] $.normals;
    has Pointer[num32] $.tangents;
    has Pointer[byte] $.colors;
    has Pointer[uint16] $.indices;
    has Pointer[num32] $.animVertices;
    has Pointer[num32] $.animNormals;
    has Pointer[byte] $.boneIds;
    has Pointer[num32] $.boneWeights;
    has uint32 $.vaoId;
    has Pointer[uint32] $.vboId;
}
class Shader is export is repr('CStruct') is rw {
    has uint32 $.id;
    has Pointer[int32] $.locs;
}
class MaterialMap is export is repr('CStruct') is rw {
    has Texture2D $.texture;
    has Color $.color;
    has num32 $.value;
}
class Material is export is repr('CStruct') is rw {
    has Shader $.shader;
    has Pointer[MaterialMap] $.maps;
    has CArray[num32] $.params;
}
class Transform is export is repr('CStruct') is rw {
    has Vector3 $.translation;
    has Quaternion $.rotation;
    has Vector3 $.scale;
}
class BoneInfo is export is repr('CStruct') is rw {
    has CArray[Str] $.name;
    has int32 $.parent;
}
class Model is export is repr('CStruct') is rw {
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
class ModelAnimation is export is repr('CStruct') is rw {
    has int32 $.boneCount;
    has int32 $.frameCount;
    has Pointer[BoneInfo] $.bones;
    has Pointer[Transform] $.framePoses;
    has CArray[Str] $.name;
}
class Ray is export is repr('CStruct') is rw {
    has Vector3 $.position;
    has Vector3 $.direction;
}
class RayCollision is export is repr('CStruct') is rw {
    has bool $.hit;
    has num32 $.distance;
    has Vector3 $.point;
    has Vector3 $.normal;
}
class BoundingBox is export is repr('CStruct') is rw {
    has Vector3 $.min;
    has Vector3 $.max;
}
class Wave is export is repr('CStruct') is rw {
    has uint32 $.frameCount;
    has uint32 $.sampleRate;
    has uint32 $.sampleSize;
    has uint32 $.channels;
    has Pointer[void] $.data;
}
class rAudioBuffer is export is repr('CStruct') is rw {  has int32 $.dummy;}
class rAudioProcessor is export is repr('CStruct') is rw {  has int32 $.dummy;}
class AudioStream is export is repr('CStruct') is rw {
    has Pointer[rAudioBuffer] $.buffer;
    has Pointer[rAudioProcessor] $.processor;
    has uint32 $.sampleRate;
    has uint32 $.sampleSize;
    has uint32 $.channels;
}
class Sound is export is repr('CStruct') is rw {
    has AudioStream $.stream;
    has uint32 $.frameCount;
}
class Music is export is repr('CStruct') is rw {
    has AudioStream $.stream;
    has uint32 $.frameCount;
    has bool $.looping;
    has int32 $.ctxType;
    has Pointer[void] $.ctxData;
}
class VrDeviceInfo is export is repr('CStruct') is rw {
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
class VrStereoConfig is export is repr('CStruct') is rw {
    has CArray[Matrix] $.projection;
    has CArray[Matrix] $.viewOffset;
    has CArray[num32] $.leftLensCenter;
    has CArray[num32] $.rightLensCenter;
    has CArray[num32] $.leftScreenCenter;
    has CArray[num32] $.rightScreenCenter;
    has CArray[num32] $.scale;
    has CArray[num32] $.scaleIn;
}
class FilePathList is export is repr('CStruct') is rw {
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
our sub init-window (int32 $width, int32 $height, Str $title) is export is native(LIBRAYLIB) is symbol('InitWindow'){ * }
our sub window-should-close () returns bool is export is native(LIBRAYLIB) is symbol('WindowShouldClose'){ * }
our sub close-window () is export is native(LIBRAYLIB) is symbol('CloseWindow'){ * }
our sub is-window-ready () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowReady'){ * }
our sub is-window-fullscreen () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowFullscreen'){ * }
our sub is-window-hidden () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowHidden'){ * }
our sub is-window-minimized () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowMinimized'){ * }
our sub is-window-maximized () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowMaximized'){ * }
our sub is-window-focused () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowFocused'){ * }
our sub is-window-resized () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowResized'){ * }
our sub is-window-state (int32 $flag) returns bool is export is native(LIBRAYLIB) is symbol('IsWindowState'){ * }
our sub set-window-state (int32 $flags) is export is native(LIBRAYLIB) is symbol('SetWindowState'){ * }
our sub clear-window-state (int32 $flags) is export is native(LIBRAYLIB) is symbol('ClearWindowState'){ * }
our sub toggle-fullscreen () is export is native(LIBRAYLIB) is symbol('ToggleFullscreen'){ * }
our sub toggle-borderless-windowed () is export is native(LIBRAYLIB) is symbol('ToggleBorderlessWindowed'){ * }
our sub maximize-window () is export is native(LIBRAYLIB) is symbol('MaximizeWindow'){ * }
our sub minimize-window () is export is native(LIBRAYLIB) is symbol('MinimizeWindow'){ * }
our sub restore-window () is export is native(LIBRAYLIB) is symbol('RestoreWindow'){ * }
our sub set-window-icon (Image $image) is export is native(LIBRAYLIB) is symbol('SetWindowIcon'){ * }
our sub set-window-icons (Pointer[Image] $images, int32 $count) is export is native(LIBRAYLIB) is symbol('SetWindowIcons'){ * }
our sub set-window-title (Str $title) is export is native(LIBRAYLIB) is symbol('SetWindowTitle'){ * }
our sub set-window-position (int32 $x, int32 $y) is export is native(LIBRAYLIB) is symbol('SetWindowPosition'){ * }
our sub set-window-monitor (int32 $monitor) is export is native(LIBRAYLIB) is symbol('SetWindowMonitor'){ * }
our sub set-window-min-size (int32 $width, int32 $height) is export is native(LIBRAYLIB) is symbol('SetWindowMinSize'){ * }
our sub set-window-size (int32 $width, int32 $height) is export is native(LIBRAYLIB) is symbol('SetWindowSize'){ * }
our sub set-window-opacity (num32 $opacity) is export is native(LIBRAYLIB) is symbol('SetWindowOpacity'){ * }
our sub set-window-focused () is export is native(LIBRAYLIB) is symbol('SetWindowFocused'){ * }
our sub get-window-handle () is export is native(LIBRAYLIB) is symbol('GetWindowHandle'){ * }
our sub get-screen-width () returns int32 is export is native(LIBRAYLIB) is symbol('GetScreenWidth'){ * }
our sub get-screen-height () returns int32 is export is native(LIBRAYLIB) is symbol('GetScreenHeight'){ * }
our sub get-render-width () returns int32 is export is native(LIBRAYLIB) is symbol('GetRenderWidth'){ * }
our sub get-render-height () returns int32 is export is native(LIBRAYLIB) is symbol('GetRenderHeight'){ * }
our sub get-monitor-count () returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorCount'){ * }
our sub get-current-monitor () returns int32 is export is native(LIBRAYLIB) is symbol('GetCurrentMonitor'){ * }
our sub get-monitor-position (int32 $monitor) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetMonitorPosition'){ * }
our sub get-monitor-width (int32 $monitor) returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorWidth'){ * }
our sub get-monitor-height (int32 $monitor) returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorHeight'){ * }
our sub get-monitor-physical-width (int32 $monitor) returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorPhysicalWidth'){ * }
our sub get-monitor-physical-height (int32 $monitor) returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorPhysicalHeight'){ * }
our sub get-monitor-refresh-rate (int32 $monitor) returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorRefreshRate'){ * }
our sub get-window-position () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetWindowPosition'){ * }
our sub get-window-scale-dpi () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetWindowScaleDPI'){ * }
our sub get-monitor-name (int32 $monitor) returns Str is export is native(LIBRAYLIB) is symbol('GetMonitorName'){ * }
our sub set-clipboard-text (Str $text) is export is native(LIBRAYLIB) is symbol('SetClipboardText'){ * }
our sub get-clipboard-text () returns Str is export is native(LIBRAYLIB) is symbol('GetClipboardText'){ * }
our sub enable-event-waiting () is export is native(LIBRAYLIB) is symbol('EnableEventWaiting'){ * }
our sub disable-event-waiting () is export is native(LIBRAYLIB) is symbol('DisableEventWaiting'){ * }
our sub swap-screen-buffer () is export is native(LIBRAYLIB) is symbol('SwapScreenBuffer'){ * }
our sub poll-input-events () is export is native(LIBRAYLIB) is symbol('PollInputEvents'){ * }
our sub wait-time (num64 $seconds) is export is native(LIBRAYLIB) is symbol('WaitTime'){ * }
our sub show-cursor () is export is native(LIBRAYLIB) is symbol('ShowCursor'){ * }
our sub hide-cursor () is export is native(LIBRAYLIB) is symbol('HideCursor'){ * }
our sub is-cursor-hidden () returns bool is export is native(LIBRAYLIB) is symbol('IsCursorHidden'){ * }
our sub enable-cursor () is export is native(LIBRAYLIB) is symbol('EnableCursor'){ * }
our sub disable-cursor () is export is native(LIBRAYLIB) is symbol('DisableCursor'){ * }
our sub is-cursor-on-screen () returns bool is export is native(LIBRAYLIB) is symbol('IsCursorOnScreen'){ * }
our sub clear-background (Color $color) is export is native(LIBRAYLIB) is symbol('ClearBackground'){ * }
our sub begin-drawing () is export is native(LIBRAYLIB) is symbol('BeginDrawing'){ * }
our sub end-drawing () is export is native(LIBRAYLIB) is symbol('EndDrawing'){ * }
our sub begin-mode2d (Camera2D $camera) is export is native(LIBRAYLIB) is symbol('BeginMode2D'){ * }
our sub end-mode2d () is export is native(LIBRAYLIB) is symbol('EndMode2D'){ * }
our sub begin-mode3d (Camera3D $camera) is export is native(LIBRAYLIB) is symbol('BeginMode3D'){ * }
our sub end-mode3d () is export is native(LIBRAYLIB) is symbol('EndMode3D'){ * }
our sub begin-texture-mode (RenderTexture2D $target) is export is native(LIBRAYLIB) is symbol('BeginTextureMode'){ * }
our sub end-texture-mode () is export is native(LIBRAYLIB) is symbol('EndTextureMode'){ * }
our sub begin-shader-mode (Shader $shader) is export is native(LIBRAYLIB) is symbol('BeginShaderMode'){ * }
our sub end-shader-mode () is export is native(LIBRAYLIB) is symbol('EndShaderMode'){ * }
our sub begin-blend-mode (int32 $mode) is export is native(LIBRAYLIB) is symbol('BeginBlendMode'){ * }
our sub end-blend-mode () is export is native(LIBRAYLIB) is symbol('EndBlendMode'){ * }
our sub begin-scissor-mode (int32 $x, int32 $y, int32 $width, int32 $height) is export is native(LIBRAYLIB) is symbol('BeginScissorMode'){ * }
our sub end-scissor-mode () is export is native(LIBRAYLIB) is symbol('EndScissorMode'){ * }
our sub begin-vr-stereo-mode (VrStereoConfig $config) is export is native(LIBRAYLIB) is symbol('BeginVrStereoMode'){ * }
our sub end-vr-stereo-mode () is export is native(LIBRAYLIB) is symbol('EndVrStereoMode'){ * }
our sub load-vr-stereo-config (VrDeviceInfo $device) returns VrStereoConfig is export is native(LIBRAYLIB) is symbol('LoadVrStereoConfig'){ * }
our sub unload-vr-stereo-config (VrStereoConfig $config) is export is native(LIBRAYLIB) is symbol('UnloadVrStereoConfig'){ * }
our sub load-shader (Str $vsFileName, Str $fsFileName) returns Shader is export is native(LIBRAYLIB) is symbol('LoadShader'){ * }
our sub load-shader-from-memory (Str $vsCode, Str $fsCode) returns Shader is export is native(LIBRAYLIB) is symbol('LoadShaderFromMemory'){ * }
our sub is-shader-ready (Shader $shader) returns bool is export is native(LIBRAYLIB) is symbol('IsShaderReady'){ * }
our sub get-shader-location (Shader $shader, Str $uniformName) returns int32 is export is native(LIBRAYLIB) is symbol('GetShaderLocation'){ * }
our sub get-shader-location-attrib (Shader $shader, Str $attribName) returns int32 is export is native(LIBRAYLIB) is symbol('GetShaderLocationAttrib'){ * }
our sub set-shader-value (Shader $shader, int32 $locIndex, ) is export is native(LIBRAYLIB) is symbol('SetShaderValue'){ * }
our sub set-shader-value-v (Shader $shader, int32 $locIndex, ) is export is native(LIBRAYLIB) is symbol('SetShaderValueV'){ * }
our sub set-shader-value-matrix (Shader $shader, int32 $locIndex, Matrix $mat) is export is native(LIBRAYLIB) is symbol('SetShaderValueMatrix'){ * }
our sub set-shader-value-texture (Shader $shader, int32 $locIndex, Texture2D $texture) is export is native(LIBRAYLIB) is symbol('SetShaderValueTexture'){ * }
our sub unload-shader (Shader $shader) is export is native(LIBRAYLIB) is symbol('UnloadShader'){ * }
our sub get-mouse-ray (Vector2 $mousePosition, Camera $camera) returns Ray is export is native(LIBRAYLIB) is symbol('GetMouseRay'){ * }
our sub get-camera-matrix (Camera $camera) returns Matrix is export is native(LIBRAYLIB) is symbol('GetCameraMatrix'){ * }
our sub get-camera-matrix2d (Camera2D $camera) returns Matrix is export is native(LIBRAYLIB) is symbol('GetCameraMatrix2D'){ * }
our sub get-world-to-screen (Vector3 $position, Camera $camera) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetWorldToScreen'){ * }
our sub get-screen-to-world2d (Vector2 $position, Camera2D $camera) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetScreenToWorld2D'){ * }
our sub get-world-to-screen-ex (Vector3 $position, Camera $camera, int32 $width, int32 $height) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetWorldToScreenEx'){ * }
our sub get-world-to-screen2d (Vector2 $position, Camera2D $camera) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetWorldToScreen2D'){ * }
our sub set-target-fps (int32 $fps) is export is native(LIBRAYLIB) is symbol('SetTargetFPS'){ * }
our sub get-fps () returns int32 is export is native(LIBRAYLIB) is symbol('GetFPS'){ * }
our sub get-frame-time () returns num32 is export is native(LIBRAYLIB) is symbol('GetFrameTime'){ * }
our sub get-time () returns num64 is export is native(LIBRAYLIB) is symbol('GetTime'){ * }
our sub get-random-value (int32 $min, int32 $max) returns int32 is export is native(LIBRAYLIB) is symbol('GetRandomValue'){ * }
our sub set-random-seed (int32 $seed) is export is native(LIBRAYLIB) is symbol('SetRandomSeed'){ * }
our sub take-screenshot (Str $fileName) is export is native(LIBRAYLIB) is symbol('TakeScreenshot'){ * }
our sub set-config-flags (int32 $flags) is export is native(LIBRAYLIB) is symbol('SetConfigFlags'){ * }
our sub trace-log (int32 $logLevel, Str $text, ) is export is native(LIBRAYLIB) is symbol('TraceLog'){ * }
our sub set-trace-log-level (int32 $logLevel) is export is native(LIBRAYLIB) is symbol('SetTraceLogLevel'){ * }
our sub mem-alloc (int32 $size) is export is native(LIBRAYLIB) is symbol('MemAlloc'){ * }
our sub mem-realloc () is export is native(LIBRAYLIB) is symbol('MemRealloc'){ * }
our sub mem-free () is export is native(LIBRAYLIB) is symbol('MemFree'){ * }
our sub open-url (Str $url) is export is native(LIBRAYLIB) is symbol('OpenURL'){ * }
our sub load-file-data (Str $fileName, Pointer[int32] $bytesRead) returns Str is export is native(LIBRAYLIB) is symbol('LoadFileData'){ * }
our sub unload-file-data (Str $data) is export is native(LIBRAYLIB) is symbol('UnloadFileData'){ * }
our sub save-file-data (Str $fileName, ) returns bool is export is native(LIBRAYLIB) is symbol('SaveFileData'){ * }
our sub export-data-as-code (Str $data, int32 $size, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportDataAsCode'){ * }
our sub load-file-text (Str $fileName) returns Str is export is native(LIBRAYLIB) is symbol('LoadFileText'){ * }
our sub unload-file-text (Str $text) is export is native(LIBRAYLIB) is symbol('UnloadFileText'){ * }
our sub save-file-text (Str $fileName, Str $text) returns bool is export is native(LIBRAYLIB) is symbol('SaveFileText'){ * }
our sub file-exists (Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('FileExists'){ * }
our sub directory-exists (Str $dirPath) returns bool is export is native(LIBRAYLIB) is symbol('DirectoryExists'){ * }
our sub is-file-extension (Str $fileName, Str $ext) returns bool is export is native(LIBRAYLIB) is symbol('IsFileExtension'){ * }
our sub get-file-length (Str $fileName) returns int32 is export is native(LIBRAYLIB) is symbol('GetFileLength'){ * }
our sub get-file-extension (Str $fileName) returns Str is export is native(LIBRAYLIB) is symbol('GetFileExtension'){ * }
our sub get-file-name (Str $filePath) returns Str is export is native(LIBRAYLIB) is symbol('GetFileName'){ * }
our sub get-file-name-without-ext (Str $filePath) returns Str is export is native(LIBRAYLIB) is symbol('GetFileNameWithoutExt'){ * }
our sub get-directory-path (Str $filePath) returns Str is export is native(LIBRAYLIB) is symbol('GetDirectoryPath'){ * }
our sub get-prev-directory-path (Str $dirPath) returns Str is export is native(LIBRAYLIB) is symbol('GetPrevDirectoryPath'){ * }
our sub get-working-directory () returns Str is export is native(LIBRAYLIB) is symbol('GetWorkingDirectory'){ * }
our sub get-application-directory () returns Str is export is native(LIBRAYLIB) is symbol('GetApplicationDirectory'){ * }
our sub change-directory (Str $dir) returns bool is export is native(LIBRAYLIB) is symbol('ChangeDirectory'){ * }
our sub is-path-file (Str $path) returns bool is export is native(LIBRAYLIB) is symbol('IsPathFile'){ * }
our sub load-directory-files (Str $dirPath) returns FilePathList is export is native(LIBRAYLIB) is symbol('LoadDirectoryFiles'){ * }
our sub load-directory-files-ex (Str $basePath, Str $filter, bool $scanSubdirs) returns FilePathList is export is native(LIBRAYLIB) is symbol('LoadDirectoryFilesEx'){ * }
our sub unload-directory-files (FilePathList $files) is export is native(LIBRAYLIB) is symbol('UnloadDirectoryFiles'){ * }
our sub is-file-dropped () returns bool is export is native(LIBRAYLIB) is symbol('IsFileDropped'){ * }
our sub load-dropped-files () returns FilePathList is export is native(LIBRAYLIB) is symbol('LoadDroppedFiles'){ * }
our sub unload-dropped-files (FilePathList $files) is export is native(LIBRAYLIB) is symbol('UnloadDroppedFiles'){ * }
our sub get-file-mod-time (Str $fileName) returns long is export is native(LIBRAYLIB) is symbol('GetFileModTime'){ * }
our sub compress-data (Str $data, int32 $dataSize, Pointer[int32] $compDataSize) returns Str is export is native(LIBRAYLIB) is symbol('CompressData'){ * }
our sub decompress-data (Str $compData, int32 $compDataSize, Pointer[int32] $dataSize) returns Str is export is native(LIBRAYLIB) is symbol('DecompressData'){ * }
our sub encode-data-base64 (Str $data, int32 $dataSize, Pointer[int32] $outputSize) returns Str is export is native(LIBRAYLIB) is symbol('EncodeDataBase64'){ * }
our sub decode-data-base64 (Str $data, Pointer[int32] $outputSize) returns Str is export is native(LIBRAYLIB) is symbol('DecodeDataBase64'){ * }
our sub is-key-pressed (int32 $key) returns bool is export is native(LIBRAYLIB) is symbol('IsKeyPressed'){ * }
our sub is-key-pressed-repeat (int32 $key) returns bool is export is native(LIBRAYLIB) is symbol('IsKeyPressedRepeat'){ * }
our sub is-key-down (int32 $key) returns bool is export is native(LIBRAYLIB) is symbol('IsKeyDown'){ * }
our sub is-key-released (int32 $key) returns bool is export is native(LIBRAYLIB) is symbol('IsKeyReleased'){ * }
our sub is-key-up (int32 $key) returns bool is export is native(LIBRAYLIB) is symbol('IsKeyUp'){ * }
our sub set-exit-key (int32 $key) is export is native(LIBRAYLIB) is symbol('SetExitKey'){ * }
our sub get-key-pressed () returns int32 is export is native(LIBRAYLIB) is symbol('GetKeyPressed'){ * }
our sub get-char-pressed () returns int32 is export is native(LIBRAYLIB) is symbol('GetCharPressed'){ * }
our sub is-gamepad-available (int32 $gamepad) returns bool is export is native(LIBRAYLIB) is symbol('IsGamepadAvailable'){ * }
our sub get-gamepad-name (int32 $gamepad) returns Str is export is native(LIBRAYLIB) is symbol('GetGamepadName'){ * }
our sub is-gamepad-button-pressed (int32 $gamepad, int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsGamepadButtonPressed'){ * }
our sub is-gamepad-button-down (int32 $gamepad, int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsGamepadButtonDown'){ * }
our sub is-gamepad-button-released (int32 $gamepad, int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsGamepadButtonReleased'){ * }
our sub is-gamepad-button-up (int32 $gamepad, int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsGamepadButtonUp'){ * }
our sub get-gamepad-button-pressed () returns int32 is export is native(LIBRAYLIB) is symbol('GetGamepadButtonPressed'){ * }
our sub get-gamepad-axis-count (int32 $gamepad) returns int32 is export is native(LIBRAYLIB) is symbol('GetGamepadAxisCount'){ * }
our sub get-gamepad-axis-movement (int32 $gamepad, int32 $axis) returns num32 is export is native(LIBRAYLIB) is symbol('GetGamepadAxisMovement'){ * }
our sub set-gamepad-mappings (Str $mappings) returns int32 is export is native(LIBRAYLIB) is symbol('SetGamepadMappings'){ * }
our sub is-mouse-button-pressed (int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsMouseButtonPressed'){ * }
our sub is-mouse-button-down (int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsMouseButtonDown'){ * }
our sub is-mouse-button-released (int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsMouseButtonReleased'){ * }
our sub is-mouse-button-up (int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsMouseButtonUp'){ * }
our sub get-mouse-x () returns int32 is export is native(LIBRAYLIB) is symbol('GetMouseX'){ * }
our sub get-mouse-y () returns int32 is export is native(LIBRAYLIB) is symbol('GetMouseY'){ * }
our sub get-mouse-position () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetMousePosition'){ * }
our sub get-mouse-delta () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetMouseDelta'){ * }
our sub set-mouse-position (int32 $x, int32 $y) is export is native(LIBRAYLIB) is symbol('SetMousePosition'){ * }
our sub set-mouse-offset (int32 $offsetX, int32 $offsetY) is export is native(LIBRAYLIB) is symbol('SetMouseOffset'){ * }
our sub set-mouse-scale (num32 $scaleX, num32 $scaleY) is export is native(LIBRAYLIB) is symbol('SetMouseScale'){ * }
our sub get-mouse-wheel-move () returns num32 is export is native(LIBRAYLIB) is symbol('GetMouseWheelMove'){ * }
our sub get-mouse-wheel-move-v () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetMouseWheelMoveV'){ * }
our sub set-mouse-cursor (int32 $cursor) is export is native(LIBRAYLIB) is symbol('SetMouseCursor'){ * }
our sub get-touch-x () returns int32 is export is native(LIBRAYLIB) is symbol('GetTouchX'){ * }
our sub get-touch-y () returns int32 is export is native(LIBRAYLIB) is symbol('GetTouchY'){ * }
our sub get-touch-position (int32 $index) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetTouchPosition'){ * }
our sub get-touch-point-id (int32 $index) returns int32 is export is native(LIBRAYLIB) is symbol('GetTouchPointId'){ * }
our sub get-touch-point-count () returns int32 is export is native(LIBRAYLIB) is symbol('GetTouchPointCount'){ * }
our sub set-gestures-enabled (int32 $flags) is export is native(LIBRAYLIB) is symbol('SetGesturesEnabled'){ * }
our sub is-gesture-detected (int32 $gesture) returns bool is export is native(LIBRAYLIB) is symbol('IsGestureDetected'){ * }
our sub get-gesture-detected () returns int32 is export is native(LIBRAYLIB) is symbol('GetGestureDetected'){ * }
our sub get-gesture-hold-duration () returns num32 is export is native(LIBRAYLIB) is symbol('GetGestureHoldDuration'){ * }
our sub get-gesture-drag-vector () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetGestureDragVector'){ * }
our sub get-gesture-drag-angle () returns num32 is export is native(LIBRAYLIB) is symbol('GetGestureDragAngle'){ * }
our sub get-gesture-pinch-vector () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetGesturePinchVector'){ * }
our sub get-gesture-pinch-angle () returns num32 is export is native(LIBRAYLIB) is symbol('GetGesturePinchAngle'){ * }
our sub update-camera (Pointer[Camera] $camera, int32 $mode) is export is native(LIBRAYLIB) is symbol('UpdateCamera'){ * }
our sub update-camera-pro (Pointer[Camera] $camera, Vector3 $movement, Vector3 $rotation, num32 $zoom) is export is native(LIBRAYLIB) is symbol('UpdateCameraPro'){ * }
our sub set-shapes-texture (Texture2D $texture, Rectangle $source) is export is native(LIBRAYLIB) is symbol('SetShapesTexture'){ * }
our sub draw-pixel (int32 $posX, int32 $posY, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPixel'){ * }
our sub draw-pixel-v (Vector2 $position, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPixelV'){ * }
our sub draw-line (int32 $startPosX, int32 $startPosY, int32 $endPosX, int32 $endPosY, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLine'){ * }
our sub draw-line-v (Vector2 $startPos, Vector2 $endPos, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineV'){ * }
our sub draw-line-ex (Vector2 $startPos, Vector2 $endPos, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineEx'){ * }
our sub draw-line-bezier (Vector2 $startPos, Vector2 $endPos, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineBezier'){ * }
our sub draw-line-bezier-quad (Vector2 $startPos, Vector2 $endPos, Vector2 $controlPos, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineBezierQuad'){ * }
our sub draw-line-bezier-cubic (Vector2 $startPos, Vector2 $endPos, Vector2 $startControlPos, Vector2 $endControlPos, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineBezierCubic'){ * }
our sub draw-line-bspline (Pointer[Vector2] $points, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineBSpline'){ * }
our sub draw-line-catmull-rom (Pointer[Vector2] $points, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineCatmullRom'){ * }
our sub draw-line-strip (Pointer[Vector2] $points, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineStrip'){ * }
our sub draw-circle (int32 $centerX, int32 $centerY, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircle'){ * }
our sub draw-circle-sector (Vector2 $center, num32 $radius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleSector'){ * }
our sub draw-circle-sector-lines (Vector2 $center, num32 $radius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleSectorLines'){ * }
our sub draw-circle-gradient (int32 $centerX, int32 $centerY, num32 $radius, Color $color1, Color $color2) is export is native(LIBRAYLIB) is symbol('DrawCircleGradient'){ * }
our sub draw-circle-v (Vector2 $center, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleV'){ * }
our sub draw-circle-lines (int32 $centerX, int32 $centerY, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleLines'){ * }
our sub draw-ellipse (int32 $centerX, int32 $centerY, num32 $radiusH, num32 $radiusV, Color $color) is export is native(LIBRAYLIB) is symbol('DrawEllipse'){ * }
our sub draw-ellipse-lines (int32 $centerX, int32 $centerY, num32 $radiusH, num32 $radiusV, Color $color) is export is native(LIBRAYLIB) is symbol('DrawEllipseLines'){ * }
our sub draw-ring (Vector2 $center, num32 $innerRadius, num32 $outerRadius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRing'){ * }
our sub draw-ring-lines (Vector2 $center, num32 $innerRadius, num32 $outerRadius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRingLines'){ * }
our sub draw-rectangle (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangle'){ * }
our sub draw-rectangle-v (Vector2 $position, Vector2 $size, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleV'){ * }
our sub draw-rectangle-rec (Rectangle $rec, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleRec'){ * }
our sub draw-rectangle-pro (Rectangle $rec, Vector2 $origin, num32 $rotation, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectanglePro'){ * }
our sub draw-rectangle-gradient-v (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color1, Color $color2) is export is native(LIBRAYLIB) is symbol('DrawRectangleGradientV'){ * }
our sub draw-rectangle-gradient-h (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color1, Color $color2) is export is native(LIBRAYLIB) is symbol('DrawRectangleGradientH'){ * }
our sub draw-rectangle-gradient-ex (Rectangle $rec, Color $col1, Color $col2, Color $col3, Color $col4) is export is native(LIBRAYLIB) is symbol('DrawRectangleGradientEx'){ * }
our sub draw-rectangle-lines (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleLines'){ * }
our sub draw-rectangle-lines-ex (Rectangle $rec, num32 $lineThick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleLinesEx'){ * }
our sub draw-rectangle-rounded (Rectangle $rec, num32 $roundness, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleRounded'){ * }
our sub draw-rectangle-rounded-lines (Rectangle $rec, num32 $roundness, int32 $segments, num32 $lineThick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleRoundedLines'){ * }
our sub draw-triangle (Vector2 $v1, Vector2 $v2, Vector2 $v3, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangle'){ * }
our sub draw-triangle-lines (Vector2 $v1, Vector2 $v2, Vector2 $v3, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleLines'){ * }
our sub draw-triangle-fan (Pointer[Vector2] $points, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleFan'){ * }
our sub draw-triangle-strip (Pointer[Vector2] $points, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleStrip'){ * }
our sub draw-poly (Vector2 $center, int32 $sides, num32 $radius, num32 $rotation, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPoly'){ * }
our sub draw-poly-lines (Vector2 $center, int32 $sides, num32 $radius, num32 $rotation, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPolyLines'){ * }
our sub draw-poly-lines-ex (Vector2 $center, int32 $sides, num32 $radius, num32 $rotation, num32 $lineThick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPolyLinesEx'){ * }
our sub check-collision-recs (Rectangle $rec1, Rectangle $rec2) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionRecs'){ * }
our sub check-collision-circles (Vector2 $center1, num32 $radius1, Vector2 $center2, num32 $radius2) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionCircles'){ * }
our sub check-collision-circle-rec (Vector2 $center, num32 $radius, Rectangle $rec) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionCircleRec'){ * }
our sub check-collision-point-rec (Vector2 $point, Rectangle $rec) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointRec'){ * }
our sub check-collision-point-circle (Vector2 $point, Vector2 $center, num32 $radius) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointCircle'){ * }
our sub check-collision-point-triangle (Vector2 $point, Vector2 $p1, Vector2 $p2, Vector2 $p3) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointTriangle'){ * }
our sub check-collision-point-poly (Vector2 $point, Pointer[Vector2] $points, int32 $pointCount) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointPoly'){ * }
our sub check-collision-lines (Vector2 $startPos1, Vector2 $endPos1, Vector2 $startPos2, Vector2 $endPos2, Pointer[Vector2] $collisionPoint) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionLines'){ * }
our sub check-collision-point-line (Vector2 $point, Vector2 $p1, Vector2 $p2, int32 $threshold) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointLine'){ * }
our sub get-collision-rec (Rectangle $rec1, Rectangle $rec2) returns Rectangle is export is native(LIBRAYLIB) is symbol('GetCollisionRec'){ * }
our sub load-image (Str $fileName) returns Image is export is native(LIBRAYLIB) is symbol('LoadImage'){ * }
our sub load-image-raw (Str $fileName, int32 $width, int32 $height, int32 $format, int32 $headerSize) returns Image is export is native(LIBRAYLIB) is symbol('LoadImageRaw'){ * }
our sub load-image-anim (Str $fileName, Pointer[int32] $frames) returns Image is export is native(LIBRAYLIB) is symbol('LoadImageAnim'){ * }
our sub load-image-from-memory (Str $fileType, Str $fileData, int32 $dataSize) returns Image is export is native(LIBRAYLIB) is symbol('LoadImageFromMemory'){ * }
our sub load-image-from-texture (Texture2D $texture) returns Image is export is native(LIBRAYLIB) is symbol('LoadImageFromTexture'){ * }
our sub load-image-from-screen () returns Image is export is native(LIBRAYLIB) is symbol('LoadImageFromScreen'){ * }
our sub is-image-ready (Image $image) returns bool is export is native(LIBRAYLIB) is symbol('IsImageReady'){ * }
our sub unload-image (Image $image) is export is native(LIBRAYLIB) is symbol('UnloadImage'){ * }
our sub export-image (Image $image, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportImage'){ * }
our sub export-image-to-memory (Image $image, Str $fileType, Pointer[int32] $fileSize) returns Str is export is native(LIBRAYLIB) is symbol('ExportImageToMemory'){ * }
our sub export-image-as-code (Image $image, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportImageAsCode'){ * }
our sub gen-image-color (int32 $width, int32 $height, Color $color) returns Image is export is native(LIBRAYLIB) is symbol('GenImageColor'){ * }
our sub gen-image-gradient-linear (int32 $width, int32 $height, int32 $direction, Color $start, Color $end) returns Image is export is native(LIBRAYLIB) is symbol('GenImageGradientLinear'){ * }
our sub gen-image-gradient-radial (int32 $width, int32 $height, num32 $density, Color $inner, Color $outer) returns Image is export is native(LIBRAYLIB) is symbol('GenImageGradientRadial'){ * }
our sub gen-image-gradient-square (int32 $width, int32 $height, num32 $density, Color $inner, Color $outer) returns Image is export is native(LIBRAYLIB) is symbol('GenImageGradientSquare'){ * }
our sub gen-image-checked (int32 $width, int32 $height, int32 $checksX, int32 $checksY, Color $col1, Color $col2) returns Image is export is native(LIBRAYLIB) is symbol('GenImageChecked'){ * }
our sub gen-image-white-noise (int32 $width, int32 $height, num32 $factor) returns Image is export is native(LIBRAYLIB) is symbol('GenImageWhiteNoise'){ * }
our sub gen-image-perlin-noise (int32 $width, int32 $height, int32 $offsetX, int32 $offsetY, num32 $scale) returns Image is export is native(LIBRAYLIB) is symbol('GenImagePerlinNoise'){ * }
our sub gen-image-cellular (int32 $width, int32 $height, int32 $tileSize) returns Image is export is native(LIBRAYLIB) is symbol('GenImageCellular'){ * }
our sub gen-image-text (int32 $width, int32 $height, Str $text) returns Image is export is native(LIBRAYLIB) is symbol('GenImageText'){ * }
our sub image-copy (Image $image) returns Image is export is native(LIBRAYLIB) is symbol('ImageCopy'){ * }
our sub image-from-image (Image $image, Rectangle $rec) returns Image is export is native(LIBRAYLIB) is symbol('ImageFromImage'){ * }
our sub image-text (Str $text, int32 $fontSize, Color $color) returns Image is export is native(LIBRAYLIB) is symbol('ImageText'){ * }
our sub image-text-ex (Font $font, Str $text, num32 $fontSize, num32 $spacing, Color $tint) returns Image is export is native(LIBRAYLIB) is symbol('ImageTextEx'){ * }
our sub image-format (Pointer[Image] $image, int32 $newFormat) is export is native(LIBRAYLIB) is symbol('ImageFormat'){ * }
our sub image-to-pot (Pointer[Image] $image, Color $fill) is export is native(LIBRAYLIB) is symbol('ImageToPOT'){ * }
our sub image-crop (Pointer[Image] $image, Rectangle $crop) is export is native(LIBRAYLIB) is symbol('ImageCrop'){ * }
our sub image-alpha-crop (Pointer[Image] $image, num32 $threshold) is export is native(LIBRAYLIB) is symbol('ImageAlphaCrop'){ * }
our sub image-alpha-clear (Pointer[Image] $image, Color $color, num32 $threshold) is export is native(LIBRAYLIB) is symbol('ImageAlphaClear'){ * }
our sub image-alpha-mask (Pointer[Image] $image, Image $alphaMask) is export is native(LIBRAYLIB) is symbol('ImageAlphaMask'){ * }
our sub image-alpha-premultiply (Pointer[Image] $image) is export is native(LIBRAYLIB) is symbol('ImageAlphaPremultiply'){ * }
our sub image-blur-gaussian (Pointer[Image] $image, int32 $blurSize) is export is native(LIBRAYLIB) is symbol('ImageBlurGaussian'){ * }
our sub image-resize (Pointer[Image] $image, int32 $newWidth, int32 $newHeight) is export is native(LIBRAYLIB) is symbol('ImageResize'){ * }
our sub image-resize-nn (Pointer[Image] $image, int32 $newWidth, int32 $newHeight) is export is native(LIBRAYLIB) is symbol('ImageResizeNN'){ * }
our sub image-resize-canvas (Pointer[Image] $image, int32 $newWidth, int32 $newHeight, int32 $offsetX, int32 $offsetY, Color $fill) is export is native(LIBRAYLIB) is symbol('ImageResizeCanvas'){ * }
our sub image-mipmaps (Pointer[Image] $image) is export is native(LIBRAYLIB) is symbol('ImageMipmaps'){ * }
our sub image-dither (Pointer[Image] $image, int32 $rBpp, int32 $gBpp, int32 $bBpp, int32 $aBpp) is export is native(LIBRAYLIB) is symbol('ImageDither'){ * }
our sub image-flip-vertical (Pointer[Image] $image) is export is native(LIBRAYLIB) is symbol('ImageFlipVertical'){ * }
our sub image-flip-horizontal (Pointer[Image] $image) is export is native(LIBRAYLIB) is symbol('ImageFlipHorizontal'){ * }
our sub image-rotate (Pointer[Image] $image, int32 $degrees) is export is native(LIBRAYLIB) is symbol('ImageRotate'){ * }
our sub image-rotate-cw (Pointer[Image] $image) is export is native(LIBRAYLIB) is symbol('ImageRotateCW'){ * }
our sub image-rotate-ccw (Pointer[Image] $image) is export is native(LIBRAYLIB) is symbol('ImageRotateCCW'){ * }
our sub image-color-tint (Pointer[Image] $image, Color $color) is export is native(LIBRAYLIB) is symbol('ImageColorTint'){ * }
our sub image-color-invert (Pointer[Image] $image) is export is native(LIBRAYLIB) is symbol('ImageColorInvert'){ * }
our sub image-color-grayscale (Pointer[Image] $image) is export is native(LIBRAYLIB) is symbol('ImageColorGrayscale'){ * }
our sub image-color-contrast (Pointer[Image] $image, num32 $contrast) is export is native(LIBRAYLIB) is symbol('ImageColorContrast'){ * }
our sub image-color-brightness (Pointer[Image] $image, int32 $brightness) is export is native(LIBRAYLIB) is symbol('ImageColorBrightness'){ * }
our sub image-color-replace (Pointer[Image] $image, Color $color, Color $replace) is export is native(LIBRAYLIB) is symbol('ImageColorReplace'){ * }
our sub load-image-colors (Image $image) returns Color is export is native(LIBRAYLIB) is symbol('LoadImageColors'){ * }
our sub load-image-palette (Image $image, int32 $maxPaletteSize, Pointer[int32] $colorCount) returns Color is export is native(LIBRAYLIB) is symbol('LoadImagePalette'){ * }
our sub unload-image-colors (Pointer[Color] $colors) is export is native(LIBRAYLIB) is symbol('UnloadImageColors'){ * }
our sub unload-image-palette (Pointer[Color] $colors) is export is native(LIBRAYLIB) is symbol('UnloadImagePalette'){ * }
our sub get-image-alpha-border (Image $image, num32 $threshold) returns Rectangle is export is native(LIBRAYLIB) is symbol('GetImageAlphaBorder'){ * }
our sub get-image-color (Image $image, int32 $x, int32 $y) returns Color is export is native(LIBRAYLIB) is symbol('GetImageColor'){ * }
our sub image-clear-background (Pointer[Image] $dst, Color $color) is export is native(LIBRAYLIB) is symbol('ImageClearBackground'){ * }
our sub image-draw-pixel (Pointer[Image] $dst, int32 $posX, int32 $posY, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawPixel'){ * }
our sub image-draw-pixel-v (Pointer[Image] $dst, Vector2 $position, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawPixelV'){ * }
our sub image-draw-line (Pointer[Image] $dst, int32 $startPosX, int32 $startPosY, int32 $endPosX, int32 $endPosY, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawLine'){ * }
our sub image-draw-line-v (Pointer[Image] $dst, Vector2 $start, Vector2 $end, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawLineV'){ * }
our sub image-draw-circle (Pointer[Image] $dst, int32 $centerX, int32 $centerY, int32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawCircle'){ * }
our sub image-draw-circle-v (Pointer[Image] $dst, Vector2 $center, int32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawCircleV'){ * }
our sub image-draw-circle-lines (Pointer[Image] $dst, int32 $centerX, int32 $centerY, int32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawCircleLines'){ * }
our sub image-draw-circle-lines-v (Pointer[Image] $dst, Vector2 $center, int32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawCircleLinesV'){ * }
our sub image-draw-rectangle (Pointer[Image] $dst, int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawRectangle'){ * }
our sub image-draw-rectangle-v (Pointer[Image] $dst, Vector2 $position, Vector2 $size, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawRectangleV'){ * }
our sub image-draw-rectangle-rec (Pointer[Image] $dst, Rectangle $rec, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawRectangleRec'){ * }
our sub image-draw-rectangle-lines (Pointer[Image] $dst, Rectangle $rec, int32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawRectangleLines'){ * }
our sub image-draw (Pointer[Image] $dst, Image $src, Rectangle $srcRec, Rectangle $dstRec, Color $tint) is export is native(LIBRAYLIB) is symbol('ImageDraw'){ * }
our sub image-draw-text (Pointer[Image] $dst, Str $text, int32 $posX, int32 $posY, int32 $fontSize, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawText'){ * }
our sub image-draw-text-ex (Pointer[Image] $dst, Font $font, Str $text, Vector2 $position, num32 $fontSize, num32 $spacing, Color $tint) is export is native(LIBRAYLIB) is symbol('ImageDrawTextEx'){ * }
our sub load-texture (Str $fileName) returns Texture2D is export is native(LIBRAYLIB) is symbol('LoadTexture'){ * }
our sub load-texture-from-image (Image $image) returns Texture2D is export is native(LIBRAYLIB) is symbol('LoadTextureFromImage'){ * }
our sub load-texture-cubemap (Image $image, int32 $layout) returns TextureCubemap is export is native(LIBRAYLIB) is symbol('LoadTextureCubemap'){ * }
our sub load-render-texture (int32 $width, int32 $height) returns RenderTexture2D is export is native(LIBRAYLIB) is symbol('LoadRenderTexture'){ * }
our sub is-texture-ready (Texture2D $texture) returns bool is export is native(LIBRAYLIB) is symbol('IsTextureReady'){ * }
our sub unload-texture (Texture2D $texture) is export is native(LIBRAYLIB) is symbol('UnloadTexture'){ * }
our sub is-render-texture-ready (RenderTexture2D $target) returns bool is export is native(LIBRAYLIB) is symbol('IsRenderTextureReady'){ * }
our sub unload-render-texture (RenderTexture2D $target) is export is native(LIBRAYLIB) is symbol('UnloadRenderTexture'){ * }
our sub update-texture (Texture2D $texture, ) is export is native(LIBRAYLIB) is symbol('UpdateTexture'){ * }
our sub update-texture-rec (Texture2D $texture, Rectangle $rec, ) is export is native(LIBRAYLIB) is symbol('UpdateTextureRec'){ * }
our sub gen-texture-mipmaps (Pointer[Texture2D] $texture) is export is native(LIBRAYLIB) is symbol('GenTextureMipmaps'){ * }
our sub set-texture-filter (Texture2D $texture, int32 $filter) is export is native(LIBRAYLIB) is symbol('SetTextureFilter'){ * }
our sub set-texture-wrap (Texture2D $texture, int32 $wrap) is export is native(LIBRAYLIB) is symbol('SetTextureWrap'){ * }
our sub draw-texture (Texture2D $texture, int32 $posX, int32 $posY, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTexture'){ * }
our sub draw-texture-v (Texture2D $texture, Vector2 $position, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextureV'){ * }
our sub draw-texture-ex (Texture2D $texture, Vector2 $position, num32 $rotation, num32 $scale, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextureEx'){ * }
our sub draw-texture-rec (Texture2D $texture, Rectangle $source, Vector2 $position, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextureRec'){ * }
our sub draw-texture-pro (Texture2D $texture, Rectangle $source, Rectangle $dest, Vector2 $origin, num32 $rotation, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTexturePro'){ * }
our sub draw-texture-npatch (Texture2D $texture, NPatchInfo $nPatchInfo, Rectangle $dest, Vector2 $origin, num32 $rotation, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextureNPatch'){ * }
our sub fade (Color $color, num32 $alpha) returns Color is export is native(LIBRAYLIB) is symbol('Fade'){ * }
our sub color-to-int (Color $color) returns int32 is export is native(LIBRAYLIB) is symbol('ColorToInt'){ * }
our sub color-normalize (Color $color) returns Vector4 is export is native(LIBRAYLIB) is symbol('ColorNormalize'){ * }
our sub color-from-normalized (Vector4 $normalized) returns Color is export is native(LIBRAYLIB) is symbol('ColorFromNormalized'){ * }
our sub color-to-hsv (Color $color) returns Vector3 is export is native(LIBRAYLIB) is symbol('ColorToHSV'){ * }
our sub color-from-hsv (num32 $hue, num32 $saturation, num32 $value) returns Color is export is native(LIBRAYLIB) is symbol('ColorFromHSV'){ * }
our sub color-tint (Color $color, Color $tint) returns Color is export is native(LIBRAYLIB) is symbol('ColorTint'){ * }
our sub color-brightness (Color $color, num32 $factor) returns Color is export is native(LIBRAYLIB) is symbol('ColorBrightness'){ * }
our sub color-contrast (Color $color, num32 $contrast) returns Color is export is native(LIBRAYLIB) is symbol('ColorContrast'){ * }
our sub color-alpha (Color $color, num32 $alpha) returns Color is export is native(LIBRAYLIB) is symbol('ColorAlpha'){ * }
our sub color-alpha-blend (Color $dst, Color $src, Color $tint) returns Color is export is native(LIBRAYLIB) is symbol('ColorAlphaBlend'){ * }
our sub get-color (int32 $hexValue) returns Color is export is native(LIBRAYLIB) is symbol('GetColor'){ * }
our sub get-pixel-color () returns Color is export is native(LIBRAYLIB) is symbol('GetPixelColor'){ * }
our sub set-pixel-color () is export is native(LIBRAYLIB) is symbol('SetPixelColor'){ * }
our sub get-pixel-data-size (int32 $width, int32 $height, int32 $format) returns int32 is export is native(LIBRAYLIB) is symbol('GetPixelDataSize'){ * }
our sub get-font-default () returns Font is export is native(LIBRAYLIB) is symbol('GetFontDefault'){ * }
our sub load-font (Str $fileName) returns Font is export is native(LIBRAYLIB) is symbol('LoadFont'){ * }
our sub load-font-ex (Str $fileName, int32 $fontSize, Pointer[int32] $fontChars, int32 $glyphCount) returns Font is export is native(LIBRAYLIB) is symbol('LoadFontEx'){ * }
our sub load-font-from-image (Image $image, Color $key, int32 $firstChar) returns Font is export is native(LIBRAYLIB) is symbol('LoadFontFromImage'){ * }
our sub load-font-from-memory (Str $fileType, Str $fileData, int32 $dataSize, int32 $fontSize, Pointer[int32] $fontChars, int32 $glyphCount) returns Font is export is native(LIBRAYLIB) is symbol('LoadFontFromMemory'){ * }
our sub is-font-ready (Font $font) returns bool is export is native(LIBRAYLIB) is symbol('IsFontReady'){ * }
our sub load-font-data (Str $fileData, int32 $dataSize, int32 $fontSize, Pointer[int32] $fontChars, int32 $glyphCount, int32 $type) returns GlyphInfo is export is native(LIBRAYLIB) is symbol('LoadFontData'){ * }
our sub gen-image-font-atlas (Pointer[GlyphInfo] $chars, Pointer[Rectangle] $recs, int32 $glyphCount, int32 $fontSize, int32 $padding, int32 $packMethod) returns Image is export is native(LIBRAYLIB) is symbol('GenImageFontAtlas'){ * }
our sub unload-font-data (Pointer[GlyphInfo] $chars, int32 $glyphCount) is export is native(LIBRAYLIB) is symbol('UnloadFontData'){ * }
our sub unload-font (Font $font) is export is native(LIBRAYLIB) is symbol('UnloadFont'){ * }
our sub export-font-as-code (Font $font, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportFontAsCode'){ * }
our sub draw-fps (int32 $posX, int32 $posY) is export is native(LIBRAYLIB) is symbol('DrawFPS'){ * }
our sub draw-text (Str $text, int32 $posX, int32 $posY, int32 $fontSize, Color $color) is export is native(LIBRAYLIB) is symbol('DrawText'){ * }
our sub draw-text-ex (Font $font, Str $text, Vector2 $position, num32 $fontSize, num32 $spacing, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextEx'){ * }
our sub draw-text-pro (Font $font, Str $text, Vector2 $position, Vector2 $origin, num32 $rotation, num32 $fontSize, num32 $spacing, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextPro'){ * }
our sub draw-text-codepoint (Font $font, int32 $codepoint, Vector2 $position, num32 $fontSize, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextCodepoint'){ * }
our sub draw-text-codepoints (Font $font, Pointer[int32] $codepoints, int32 $count, Vector2 $position, num32 $fontSize, num32 $spacing, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextCodepoints'){ * }
our sub set-text-line-spacing (int32 $spacing) is export is native(LIBRAYLIB) is symbol('SetTextLineSpacing'){ * }
our sub measure-text (Str $text, int32 $fontSize) returns int32 is export is native(LIBRAYLIB) is symbol('MeasureText'){ * }
our sub measure-text-ex (Font $font, Str $text, num32 $fontSize, num32 $spacing) returns Vector2 is export is native(LIBRAYLIB) is symbol('MeasureTextEx'){ * }
our sub get-glyph-index (Font $font, int32 $codepoint) returns int32 is export is native(LIBRAYLIB) is symbol('GetGlyphIndex'){ * }
our sub get-glyph-info (Font $font, int32 $codepoint) returns GlyphInfo is export is native(LIBRAYLIB) is symbol('GetGlyphInfo'){ * }
our sub get-glyph-atlas-rec (Font $font, int32 $codepoint) returns Rectangle is export is native(LIBRAYLIB) is symbol('GetGlyphAtlasRec'){ * }
our sub load-utf8 (Pointer[int32] $codepoints, int32 $length) returns Str is export is native(LIBRAYLIB) is symbol('LoadUTF8'){ * }
our sub unload-utf8 (Str $text) is export is native(LIBRAYLIB) is symbol('UnloadUTF8'){ * }
our sub load-codepoints (Str $text, Pointer[int32] $count) returns int32 is export is native(LIBRAYLIB) is symbol('LoadCodepoints'){ * }
our sub unload-codepoints (Pointer[int32] $codepoints) is export is native(LIBRAYLIB) is symbol('UnloadCodepoints'){ * }
our sub get-codepoint-count (Str $text) returns int32 is export is native(LIBRAYLIB) is symbol('GetCodepointCount'){ * }
our sub get-codepoint (Str $text, Pointer[int32] $codepointSize) returns int32 is export is native(LIBRAYLIB) is symbol('GetCodepoint'){ * }
our sub get-codepoint-next (Str $text, Pointer[int32] $codepointSize) returns int32 is export is native(LIBRAYLIB) is symbol('GetCodepointNext'){ * }
our sub get-codepoint-previous (Str $text, Pointer[int32] $codepointSize) returns int32 is export is native(LIBRAYLIB) is symbol('GetCodepointPrevious'){ * }
our sub codepoint-to-utf8 (int32 $codepoint, Pointer[int32] $utf8Size) returns Str is export is native(LIBRAYLIB) is symbol('CodepointToUTF8'){ * }
our sub text-copy (Str $dst, Str $src) returns int32 is export is native(LIBRAYLIB) is symbol('TextCopy'){ * }
our sub text-is-equal (Str $text1, Str $text2) returns bool is export is native(LIBRAYLIB) is symbol('TextIsEqual'){ * }
our sub text-length (Str $text) returns int32 is export is native(LIBRAYLIB) is symbol('TextLength'){ * }
our sub text-format (Str $text, ) returns Str is export is native(LIBRAYLIB) is symbol('TextFormat'){ * }
our sub text-subtext (Str $text, int32 $position, int32 $length) returns Str is export is native(LIBRAYLIB) is symbol('TextSubtext'){ * }
our sub text-replace (Str $text, Str $replace, Str $by) returns Str is export is native(LIBRAYLIB) is symbol('TextReplace'){ * }
our sub text-insert (Str $text, Str $insert, int32 $position) returns Str is export is native(LIBRAYLIB) is symbol('TextInsert'){ * }
our sub text-join (Str $textList, int32 $count, Str $delimiter) returns Str is export is native(LIBRAYLIB) is symbol('TextJoin'){ * }
our sub text-split (Str $text, Str $delimiter, Pointer[int32] $count) returns Str is export is native(LIBRAYLIB) is symbol('TextSplit'){ * }
our sub text-append (Str $text, Str $append, Pointer[int32] $position) is export is native(LIBRAYLIB) is symbol('TextAppend'){ * }
our sub text-find-index (Str $text, Str $find) returns int32 is export is native(LIBRAYLIB) is symbol('TextFindIndex'){ * }
our sub text-to-upper (Str $text) returns Str is export is native(LIBRAYLIB) is symbol('TextToUpper'){ * }
our sub text-to-lower (Str $text) returns Str is export is native(LIBRAYLIB) is symbol('TextToLower'){ * }
our sub text-to-pascal (Str $text) returns Str is export is native(LIBRAYLIB) is symbol('TextToPascal'){ * }
our sub text-to-integer (Str $text) returns int32 is export is native(LIBRAYLIB) is symbol('TextToInteger'){ * }
our sub draw-line3d (Vector3 $startPos, Vector3 $endPos, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLine3D'){ * }
our sub draw-point3d (Vector3 $position, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPoint3D'){ * }
our sub draw-circle3d (Vector3 $center, num32 $radius, Vector3 $rotationAxis, num32 $rotationAngle, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircle3D'){ * }
our sub draw-triangle3d (Vector3 $v1, Vector3 $v2, Vector3 $v3, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangle3D'){ * }
our sub draw-triangle-strip3d (Pointer[Vector3] $points, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleStrip3D'){ * }
our sub draw-cube (Vector3 $position, num32 $width, num32 $height, num32 $length, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCube'){ * }
our sub draw-cube-v (Vector3 $position, Vector3 $size, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCubeV'){ * }
our sub draw-cube-wires (Vector3 $position, num32 $width, num32 $height, num32 $length, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCubeWires'){ * }
our sub draw-cube-wires-v (Vector3 $position, Vector3 $size, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCubeWiresV'){ * }
our sub draw-sphere (Vector3 $centerPos, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSphere'){ * }
our sub draw-sphere-ex (Vector3 $centerPos, num32 $radius, int32 $rings, int32 $slices, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSphereEx'){ * }
our sub draw-sphere-wires (Vector3 $centerPos, num32 $radius, int32 $rings, int32 $slices, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSphereWires'){ * }
our sub draw-cylinder (Vector3 $position, num32 $radiusTop, num32 $radiusBottom, num32 $height, int32 $slices, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCylinder'){ * }
our sub draw-cylinder-ex (Vector3 $startPos, Vector3 $endPos, num32 $startRadius, num32 $endRadius, int32 $sides, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCylinderEx'){ * }
our sub draw-cylinder-wires (Vector3 $position, num32 $radiusTop, num32 $radiusBottom, num32 $height, int32 $slices, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCylinderWires'){ * }
our sub draw-cylinder-wires-ex (Vector3 $startPos, Vector3 $endPos, num32 $startRadius, num32 $endRadius, int32 $sides, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCylinderWiresEx'){ * }
our sub draw-capsule (Vector3 $startPos, Vector3 $endPos, num32 $radius, int32 $slices, int32 $rings, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCapsule'){ * }
our sub draw-capsule-wires (Vector3 $startPos, Vector3 $endPos, num32 $radius, int32 $slices, int32 $rings, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCapsuleWires'){ * }
our sub draw-plane (Vector3 $centerPos, Vector2 $size, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPlane'){ * }
our sub draw-ray (Ray $ray, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRay'){ * }
our sub draw-grid (int32 $slices, num32 $spacing) is export is native(LIBRAYLIB) is symbol('DrawGrid'){ * }
our sub load-model (Str $fileName) returns Model is export is native(LIBRAYLIB) is symbol('LoadModel'){ * }
our sub load-model-from-mesh (Mesh $mesh) returns Model is export is native(LIBRAYLIB) is symbol('LoadModelFromMesh'){ * }
our sub is-model-ready (Model $model) returns bool is export is native(LIBRAYLIB) is symbol('IsModelReady'){ * }
our sub unload-model (Model $model) is export is native(LIBRAYLIB) is symbol('UnloadModel'){ * }
our sub get-model-bounding-box (Model $model) returns BoundingBox is export is native(LIBRAYLIB) is symbol('GetModelBoundingBox'){ * }
our sub draw-model (Model $model, Vector3 $position, num32 $scale, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawModel'){ * }
our sub draw-model-ex (Model $model, Vector3 $position, Vector3 $rotationAxis, num32 $rotationAngle, Vector3 $scale, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawModelEx'){ * }
our sub draw-model-wires (Model $model, Vector3 $position, num32 $scale, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawModelWires'){ * }
our sub draw-model-wires-ex (Model $model, Vector3 $position, Vector3 $rotationAxis, num32 $rotationAngle, Vector3 $scale, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawModelWiresEx'){ * }
our sub draw-bounding-box (BoundingBox $box, Color $color) is export is native(LIBRAYLIB) is symbol('DrawBoundingBox'){ * }
our sub draw-billboard (Camera $camera, Texture2D $texture, Vector3 $position, num32 $size, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawBillboard'){ * }
our sub draw-billboard-rec (Camera $camera, Texture2D $texture, Rectangle $source, Vector3 $position, Vector2 $size, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawBillboardRec'){ * }
our sub draw-billboard-pro (Camera $camera, Texture2D $texture, Rectangle $source, Vector3 $position, Vector3 $up, Vector2 $size, Vector2 $origin, num32 $rotation, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawBillboardPro'){ * }
our sub upload-mesh (Pointer[Mesh] $mesh, bool $dynamic) is export is native(LIBRAYLIB) is symbol('UploadMesh'){ * }
our sub update-mesh-buffer (Mesh $mesh, int32 $index, ) is export is native(LIBRAYLIB) is symbol('UpdateMeshBuffer'){ * }
our sub unload-mesh (Mesh $mesh) is export is native(LIBRAYLIB) is symbol('UnloadMesh'){ * }
our sub draw-mesh (Mesh $mesh, Material $material, Matrix $transform) is export is native(LIBRAYLIB) is symbol('DrawMesh'){ * }
our sub draw-mesh-instanced (Mesh $mesh, Material $material, Pointer[Matrix] $transforms, int32 $instances) is export is native(LIBRAYLIB) is symbol('DrawMeshInstanced'){ * }
our sub export-mesh (Mesh $mesh, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportMesh'){ * }
our sub get-mesh-bounding-box (Mesh $mesh) returns BoundingBox is export is native(LIBRAYLIB) is symbol('GetMeshBoundingBox'){ * }
our sub gen-mesh-tangents (Pointer[Mesh] $mesh) is export is native(LIBRAYLIB) is symbol('GenMeshTangents'){ * }
our sub gen-mesh-poly (int32 $sides, num32 $radius) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshPoly'){ * }
our sub gen-mesh-plane (num32 $width, num32 $length, int32 $resX, int32 $resZ) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshPlane'){ * }
our sub gen-mesh-cube (num32 $width, num32 $height, num32 $length) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshCube'){ * }
our sub gen-mesh-sphere (num32 $radius, int32 $rings, int32 $slices) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshSphere'){ * }
our sub gen-mesh-hemi-sphere (num32 $radius, int32 $rings, int32 $slices) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshHemiSphere'){ * }
our sub gen-mesh-cylinder (num32 $radius, num32 $height, int32 $slices) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshCylinder'){ * }
our sub gen-mesh-cone (num32 $radius, num32 $height, int32 $slices) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshCone'){ * }
our sub gen-mesh-torus (num32 $radius, num32 $size, int32 $radSeg, int32 $sides) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshTorus'){ * }
our sub gen-mesh-knot (num32 $radius, num32 $size, int32 $radSeg, int32 $sides) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshKnot'){ * }
our sub gen-mesh-heightmap (Image $heightmap, Vector3 $size) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshHeightmap'){ * }
our sub gen-mesh-cubicmap (Image $cubicmap, Vector3 $cubeSize) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshCubicmap'){ * }
our sub load-materials (Str $fileName, Pointer[int32] $materialCount) returns Material is export is native(LIBRAYLIB) is symbol('LoadMaterials'){ * }
our sub load-material-default () returns Material is export is native(LIBRAYLIB) is symbol('LoadMaterialDefault'){ * }
our sub is-material-ready (Material $material) returns bool is export is native(LIBRAYLIB) is symbol('IsMaterialReady'){ * }
our sub unload-material (Material $material) is export is native(LIBRAYLIB) is symbol('UnloadMaterial'){ * }
our sub set-material-texture (Pointer[Material] $material, int32 $mapType, Texture2D $texture) is export is native(LIBRAYLIB) is symbol('SetMaterialTexture'){ * }
our sub set-model-mesh-material (Pointer[Model] $model, int32 $meshId, int32 $materialId) is export is native(LIBRAYLIB) is symbol('SetModelMeshMaterial'){ * }
our sub load-model-animations (Str $fileName, Pointer[int32] $animCount) returns ModelAnimation is export is native(LIBRAYLIB) is symbol('LoadModelAnimations'){ * }
our sub update-model-animation (Model $model, ModelAnimation $anim, int32 $frame) is export is native(LIBRAYLIB) is symbol('UpdateModelAnimation'){ * }
our sub unload-model-animation (ModelAnimation $anim) is export is native(LIBRAYLIB) is symbol('UnloadModelAnimation'){ * }
our sub unload-model-animations (Pointer[ModelAnimation] $animations, int32 $count) is export is native(LIBRAYLIB) is symbol('UnloadModelAnimations'){ * }
our sub is-model-animation-valid (Model $model, ModelAnimation $anim) returns bool is export is native(LIBRAYLIB) is symbol('IsModelAnimationValid'){ * }
our sub check-collision-spheres (Vector3 $center1, num32 $radius1, Vector3 $center2, num32 $radius2) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionSpheres'){ * }
our sub check-collision-boxes (BoundingBox $box1, BoundingBox $box2) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionBoxes'){ * }
our sub check-collision-box-sphere (BoundingBox $box, Vector3 $center, num32 $radius) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionBoxSphere'){ * }
our sub get-ray-collision-sphere (Ray $ray, Vector3 $center, num32 $radius) returns RayCollision is export is native(LIBRAYLIB) is symbol('GetRayCollisionSphere'){ * }
our sub get-ray-collision-box (Ray $ray, BoundingBox $box) returns RayCollision is export is native(LIBRAYLIB) is symbol('GetRayCollisionBox'){ * }
our sub get-ray-collision-mesh (Ray $ray, Mesh $mesh, Matrix $transform) returns RayCollision is export is native(LIBRAYLIB) is symbol('GetRayCollisionMesh'){ * }
our sub get-ray-collision-triangle (Ray $ray, Vector3 $p1, Vector3 $p2, Vector3 $p3) returns RayCollision is export is native(LIBRAYLIB) is symbol('GetRayCollisionTriangle'){ * }
our sub get-ray-collision-quad (Ray $ray, Vector3 $p1, Vector3 $p2, Vector3 $p3, Vector3 $p4) returns RayCollision is export is native(LIBRAYLIB) is symbol('GetRayCollisionQuad'){ * }
our sub init-audio-device () is export is native(LIBRAYLIB) is symbol('InitAudioDevice'){ * }
our sub close-audio-device () is export is native(LIBRAYLIB) is symbol('CloseAudioDevice'){ * }
our sub is-audio-device-ready () returns bool is export is native(LIBRAYLIB) is symbol('IsAudioDeviceReady'){ * }
our sub set-master-volume (num32 $volume) is export is native(LIBRAYLIB) is symbol('SetMasterVolume'){ * }
our sub load-wave (Str $fileName) returns Wave is export is native(LIBRAYLIB) is symbol('LoadWave'){ * }
our sub load-wave-from-memory (Str $fileType, Str $fileData, int32 $dataSize) returns Wave is export is native(LIBRAYLIB) is symbol('LoadWaveFromMemory'){ * }
our sub is-wave-ready (Wave $wave) returns bool is export is native(LIBRAYLIB) is symbol('IsWaveReady'){ * }
our sub load-sound (Str $fileName) returns Sound is export is native(LIBRAYLIB) is symbol('LoadSound'){ * }
our sub load-sound-from-wave (Wave $wave) returns Sound is export is native(LIBRAYLIB) is symbol('LoadSoundFromWave'){ * }
our sub load-sound-alias (Sound $source) returns Sound is export is native(LIBRAYLIB) is symbol('LoadSoundAlias'){ * }
our sub is-sound-ready (Sound $sound) returns bool is export is native(LIBRAYLIB) is symbol('IsSoundReady'){ * }
our sub update-sound (Sound $sound, ) is export is native(LIBRAYLIB) is symbol('UpdateSound'){ * }
our sub unload-wave (Wave $wave) is export is native(LIBRAYLIB) is symbol('UnloadWave'){ * }
our sub unload-sound (Sound $sound) is export is native(LIBRAYLIB) is symbol('UnloadSound'){ * }
our sub unload-sound-alias (Sound $alias) is export is native(LIBRAYLIB) is symbol('UnloadSoundAlias'){ * }
our sub export-wave (Wave $wave, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportWave'){ * }
our sub export-wave-as-code (Wave $wave, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportWaveAsCode'){ * }
our sub play-sound (Sound $sound) is export is native(LIBRAYLIB) is symbol('PlaySound'){ * }
our sub stop-sound (Sound $sound) is export is native(LIBRAYLIB) is symbol('StopSound'){ * }
our sub pause-sound (Sound $sound) is export is native(LIBRAYLIB) is symbol('PauseSound'){ * }
our sub resume-sound (Sound $sound) is export is native(LIBRAYLIB) is symbol('ResumeSound'){ * }
our sub is-sound-playing (Sound $sound) returns bool is export is native(LIBRAYLIB) is symbol('IsSoundPlaying'){ * }
our sub set-sound-volume (Sound $sound, num32 $volume) is export is native(LIBRAYLIB) is symbol('SetSoundVolume'){ * }
our sub set-sound-pitch (Sound $sound, num32 $pitch) is export is native(LIBRAYLIB) is symbol('SetSoundPitch'){ * }
our sub set-sound-pan (Sound $sound, num32 $pan) is export is native(LIBRAYLIB) is symbol('SetSoundPan'){ * }
our sub wave-copy (Wave $wave) returns Wave is export is native(LIBRAYLIB) is symbol('WaveCopy'){ * }
our sub wave-crop (Pointer[Wave] $wave, int32 $initSample, int32 $finalSample) is export is native(LIBRAYLIB) is symbol('WaveCrop'){ * }
our sub wave-format (Pointer[Wave] $wave, int32 $sampleRate, int32 $sampleSize, int32 $channels) is export is native(LIBRAYLIB) is symbol('WaveFormat'){ * }
our sub load-wave-samples (Wave $wave) returns num32 is export is native(LIBRAYLIB) is symbol('LoadWaveSamples'){ * }
our sub unload-wave-samples (Pointer[num32] $samples) is export is native(LIBRAYLIB) is symbol('UnloadWaveSamples'){ * }
our sub load-music-stream (Str $fileName) returns Music is export is native(LIBRAYLIB) is symbol('LoadMusicStream'){ * }
our sub load-music-stream-from-memory (Str $fileType, Str $data, int32 $dataSize) returns Music is export is native(LIBRAYLIB) is symbol('LoadMusicStreamFromMemory'){ * }
our sub is-music-ready (Music $music) returns bool is export is native(LIBRAYLIB) is symbol('IsMusicReady'){ * }
our sub unload-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('UnloadMusicStream'){ * }
our sub play-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('PlayMusicStream'){ * }
our sub is-music-stream-playing (Music $music) returns bool is export is native(LIBRAYLIB) is symbol('IsMusicStreamPlaying'){ * }
our sub update-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('UpdateMusicStream'){ * }
our sub stop-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('StopMusicStream'){ * }
our sub pause-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('PauseMusicStream'){ * }
our sub resume-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('ResumeMusicStream'){ * }
our sub seek-music-stream (Music $music, num32 $position) is export is native(LIBRAYLIB) is symbol('SeekMusicStream'){ * }
our sub set-music-volume (Music $music, num32 $volume) is export is native(LIBRAYLIB) is symbol('SetMusicVolume'){ * }
our sub set-music-pitch (Music $music, num32 $pitch) is export is native(LIBRAYLIB) is symbol('SetMusicPitch'){ * }
our sub set-music-pan (Music $music, num32 $pan) is export is native(LIBRAYLIB) is symbol('SetMusicPan'){ * }
our sub get-music-time-length (Music $music) returns num32 is export is native(LIBRAYLIB) is symbol('GetMusicTimeLength'){ * }
our sub get-music-time-played (Music $music) returns num32 is export is native(LIBRAYLIB) is symbol('GetMusicTimePlayed'){ * }
our sub load-audio-stream (int32 $sampleRate, int32 $sampleSize, int32 $channels) returns AudioStream is export is native(LIBRAYLIB) is symbol('LoadAudioStream'){ * }
our sub is-audio-stream-ready (AudioStream $stream) returns bool is export is native(LIBRAYLIB) is symbol('IsAudioStreamReady'){ * }
our sub unload-audio-stream (AudioStream $stream) is export is native(LIBRAYLIB) is symbol('UnloadAudioStream'){ * }
our sub update-audio-stream (AudioStream $stream, ) is export is native(LIBRAYLIB) is symbol('UpdateAudioStream'){ * }
our sub is-audio-stream-processed (AudioStream $stream) returns bool is export is native(LIBRAYLIB) is symbol('IsAudioStreamProcessed'){ * }
our sub play-audio-stream (AudioStream $stream) is export is native(LIBRAYLIB) is symbol('PlayAudioStream'){ * }
our sub pause-audio-stream (AudioStream $stream) is export is native(LIBRAYLIB) is symbol('PauseAudioStream'){ * }
our sub resume-audio-stream (AudioStream $stream) is export is native(LIBRAYLIB) is symbol('ResumeAudioStream'){ * }
our sub is-audio-stream-playing (AudioStream $stream) returns bool is export is native(LIBRAYLIB) is symbol('IsAudioStreamPlaying'){ * }
our sub stop-audio-stream (AudioStream $stream) is export is native(LIBRAYLIB) is symbol('StopAudioStream'){ * }
our sub set-audio-stream-volume (AudioStream $stream, num32 $volume) is export is native(LIBRAYLIB) is symbol('SetAudioStreamVolume'){ * }
our sub set-audio-stream-pitch (AudioStream $stream, num32 $pitch) is export is native(LIBRAYLIB) is symbol('SetAudioStreamPitch'){ * }
our sub set-audio-stream-pan (AudioStream $stream, num32 $pan) is export is native(LIBRAYLIB) is symbol('SetAudioStreamPan'){ * }
our sub set-audio-stream-buffer-size-default (int32 $size) is export is native(LIBRAYLIB) is symbol('SetAudioStreamBufferSizeDefault'){ * }
