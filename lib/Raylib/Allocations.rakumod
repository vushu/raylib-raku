unit module Raylib::Allocations:ver<0.0.1>:auth<zef:vushu>;
use NativeCall;
use Raylib::Bindings;
constant LIBRAYLIB = './generator/libraylib.so.4.5.0';
our sub malloc-Vector2(num32 $x,num32 $y) returns Vector2 is export is native(LIBRAYLIB) is symbol('malloc_Vector2') {*}
our sub free-Vector2(Vector2 $ptr) is export is native(LIBRAYLIB) is symbol('free_Vector2') {*}
our sub malloc-Vector3(num32 $x,num32 $y,num32 $z) returns Vector3 is export is native(LIBRAYLIB) is symbol('malloc_Vector3') {*}
our sub free-Vector3(Vector3 $ptr) is export is native(LIBRAYLIB) is symbol('free_Vector3') {*}
our sub malloc-Vector4(num32 $x,num32 $y,num32 $z,num32 $w) returns Vector4 is export is native(LIBRAYLIB) is symbol('malloc_Vector4') {*}
our sub free-Vector4(Vector4 $ptr) is export is native(LIBRAYLIB) is symbol('free_Vector4') {*}
our sub malloc-Matrix(num32 $m0,num32 $m4,num32 $m8,num32 $m12,num32 $m1,num32 $m5,num32 $m9,num32 $m13,num32 $m2,num32 $m6,num32 $m10,num32 $m14,num32 $m3,num32 $m7,num32 $m11,num32 $m15) returns Matrix is export is native(LIBRAYLIB) is symbol('malloc_Matrix') {*}
our sub free-Matrix(Matrix $ptr) is export is native(LIBRAYLIB) is symbol('free_Matrix') {*}
our sub malloc-Color(uint8 $r,uint8 $g,uint8 $b,uint8 $a) returns Color is export is native(LIBRAYLIB) is symbol('malloc_Color') {*}
our sub free-Color(Color $ptr) is export is native(LIBRAYLIB) is symbol('free_Color') {*}
our sub malloc-Rectangle(num32 $x,num32 $y,num32 $width,num32 $height) returns Rectangle is export is native(LIBRAYLIB) is symbol('malloc_Rectangle') {*}
our sub free-Rectangle(Rectangle $ptr) is export is native(LIBRAYLIB) is symbol('free_Rectangle') {*}
our sub malloc-Image(void $data,int32 $width,int32 $height,int32 $mipmaps,int32 $format) returns Image is export is native(LIBRAYLIB) is symbol('malloc_Image') {*}
our sub free-Image(Image $ptr) is export is native(LIBRAYLIB) is symbol('free_Image') {*}
our sub malloc-Texture(int32 $id,int32 $width,int32 $height,int32 $mipmaps,int32 $format) returns Texture is export is native(LIBRAYLIB) is symbol('malloc_Texture') {*}
our sub free-Texture(Texture $ptr) is export is native(LIBRAYLIB) is symbol('free_Texture') {*}
our sub malloc-RenderTexture(int32 $id,Texture $texture,Texture $depth) returns RenderTexture is export is native(LIBRAYLIB) is symbol('malloc_RenderTexture') {*}
our sub free-RenderTexture(RenderTexture $ptr) is export is native(LIBRAYLIB) is symbol('free_RenderTexture') {*}
our sub malloc-NPatchInfo(Rectangle $source,int32 $left,int32 $top,int32 $right,int32 $bottom,int32 $layout) returns NPatchInfo is export is native(LIBRAYLIB) is symbol('malloc_NPatchInfo') {*}
our sub free-NPatchInfo(NPatchInfo $ptr) is export is native(LIBRAYLIB) is symbol('free_NPatchInfo') {*}
our sub malloc-GlyphInfo(int32 $value,int32 $offsetX,int32 $offsetY,int32 $advanceX,Image $image) returns GlyphInfo is export is native(LIBRAYLIB) is symbol('malloc_GlyphInfo') {*}
our sub free-GlyphInfo(GlyphInfo $ptr) is export is native(LIBRAYLIB) is symbol('free_GlyphInfo') {*}
our sub malloc-Font(int32 $baseSize,int32 $glyphCount,int32 $glyphPadding,Texture2D $texture,Rectangle $recs,GlyphInfo $glyphs) returns Font is export is native(LIBRAYLIB) is symbol('malloc_Font') {*}
our sub free-Font(Font $ptr) is export is native(LIBRAYLIB) is symbol('free_Font') {*}
our sub malloc-Camera3D(Vector3 $position,Vector3 $target,Vector3 $up,num32 $fovy,int32 $projection) returns Camera3D is export is native(LIBRAYLIB) is symbol('malloc_Camera3D') {*}
our sub free-Camera3D(Camera3D $ptr) is export is native(LIBRAYLIB) is symbol('free_Camera3D') {*}
our sub malloc-Camera2D(Vector2 $offset,Vector2 $target,num32 $rotation,num32 $zoom) returns Camera2D is export is native(LIBRAYLIB) is symbol('malloc_Camera2D') {*}
our sub free-Camera2D(Camera2D $ptr) is export is native(LIBRAYLIB) is symbol('free_Camera2D') {*}
our sub malloc-Mesh(int32 $vertexCount,int32 $triangleCount,num32 $vertices,num32 $texcoords,num32 $texcoords2,num32 $normals,num32 $tangents,uint8 $colors,int16 $indices,num32 $animVertices,num32 $animNormals,uint8 $boneIds,num32 $boneWeights,int32 $vaoId,int32 $vboId) returns Mesh is export is native(LIBRAYLIB) is symbol('malloc_Mesh') {*}
our sub free-Mesh(Mesh $ptr) is export is native(LIBRAYLIB) is symbol('free_Mesh') {*}
our sub malloc-Shader(int32 $id,int32 $locs) returns Shader is export is native(LIBRAYLIB) is symbol('malloc_Shader') {*}
our sub free-Shader(Shader $ptr) is export is native(LIBRAYLIB) is symbol('free_Shader') {*}
our sub malloc-MaterialMap(Texture2D $texture,Color $color,num32 $value) returns MaterialMap is export is native(LIBRAYLIB) is symbol('malloc_MaterialMap') {*}
our sub free-MaterialMap(MaterialMap $ptr) is export is native(LIBRAYLIB) is symbol('free_MaterialMap') {*}
our sub malloc-Material(Shader $shader,MaterialMap $maps,CArray[num32] $params) returns Material is export is native(LIBRAYLIB) is symbol('malloc_Material') {*}
our sub free-Material(Material $ptr) is export is native(LIBRAYLIB) is symbol('free_Material') {*}
our sub malloc-Transform(Vector3 $translation,Quaternion $rotation,Vector3 $scale) returns Transform is export is native(LIBRAYLIB) is symbol('malloc_Transform') {*}
our sub free-Transform(Transform $ptr) is export is native(LIBRAYLIB) is symbol('free_Transform') {*}
our sub malloc-BoneInfo(CArray[Str] $name,int32 $parent) returns BoneInfo is export is native(LIBRAYLIB) is symbol('malloc_BoneInfo') {*}
our sub free-BoneInfo(BoneInfo $ptr) is export is native(LIBRAYLIB) is symbol('free_BoneInfo') {*}
our sub malloc-Model(Matrix $transform,int32 $meshCount,int32 $materialCount,Mesh $meshes,Material $materials,int32 $meshMaterial,int32 $boneCount,BoneInfo $bones,Transform $bindPose) returns Model is export is native(LIBRAYLIB) is symbol('malloc_Model') {*}
our sub free-Model(Model $ptr) is export is native(LIBRAYLIB) is symbol('free_Model') {*}
our sub malloc-ModelAnimation(int32 $boneCount,int32 $frameCount,BoneInfo $bones,Transform $framePoses,CArray[Str] $name) returns ModelAnimation is export is native(LIBRAYLIB) is symbol('malloc_ModelAnimation') {*}
our sub free-ModelAnimation(ModelAnimation $ptr) is export is native(LIBRAYLIB) is symbol('free_ModelAnimation') {*}
our sub malloc-Ray(Vector3 $position,Vector3 $direction) returns Ray is export is native(LIBRAYLIB) is symbol('malloc_Ray') {*}
our sub free-Ray(Ray $ptr) is export is native(LIBRAYLIB) is symbol('free_Ray') {*}
our sub malloc-RayCollision(bool $hit,num32 $distance,Vector3 $point,Vector3 $normal) returns RayCollision is export is native(LIBRAYLIB) is symbol('malloc_RayCollision') {*}
our sub free-RayCollision(RayCollision $ptr) is export is native(LIBRAYLIB) is symbol('free_RayCollision') {*}
our sub malloc-BoundingBox(Vector3 $min,Vector3 $max) returns BoundingBox is export is native(LIBRAYLIB) is symbol('malloc_BoundingBox') {*}
our sub free-BoundingBox(BoundingBox $ptr) is export is native(LIBRAYLIB) is symbol('free_BoundingBox') {*}
our sub malloc-Wave(int32 $frameCount,int32 $sampleRate,int32 $sampleSize,int32 $channels,void $data) returns Wave is export is native(LIBRAYLIB) is symbol('malloc_Wave') {*}
our sub free-Wave(Wave $ptr) is export is native(LIBRAYLIB) is symbol('free_Wave') {*}
our sub malloc-AudioStream(rAudioBuffer $buffer,rAudioProcessor $processor,int32 $sampleRate,int32 $sampleSize,int32 $channels) returns AudioStream is export is native(LIBRAYLIB) is symbol('malloc_AudioStream') {*}
our sub free-AudioStream(AudioStream $ptr) is export is native(LIBRAYLIB) is symbol('free_AudioStream') {*}
our sub malloc-Sound(AudioStream $stream,int32 $frameCount) returns Sound is export is native(LIBRAYLIB) is symbol('malloc_Sound') {*}
our sub free-Sound(Sound $ptr) is export is native(LIBRAYLIB) is symbol('free_Sound') {*}
our sub malloc-Music(AudioStream $stream,int32 $frameCount,bool $looping,int32 $ctxType,void $ctxData) returns Music is export is native(LIBRAYLIB) is symbol('malloc_Music') {*}
our sub free-Music(Music $ptr) is export is native(LIBRAYLIB) is symbol('free_Music') {*}
our sub malloc-VrDeviceInfo(int32 $hResolution,int32 $vResolution,num32 $hScreenSize,num32 $vScreenSize,num32 $vScreenCenter,num32 $eyeToScreenDistance,num32 $lensSeparationDistance,num32 $interpupillaryDistance,CArray[num32] $lensDistortionValues,CArray[num32] $chromaAbCorrection) returns VrDeviceInfo is export is native(LIBRAYLIB) is symbol('malloc_VrDeviceInfo') {*}
our sub free-VrDeviceInfo(VrDeviceInfo $ptr) is export is native(LIBRAYLIB) is symbol('free_VrDeviceInfo') {*}
our sub malloc-VrStereoConfig(CArray[Matrix] $projection,CArray[Matrix] $viewOffset,CArray[num32] $leftLensCenter,CArray[num32] $rightLensCenter,CArray[num32] $leftScreenCenter,CArray[num32] $rightScreenCenter,CArray[num32] $scale,CArray[num32] $scaleIn) returns VrStereoConfig is export is native(LIBRAYLIB) is symbol('malloc_VrStereoConfig') {*}
our sub free-VrStereoConfig(VrStereoConfig $ptr) is export is native(LIBRAYLIB) is symbol('free_VrStereoConfig') {*}
our sub malloc-FilePathList(int32 $capacity,int32 $count,Str $paths) returns FilePathList is export is native(LIBRAYLIB) is symbol('malloc_FilePathList') {*}
our sub free-FilePathList(FilePathList $ptr) is export is native(LIBRAYLIB) is symbol('free_FilePathList') {*}
