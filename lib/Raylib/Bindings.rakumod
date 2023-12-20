# This Raku module is generated from raylib.h
unit module Raylib::Bindings:ver<0.0.17>:auth<zef:vushu>;
use NativeCall;
constant LIBRAYLIB = %?RESOURCES<libraries/raylib>;
class Vector2 is export is repr('CStruct') is rw {
    has num32 $.x;
    has num32 $.y;
    method init(num32 $x,num32 $y) returns Vector2 {
        malloc-Vector2($x,$y);
    }
    submethod DESTROY {
        free-Vector2(self);
    }
}
class Vector3 is export is repr('CStruct') is rw {
    has num32 $.x;
    has num32 $.y;
    has num32 $.z;
    method init(num32 $x,num32 $y,num32 $z) returns Vector3 {
        malloc-Vector3($x,$y,$z);
    }
    submethod DESTROY {
        free-Vector3(self);
    }
}
class Vector4 is export is repr('CStruct') is rw {
    has num32 $.x;
    has num32 $.y;
    has num32 $.z;
    has num32 $.w;
    method init(num32 $x,num32 $y,num32 $z,num32 $w) returns Vector4 {
        malloc-Vector4($x,$y,$z,$w);
    }
    submethod DESTROY {
        free-Vector4(self);
    }
}
class Quaternion is Vector4 is export is repr('CStruct') {}
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
    method init(num32 $m0,num32 $m4,num32 $m8,num32 $m12,num32 $m1,num32 $m5,num32 $m9,num32 $m13,num32 $m2,num32 $m6,num32 $m10,num32 $m14,num32 $m3,num32 $m7,num32 $m11,num32 $m15) returns Matrix {
        malloc-Matrix($m0,$m4,$m8,$m12,$m1,$m5,$m9,$m13,$m2,$m6,$m10,$m14,$m3,$m7,$m11,$m15);
    }
    submethod DESTROY {
        free-Matrix(self);
    }
}
class Color is export is repr('CStruct') is rw {
    has uint8 $.r;
    has uint8 $.g;
    has uint8 $.b;
    has uint8 $.a;
    method init(uint8 $r,uint8 $g,uint8 $b,uint8 $a) returns Color {
        malloc-Color($r,$g,$b,$a);
    }
    submethod DESTROY {
        free-Color(self);
    }
}
class Rectangle is export is repr('CStruct') is rw {
    has num32 $.x;
    has num32 $.y;
    has num32 $.width;
    has num32 $.height;
    method init(num32 $x,num32 $y,num32 $width,num32 $height) returns Rectangle {
        malloc-Rectangle($x,$y,$width,$height);
    }
    submethod DESTROY {
        free-Rectangle(self);
    }
}
class Image is export is repr('CStruct') is rw {
    has Pointer[void] $.data;
    has int32 $.width;
    has int32 $.height;
    has int32 $.mipmaps;
    has int32 $.format;
    method init(void $data,int32 $width,int32 $height,int32 $mipmaps,int32 $format) returns Image {
        malloc-Image($data,$width,$height,$mipmaps,$format);
    }
    submethod DESTROY {
        free-Image(self);
    }
}
class Texture is export is repr('CStruct') is rw {
    has uint32 $.id;
    has int32 $.width;
    has int32 $.height;
    has int32 $.mipmaps;
    has int32 $.format;
    method init(int32 $id,int32 $width,int32 $height,int32 $mipmaps,int32 $format) returns Texture {
        malloc-Texture($id,$width,$height,$mipmaps,$format);
    }
    submethod DESTROY {
        free-Texture(self);
    }
}
class Texture2D is Texture is export is repr('CStruct') {}
class TextureCubemap is Texture is export is repr('CStruct') {}
class RenderTexture is export is repr('CStruct') is rw {
    has uint32 $.id;
    HAS Texture $.texture;
    HAS Texture $.depth;
    method init(int32 $id,Texture $texture,Texture $depth) returns RenderTexture {
        malloc-RenderTexture($id,$texture,$depth);
    }
    submethod DESTROY {
        free-RenderTexture(self);
    }
}
class RenderTexture2D is RenderTexture is export is repr('CStruct') {}
class NPatchInfo is export is repr('CStruct') is rw {
    HAS Rectangle $.source;
    has int32 $.left;
    has int32 $.top;
    has int32 $.right;
    has int32 $.bottom;
    has int32 $.layout;
    method init(Rectangle $source,int32 $left,int32 $top,int32 $right,int32 $bottom,int32 $layout) returns NPatchInfo {
        malloc-NPatchInfo($source,$left,$top,$right,$bottom,$layout);
    }
    submethod DESTROY {
        free-NPatchInfo(self);
    }
}
class GlyphInfo is export is repr('CStruct') is rw {
    has int32 $.value;
    has int32 $.offsetX;
    has int32 $.offsetY;
    has int32 $.advanceX;
    HAS Image $.image;
    method init(int32 $value,int32 $offsetX,int32 $offsetY,int32 $advanceX,Image $image) returns GlyphInfo {
        malloc-GlyphInfo($value,$offsetX,$offsetY,$advanceX,$image);
    }
    submethod DESTROY {
        free-GlyphInfo(self);
    }
}
class Font is export is repr('CStruct') is rw {
    has int32 $.baseSize;
    has int32 $.glyphCount;
    has int32 $.glyphPadding;
    HAS Texture2D $.texture;
    has Pointer[Rectangle] $.recs;
    has Pointer[GlyphInfo] $.glyphs;
    method init(int32 $baseSize,int32 $glyphCount,int32 $glyphPadding,Texture2D $texture,Pointer[Rectangle] $recs,Pointer[GlyphInfo] $glyphs) returns Font {
        malloc-Font($baseSize,$glyphCount,$glyphPadding,$texture,$recs,$glyphs);
    }
    submethod DESTROY {
        free-Font(self);
    }
}
class Camera3D is export is repr('CStruct') is rw {
    HAS Vector3 $.position;
    HAS Vector3 $.target;
    HAS Vector3 $.up;
    has num32 $.fovy;
    has int32 $.projection;
    method init(Vector3 $position,Vector3 $target,Vector3 $up,num32 $fovy,int32 $projection) returns Camera3D {
        malloc-Camera3D($position,$target,$up,$fovy,$projection);
    }
    submethod DESTROY {
        free-Camera3D(self);
    }
}
class Camera is Camera3D is export is repr('CStruct') {}
class Camera2D is export is repr('CStruct') is rw {
    HAS Vector2 $.offset;
    HAS Vector2 $.target;
    has num32 $.rotation;
    has num32 $.zoom;
    method init(Vector2 $offset,Vector2 $target,num32 $rotation,num32 $zoom) returns Camera2D {
        malloc-Camera2D($offset,$target,$rotation,$zoom);
    }
    submethod DESTROY {
        free-Camera2D(self);
    }
}
class Mesh is export is repr('CStruct') is rw {
    has int32 $.vertexCount;
    has int32 $.triangleCount;
    has num32 $.vertices is rw;
    has num32 $.texcoords is rw;
    has num32 $.texcoords2 is rw;
    has num32 $.normals is rw;
    has num32 $.tangents is rw;
    has uint8 $.colors is rw;
    has uint16 $.indices is rw;
    has num32 $.animVertices is rw;
    has num32 $.animNormals is rw;
    has uint8 $.boneIds is rw;
    has num32 $.boneWeights is rw;
    has uint32 $.vaoId;
    has uint32 $.vboId is rw;
    method init(int32 $vertexCount,int32 $triangleCount,num32 $vertices,num32 $texcoords,num32 $texcoords2,num32 $normals,num32 $tangents,uint8 $colors,int16 $indices,num32 $animVertices,num32 $animNormals,uint8 $boneIds,num32 $boneWeights,int32 $vaoId,int32 $vboId) returns Mesh {
        malloc-Mesh($vertexCount,$triangleCount,$vertices,$texcoords,$texcoords2,$normals,$tangents,$colors,$indices,$animVertices,$animNormals,$boneIds,$boneWeights,$vaoId,$vboId);
    }
    submethod DESTROY {
        free-Mesh(self);
    }
}
class Shader is export is repr('CStruct') is rw {
    has uint32 $.id;
    has int32 $.locs is rw;
    method init(int32 $id,int32 $locs) returns Shader {
        malloc-Shader($id,$locs);
    }
    submethod DESTROY {
        free-Shader(self);
    }
}
class MaterialMap is export is repr('CStruct') is rw {
    HAS Texture2D $.texture;
    HAS Color $.color;
    has num32 $.value;
    method init(Texture2D $texture,Color $color,num32 $value) returns MaterialMap {
        malloc-MaterialMap($texture,$color,$value);
    }
    submethod DESTROY {
        free-MaterialMap(self);
    }
}
class Material is export is repr('CStruct') is rw {
    HAS Shader $.shader;
    has Pointer[MaterialMap] $.maps;
    has CArray[num32] $.params is rw;
    method init(Shader $shader,Pointer[MaterialMap] $maps,CArray[num32] $params) returns Material {
        malloc-Material($shader,$maps,$params);
    }
    submethod DESTROY {
        free-Material(self);
    }
}
class Transform is export is repr('CStruct') is rw {
    HAS Vector3 $.translation;
    HAS Quaternion $.rotation;
    HAS Vector3 $.scale;
    method init(Vector3 $translation,Quaternion $rotation,Vector3 $scale) returns Transform {
        malloc-Transform($translation,$rotation,$scale);
    }
    submethod DESTROY {
        free-Transform(self);
    }
}
class BoneInfo is export is repr('CStruct') is rw {
    has uint8 @.name[32] is CArray;
    has int32 $.parent;
    method init(Str $name,int32 $parent) returns BoneInfo {
        malloc-BoneInfo($name,$parent);
    }
    submethod DESTROY {
        free-BoneInfo(self);
    }
}
class Model is export is repr('CStruct') is rw {
    HAS Matrix $.transform;
    has int32 $.meshCount;
    has int32 $.materialCount;
    has Pointer[Mesh] $.meshes;
    has Pointer[Material] $.materials;
    has int32 $.meshMaterial is rw;
    has int32 $.boneCount;
    has Pointer[BoneInfo] $.bones;
    has Pointer[Transform] $.bindPose;
    method init(Matrix $transform,int32 $meshCount,int32 $materialCount,Pointer[Mesh] $meshes,Pointer[Material] $materials,int32 $meshMaterial,int32 $boneCount,Pointer[BoneInfo] $bones,Pointer[Transform] $bindPose) returns Model {
        malloc-Model($transform,$meshCount,$materialCount,$meshes,$materials,$meshMaterial,$boneCount,$bones,$bindPose);
    }
    submethod DESTROY {
        free-Model(self);
    }
}
class ModelAnimation is export is repr('CStruct') is rw {
    has int32 $.boneCount;
    has int32 $.frameCount;
    has Pointer[BoneInfo] $.bones;
    has Pointer $.framePoses;
    has uint8 @.name[32] is CArray;
    method init(int32 $boneCount,int32 $frameCount,Pointer[BoneInfo] $bones,Pointer $framePoses,Str $name) returns ModelAnimation {
        malloc-ModelAnimation($boneCount,$frameCount,$bones,$framePoses,$name);
    }
    submethod DESTROY {
        free-ModelAnimation(self);
    }
}
class Ray is export is repr('CStruct') is rw {
    HAS Vector3 $.position;
    HAS Vector3 $.direction;
    method init(Vector3 $position,Vector3 $direction) returns Ray {
        malloc-Ray($position,$direction);
    }
    submethod DESTROY {
        free-Ray(self);
    }
}
class RayCollision is export is repr('CStruct') is rw {
    has bool $.hit;
    has num32 $.distance;
    HAS Vector3 $.point;
    HAS Vector3 $.normal;
    method init(bool $hit,num32 $distance,Vector3 $point,Vector3 $normal) returns RayCollision {
        malloc-RayCollision($hit,$distance,$point,$normal);
    }
    submethod DESTROY {
        free-RayCollision(self);
    }
}
class BoundingBox is export is repr('CStruct') is rw {
    HAS Vector3 $.min;
    HAS Vector3 $.max;
    method init(Vector3 $min,Vector3 $max) returns BoundingBox {
        malloc-BoundingBox($min,$max);
    }
    submethod DESTROY {
        free-BoundingBox(self);
    }
}
class Wave is export is repr('CStruct') is rw {
    has uint32 $.frameCount;
    has uint32 $.sampleRate;
    has uint32 $.sampleSize;
    has uint32 $.channels;
    has Pointer[void] $.data;
    method init(int32 $frameCount,int32 $sampleRate,int32 $sampleSize,int32 $channels,void $data) returns Wave {
        malloc-Wave($frameCount,$sampleRate,$sampleSize,$channels,$data);
    }
    submethod DESTROY {
        free-Wave(self);
    }
}
class rAudioBuffer is export is repr('CStruct') {  has int32 $.dummy;}
class rAudioProcessor is export is repr('CStruct') {  has int32 $.dummy;}
class AudioStream is export is repr('CStruct') is rw {
    has Pointer[rAudioBuffer] $.buffer;
    has Pointer[rAudioProcessor] $.processor;
    has uint32 $.sampleRate;
    has uint32 $.sampleSize;
    has uint32 $.channels;


}
class Sound is export is repr('CStruct') is rw {
    HAS AudioStream $.stream;
    has uint32 $.frameCount;
    method init(AudioStream $stream,int32 $frameCount) returns Sound {
        malloc-Sound($stream,$frameCount);
    }
    submethod DESTROY {
        free-Sound(self);
    }
}
class Music is export is repr('CStruct') is rw {
    HAS AudioStream $.stream;
    has uint32 $.frameCount;
    has bool $.looping;
    has int32 $.ctxType;
    has Pointer[void] $.ctxData;
    method init(AudioStream $stream,int32 $frameCount,bool $looping,int32 $ctxType,void $ctxData) returns Music {
        malloc-Music($stream,$frameCount,$looping,$ctxType,$ctxData);
    }
    submethod DESTROY {
        free-Music(self);
    }
}
class VrDeviceInfo is export is repr('CStruct') is rw {
    has int32 $.hResolution;
    has int32 $.vResolution;
    has num32 $.hScreenSize;
    has num32 $.vScreenSize;
    has num32 $.eyeToScreenDistance;
    has num32 $.lensSeparationDistance;
    has num32 $.interpupillaryDistance;
    has CArray[num32] $.lensDistortionValues is rw;
    has CArray[num32] $.chromaAbCorrection is rw;
    method init(int32 $hResolution,int32 $vResolution,num32 $hScreenSize,num32 $vScreenSize,num32 $eyeToScreenDistance,num32 $lensSeparationDistance,num32 $interpupillaryDistance,CArray[num32] $lensDistortionValues,CArray[num32] $chromaAbCorrection) returns VrDeviceInfo {
        malloc-VrDeviceInfo($hResolution,$vResolution,$hScreenSize,$vScreenSize,$eyeToScreenDistance,$lensSeparationDistance,$interpupillaryDistance,$lensDistortionValues,$chromaAbCorrection);
    }
    submethod DESTROY {
        free-VrDeviceInfo(self);
    }
}
class VrStereoConfig is export is repr('CStruct') is rw {
    has CArray[Matrix] $.projection is rw;
    has CArray[Matrix] $.viewOffset is rw;
    has CArray[num32] $.leftLensCenter is rw;
    has CArray[num32] $.rightLensCenter is rw;
    has CArray[num32] $.leftScreenCenter is rw;
    has CArray[num32] $.rightScreenCenter is rw;
    has CArray[num32] $.scale is rw;
    has CArray[num32] $.scaleIn is rw;
    method init(CArray[Matrix] $projection,CArray[Matrix] $viewOffset,CArray[num32] $leftLensCenter,CArray[num32] $rightLensCenter,CArray[num32] $leftScreenCenter,CArray[num32] $rightScreenCenter,CArray[num32] $scale,CArray[num32] $scaleIn) returns VrStereoConfig {
        malloc-VrStereoConfig($projection,$viewOffset,$leftLensCenter,$rightLensCenter,$leftScreenCenter,$rightScreenCenter,$scale,$scaleIn);
    }
    submethod DESTROY {
        free-VrStereoConfig(self);
    }
}
class FilePathList is export is repr('CStruct') is rw {
    has uint32 $.capacity;
    has uint32 $.count;
    has Str $.paths is rw;
    method init(int32 $capacity,int32 $count,Str $paths) returns FilePathList {
        malloc-FilePathList($capacity,$count,$paths);
    }
    submethod DESTROY {
        free-FilePathList(self);
    }
}
class AutomationEvent is export is repr('CStruct') is rw {
    has uint32 $.frame;
    has uint32 $.type;
    has CArray[int32] $.params is rw;
    method init(int32 $frame,int32 $type,CArray[int32] $params) returns AutomationEvent {
        malloc-AutomationEvent($frame,$type,$params);
    }
    submethod DESTROY {
        free-AutomationEvent(self);
    }
}
class AutomationEventList is export is repr('CStruct') is rw {
    has uint32 $.capacity;
    has uint32 $.count;
    has Pointer[AutomationEvent] $.events;
    method init(int32 $capacity,int32 $count,Pointer[AutomationEvent] $events) returns AutomationEventList {
        malloc-AutomationEventList($capacity,$count,$events);
    }
    submethod DESTROY {
        free-AutomationEventList(self);
    }
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
    PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA => 2,
    PIXELFORMAT_UNCOMPRESSED_R5G6B5 => 3,
    PIXELFORMAT_UNCOMPRESSED_R8G8B8 => 4,
    PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 => 5,
    PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 => 6,
    PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 => 7,
    PIXELFORMAT_UNCOMPRESSED_R32 => 8,
    PIXELFORMAT_UNCOMPRESSED_R32G32B32 => 9,
    PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 => 10,
    PIXELFORMAT_UNCOMPRESSED_R16 => 11,
    PIXELFORMAT_UNCOMPRESSED_R16G16B16 => 12,
    PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 => 13,
    PIXELFORMAT_COMPRESSED_DXT1_RGB => 14,
    PIXELFORMAT_COMPRESSED_DXT1_RGBA => 15,
    PIXELFORMAT_COMPRESSED_DXT3_RGBA => 16,
    PIXELFORMAT_COMPRESSED_DXT5_RGBA => 17,
    PIXELFORMAT_COMPRESSED_ETC1_RGB => 18,
    PIXELFORMAT_COMPRESSED_ETC2_RGB => 19,
    PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA => 20,
    PIXELFORMAT_COMPRESSED_PVRT_RGB => 21,
    PIXELFORMAT_COMPRESSED_PVRT_RGBA => 22,
    PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA => 23,
    PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA => 24,
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
our sub term:<close-window> () is export is native(LIBRAYLIB) is symbol('CloseWindow'){ * }
our sub term:<window-should-close> () returns bool is export is native(LIBRAYLIB) is symbol('WindowShouldClose'){ * }
our sub term:<is-window-ready> () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowReady'){ * }
our sub term:<is-window-fullscreen> () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowFullscreen'){ * }
our sub term:<is-window-hidden> () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowHidden'){ * }
our sub term:<is-window-minimized> () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowMinimized'){ * }
our sub term:<is-window-maximized> () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowMaximized'){ * }
our sub term:<is-window-focused> () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowFocused'){ * }
our sub term:<is-window-resized> () returns bool is export is native(LIBRAYLIB) is symbol('IsWindowResized'){ * }
our sub is-window-state (uint32 $flag) returns bool is export is native(LIBRAYLIB) is symbol('IsWindowState'){ * }
our sub set-window-state (uint32 $flags) is export is native(LIBRAYLIB) is symbol('SetWindowState'){ * }
our sub clear-window-state (uint32 $flags) is export is native(LIBRAYLIB) is symbol('ClearWindowState'){ * }
our sub term:<toggle-fullscreen> () is export is native(LIBRAYLIB) is symbol('ToggleFullscreen'){ * }
our sub term:<toggle-borderless-windowed> () is export is native(LIBRAYLIB) is symbol('ToggleBorderlessWindowed'){ * }
our sub term:<maximize-window> () is export is native(LIBRAYLIB) is symbol('MaximizeWindow'){ * }
our sub term:<minimize-window> () is export is native(LIBRAYLIB) is symbol('MinimizeWindow'){ * }
our sub term:<restore-window> () is export is native(LIBRAYLIB) is symbol('RestoreWindow'){ * }
our sub set-window-icons (Image $images is rw, int32 $count) is export is native(LIBRAYLIB) is symbol('SetWindowIcons'){ * }
our sub set-window-title (Str $title) is export is native(LIBRAYLIB) is symbol('SetWindowTitle'){ * }
our sub set-window-position (int32 $x, int32 $y) is export is native(LIBRAYLIB) is symbol('SetWindowPosition'){ * }
our sub set-window-monitor (int32 $monitor) is export is native(LIBRAYLIB) is symbol('SetWindowMonitor'){ * }
our sub set-window-min-size (int32 $width, int32 $height) is export is native(LIBRAYLIB) is symbol('SetWindowMinSize'){ * }
our sub set-window-max-size (int32 $width, int32 $height) is export is native(LIBRAYLIB) is symbol('SetWindowMaxSize'){ * }
our sub set-window-size (int32 $width, int32 $height) is export is native(LIBRAYLIB) is symbol('SetWindowSize'){ * }
our sub set-window-opacity (num32 $opacity) is export is native(LIBRAYLIB) is symbol('SetWindowOpacity'){ * }
our sub term:<set-window-focused> () is export is native(LIBRAYLIB) is symbol('SetWindowFocused'){ * }
our sub term:<get-window-handle> () is export is native(LIBRAYLIB) is symbol('GetWindowHandle'){ * }
our sub term:<get-screen-width> () returns int32 is export is native(LIBRAYLIB) is symbol('GetScreenWidth'){ * }
our sub term:<get-screen-height> () returns int32 is export is native(LIBRAYLIB) is symbol('GetScreenHeight'){ * }
our sub term:<get-render-width> () returns int32 is export is native(LIBRAYLIB) is symbol('GetRenderWidth'){ * }
our sub term:<get-render-height> () returns int32 is export is native(LIBRAYLIB) is symbol('GetRenderHeight'){ * }
our sub term:<get-monitor-count> () returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorCount'){ * }
our sub term:<get-current-monitor> () returns int32 is export is native(LIBRAYLIB) is symbol('GetCurrentMonitor'){ * }
our sub get-monitor-width (int32 $monitor) returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorWidth'){ * }
our sub get-monitor-height (int32 $monitor) returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorHeight'){ * }
our sub get-monitor-physical-width (int32 $monitor) returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorPhysicalWidth'){ * }
our sub get-monitor-physical-height (int32 $monitor) returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorPhysicalHeight'){ * }
our sub get-monitor-refresh-rate (int32 $monitor) returns int32 is export is native(LIBRAYLIB) is symbol('GetMonitorRefreshRate'){ * }
our sub get-monitor-name (int32 $monitor) returns Str is export is native(LIBRAYLIB) is symbol('GetMonitorName'){ * }
our sub set-clipboard-text (Str $text) is export is native(LIBRAYLIB) is symbol('SetClipboardText'){ * }
our sub term:<get-clipboard-text> () returns Str is export is native(LIBRAYLIB) is symbol('GetClipboardText'){ * }
our sub term:<enable-event-waiting> () is export is native(LIBRAYLIB) is symbol('EnableEventWaiting'){ * }
our sub term:<disable-event-waiting> () is export is native(LIBRAYLIB) is symbol('DisableEventWaiting'){ * }
our sub term:<show-cursor> () is export is native(LIBRAYLIB) is symbol('ShowCursor'){ * }
our sub term:<hide-cursor> () is export is native(LIBRAYLIB) is symbol('HideCursor'){ * }
our sub term:<is-cursor-hidden> () returns bool is export is native(LIBRAYLIB) is symbol('IsCursorHidden'){ * }
our sub term:<enable-cursor> () is export is native(LIBRAYLIB) is symbol('EnableCursor'){ * }
our sub term:<disable-cursor> () is export is native(LIBRAYLIB) is symbol('DisableCursor'){ * }
our sub term:<is-cursor-on-screen> () returns bool is export is native(LIBRAYLIB) is symbol('IsCursorOnScreen'){ * }
our sub term:<begin-drawing> () is export is native(LIBRAYLIB) is symbol('BeginDrawing'){ * }
our sub term:<end-drawing> () is export is native(LIBRAYLIB) is symbol('EndDrawing'){ * }
our sub term:<end-mode2d> () is export is native(LIBRAYLIB) is symbol('EndMode2D'){ * }
our sub term:<end-mode3d> () is export is native(LIBRAYLIB) is symbol('EndMode3D'){ * }
our sub term:<end-texture-mode> () is export is native(LIBRAYLIB) is symbol('EndTextureMode'){ * }
our sub term:<end-shader-mode> () is export is native(LIBRAYLIB) is symbol('EndShaderMode'){ * }
our sub begin-blend-mode (int32 $mode) is export is native(LIBRAYLIB) is symbol('BeginBlendMode'){ * }
our sub term:<end-blend-mode> () is export is native(LIBRAYLIB) is symbol('EndBlendMode'){ * }
our sub begin-scissor-mode (int32 $x, int32 $y, int32 $width, int32 $height) is export is native(LIBRAYLIB) is symbol('BeginScissorMode'){ * }
our sub term:<end-scissor-mode> () is export is native(LIBRAYLIB) is symbol('EndScissorMode'){ * }
our sub term:<end-vr-stereo-mode> () is export is native(LIBRAYLIB) is symbol('EndVrStereoMode'){ * }
our sub set-target-fps (int32 $fps) is export is native(LIBRAYLIB) is symbol('SetTargetFPS'){ * }
our sub term:<get-frame-time> () returns num32 is export is native(LIBRAYLIB) is symbol('GetFrameTime'){ * }
our sub term:<get-time> () returns num64 is export is native(LIBRAYLIB) is symbol('GetTime'){ * }
our sub term:<get-fps> () returns int32 is export is native(LIBRAYLIB) is symbol('GetFPS'){ * }
our sub term:<swap-screen-buffer> () is export is native(LIBRAYLIB) is symbol('SwapScreenBuffer'){ * }
our sub term:<poll-input-events> () is export is native(LIBRAYLIB) is symbol('PollInputEvents'){ * }
our sub wait-time (num64 $seconds) is export is native(LIBRAYLIB) is symbol('WaitTime'){ * }
our sub set-random-seed (uint32 $seed) is export is native(LIBRAYLIB) is symbol('SetRandomSeed'){ * }
our sub get-random-value (int32 $min, int32 $max) returns int32 is export is native(LIBRAYLIB) is symbol('GetRandomValue'){ * }
our sub load-random-sequence (uint32 $count, int32 $min, int32 $max) returns int32 is export is native(LIBRAYLIB) is symbol('LoadRandomSequence'){ * }
our sub unload-random-sequence (int32 $sequence is rw, ) is export is native(LIBRAYLIB) is symbol('UnloadRandomSequence'){ * }
our sub take-screenshot (Str $fileName) is export is native(LIBRAYLIB) is symbol('TakeScreenshot'){ * }
our sub set-config-flags (uint32 $flags) is export is native(LIBRAYLIB) is symbol('SetConfigFlags'){ * }
our sub open-url (Str $url) is export is native(LIBRAYLIB) is symbol('OpenURL'){ * }
our sub trace-log (int32 $logLevel, Str $text, ) is export is native(LIBRAYLIB) is symbol('TraceLog'){ * }
our sub set-trace-log-level (int32 $logLevel) is export is native(LIBRAYLIB) is symbol('SetTraceLogLevel'){ * }
our sub mem-alloc (uint32 $size) is export is native(LIBRAYLIB) is symbol('MemAlloc'){ * }
our sub mem-realloc (Pointer[void] $ptr, uint32 $size) is export is native(LIBRAYLIB) is symbol('MemRealloc'){ * }
our sub mem-free (Pointer[void] $ptr, ) is export is native(LIBRAYLIB) is symbol('MemFree'){ * }
our sub set-trace-log-callback (&trace-log-callback (int32 $logLevel, Str $text, Str $args)) is export is native(LIBRAYLIB) is symbol('SetTraceLogCallback'){ * }
our sub set-load-file-data-callback (&load-file-data-callback (Str $fileName, int32 $dataSize is rw,  --> Str)) is export is native(LIBRAYLIB) is symbol('SetLoadFileDataCallback'){ * }
our sub set-save-file-data-callback (&save-file-data-callback (Str $fileName, Pointer[void] $data, int32 $dataSize --> bool)) is export is native(LIBRAYLIB) is symbol('SetSaveFileDataCallback'){ * }
our sub set-load-file-text-callback (&load-file-text-callback (Str $fileName --> Str)) is export is native(LIBRAYLIB) is symbol('SetLoadFileTextCallback'){ * }
our sub set-save-file-text-callback (&save-file-text-callback (Str $fileName, CArray[uint8] $text,  --> bool)) is export is native(LIBRAYLIB) is symbol('SetSaveFileTextCallback'){ * }
our sub load-file-data (Str $fileName, int32 $dataSize is rw, ) returns Str is export is native(LIBRAYLIB) is symbol('LoadFileData'){ * }
our sub unload-file-data (CArray[uint8] $data, ) is export is native(LIBRAYLIB) is symbol('UnloadFileData'){ * }
our sub save-file-data (Str $fileName, Pointer[void] $data, int32 $dataSize) returns bool is export is native(LIBRAYLIB) is symbol('SaveFileData'){ * }
our sub export-data-as-code (uint8 $data is rw, int32 $dataSize, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportDataAsCode'){ * }
our sub load-file-text (Str $fileName) returns Str is export is native(LIBRAYLIB) is symbol('LoadFileText'){ * }
our sub unload-file-text (CArray[uint8] $text, ) is export is native(LIBRAYLIB) is symbol('UnloadFileText'){ * }
our sub save-file-text (Str $fileName, CArray[uint8] $text, ) returns bool is export is native(LIBRAYLIB) is symbol('SaveFileText'){ * }
our sub file-exists (Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('FileExists'){ * }
our sub directory-exists (Str $dirPath) returns bool is export is native(LIBRAYLIB) is symbol('DirectoryExists'){ * }
our sub is-file-extension (Str $fileName, Str $ext) returns bool is export is native(LIBRAYLIB) is symbol('IsFileExtension'){ * }
our sub get-file-length (Str $fileName) returns int32 is export is native(LIBRAYLIB) is symbol('GetFileLength'){ * }
our sub get-file-extension (Str $fileName) returns Str is export is native(LIBRAYLIB) is symbol('GetFileExtension'){ * }
our sub get-file-name (Str $filePath) returns Str is export is native(LIBRAYLIB) is symbol('GetFileName'){ * }
our sub get-file-name-without-ext (Str $filePath) returns Str is export is native(LIBRAYLIB) is symbol('GetFileNameWithoutExt'){ * }
our sub get-directory-path (Str $filePath) returns Str is export is native(LIBRAYLIB) is symbol('GetDirectoryPath'){ * }
our sub get-prev-directory-path (Str $dirPath) returns Str is export is native(LIBRAYLIB) is symbol('GetPrevDirectoryPath'){ * }
our sub term:<get-working-directory> () returns Str is export is native(LIBRAYLIB) is symbol('GetWorkingDirectory'){ * }
our sub term:<get-application-directory> () returns Str is export is native(LIBRAYLIB) is symbol('GetApplicationDirectory'){ * }
our sub change-directory (Str $dir) returns bool is export is native(LIBRAYLIB) is symbol('ChangeDirectory'){ * }
our sub is-path-file (Str $path) returns bool is export is native(LIBRAYLIB) is symbol('IsPathFile'){ * }
our sub term:<is-file-dropped> () returns bool is export is native(LIBRAYLIB) is symbol('IsFileDropped'){ * }
our sub compress-data (uint8 $data is rw, int32 $dataSize, int32 $compDataSize is rw, ) returns Str is export is native(LIBRAYLIB) is symbol('CompressData'){ * }
our sub decompress-data (uint8 $compData is rw, int32 $compDataSize, int32 $dataSize is rw, ) returns Str is export is native(LIBRAYLIB) is symbol('DecompressData'){ * }
our sub encode-data-base64 (uint8 $data is rw, int32 $dataSize, int32 $outputSize is rw, ) returns Str is export is native(LIBRAYLIB) is symbol('EncodeDataBase64'){ * }
our sub decode-data-base64 (uint8 $data is rw, int32 $outputSize is rw, ) returns Str is export is native(LIBRAYLIB) is symbol('DecodeDataBase64'){ * }
our sub unload-automation-event-list (AutomationEventList $list is rw) is export is native(LIBRAYLIB) is symbol('UnloadAutomationEventList'){ * }
our sub set-automation-event-list (AutomationEventList $list is rw) is export is native(LIBRAYLIB) is symbol('SetAutomationEventList'){ * }
our sub set-automation-event-base-frame (int32 $frame) is export is native(LIBRAYLIB) is symbol('SetAutomationEventBaseFrame'){ * }
our sub term:<start-automation-event-recording> () is export is native(LIBRAYLIB) is symbol('StartAutomationEventRecording'){ * }
our sub term:<stop-automation-event-recording> () is export is native(LIBRAYLIB) is symbol('StopAutomationEventRecording'){ * }
our sub is-key-pressed (int32 $key) returns bool is export is native(LIBRAYLIB) is symbol('IsKeyPressed'){ * }
our sub is-key-pressed-repeat (int32 $key) returns bool is export is native(LIBRAYLIB) is symbol('IsKeyPressedRepeat'){ * }
our sub is-key-down (int32 $key) returns bool is export is native(LIBRAYLIB) is symbol('IsKeyDown'){ * }
our sub is-key-released (int32 $key) returns bool is export is native(LIBRAYLIB) is symbol('IsKeyReleased'){ * }
our sub is-key-up (int32 $key) returns bool is export is native(LIBRAYLIB) is symbol('IsKeyUp'){ * }
our sub term:<get-key-pressed> () returns int32 is export is native(LIBRAYLIB) is symbol('GetKeyPressed'){ * }
our sub term:<get-char-pressed> () returns int32 is export is native(LIBRAYLIB) is symbol('GetCharPressed'){ * }
our sub set-exit-key (int32 $key) is export is native(LIBRAYLIB) is symbol('SetExitKey'){ * }
our sub is-gamepad-available (int32 $gamepad) returns bool is export is native(LIBRAYLIB) is symbol('IsGamepadAvailable'){ * }
our sub get-gamepad-name (int32 $gamepad) returns Str is export is native(LIBRAYLIB) is symbol('GetGamepadName'){ * }
our sub is-gamepad-button-pressed (int32 $gamepad, int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsGamepadButtonPressed'){ * }
our sub is-gamepad-button-down (int32 $gamepad, int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsGamepadButtonDown'){ * }
our sub is-gamepad-button-released (int32 $gamepad, int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsGamepadButtonReleased'){ * }
our sub is-gamepad-button-up (int32 $gamepad, int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsGamepadButtonUp'){ * }
our sub term:<get-gamepad-button-pressed> () returns int32 is export is native(LIBRAYLIB) is symbol('GetGamepadButtonPressed'){ * }
our sub get-gamepad-axis-count (int32 $gamepad) returns int32 is export is native(LIBRAYLIB) is symbol('GetGamepadAxisCount'){ * }
our sub get-gamepad-axis-movement (int32 $gamepad, int32 $axis) returns num32 is export is native(LIBRAYLIB) is symbol('GetGamepadAxisMovement'){ * }
our sub set-gamepad-mappings (Str $mappings) returns int32 is export is native(LIBRAYLIB) is symbol('SetGamepadMappings'){ * }
our sub is-mouse-button-pressed (int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsMouseButtonPressed'){ * }
our sub is-mouse-button-down (int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsMouseButtonDown'){ * }
our sub is-mouse-button-released (int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsMouseButtonReleased'){ * }
our sub is-mouse-button-up (int32 $button) returns bool is export is native(LIBRAYLIB) is symbol('IsMouseButtonUp'){ * }
our sub term:<get-mouse-x> () returns int32 is export is native(LIBRAYLIB) is symbol('GetMouseX'){ * }
our sub term:<get-mouse-y> () returns int32 is export is native(LIBRAYLIB) is symbol('GetMouseY'){ * }
our sub set-mouse-position (int32 $x, int32 $y) is export is native(LIBRAYLIB) is symbol('SetMousePosition'){ * }
our sub set-mouse-offset (int32 $offsetX, int32 $offsetY) is export is native(LIBRAYLIB) is symbol('SetMouseOffset'){ * }
our sub set-mouse-scale (num32 $scaleX, num32 $scaleY) is export is native(LIBRAYLIB) is symbol('SetMouseScale'){ * }
our sub term:<get-mouse-wheel-move> () returns num32 is export is native(LIBRAYLIB) is symbol('GetMouseWheelMove'){ * }
our sub set-mouse-cursor (int32 $cursor) is export is native(LIBRAYLIB) is symbol('SetMouseCursor'){ * }
our sub term:<get-touch-x> () returns int32 is export is native(LIBRAYLIB) is symbol('GetTouchX'){ * }
our sub term:<get-touch-y> () returns int32 is export is native(LIBRAYLIB) is symbol('GetTouchY'){ * }
our sub get-touch-point-id (int32 $index) returns int32 is export is native(LIBRAYLIB) is symbol('GetTouchPointId'){ * }
our sub term:<get-touch-point-count> () returns int32 is export is native(LIBRAYLIB) is symbol('GetTouchPointCount'){ * }
our sub set-gestures-enabled (uint32 $flags) is export is native(LIBRAYLIB) is symbol('SetGesturesEnabled'){ * }
our sub is-gesture-detected (uint32 $gesture) returns bool is export is native(LIBRAYLIB) is symbol('IsGestureDetected'){ * }
our sub term:<get-gesture-detected> () returns int32 is export is native(LIBRAYLIB) is symbol('GetGestureDetected'){ * }
our sub term:<get-gesture-hold-duration> () returns num32 is export is native(LIBRAYLIB) is symbol('GetGestureHoldDuration'){ * }
our sub term:<get-gesture-drag-angle> () returns num32 is export is native(LIBRAYLIB) is symbol('GetGestureDragAngle'){ * }
our sub term:<get-gesture-pinch-angle> () returns num32 is export is native(LIBRAYLIB) is symbol('GetGesturePinchAngle'){ * }
our sub update-camera (Camera $camera is rw, int32 $mode) is export is native(LIBRAYLIB) is symbol('UpdateCamera'){ * }
our sub image-format (Image $image is rw, int32 $newFormat) is export is native(LIBRAYLIB) is symbol('ImageFormat'){ * }
our sub image-alpha-crop (Image $image is rw, num32 $threshold) is export is native(LIBRAYLIB) is symbol('ImageAlphaCrop'){ * }
our sub image-alpha-premultiply (Image $image is rw) is export is native(LIBRAYLIB) is symbol('ImageAlphaPremultiply'){ * }
our sub image-blur-gaussian (Image $image is rw, int32 $blurSize) is export is native(LIBRAYLIB) is symbol('ImageBlurGaussian'){ * }
our sub image-kernel-convolution (Image $image is rw, num32 $kernel is rw, int32 $kernelSize) is export is native(LIBRAYLIB) is symbol('ImageKernelConvolution'){ * }
our sub image-resize (Image $image is rw, int32 $newWidth, int32 $newHeight) is export is native(LIBRAYLIB) is symbol('ImageResize'){ * }
our sub image-resize-nn (Image $image is rw, int32 $newWidth, int32 $newHeight) is export is native(LIBRAYLIB) is symbol('ImageResizeNN'){ * }
our sub image-mipmaps (Image $image is rw) is export is native(LIBRAYLIB) is symbol('ImageMipmaps'){ * }
our sub image-dither (Image $image is rw, int32 $rBpp, int32 $gBpp, int32 $bBpp, int32 $aBpp) is export is native(LIBRAYLIB) is symbol('ImageDither'){ * }
our sub image-flip-vertical (Image $image is rw) is export is native(LIBRAYLIB) is symbol('ImageFlipVertical'){ * }
our sub image-flip-horizontal (Image $image is rw) is export is native(LIBRAYLIB) is symbol('ImageFlipHorizontal'){ * }
our sub image-rotate (Image $image is rw, int32 $degrees) is export is native(LIBRAYLIB) is symbol('ImageRotate'){ * }
our sub image-rotate-cw (Image $image is rw) is export is native(LIBRAYLIB) is symbol('ImageRotateCW'){ * }
our sub image-rotate-ccw (Image $image is rw) is export is native(LIBRAYLIB) is symbol('ImageRotateCCW'){ * }
our sub image-color-invert (Image $image is rw) is export is native(LIBRAYLIB) is symbol('ImageColorInvert'){ * }
our sub image-color-grayscale (Image $image is rw) is export is native(LIBRAYLIB) is symbol('ImageColorGrayscale'){ * }
our sub image-color-contrast (Image $image is rw, num32 $contrast) is export is native(LIBRAYLIB) is symbol('ImageColorContrast'){ * }
our sub image-color-brightness (Image $image is rw, int32 $brightness) is export is native(LIBRAYLIB) is symbol('ImageColorBrightness'){ * }
our sub unload-image-colors (Color $colors is rw) is export is native(LIBRAYLIB) is symbol('UnloadImageColors'){ * }
our sub unload-image-palette (Color $colors is rw) is export is native(LIBRAYLIB) is symbol('UnloadImagePalette'){ * }
our sub gen-texture-mipmaps (Texture2D $texture is rw) is export is native(LIBRAYLIB) is symbol('GenTextureMipmaps'){ * }
our sub get-pixel-data-size (int32 $width, int32 $height, int32 $format) returns int32 is export is native(LIBRAYLIB) is symbol('GetPixelDataSize'){ * }
our sub load-font-data (uint8 $fileData is rw, int32 $dataSize, int32 $fontSize, int32 $codepoints is rw, int32 $codepointCount, int32 $type) returns GlyphInfo is export is native(LIBRAYLIB) is symbol('LoadFontData'){ * }
our sub unload-font-data (GlyphInfo $glyphs is rw, int32 $glyphCount) is export is native(LIBRAYLIB) is symbol('UnloadFontData'){ * }
our sub draw-fps (int32 $posX, int32 $posY) is export is native(LIBRAYLIB) is symbol('DrawFPS'){ * }
our sub set-text-line-spacing (int32 $spacing) is export is native(LIBRAYLIB) is symbol('SetTextLineSpacing'){ * }
our sub measure-text (Str $text, int32 $fontSize) returns int32 is export is native(LIBRAYLIB) is symbol('MeasureText'){ * }
our sub load-utf8 (int32 $codepoints is rw, int32 $length) returns Str is export is native(LIBRAYLIB) is symbol('LoadUTF8'){ * }
our sub unload-utf8 (CArray[uint8] $text, ) is export is native(LIBRAYLIB) is symbol('UnloadUTF8'){ * }
our sub load-codepoints (Str $text, int32 $count is rw, ) returns int32 is export is native(LIBRAYLIB) is symbol('LoadCodepoints'){ * }
our sub unload-codepoints (int32 $codepoints is rw, ) is export is native(LIBRAYLIB) is symbol('UnloadCodepoints'){ * }
our sub get-codepoint-count (Str $text) returns int32 is export is native(LIBRAYLIB) is symbol('GetCodepointCount'){ * }
our sub get-codepoint (Str $text, int32 $codepointSize is rw, ) returns int32 is export is native(LIBRAYLIB) is symbol('GetCodepoint'){ * }
our sub get-codepoint-next (Str $text, int32 $codepointSize is rw, ) returns int32 is export is native(LIBRAYLIB) is symbol('GetCodepointNext'){ * }
our sub get-codepoint-previous (Str $text, int32 $codepointSize is rw, ) returns int32 is export is native(LIBRAYLIB) is symbol('GetCodepointPrevious'){ * }
our sub codepoint-to-utf8 (int32 $codepoint, int32 $utf8Size is rw, ) returns Str is export is native(LIBRAYLIB) is symbol('CodepointToUTF8'){ * }
our sub text-copy (CArray[uint8] $dst, Str $src) returns int32 is export is native(LIBRAYLIB) is symbol('TextCopy'){ * }
our sub text-is-equal (Str $text1, Str $text2) returns bool is export is native(LIBRAYLIB) is symbol('TextIsEqual'){ * }
our sub text-length (Str $text) returns int32 is export is native(LIBRAYLIB) is symbol('TextLength'){ * }
our sub text-format (Str $text, ) returns Str is export is native(LIBRAYLIB) is symbol('TextFormat'){ * }
our sub text-subtext (Str $text, int32 $position, int32 $length) returns Str is export is native(LIBRAYLIB) is symbol('TextSubtext'){ * }
our sub text-replace (CArray[uint8] $text, Str $replace, Str $by) returns Str is export is native(LIBRAYLIB) is symbol('TextReplace'){ * }
our sub text-insert (Str $text, Str $insert, int32 $position) returns Str is export is native(LIBRAYLIB) is symbol('TextInsert'){ * }
our sub text-join (Str $textList, int32 $count, Str $delimiter) returns Str is export is native(LIBRAYLIB) is symbol('TextJoin'){ * }
our sub text-split (Str $text, Str $delimiter, int32 $count is rw, ) returns Str is export is native(LIBRAYLIB) is symbol('TextSplit'){ * }
our sub text-append (CArray[uint8] $text, Str $append, int32 $position is rw, ) is export is native(LIBRAYLIB) is symbol('TextAppend'){ * }
our sub text-find-index (Str $text, Str $find) returns int32 is export is native(LIBRAYLIB) is symbol('TextFindIndex'){ * }
our sub text-to-upper (Str $text) returns Str is export is native(LIBRAYLIB) is symbol('TextToUpper'){ * }
our sub text-to-lower (Str $text) returns Str is export is native(LIBRAYLIB) is symbol('TextToLower'){ * }
our sub text-to-pascal (Str $text) returns Str is export is native(LIBRAYLIB) is symbol('TextToPascal'){ * }
our sub text-to-integer (Str $text) returns int32 is export is native(LIBRAYLIB) is symbol('TextToInteger'){ * }
our sub text-to-float (Str $text) returns num32 is export is native(LIBRAYLIB) is symbol('TextToFloat'){ * }
our sub draw-grid (int32 $slices, num32 $spacing) is export is native(LIBRAYLIB) is symbol('DrawGrid'){ * }
our sub upload-mesh (Mesh $mesh is rw, bool $dynamic) is export is native(LIBRAYLIB) is symbol('UploadMesh'){ * }
our sub gen-mesh-tangents (Mesh $mesh is rw) is export is native(LIBRAYLIB) is symbol('GenMeshTangents'){ * }
our sub load-materials (Str $fileName, int32 $materialCount is rw, ) returns Material is export is native(LIBRAYLIB) is symbol('LoadMaterials'){ * }
our sub set-model-mesh-material (Model $model is rw, int32 $meshId, int32 $materialId) is export is native(LIBRAYLIB) is symbol('SetModelMeshMaterial'){ * }
our sub load-model-animations (Str $fileName, int32 $animCount is rw, ) returns ModelAnimation is export is native(LIBRAYLIB) is symbol('LoadModelAnimations'){ * }
our sub unload-model-animations (ModelAnimation $animations is rw, int32 $animCount) is export is native(LIBRAYLIB) is symbol('UnloadModelAnimations'){ * }
our sub term:<init-audio-device> () is export is native(LIBRAYLIB) is symbol('InitAudioDevice'){ * }
our sub term:<close-audio-device> () is export is native(LIBRAYLIB) is symbol('CloseAudioDevice'){ * }
our sub term:<is-audio-device-ready> () returns bool is export is native(LIBRAYLIB) is symbol('IsAudioDeviceReady'){ * }
our sub set-master-volume (num32 $volume) is export is native(LIBRAYLIB) is symbol('SetMasterVolume'){ * }
our sub term:<get-master-volume> () returns num32 is export is native(LIBRAYLIB) is symbol('GetMasterVolume'){ * }
our sub wave-crop (Wave $wave is rw, int32 $initSample, int32 $finalSample) is export is native(LIBRAYLIB) is symbol('WaveCrop'){ * }
our sub wave-format (Wave $wave is rw, int32 $sampleRate, int32 $sampleSize, int32 $channels) is export is native(LIBRAYLIB) is symbol('WaveFormat'){ * }
our sub unload-wave-samples (num32 $samples is rw) is export is native(LIBRAYLIB) is symbol('UnloadWaveSamples'){ * }
our sub set-audio-stream-buffer-size-default (int32 $size) is export is native(LIBRAYLIB) is symbol('SetAudioStreamBufferSizeDefault'){ * }
our sub attach-audio-mixed-processor (&audio-callback (Pointer[void] $bufferData, uint32 $frames)) is export is native(LIBRAYLIB) is symbol('AttachAudioMixedProcessor'){ * }
our sub detach-audio-mixed-processor (&audio-callback (Pointer[void] $bufferData, uint32 $frames)) is export is native(LIBRAYLIB) is symbol('DetachAudioMixedProcessor'){ * }
####### Predefined colors ########
sub term:<init-lightgray  > is export { Color.init(200,  200,  200,  255 );} # creating a new instance of Color
sub term:<init-gray       > is export { Color.init(130,  130,  130,  255 );} # creating a new instance of Color
sub term:<init-darkgray   > is export { Color.init(80,  80,  80,  255 );} # creating a new instance of Color
sub term:<init-yellow     > is export { Color.init(253,  249,  0,  255 );} # creating a new instance of Color
sub term:<init-gold       > is export { Color.init(255,  203,  0,  255 );} # creating a new instance of Color
sub term:<init-orange     > is export { Color.init(255,  161,  0,  255 );} # creating a new instance of Color
sub term:<init-pink       > is export { Color.init(255,  109,  194,  255 );} # creating a new instance of Color
sub term:<init-red        > is export { Color.init(230,  41,  55,  255 );} # creating a new instance of Color
sub term:<init-maroon     > is export { Color.init(190,  33,  55,  255 );} # creating a new instance of Color
sub term:<init-green      > is export { Color.init(0,  228,  48,  255 );} # creating a new instance of Color
sub term:<init-lime       > is export { Color.init(0,  158,  47,  255 );} # creating a new instance of Color
sub term:<init-darkgreen  > is export { Color.init(0,  117,  44,  255 );} # creating a new instance of Color
sub term:<init-skyblue    > is export { Color.init(102,  191,  255,  255 );} # creating a new instance of Color
sub term:<init-blue       > is export { Color.init(0,  121,  241,  255 );} # creating a new instance of Color
sub term:<init-darkblue   > is export { Color.init(0,  82,  172,  255 );} # creating a new instance of Color
sub term:<init-purple     > is export { Color.init(200,  122,  255,  255 );} # creating a new instance of Color
sub term:<init-violet     > is export { Color.init(135,  60,  190,  255 );} # creating a new instance of Color
sub term:<init-darkpurple > is export { Color.init(112,  31,  126,  255 );} # creating a new instance of Color
sub term:<init-beige      > is export { Color.init(211,  176,  131,  255 );} # creating a new instance of Color
sub term:<init-brown      > is export { Color.init(127,  106,  79,  255 );} # creating a new instance of Color
sub term:<init-darkbrown  > is export { Color.init(76,  63,  47,  255 );} # creating a new instance of Color
sub term:<init-white      > is export { Color.init(255,  255,  255,  255 );} # creating a new instance of Color
sub term:<init-black      > is export { Color.init(0,  0,  0,  255 );} # creating a new instance of Color
sub term:<init-blank      > is export { Color.init(0,  0,  0,  0 );} # creating a new instance of Color
sub term:<init-magenta    > is export { Color.init(255,  0,  255,  255 );} # creating a new instance of Color
sub term:<init-raywhite   > is export { Color.init(245,  245,  245,  255 );} # creating a new instance of Color
####### Pointerized functions ########
our sub set-window-icon (Image $image) is export is native(LIBRAYLIB) is symbol('SetWindowIcon_pointerized'){ * }
our sub get-monitor-position (int32 $monitor) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetMonitorPosition_pointerized'){ * }
our sub term:<get-window-position> () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetWindowPosition_pointerized'){ * }
our sub term:<get-window-scale-dpi> () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetWindowScaleDPI_pointerized'){ * }
our sub clear-background (Color $color) is export is native(LIBRAYLIB) is symbol('ClearBackground_pointerized'){ * }
our sub begin-mode2d (Camera2D $camera) is export is native(LIBRAYLIB) is symbol('BeginMode2D_pointerized'){ * }
our sub begin-mode3d (Camera3D $camera) is export is native(LIBRAYLIB) is symbol('BeginMode3D_pointerized'){ * }
our sub begin-texture-mode (RenderTexture2D $target) is export is native(LIBRAYLIB) is symbol('BeginTextureMode_pointerized'){ * }
our sub begin-shader-mode (Shader $shader) is export is native(LIBRAYLIB) is symbol('BeginShaderMode_pointerized'){ * }
our sub begin-vr-stereo-mode (VrStereoConfig $config) is export is native(LIBRAYLIB) is symbol('BeginVrStereoMode_pointerized'){ * }
our sub load-vr-stereo-config (VrDeviceInfo $device) returns VrStereoConfig is export is native(LIBRAYLIB) is symbol('LoadVrStereoConfig_pointerized'){ * }
our sub unload-vr-stereo-config (VrStereoConfig $config) is export is native(LIBRAYLIB) is symbol('UnloadVrStereoConfig_pointerized'){ * }
our sub load-shader (Str $vsFileName, Str $fsFileName) returns Shader is export is native(LIBRAYLIB) is symbol('LoadShader_pointerized'){ * }
our sub load-shader-from-memory (Str $vsCode, Str $fsCode) returns Shader is export is native(LIBRAYLIB) is symbol('LoadShaderFromMemory_pointerized'){ * }
our sub is-shader-ready (Shader $shader) returns bool is export is native(LIBRAYLIB) is symbol('IsShaderReady_pointerized'){ * }
our sub get-shader-location (Shader $shader, Str $uniformName) returns int32 is export is native(LIBRAYLIB) is symbol('GetShaderLocation_pointerized'){ * }
our sub get-shader-location-attrib (Shader $shader, Str $attribName) returns int32 is export is native(LIBRAYLIB) is symbol('GetShaderLocationAttrib_pointerized'){ * }
our sub set-shader-value (Shader $shader, int32 $locIndex, Pointer[void] $value, int32 $uniformType) is export is native(LIBRAYLIB) is symbol('SetShaderValue_pointerized'){ * }
our sub set-shader-value-v (Shader $shader, int32 $locIndex, Pointer[void] $value, int32 $uniformType, int32 $count) is export is native(LIBRAYLIB) is symbol('SetShaderValueV_pointerized'){ * }
our sub set-shader-value-matrix (Shader $shader, int32 $locIndex, Matrix $mat) is export is native(LIBRAYLIB) is symbol('SetShaderValueMatrix_pointerized'){ * }
our sub set-shader-value-texture (Shader $shader, int32 $locIndex, Texture2D $texture) is export is native(LIBRAYLIB) is symbol('SetShaderValueTexture_pointerized'){ * }
our sub unload-shader (Shader $shader) is export is native(LIBRAYLIB) is symbol('UnloadShader_pointerized'){ * }
our sub get-mouse-ray (Vector2 $mousePosition, Camera $camera) returns Ray is export is native(LIBRAYLIB) is symbol('GetMouseRay_pointerized'){ * }
our sub get-camera-matrix (Camera $camera) returns Matrix is export is native(LIBRAYLIB) is symbol('GetCameraMatrix_pointerized'){ * }
our sub get-camera-matrix2d (Camera2D $camera) returns Matrix is export is native(LIBRAYLIB) is symbol('GetCameraMatrix2D_pointerized'){ * }
our sub get-world-to-screen (Vector3 $position, Camera $camera) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetWorldToScreen_pointerized'){ * }
our sub get-screen-to-world2d (Vector2 $position, Camera2D $camera) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetScreenToWorld2D_pointerized'){ * }
our sub get-world-to-screen-ex (Vector3 $position, Camera $camera, int32 $width, int32 $height) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetWorldToScreenEx_pointerized'){ * }
our sub get-world-to-screen2d (Vector2 $position, Camera2D $camera) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetWorldToScreen2D_pointerized'){ * }
our sub load-directory-files (Str $dirPath) returns FilePathList is export is native(LIBRAYLIB) is symbol('LoadDirectoryFiles_pointerized'){ * }
our sub load-directory-files-ex (Str $basePath, Str $filter, bool $scanSubdirs) returns FilePathList is export is native(LIBRAYLIB) is symbol('LoadDirectoryFilesEx_pointerized'){ * }
our sub unload-directory-files (FilePathList $files) is export is native(LIBRAYLIB) is symbol('UnloadDirectoryFiles_pointerized'){ * }
our sub term:<load-dropped-files> () returns FilePathList is export is native(LIBRAYLIB) is symbol('LoadDroppedFiles_pointerized'){ * }
our sub unload-dropped-files (FilePathList $files) is export is native(LIBRAYLIB) is symbol('UnloadDroppedFiles_pointerized'){ * }
our sub get-file-mod-time (Str $fileName) returns long is export is native(LIBRAYLIB) is symbol('GetFileModTime_pointerized'){ * }
our sub load-automation-event-list (Str $fileName) returns AutomationEventList is export is native(LIBRAYLIB) is symbol('LoadAutomationEventList_pointerized'){ * }
our sub export-automation-event-list (AutomationEventList $list, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportAutomationEventList_pointerized'){ * }
our sub play-automation-event (AutomationEvent $event) is export is native(LIBRAYLIB) is symbol('PlayAutomationEvent_pointerized'){ * }
our sub term:<get-mouse-position> () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetMousePosition_pointerized'){ * }
our sub term:<get-mouse-delta> () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetMouseDelta_pointerized'){ * }
our sub term:<get-mouse-wheel-move-v> () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetMouseWheelMoveV_pointerized'){ * }
our sub get-touch-position (int32 $index) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetTouchPosition_pointerized'){ * }
our sub term:<get-gesture-drag-vector> () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetGestureDragVector_pointerized'){ * }
our sub term:<get-gesture-pinch-vector> () returns Vector2 is export is native(LIBRAYLIB) is symbol('GetGesturePinchVector_pointerized'){ * }
our sub update-camera-pro (Camera $camera is rw, Vector3 $movement, Vector3 $rotation, num32 $zoom) is export is native(LIBRAYLIB) is symbol('UpdateCameraPro_pointerized'){ * }
our sub set-shapes-texture (Texture2D $texture, Rectangle $source) is export is native(LIBRAYLIB) is symbol('SetShapesTexture_pointerized'){ * }
our sub draw-pixel (int32 $posX, int32 $posY, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPixel_pointerized'){ * }
our sub draw-pixel-v (Vector2 $position, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPixelV_pointerized'){ * }
our sub draw-line (int32 $startPosX, int32 $startPosY, int32 $endPosX, int32 $endPosY, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLine_pointerized'){ * }
our sub draw-line-v (Vector2 $startPos, Vector2 $endPos, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineV_pointerized'){ * }
our sub draw-line-ex (Vector2 $startPos, Vector2 $endPos, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineEx_pointerized'){ * }
our sub draw-line-strip (Vector2 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineStrip_pointerized'){ * }
our sub draw-line-bezier (Vector2 $startPos, Vector2 $endPos, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLineBezier_pointerized'){ * }
our sub draw-circle (int32 $centerX, int32 $centerY, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircle_pointerized'){ * }
our sub draw-circle-sector (Vector2 $center, num32 $radius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleSector_pointerized'){ * }
our sub draw-circle-sector-lines (Vector2 $center, num32 $radius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleSectorLines_pointerized'){ * }
our sub draw-circle-gradient (int32 $centerX, int32 $centerY, num32 $radius, Color $color1, Color $color2) is export is native(LIBRAYLIB) is symbol('DrawCircleGradient_pointerized'){ * }
our sub draw-circle-v (Vector2 $center, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleV_pointerized'){ * }
our sub draw-circle-lines (int32 $centerX, int32 $centerY, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleLines_pointerized'){ * }
our sub draw-circle-lines-v (Vector2 $center, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircleLinesV_pointerized'){ * }
our sub draw-ellipse (int32 $centerX, int32 $centerY, num32 $radiusH, num32 $radiusV, Color $color) is export is native(LIBRAYLIB) is symbol('DrawEllipse_pointerized'){ * }
our sub draw-ellipse-lines (int32 $centerX, int32 $centerY, num32 $radiusH, num32 $radiusV, Color $color) is export is native(LIBRAYLIB) is symbol('DrawEllipseLines_pointerized'){ * }
our sub draw-ring (Vector2 $center, num32 $innerRadius, num32 $outerRadius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRing_pointerized'){ * }
our sub draw-ring-lines (Vector2 $center, num32 $innerRadius, num32 $outerRadius, num32 $startAngle, num32 $endAngle, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRingLines_pointerized'){ * }
our sub draw-rectangle (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangle_pointerized'){ * }
our sub draw-rectangle-v (Vector2 $position, Vector2 $size, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleV_pointerized'){ * }
our sub draw-rectangle-rec (Rectangle $rec, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleRec_pointerized'){ * }
our sub draw-rectangle-pro (Rectangle $rec, Vector2 $origin, num32 $rotation, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectanglePro_pointerized'){ * }
our sub draw-rectangle-gradient-v (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color1, Color $color2) is export is native(LIBRAYLIB) is symbol('DrawRectangleGradientV_pointerized'){ * }
our sub draw-rectangle-gradient-h (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color1, Color $color2) is export is native(LIBRAYLIB) is symbol('DrawRectangleGradientH_pointerized'){ * }
our sub draw-rectangle-gradient-ex (Rectangle $rec, Color $col1, Color $col2, Color $col3, Color $col4) is export is native(LIBRAYLIB) is symbol('DrawRectangleGradientEx_pointerized'){ * }
our sub draw-rectangle-lines (int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleLines_pointerized'){ * }
our sub draw-rectangle-lines-ex (Rectangle $rec, num32 $lineThick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleLinesEx_pointerized'){ * }
our sub draw-rectangle-rounded (Rectangle $rec, num32 $roundness, int32 $segments, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleRounded_pointerized'){ * }
our sub draw-rectangle-rounded-lines (Rectangle $rec, num32 $roundness, int32 $segments, num32 $lineThick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRectangleRoundedLines_pointerized'){ * }
our sub draw-triangle (Vector2 $v1, Vector2 $v2, Vector2 $v3, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangle_pointerized'){ * }
our sub draw-triangle-lines (Vector2 $v1, Vector2 $v2, Vector2 $v3, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleLines_pointerized'){ * }
our sub draw-triangle-fan (Vector2 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleFan_pointerized'){ * }
our sub draw-triangle-strip (Vector2 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleStrip_pointerized'){ * }
our sub draw-poly (Vector2 $center, int32 $sides, num32 $radius, num32 $rotation, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPoly_pointerized'){ * }
our sub draw-poly-lines (Vector2 $center, int32 $sides, num32 $radius, num32 $rotation, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPolyLines_pointerized'){ * }
our sub draw-poly-lines-ex (Vector2 $center, int32 $sides, num32 $radius, num32 $rotation, num32 $lineThick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPolyLinesEx_pointerized'){ * }
our sub draw-spline-linear (Vector2 $points is rw, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineLinear_pointerized'){ * }
our sub draw-spline-basis (Vector2 $points is rw, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineBasis_pointerized'){ * }
our sub draw-spline-catmull-rom (Vector2 $points is rw, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineCatmullRom_pointerized'){ * }
our sub draw-spline-bezier-quadratic (Vector2 $points is rw, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineBezierQuadratic_pointerized'){ * }
our sub draw-spline-bezier-cubic (Vector2 $points is rw, int32 $pointCount, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineBezierCubic_pointerized'){ * }
our sub draw-spline-segment-linear (Vector2 $p1, Vector2 $p2, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineSegmentLinear_pointerized'){ * }
our sub draw-spline-segment-basis (Vector2 $p1, Vector2 $p2, Vector2 $p3, Vector2 $p4, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineSegmentBasis_pointerized'){ * }
our sub draw-spline-segment-catmull-rom (Vector2 $p1, Vector2 $p2, Vector2 $p3, Vector2 $p4, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineSegmentCatmullRom_pointerized'){ * }
our sub draw-spline-segment-bezier-quadratic (Vector2 $p1, Vector2 $c2, Vector2 $p3, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineSegmentBezierQuadratic_pointerized'){ * }
our sub draw-spline-segment-bezier-cubic (Vector2 $p1, Vector2 $c2, Vector2 $c3, Vector2 $p4, num32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSplineSegmentBezierCubic_pointerized'){ * }
our sub get-spline-point-linear (Vector2 $startPos, Vector2 $endPos, num32 $t) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetSplinePointLinear_pointerized'){ * }
our sub get-spline-point-basis (Vector2 $p1, Vector2 $p2, Vector2 $p3, Vector2 $p4, num32 $t) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetSplinePointBasis_pointerized'){ * }
our sub get-spline-point-catmull-rom (Vector2 $p1, Vector2 $p2, Vector2 $p3, Vector2 $p4, num32 $t) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetSplinePointCatmullRom_pointerized'){ * }
our sub get-spline-point-bezier-quad (Vector2 $p1, Vector2 $c2, Vector2 $p3, num32 $t) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetSplinePointBezierQuad_pointerized'){ * }
our sub get-spline-point-bezier-cubic (Vector2 $p1, Vector2 $c2, Vector2 $c3, Vector2 $p4, num32 $t) returns Vector2 is export is native(LIBRAYLIB) is symbol('GetSplinePointBezierCubic_pointerized'){ * }
our sub check-collision-recs (Rectangle $rec1, Rectangle $rec2) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionRecs_pointerized'){ * }
our sub check-collision-circles (Vector2 $center1, num32 $radius1, Vector2 $center2, num32 $radius2) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionCircles_pointerized'){ * }
our sub check-collision-circle-rec (Vector2 $center, num32 $radius, Rectangle $rec) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionCircleRec_pointerized'){ * }
our sub check-collision-point-rec (Vector2 $point, Rectangle $rec) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointRec_pointerized'){ * }
our sub check-collision-point-circle (Vector2 $point, Vector2 $center, num32 $radius) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointCircle_pointerized'){ * }
our sub check-collision-point-triangle (Vector2 $point, Vector2 $p1, Vector2 $p2, Vector2 $p3) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointTriangle_pointerized'){ * }
our sub check-collision-point-poly (Vector2 $point, Vector2 $points is rw, int32 $pointCount) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointPoly_pointerized'){ * }
our sub check-collision-lines (Vector2 $startPos1, Vector2 $endPos1, Vector2 $startPos2, Vector2 $endPos2, Vector2 $collisionPoint is rw) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionLines_pointerized'){ * }
our sub check-collision-point-line (Vector2 $point, Vector2 $p1, Vector2 $p2, int32 $threshold) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionPointLine_pointerized'){ * }
our sub get-collision-rec (Rectangle $rec1, Rectangle $rec2) returns Rectangle is export is native(LIBRAYLIB) is symbol('GetCollisionRec_pointerized'){ * }
our sub load-image (Str $fileName) returns Image is export is native(LIBRAYLIB) is symbol('LoadImage_pointerized'){ * }
our sub load-image-raw (Str $fileName, int32 $width, int32 $height, int32 $format, int32 $headerSize) returns Image is export is native(LIBRAYLIB) is symbol('LoadImageRaw_pointerized'){ * }
our sub load-image-svg (Str $fileNameOrString, int32 $width, int32 $height) returns Image is export is native(LIBRAYLIB) is symbol('LoadImageSvg_pointerized'){ * }
our sub load-image-anim (Str $fileName, int32 $frames is rw, ) returns Image is export is native(LIBRAYLIB) is symbol('LoadImageAnim_pointerized'){ * }
our sub load-image-from-memory (Str $fileType, uint8 $fileData is rw, int32 $dataSize) returns Image is export is native(LIBRAYLIB) is symbol('LoadImageFromMemory_pointerized'){ * }
our sub load-image-from-texture (Texture2D $texture) returns Image is export is native(LIBRAYLIB) is symbol('LoadImageFromTexture_pointerized'){ * }
our sub term:<load-image-from-screen> () returns Image is export is native(LIBRAYLIB) is symbol('LoadImageFromScreen_pointerized'){ * }
our sub is-image-ready (Image $image) returns bool is export is native(LIBRAYLIB) is symbol('IsImageReady_pointerized'){ * }
our sub unload-image (Image $image) is export is native(LIBRAYLIB) is symbol('UnloadImage_pointerized'){ * }
our sub export-image (Image $image, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportImage_pointerized'){ * }
our sub export-image-to-memory (Image $image, Str $fileType, int32 $fileSize is rw, ) returns Str is export is native(LIBRAYLIB) is symbol('ExportImageToMemory_pointerized'){ * }
our sub export-image-as-code (Image $image, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportImageAsCode_pointerized'){ * }
our sub gen-image-color (int32 $width, int32 $height, Color $color) returns Image is export is native(LIBRAYLIB) is symbol('GenImageColor_pointerized'){ * }
our sub gen-image-gradient-linear (int32 $width, int32 $height, int32 $direction, Color $start, Color $end) returns Image is export is native(LIBRAYLIB) is symbol('GenImageGradientLinear_pointerized'){ * }
our sub gen-image-gradient-radial (int32 $width, int32 $height, num32 $density, Color $inner, Color $outer) returns Image is export is native(LIBRAYLIB) is symbol('GenImageGradientRadial_pointerized'){ * }
our sub gen-image-gradient-square (int32 $width, int32 $height, num32 $density, Color $inner, Color $outer) returns Image is export is native(LIBRAYLIB) is symbol('GenImageGradientSquare_pointerized'){ * }
our sub gen-image-checked (int32 $width, int32 $height, int32 $checksX, int32 $checksY, Color $col1, Color $col2) returns Image is export is native(LIBRAYLIB) is symbol('GenImageChecked_pointerized'){ * }
our sub gen-image-white-noise (int32 $width, int32 $height, num32 $factor) returns Image is export is native(LIBRAYLIB) is symbol('GenImageWhiteNoise_pointerized'){ * }
our sub gen-image-perlin-noise (int32 $width, int32 $height, int32 $offsetX, int32 $offsetY, num32 $scale) returns Image is export is native(LIBRAYLIB) is symbol('GenImagePerlinNoise_pointerized'){ * }
our sub gen-image-cellular (int32 $width, int32 $height, int32 $tileSize) returns Image is export is native(LIBRAYLIB) is symbol('GenImageCellular_pointerized'){ * }
our sub gen-image-text (int32 $width, int32 $height, Str $text) returns Image is export is native(LIBRAYLIB) is symbol('GenImageText_pointerized'){ * }
our sub image-copy (Image $image) returns Image is export is native(LIBRAYLIB) is symbol('ImageCopy_pointerized'){ * }
our sub image-from-image (Image $image, Rectangle $rec) returns Image is export is native(LIBRAYLIB) is symbol('ImageFromImage_pointerized'){ * }
our sub image-text (Str $text, int32 $fontSize, Color $color) returns Image is export is native(LIBRAYLIB) is symbol('ImageText_pointerized'){ * }
our sub image-text-ex (Font $font, Str $text, num32 $fontSize, num32 $spacing, Color $tint) returns Image is export is native(LIBRAYLIB) is symbol('ImageTextEx_pointerized'){ * }
our sub image-to-pot (Image $image is rw, Color $fill) is export is native(LIBRAYLIB) is symbol('ImageToPOT_pointerized'){ * }
our sub image-crop (Image $image is rw, Rectangle $crop) is export is native(LIBRAYLIB) is symbol('ImageCrop_pointerized'){ * }
our sub image-alpha-clear (Image $image is rw, Color $color, num32 $threshold) is export is native(LIBRAYLIB) is symbol('ImageAlphaClear_pointerized'){ * }
our sub image-alpha-mask (Image $image is rw, Image $alphaMask) is export is native(LIBRAYLIB) is symbol('ImageAlphaMask_pointerized'){ * }
our sub image-resize-canvas (Image $image is rw, int32 $newWidth, int32 $newHeight, int32 $offsetX, int32 $offsetY, Color $fill) is export is native(LIBRAYLIB) is symbol('ImageResizeCanvas_pointerized'){ * }
our sub image-color-tint (Image $image is rw, Color $color) is export is native(LIBRAYLIB) is symbol('ImageColorTint_pointerized'){ * }
our sub image-color-replace (Image $image is rw, Color $color, Color $replace) is export is native(LIBRAYLIB) is symbol('ImageColorReplace_pointerized'){ * }
our sub load-image-colors (Image $image) returns Color is export is native(LIBRAYLIB) is symbol('LoadImageColors_pointerized'){ * }
our sub load-image-palette (Image $image, int32 $maxPaletteSize, int32 $colorCount is rw, ) returns Color is export is native(LIBRAYLIB) is symbol('LoadImagePalette_pointerized'){ * }
our sub get-image-alpha-border (Image $image, num32 $threshold) returns Rectangle is export is native(LIBRAYLIB) is symbol('GetImageAlphaBorder_pointerized'){ * }
our sub get-image-color (Image $image, int32 $x, int32 $y) returns Color is export is native(LIBRAYLIB) is symbol('GetImageColor_pointerized'){ * }
our sub image-clear-background (Image $dst is rw, Color $color) is export is native(LIBRAYLIB) is symbol('ImageClearBackground_pointerized'){ * }
our sub image-draw-pixel (Image $dst is rw, int32 $posX, int32 $posY, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawPixel_pointerized'){ * }
our sub image-draw-pixel-v (Image $dst is rw, Vector2 $position, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawPixelV_pointerized'){ * }
our sub image-draw-line (Image $dst is rw, int32 $startPosX, int32 $startPosY, int32 $endPosX, int32 $endPosY, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawLine_pointerized'){ * }
our sub image-draw-line-v (Image $dst is rw, Vector2 $start, Vector2 $end, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawLineV_pointerized'){ * }
our sub image-draw-circle (Image $dst is rw, int32 $centerX, int32 $centerY, int32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawCircle_pointerized'){ * }
our sub image-draw-circle-v (Image $dst is rw, Vector2 $center, int32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawCircleV_pointerized'){ * }
our sub image-draw-circle-lines (Image $dst is rw, int32 $centerX, int32 $centerY, int32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawCircleLines_pointerized'){ * }
our sub image-draw-circle-lines-v (Image $dst is rw, Vector2 $center, int32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawCircleLinesV_pointerized'){ * }
our sub image-draw-rectangle (Image $dst is rw, int32 $posX, int32 $posY, int32 $width, int32 $height, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawRectangle_pointerized'){ * }
our sub image-draw-rectangle-v (Image $dst is rw, Vector2 $position, Vector2 $size, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawRectangleV_pointerized'){ * }
our sub image-draw-rectangle-rec (Image $dst is rw, Rectangle $rec, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawRectangleRec_pointerized'){ * }
our sub image-draw-rectangle-lines (Image $dst is rw, Rectangle $rec, int32 $thick, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawRectangleLines_pointerized'){ * }
our sub image-draw (Image $dst is rw, Image $src, Rectangle $srcRec, Rectangle $dstRec, Color $tint) is export is native(LIBRAYLIB) is symbol('ImageDraw_pointerized'){ * }
our sub image-draw-text (Image $dst is rw, Str $text, int32 $posX, int32 $posY, int32 $fontSize, Color $color) is export is native(LIBRAYLIB) is symbol('ImageDrawText_pointerized'){ * }
our sub image-draw-text-ex (Image $dst is rw, Font $font, Str $text, Vector2 $position, num32 $fontSize, num32 $spacing, Color $tint) is export is native(LIBRAYLIB) is symbol('ImageDrawTextEx_pointerized'){ * }
our sub load-texture (Str $fileName) returns Texture2D is export is native(LIBRAYLIB) is symbol('LoadTexture_pointerized'){ * }
our sub load-texture-from-image (Image $image) returns Texture2D is export is native(LIBRAYLIB) is symbol('LoadTextureFromImage_pointerized'){ * }
our sub load-texture-cubemap (Image $image, int32 $layout) returns TextureCubemap is export is native(LIBRAYLIB) is symbol('LoadTextureCubemap_pointerized'){ * }
our sub load-render-texture (int32 $width, int32 $height) returns RenderTexture2D is export is native(LIBRAYLIB) is symbol('LoadRenderTexture_pointerized'){ * }
our sub is-texture-ready (Texture2D $texture) returns bool is export is native(LIBRAYLIB) is symbol('IsTextureReady_pointerized'){ * }
our sub unload-texture (Texture2D $texture) is export is native(LIBRAYLIB) is symbol('UnloadTexture_pointerized'){ * }
our sub is-render-texture-ready (RenderTexture2D $target) returns bool is export is native(LIBRAYLIB) is symbol('IsRenderTextureReady_pointerized'){ * }
our sub unload-render-texture (RenderTexture2D $target) is export is native(LIBRAYLIB) is symbol('UnloadRenderTexture_pointerized'){ * }
our sub update-texture (Texture2D $texture, Pointer[void] $pixels, ) is export is native(LIBRAYLIB) is symbol('UpdateTexture_pointerized'){ * }
our sub update-texture-rec (Texture2D $texture, Rectangle $rec, Pointer[void] $pixels, ) is export is native(LIBRAYLIB) is symbol('UpdateTextureRec_pointerized'){ * }
our sub set-texture-filter (Texture2D $texture, int32 $filter) is export is native(LIBRAYLIB) is symbol('SetTextureFilter_pointerized'){ * }
our sub set-texture-wrap (Texture2D $texture, int32 $wrap) is export is native(LIBRAYLIB) is symbol('SetTextureWrap_pointerized'){ * }
our sub draw-texture (Texture2D $texture, int32 $posX, int32 $posY, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTexture_pointerized'){ * }
our sub draw-texture-v (Texture2D $texture, Vector2 $position, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextureV_pointerized'){ * }
our sub draw-texture-ex (Texture2D $texture, Vector2 $position, num32 $rotation, num32 $scale, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextureEx_pointerized'){ * }
our sub draw-texture-rec (Texture2D $texture, Rectangle $source, Vector2 $position, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextureRec_pointerized'){ * }
our sub draw-texture-pro (Texture2D $texture, Rectangle $source, Rectangle $dest, Vector2 $origin, num32 $rotation, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTexturePro_pointerized'){ * }
our sub draw-texture-npatch (Texture2D $texture, NPatchInfo $nPatchInfo, Rectangle $dest, Vector2 $origin, num32 $rotation, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextureNPatch_pointerized'){ * }
our sub fade (Color $color, num32 $alpha) returns Color is export is native(LIBRAYLIB) is symbol('Fade_pointerized'){ * }
our sub color-to-int (Color $color) returns int32 is export is native(LIBRAYLIB) is symbol('ColorToInt_pointerized'){ * }
our sub color-normalize (Color $color) returns Vector4 is export is native(LIBRAYLIB) is symbol('ColorNormalize_pointerized'){ * }
our sub color-from-normalized (Vector4 $normalized) returns Color is export is native(LIBRAYLIB) is symbol('ColorFromNormalized_pointerized'){ * }
our sub color-to-hsv (Color $color) returns Vector3 is export is native(LIBRAYLIB) is symbol('ColorToHSV_pointerized'){ * }
our sub color-from-hsv (num32 $hue, num32 $saturation, num32 $value) returns Color is export is native(LIBRAYLIB) is symbol('ColorFromHSV_pointerized'){ * }
our sub color-tint (Color $color, Color $tint) returns Color is export is native(LIBRAYLIB) is symbol('ColorTint_pointerized'){ * }
our sub color-brightness (Color $color, num32 $factor) returns Color is export is native(LIBRAYLIB) is symbol('ColorBrightness_pointerized'){ * }
our sub color-contrast (Color $color, num32 $contrast) returns Color is export is native(LIBRAYLIB) is symbol('ColorContrast_pointerized'){ * }
our sub color-alpha (Color $color, num32 $alpha) returns Color is export is native(LIBRAYLIB) is symbol('ColorAlpha_pointerized'){ * }
our sub color-alpha-blend (Color $dst, Color $src, Color $tint) returns Color is export is native(LIBRAYLIB) is symbol('ColorAlphaBlend_pointerized'){ * }
our sub get-color (uint32 $hexValue) returns Color is export is native(LIBRAYLIB) is symbol('GetColor_pointerized'){ * }
our sub get-pixel-color (Pointer[void] $srcPtr, int32 $format) returns Color is export is native(LIBRAYLIB) is symbol('GetPixelColor_pointerized'){ * }
our sub set-pixel-color (Pointer[void] $dstPtr, Color $color, int32 $format) is export is native(LIBRAYLIB) is symbol('SetPixelColor_pointerized'){ * }
our sub term:<get-font-default> () returns Font is export is native(LIBRAYLIB) is symbol('GetFontDefault_pointerized'){ * }
our sub load-font (Str $fileName) returns Font is export is native(LIBRAYLIB) is symbol('LoadFont_pointerized'){ * }
our sub load-font-ex (Str $fileName, int32 $fontSize, int32 $codepoints is rw, int32 $codepointCount) returns Font is export is native(LIBRAYLIB) is symbol('LoadFontEx_pointerized'){ * }
our sub load-font-from-image (Image $image, Color $key, int32 $firstChar) returns Font is export is native(LIBRAYLIB) is symbol('LoadFontFromImage_pointerized'){ * }
our sub load-font-from-memory (Str $fileType, uint8 $fileData is rw, int32 $dataSize, int32 $fontSize, int32 $codepoints is rw, int32 $codepointCount) returns Font is export is native(LIBRAYLIB) is symbol('LoadFontFromMemory_pointerized'){ * }
our sub is-font-ready (Font $font) returns bool is export is native(LIBRAYLIB) is symbol('IsFontReady_pointerized'){ * }
our sub gen-image-font-atlas (GlyphInfo $glyphs is rw, Rectangle $glyphRecs is rw, int32 $glyphCount, int32 $fontSize, int32 $padding, int32 $packMethod) returns Image is export is native(LIBRAYLIB) is symbol('GenImageFontAtlas_pointerized'){ * }
our sub unload-font (Font $font) is export is native(LIBRAYLIB) is symbol('UnloadFont_pointerized'){ * }
our sub export-font-as-code (Font $font, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportFontAsCode_pointerized'){ * }
our sub draw-text (Str $text, int32 $posX, int32 $posY, int32 $fontSize, Color $color) is export is native(LIBRAYLIB) is symbol('DrawText_pointerized'){ * }
our sub draw-text-ex (Font $font, Str $text, Vector2 $position, num32 $fontSize, num32 $spacing, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextEx_pointerized'){ * }
our sub draw-text-pro (Font $font, Str $text, Vector2 $position, Vector2 $origin, num32 $rotation, num32 $fontSize, num32 $spacing, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextPro_pointerized'){ * }
our sub draw-text-codepoint (Font $font, int32 $codepoint, Vector2 $position, num32 $fontSize, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextCodepoint_pointerized'){ * }
our sub draw-text-codepoints (Font $font, int32 $codepoints is rw, int32 $codepointCount, Vector2 $position, num32 $fontSize, num32 $spacing, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawTextCodepoints_pointerized'){ * }
our sub measure-text-ex (Font $font, Str $text, num32 $fontSize, num32 $spacing) returns Vector2 is export is native(LIBRAYLIB) is symbol('MeasureTextEx_pointerized'){ * }
our sub get-glyph-index (Font $font, int32 $codepoint) returns int32 is export is native(LIBRAYLIB) is symbol('GetGlyphIndex_pointerized'){ * }
our sub get-glyph-info (Font $font, int32 $codepoint) returns GlyphInfo is export is native(LIBRAYLIB) is symbol('GetGlyphInfo_pointerized'){ * }
our sub get-glyph-atlas-rec (Font $font, int32 $codepoint) returns Rectangle is export is native(LIBRAYLIB) is symbol('GetGlyphAtlasRec_pointerized'){ * }
our sub draw-line3d (Vector3 $startPos, Vector3 $endPos, Color $color) is export is native(LIBRAYLIB) is symbol('DrawLine3D_pointerized'){ * }
our sub draw-point3d (Vector3 $position, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPoint3D_pointerized'){ * }
our sub draw-circle3d (Vector3 $center, num32 $radius, Vector3 $rotationAxis, num32 $rotationAngle, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCircle3D_pointerized'){ * }
our sub draw-triangle3d (Vector3 $v1, Vector3 $v2, Vector3 $v3, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangle3D_pointerized'){ * }
our sub draw-triangle-strip3d (Vector3 $points is rw, int32 $pointCount, Color $color) is export is native(LIBRAYLIB) is symbol('DrawTriangleStrip3D_pointerized'){ * }
our sub draw-cube (Vector3 $position, num32 $width, num32 $height, num32 $length, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCube_pointerized'){ * }
our sub draw-cube-v (Vector3 $position, Vector3 $size, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCubeV_pointerized'){ * }
our sub draw-cube-wires (Vector3 $position, num32 $width, num32 $height, num32 $length, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCubeWires_pointerized'){ * }
our sub draw-cube-wires-v (Vector3 $position, Vector3 $size, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCubeWiresV_pointerized'){ * }
our sub draw-sphere (Vector3 $centerPos, num32 $radius, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSphere_pointerized'){ * }
our sub draw-sphere-ex (Vector3 $centerPos, num32 $radius, int32 $rings, int32 $slices, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSphereEx_pointerized'){ * }
our sub draw-sphere-wires (Vector3 $centerPos, num32 $radius, int32 $rings, int32 $slices, Color $color) is export is native(LIBRAYLIB) is symbol('DrawSphereWires_pointerized'){ * }
our sub draw-cylinder (Vector3 $position, num32 $radiusTop, num32 $radiusBottom, num32 $height, int32 $slices, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCylinder_pointerized'){ * }
our sub draw-cylinder-ex (Vector3 $startPos, Vector3 $endPos, num32 $startRadius, num32 $endRadius, int32 $sides, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCylinderEx_pointerized'){ * }
our sub draw-cylinder-wires (Vector3 $position, num32 $radiusTop, num32 $radiusBottom, num32 $height, int32 $slices, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCylinderWires_pointerized'){ * }
our sub draw-cylinder-wires-ex (Vector3 $startPos, Vector3 $endPos, num32 $startRadius, num32 $endRadius, int32 $sides, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCylinderWiresEx_pointerized'){ * }
our sub draw-capsule (Vector3 $startPos, Vector3 $endPos, num32 $radius, int32 $slices, int32 $rings, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCapsule_pointerized'){ * }
our sub draw-capsule-wires (Vector3 $startPos, Vector3 $endPos, num32 $radius, int32 $slices, int32 $rings, Color $color) is export is native(LIBRAYLIB) is symbol('DrawCapsuleWires_pointerized'){ * }
our sub draw-plane (Vector3 $centerPos, Vector2 $size, Color $color) is export is native(LIBRAYLIB) is symbol('DrawPlane_pointerized'){ * }
our sub draw-ray (Ray $ray, Color $color) is export is native(LIBRAYLIB) is symbol('DrawRay_pointerized'){ * }
our sub load-model (Str $fileName) returns Model is export is native(LIBRAYLIB) is symbol('LoadModel_pointerized'){ * }
our sub load-model-from-mesh (Mesh $mesh) returns Model is export is native(LIBRAYLIB) is symbol('LoadModelFromMesh_pointerized'){ * }
our sub is-model-ready (Model $model) returns bool is export is native(LIBRAYLIB) is symbol('IsModelReady_pointerized'){ * }
our sub unload-model (Model $model) is export is native(LIBRAYLIB) is symbol('UnloadModel_pointerized'){ * }
our sub get-model-bounding-box (Model $model) returns BoundingBox is export is native(LIBRAYLIB) is symbol('GetModelBoundingBox_pointerized'){ * }
our sub draw-model (Model $model, Vector3 $position, num32 $scale, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawModel_pointerized'){ * }
our sub draw-model-ex (Model $model, Vector3 $position, Vector3 $rotationAxis, num32 $rotationAngle, Vector3 $scale, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawModelEx_pointerized'){ * }
our sub draw-model-wires (Model $model, Vector3 $position, num32 $scale, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawModelWires_pointerized'){ * }
our sub draw-model-wires-ex (Model $model, Vector3 $position, Vector3 $rotationAxis, num32 $rotationAngle, Vector3 $scale, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawModelWiresEx_pointerized'){ * }
our sub draw-bounding-box (BoundingBox $box, Color $color) is export is native(LIBRAYLIB) is symbol('DrawBoundingBox_pointerized'){ * }
our sub draw-billboard (Camera $camera, Texture2D $texture, Vector3 $position, num32 $size, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawBillboard_pointerized'){ * }
our sub draw-billboard-rec (Camera $camera, Texture2D $texture, Rectangle $source, Vector3 $position, Vector2 $size, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawBillboardRec_pointerized'){ * }
our sub draw-billboard-pro (Camera $camera, Texture2D $texture, Rectangle $source, Vector3 $position, Vector3 $up, Vector2 $size, Vector2 $origin, num32 $rotation, Color $tint) is export is native(LIBRAYLIB) is symbol('DrawBillboardPro_pointerized'){ * }
our sub update-mesh-buffer (Mesh $mesh, int32 $index, Pointer[void] $data, int32 $dataSize, int32 $offset) is export is native(LIBRAYLIB) is symbol('UpdateMeshBuffer_pointerized'){ * }
our sub unload-mesh (Mesh $mesh) is export is native(LIBRAYLIB) is symbol('UnloadMesh_pointerized'){ * }
our sub draw-mesh (Mesh $mesh, Material $material, Matrix $transform) is export is native(LIBRAYLIB) is symbol('DrawMesh_pointerized'){ * }
our sub draw-mesh-instanced (Mesh $mesh, Material $material, Matrix $transforms is rw, int32 $instances) is export is native(LIBRAYLIB) is symbol('DrawMeshInstanced_pointerized'){ * }
our sub get-mesh-bounding-box (Mesh $mesh) returns BoundingBox is export is native(LIBRAYLIB) is symbol('GetMeshBoundingBox_pointerized'){ * }
our sub export-mesh (Mesh $mesh, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportMesh_pointerized'){ * }
our sub export-mesh-as-code (Mesh $mesh, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportMeshAsCode_pointerized'){ * }
our sub gen-mesh-poly (int32 $sides, num32 $radius) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshPoly_pointerized'){ * }
our sub gen-mesh-plane (num32 $width, num32 $length, int32 $resX, int32 $resZ) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshPlane_pointerized'){ * }
our sub gen-mesh-cube (num32 $width, num32 $height, num32 $length) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshCube_pointerized'){ * }
our sub gen-mesh-sphere (num32 $radius, int32 $rings, int32 $slices) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshSphere_pointerized'){ * }
our sub gen-mesh-hemi-sphere (num32 $radius, int32 $rings, int32 $slices) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshHemiSphere_pointerized'){ * }
our sub gen-mesh-cylinder (num32 $radius, num32 $height, int32 $slices) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshCylinder_pointerized'){ * }
our sub gen-mesh-cone (num32 $radius, num32 $height, int32 $slices) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshCone_pointerized'){ * }
our sub gen-mesh-torus (num32 $radius, num32 $size, int32 $radSeg, int32 $sides) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshTorus_pointerized'){ * }
our sub gen-mesh-knot (num32 $radius, num32 $size, int32 $radSeg, int32 $sides) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshKnot_pointerized'){ * }
our sub gen-mesh-heightmap (Image $heightmap, Vector3 $size) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshHeightmap_pointerized'){ * }
our sub gen-mesh-cubicmap (Image $cubicmap, Vector3 $cubeSize) returns Mesh is export is native(LIBRAYLIB) is symbol('GenMeshCubicmap_pointerized'){ * }
our sub term:<load-material-default> () returns Material is export is native(LIBRAYLIB) is symbol('LoadMaterialDefault_pointerized'){ * }
our sub is-material-ready (Material $material) returns bool is export is native(LIBRAYLIB) is symbol('IsMaterialReady_pointerized'){ * }
our sub unload-material (Material $material) is export is native(LIBRAYLIB) is symbol('UnloadMaterial_pointerized'){ * }
our sub set-material-texture (Material $material is rw, int32 $mapType, Texture2D $texture) is export is native(LIBRAYLIB) is symbol('SetMaterialTexture_pointerized'){ * }
our sub update-model-animation (Model $model, ModelAnimation $anim, int32 $frame) is export is native(LIBRAYLIB) is symbol('UpdateModelAnimation_pointerized'){ * }
our sub unload-model-animation (ModelAnimation $anim) is export is native(LIBRAYLIB) is symbol('UnloadModelAnimation_pointerized'){ * }
our sub is-model-animation-valid (Model $model, ModelAnimation $anim) returns bool is export is native(LIBRAYLIB) is symbol('IsModelAnimationValid_pointerized'){ * }
our sub check-collision-spheres (Vector3 $center1, num32 $radius1, Vector3 $center2, num32 $radius2) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionSpheres_pointerized'){ * }
our sub check-collision-boxes (BoundingBox $box1, BoundingBox $box2) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionBoxes_pointerized'){ * }
our sub check-collision-box-sphere (BoundingBox $box, Vector3 $center, num32 $radius) returns bool is export is native(LIBRAYLIB) is symbol('CheckCollisionBoxSphere_pointerized'){ * }
our sub get-ray-collision-sphere (Ray $ray, Vector3 $center, num32 $radius) returns RayCollision is export is native(LIBRAYLIB) is symbol('GetRayCollisionSphere_pointerized'){ * }
our sub get-ray-collision-box (Ray $ray, BoundingBox $box) returns RayCollision is export is native(LIBRAYLIB) is symbol('GetRayCollisionBox_pointerized'){ * }
our sub get-ray-collision-mesh (Ray $ray, Mesh $mesh, Matrix $transform) returns RayCollision is export is native(LIBRAYLIB) is symbol('GetRayCollisionMesh_pointerized'){ * }
our sub get-ray-collision-triangle (Ray $ray, Vector3 $p1, Vector3 $p2, Vector3 $p3) returns RayCollision is export is native(LIBRAYLIB) is symbol('GetRayCollisionTriangle_pointerized'){ * }
our sub get-ray-collision-quad (Ray $ray, Vector3 $p1, Vector3 $p2, Vector3 $p3, Vector3 $p4) returns RayCollision is export is native(LIBRAYLIB) is symbol('GetRayCollisionQuad_pointerized'){ * }
our sub load-wave (Str $fileName) returns Wave is export is native(LIBRAYLIB) is symbol('LoadWave_pointerized'){ * }
our sub load-wave-from-memory (Str $fileType, uint8 $fileData is rw, int32 $dataSize) returns Wave is export is native(LIBRAYLIB) is symbol('LoadWaveFromMemory_pointerized'){ * }
our sub is-wave-ready (Wave $wave) returns bool is export is native(LIBRAYLIB) is symbol('IsWaveReady_pointerized'){ * }
our sub load-sound (Str $fileName) returns Sound is export is native(LIBRAYLIB) is symbol('LoadSound_pointerized'){ * }
our sub load-sound-from-wave (Wave $wave) returns Sound is export is native(LIBRAYLIB) is symbol('LoadSoundFromWave_pointerized'){ * }
our sub load-sound-alias (Sound $source) returns Sound is export is native(LIBRAYLIB) is symbol('LoadSoundAlias_pointerized'){ * }
our sub is-sound-ready (Sound $sound) returns bool is export is native(LIBRAYLIB) is symbol('IsSoundReady_pointerized'){ * }
our sub update-sound (Sound $sound, Pointer[void] $data, int32 $sampleCount) is export is native(LIBRAYLIB) is symbol('UpdateSound_pointerized'){ * }
our sub unload-wave (Wave $wave) is export is native(LIBRAYLIB) is symbol('UnloadWave_pointerized'){ * }
our sub unload-sound (Sound $sound) is export is native(LIBRAYLIB) is symbol('UnloadSound_pointerized'){ * }
our sub unload-sound-alias (Sound $alias) is export is native(LIBRAYLIB) is symbol('UnloadSoundAlias_pointerized'){ * }
our sub export-wave (Wave $wave, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportWave_pointerized'){ * }
our sub export-wave-as-code (Wave $wave, Str $fileName) returns bool is export is native(LIBRAYLIB) is symbol('ExportWaveAsCode_pointerized'){ * }
our sub play-sound (Sound $sound) is export is native(LIBRAYLIB) is symbol('PlaySound_pointerized'){ * }
our sub stop-sound (Sound $sound) is export is native(LIBRAYLIB) is symbol('StopSound_pointerized'){ * }
our sub pause-sound (Sound $sound) is export is native(LIBRAYLIB) is symbol('PauseSound_pointerized'){ * }
our sub resume-sound (Sound $sound) is export is native(LIBRAYLIB) is symbol('ResumeSound_pointerized'){ * }
our sub is-sound-playing (Sound $sound) returns bool is export is native(LIBRAYLIB) is symbol('IsSoundPlaying_pointerized'){ * }
our sub set-sound-volume (Sound $sound, num32 $volume) is export is native(LIBRAYLIB) is symbol('SetSoundVolume_pointerized'){ * }
our sub set-sound-pitch (Sound $sound, num32 $pitch) is export is native(LIBRAYLIB) is symbol('SetSoundPitch_pointerized'){ * }
our sub set-sound-pan (Sound $sound, num32 $pan) is export is native(LIBRAYLIB) is symbol('SetSoundPan_pointerized'){ * }
our sub wave-copy (Wave $wave) returns Wave is export is native(LIBRAYLIB) is symbol('WaveCopy_pointerized'){ * }
our sub load-wave-samples (Wave $wave) returns num32 is export is native(LIBRAYLIB) is symbol('LoadWaveSamples_pointerized'){ * }
our sub load-music-stream (Str $fileName) returns Music is export is native(LIBRAYLIB) is symbol('LoadMusicStream_pointerized'){ * }
our sub load-music-stream-from-memory (Str $fileType, uint8 $data is rw, int32 $dataSize) returns Music is export is native(LIBRAYLIB) is symbol('LoadMusicStreamFromMemory_pointerized'){ * }
our sub is-music-ready (Music $music) returns bool is export is native(LIBRAYLIB) is symbol('IsMusicReady_pointerized'){ * }
our sub unload-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('UnloadMusicStream_pointerized'){ * }
our sub play-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('PlayMusicStream_pointerized'){ * }
our sub is-music-stream-playing (Music $music) returns bool is export is native(LIBRAYLIB) is symbol('IsMusicStreamPlaying_pointerized'){ * }
our sub update-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('UpdateMusicStream_pointerized'){ * }
our sub stop-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('StopMusicStream_pointerized'){ * }
our sub pause-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('PauseMusicStream_pointerized'){ * }
our sub resume-music-stream (Music $music) is export is native(LIBRAYLIB) is symbol('ResumeMusicStream_pointerized'){ * }
our sub seek-music-stream (Music $music, num32 $position) is export is native(LIBRAYLIB) is symbol('SeekMusicStream_pointerized'){ * }
our sub set-music-volume (Music $music, num32 $volume) is export is native(LIBRAYLIB) is symbol('SetMusicVolume_pointerized'){ * }
our sub set-music-pitch (Music $music, num32 $pitch) is export is native(LIBRAYLIB) is symbol('SetMusicPitch_pointerized'){ * }
our sub set-music-pan (Music $music, num32 $pan) is export is native(LIBRAYLIB) is symbol('SetMusicPan_pointerized'){ * }
our sub get-music-time-length (Music $music) returns num32 is export is native(LIBRAYLIB) is symbol('GetMusicTimeLength_pointerized'){ * }
our sub get-music-time-played (Music $music) returns num32 is export is native(LIBRAYLIB) is symbol('GetMusicTimePlayed_pointerized'){ * }
our sub load-audio-stream (uint32 $sampleRate, uint32 $sampleSize, uint32 $channels) returns AudioStream is export is native(LIBRAYLIB) is symbol('LoadAudioStream_pointerized'){ * }
our sub is-audio-stream-ready (AudioStream $stream) returns bool is export is native(LIBRAYLIB) is symbol('IsAudioStreamReady_pointerized'){ * }
our sub unload-audio-stream (AudioStream $stream) is export is native(LIBRAYLIB) is symbol('UnloadAudioStream_pointerized'){ * }
our sub update-audio-stream (AudioStream $stream, Pointer[void] $data, int32 $frameCount) is export is native(LIBRAYLIB) is symbol('UpdateAudioStream_pointerized'){ * }
our sub is-audio-stream-processed (AudioStream $stream) returns bool is export is native(LIBRAYLIB) is symbol('IsAudioStreamProcessed_pointerized'){ * }
our sub play-audio-stream (AudioStream $stream) is export is native(LIBRAYLIB) is symbol('PlayAudioStream_pointerized'){ * }
our sub pause-audio-stream (AudioStream $stream) is export is native(LIBRAYLIB) is symbol('PauseAudioStream_pointerized'){ * }
our sub resume-audio-stream (AudioStream $stream) is export is native(LIBRAYLIB) is symbol('ResumeAudioStream_pointerized'){ * }
our sub is-audio-stream-playing (AudioStream $stream) returns bool is export is native(LIBRAYLIB) is symbol('IsAudioStreamPlaying_pointerized'){ * }
our sub stop-audio-stream (AudioStream $stream) is export is native(LIBRAYLIB) is symbol('StopAudioStream_pointerized'){ * }
our sub set-audio-stream-volume (AudioStream $stream, num32 $volume) is export is native(LIBRAYLIB) is symbol('SetAudioStreamVolume_pointerized'){ * }
our sub set-audio-stream-pitch (AudioStream $stream, num32 $pitch) is export is native(LIBRAYLIB) is symbol('SetAudioStreamPitch_pointerized'){ * }
our sub set-audio-stream-pan (AudioStream $stream, num32 $pan) is export is native(LIBRAYLIB) is symbol('SetAudioStreamPan_pointerized'){ * }
our sub set-audio-stream-callback (AudioStream $stream, &audio-callback (Pointer[void] $bufferData, uint32 $frames)) is export is native(LIBRAYLIB) is symbol('SetAudioStreamCallback_pointerized'){ * }
our sub attach-audio-stream-processor (AudioStream $stream, &audio-callback (Pointer[void] $bufferData, uint32 $frames)) is export is native(LIBRAYLIB) is symbol('AttachAudioStreamProcessor_pointerized'){ * }
our sub detach-audio-stream-processor (AudioStream $stream, &audio-callback (Pointer[void] $bufferData, uint32 $frames)) is export is native(LIBRAYLIB) is symbol('DetachAudioStreamProcessor_pointerized'){ * }
####### Allocation functions ########
our sub malloc-Vector2(num32 $x,num32 $y) returns Vector2 is native(LIBRAYLIB) is symbol('malloc_Vector2') {*}
our sub free-Vector2(Vector2 $ptr) is native(LIBRAYLIB) is symbol('free_Vector2') {*}
our sub malloc-Vector3(num32 $x,num32 $y,num32 $z) returns Vector3 is native(LIBRAYLIB) is symbol('malloc_Vector3') {*}
our sub free-Vector3(Vector3 $ptr) is native(LIBRAYLIB) is symbol('free_Vector3') {*}
our sub malloc-Vector4(num32 $x,num32 $y,num32 $z,num32 $w) returns Vector4 is native(LIBRAYLIB) is symbol('malloc_Vector4') {*}
our sub free-Vector4(Vector4 $ptr) is native(LIBRAYLIB) is symbol('free_Vector4') {*}
our sub malloc-Matrix(num32 $m0,num32 $m4,num32 $m8,num32 $m12,num32 $m1,num32 $m5,num32 $m9,num32 $m13,num32 $m2,num32 $m6,num32 $m10,num32 $m14,num32 $m3,num32 $m7,num32 $m11,num32 $m15) returns Matrix is native(LIBRAYLIB) is symbol('malloc_Matrix') {*}
our sub free-Matrix(Matrix $ptr) is native(LIBRAYLIB) is symbol('free_Matrix') {*}
our sub malloc-Color(uint8 $r,uint8 $g,uint8 $b,uint8 $a) returns Color is native(LIBRAYLIB) is symbol('malloc_Color') {*}
our sub free-Color(Color $ptr) is native(LIBRAYLIB) is symbol('free_Color') {*}
our sub malloc-Rectangle(num32 $x,num32 $y,num32 $width,num32 $height) returns Rectangle is native(LIBRAYLIB) is symbol('malloc_Rectangle') {*}
our sub free-Rectangle(Rectangle $ptr) is native(LIBRAYLIB) is symbol('free_Rectangle') {*}
our sub malloc-Image(void $data,int32 $width,int32 $height,int32 $mipmaps,int32 $format) returns Image is native(LIBRAYLIB) is symbol('malloc_Image') {*}
our sub free-Image(Image $ptr) is native(LIBRAYLIB) is symbol('free_Image') {*}
our sub malloc-Texture(int32 $id,int32 $width,int32 $height,int32 $mipmaps,int32 $format) returns Texture is native(LIBRAYLIB) is symbol('malloc_Texture') {*}
our sub free-Texture(Texture $ptr) is native(LIBRAYLIB) is symbol('free_Texture') {*}
our sub malloc-RenderTexture(int32 $id,Texture $texture,Texture $depth) returns RenderTexture is native(LIBRAYLIB) is symbol('malloc_RenderTexture') {*}
our sub free-RenderTexture(RenderTexture $ptr) is native(LIBRAYLIB) is symbol('free_RenderTexture') {*}
our sub malloc-NPatchInfo(Rectangle $source,int32 $left,int32 $top,int32 $right,int32 $bottom,int32 $layout) returns NPatchInfo is native(LIBRAYLIB) is symbol('malloc_NPatchInfo') {*}
our sub free-NPatchInfo(NPatchInfo $ptr) is native(LIBRAYLIB) is symbol('free_NPatchInfo') {*}
our sub malloc-GlyphInfo(int32 $value,int32 $offsetX,int32 $offsetY,int32 $advanceX,Image $image) returns GlyphInfo is native(LIBRAYLIB) is symbol('malloc_GlyphInfo') {*}
our sub free-GlyphInfo(GlyphInfo $ptr) is native(LIBRAYLIB) is symbol('free_GlyphInfo') {*}
our sub malloc-Font(int32 $baseSize,int32 $glyphCount,int32 $glyphPadding,Texture2D $texture,Pointer[Rectangle] $recs,Pointer[GlyphInfo] $glyphs) returns Font is native(LIBRAYLIB) is symbol('malloc_Font') {*}
our sub free-Font(Font $ptr) is native(LIBRAYLIB) is symbol('free_Font') {*}
our sub malloc-Camera3D(Vector3 $position,Vector3 $target,Vector3 $up,num32 $fovy,int32 $projection) returns Camera3D is native(LIBRAYLIB) is symbol('malloc_Camera3D') {*}
our sub free-Camera3D(Camera3D $ptr) is native(LIBRAYLIB) is symbol('free_Camera3D') {*}
our sub malloc-Camera2D(Vector2 $offset,Vector2 $target,num32 $rotation,num32 $zoom) returns Camera2D is native(LIBRAYLIB) is symbol('malloc_Camera2D') {*}
our sub free-Camera2D(Camera2D $ptr) is native(LIBRAYLIB) is symbol('free_Camera2D') {*}
our sub malloc-Mesh(int32 $vertexCount,int32 $triangleCount,num32 $vertices,num32 $texcoords,num32 $texcoords2,num32 $normals,num32 $tangents,uint8 $colors,int16 $indices,num32 $animVertices,num32 $animNormals,uint8 $boneIds,num32 $boneWeights,int32 $vaoId,int32 $vboId) returns Mesh is native(LIBRAYLIB) is symbol('malloc_Mesh') {*}
our sub free-Mesh(Mesh $ptr) is native(LIBRAYLIB) is symbol('free_Mesh') {*}
our sub malloc-Shader(int32 $id,int32 $locs) returns Shader is native(LIBRAYLIB) is symbol('malloc_Shader') {*}
our sub free-Shader(Shader $ptr) is native(LIBRAYLIB) is symbol('free_Shader') {*}
our sub malloc-MaterialMap(Texture2D $texture,Color $color,num32 $value) returns MaterialMap is native(LIBRAYLIB) is symbol('malloc_MaterialMap') {*}
our sub free-MaterialMap(MaterialMap $ptr) is native(LIBRAYLIB) is symbol('free_MaterialMap') {*}
our sub malloc-Material(Shader $shader,Pointer[MaterialMap] $maps,CArray[num32] $params) returns Material is native(LIBRAYLIB) is symbol('malloc_Material') {*}
our sub free-Material(Material $ptr) is native(LIBRAYLIB) is symbol('free_Material') {*}
our sub malloc-Transform(Vector3 $translation,Quaternion $rotation,Vector3 $scale) returns Transform is native(LIBRAYLIB) is symbol('malloc_Transform') {*}
our sub free-Transform(Transform $ptr) is native(LIBRAYLIB) is symbol('free_Transform') {*}
our sub malloc-BoneInfo(Str $name,int32 $parent) returns BoneInfo is native(LIBRAYLIB) is symbol('malloc_BoneInfo') {*}
our sub free-BoneInfo(BoneInfo $ptr) is native(LIBRAYLIB) is symbol('free_BoneInfo') {*}
our sub malloc-Model(Matrix $transform,int32 $meshCount,int32 $materialCount,Pointer[Mesh] $meshes,Pointer[Material] $materials,int32 $meshMaterial,int32 $boneCount,Pointer[BoneInfo] $bones,Pointer[Transform] $bindPose) returns Model is native(LIBRAYLIB) is symbol('malloc_Model') {*}
our sub free-Model(Model $ptr) is native(LIBRAYLIB) is symbol('free_Model') {*}
our sub malloc-ModelAnimation(int32 $boneCount,int32 $frameCount,Pointer[BoneInfo] $bones,Pointer $framePoses,Str $name) returns ModelAnimation is native(LIBRAYLIB) is symbol('malloc_ModelAnimation') {*}
our sub free-ModelAnimation(ModelAnimation $ptr) is native(LIBRAYLIB) is symbol('free_ModelAnimation') {*}
our sub malloc-Ray(Vector3 $position,Vector3 $direction) returns Ray is native(LIBRAYLIB) is symbol('malloc_Ray') {*}
our sub free-Ray(Ray $ptr) is native(LIBRAYLIB) is symbol('free_Ray') {*}
our sub malloc-RayCollision(bool $hit,num32 $distance,Vector3 $point,Vector3 $normal) returns RayCollision is native(LIBRAYLIB) is symbol('malloc_RayCollision') {*}
our sub free-RayCollision(RayCollision $ptr) is native(LIBRAYLIB) is symbol('free_RayCollision') {*}
our sub malloc-BoundingBox(Vector3 $min,Vector3 $max) returns BoundingBox is native(LIBRAYLIB) is symbol('malloc_BoundingBox') {*}
our sub free-BoundingBox(BoundingBox $ptr) is native(LIBRAYLIB) is symbol('free_BoundingBox') {*}
our sub malloc-Wave(int32 $frameCount,int32 $sampleRate,int32 $sampleSize,int32 $channels,void $data) returns Wave is native(LIBRAYLIB) is symbol('malloc_Wave') {*}
our sub free-Wave(Wave $ptr) is native(LIBRAYLIB) is symbol('free_Wave') {*}
our sub malloc-Sound(AudioStream $stream,int32 $frameCount) returns Sound is native(LIBRAYLIB) is symbol('malloc_Sound') {*}
our sub free-Sound(Sound $ptr) is native(LIBRAYLIB) is symbol('free_Sound') {*}
our sub malloc-Music(AudioStream $stream,int32 $frameCount,bool $looping,int32 $ctxType,void $ctxData) returns Music is native(LIBRAYLIB) is symbol('malloc_Music') {*}
our sub free-Music(Music $ptr) is native(LIBRAYLIB) is symbol('free_Music') {*}
our sub malloc-VrDeviceInfo(int32 $hResolution,int32 $vResolution,num32 $hScreenSize,num32 $vScreenSize,num32 $eyeToScreenDistance,num32 $lensSeparationDistance,num32 $interpupillaryDistance,CArray[num32] $lensDistortionValues,CArray[num32] $chromaAbCorrection) returns VrDeviceInfo is native(LIBRAYLIB) is symbol('malloc_VrDeviceInfo') {*}
our sub free-VrDeviceInfo(VrDeviceInfo $ptr) is native(LIBRAYLIB) is symbol('free_VrDeviceInfo') {*}
our sub malloc-VrStereoConfig(CArray[Matrix] $projection,CArray[Matrix] $viewOffset,CArray[num32] $leftLensCenter,CArray[num32] $rightLensCenter,CArray[num32] $leftScreenCenter,CArray[num32] $rightScreenCenter,CArray[num32] $scale,CArray[num32] $scaleIn) returns VrStereoConfig is native(LIBRAYLIB) is symbol('malloc_VrStereoConfig') {*}
our sub free-VrStereoConfig(VrStereoConfig $ptr) is native(LIBRAYLIB) is symbol('free_VrStereoConfig') {*}
our sub malloc-FilePathList(int32 $capacity,int32 $count,Str $paths) returns FilePathList is native(LIBRAYLIB) is symbol('malloc_FilePathList') {*}
our sub free-FilePathList(FilePathList $ptr) is native(LIBRAYLIB) is symbol('free_FilePathList') {*}
our sub malloc-AutomationEvent(int32 $frame,int32 $type,CArray[int32] $params) returns AutomationEvent is native(LIBRAYLIB) is symbol('malloc_AutomationEvent') {*}
our sub free-AutomationEvent(AutomationEvent $ptr) is native(LIBRAYLIB) is symbol('free_AutomationEvent') {*}
our sub malloc-AutomationEventList(int32 $capacity,int32 $count,Pointer[AutomationEvent] $events) returns AutomationEventList is native(LIBRAYLIB) is symbol('malloc_AutomationEventList') {*}
our sub free-AutomationEventList(AutomationEventList $ptr) is native(LIBRAYLIB) is symbol('free_AutomationEventList') {*}
