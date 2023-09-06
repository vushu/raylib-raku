#include <raylib.h>
#include <stdlib.h>
Vector2* malloc_Vector2(float  x, float  y) {
   Vector2* ptr = malloc(sizeof(Vector2));
   ptr->x = x;
   ptr->y = y;
   return ptr;
}
void free_Vector2(Vector2* ptr){
   free(ptr);
}
Vector3* malloc_Vector3(float  x, float  y, float  z) {
   Vector3* ptr = malloc(sizeof(Vector3));
   ptr->x = x;
   ptr->y = y;
   ptr->z = z;
   return ptr;
}
void free_Vector3(Vector3* ptr){
   free(ptr);
}
Vector4* malloc_Vector4(float  x, float  y, float  z, float  w) {
   Vector4* ptr = malloc(sizeof(Vector4));
   ptr->x = x;
   ptr->y = y;
   ptr->z = z;
   ptr->w = w;
   return ptr;
}
void free_Vector4(Vector4* ptr){
   free(ptr);
}
Matrix* malloc_Matrix(float  m0, float  m4, float  m8, float  m12, float  m1, float  m5, float  m9, float  m13, float  m2, float  m6, float  m10, float  m14, float  m3, float  m7, float  m11, float  m15) {
   Matrix* ptr = malloc(sizeof(Matrix));
   ptr->m0 = m0;
   ptr->m4 = m4;
   ptr->m8 = m8;
   ptr->m12 = m12;
   ptr->m1 = m1;
   ptr->m5 = m5;
   ptr->m9 = m9;
   ptr->m13 = m13;
   ptr->m2 = m2;
   ptr->m6 = m6;
   ptr->m10 = m10;
   ptr->m14 = m14;
   ptr->m3 = m3;
   ptr->m7 = m7;
   ptr->m11 = m11;
   ptr->m15 = m15;
   return ptr;
}
void free_Matrix(Matrix* ptr){
   free(ptr);
}
Color* malloc_Color(unsigned char  r,unsigned char  g,unsigned char  b,unsigned char  a) {
   Color* ptr = malloc(sizeof(Color));
   ptr->r = r;
   ptr->g = g;
   ptr->b = b;
   ptr->a = a;
   return ptr;
}
void free_Color(Color* ptr){
   free(ptr);
}
Rectangle* malloc_Rectangle(float  x, float  y, float  width, float  height) {
   Rectangle* ptr = malloc(sizeof(Rectangle));
   ptr->x = x;
   ptr->y = y;
   ptr->width = width;
   ptr->height = height;
   return ptr;
}
void free_Rectangle(Rectangle* ptr){
   free(ptr);
}
Image* malloc_Image(void * data, int  width, int  height, int  mipmaps, int  format) {
   Image* ptr = malloc(sizeof(Image));
   ptr->data = data;
   ptr->width = width;
   ptr->height = height;
   ptr->mipmaps = mipmaps;
   ptr->format = format;
   return ptr;
}
void free_Image(Image* ptr){
   free(ptr);
}
Texture* malloc_Texture(unsigned int  id, int  width, int  height, int  mipmaps, int  format) {
   Texture* ptr = malloc(sizeof(Texture));
   ptr->id = id;
   ptr->width = width;
   ptr->height = height;
   ptr->mipmaps = mipmaps;
   ptr->format = format;
   return ptr;
}
void free_Texture(Texture* ptr){
   free(ptr);
}
RenderTexture* malloc_RenderTexture(unsigned int  id, Texture * texture, Texture * depth) {
   RenderTexture* ptr = malloc(sizeof(RenderTexture));
   ptr->id = id;
   ptr->texture = *texture;
   ptr->depth = *depth;
   return ptr;
}
void free_RenderTexture(RenderTexture* ptr){
   free(ptr);
}
NPatchInfo* malloc_NPatchInfo(Rectangle * source, int  left, int  top, int  right, int  bottom, int  layout) {
   NPatchInfo* ptr = malloc(sizeof(NPatchInfo));
   ptr->source = *source;
   ptr->left = left;
   ptr->top = top;
   ptr->right = right;
   ptr->bottom = bottom;
   ptr->layout = layout;
   return ptr;
}
void free_NPatchInfo(NPatchInfo* ptr){
   free(ptr);
}
GlyphInfo* malloc_GlyphInfo(int  value, int  offsetX, int  offsetY, int  advanceX, Image * image) {
   GlyphInfo* ptr = malloc(sizeof(GlyphInfo));
   ptr->value = value;
   ptr->offsetX = offsetX;
   ptr->offsetY = offsetY;
   ptr->advanceX = advanceX;
   ptr->image = *image;
   return ptr;
}
void free_GlyphInfo(GlyphInfo* ptr){
   free(ptr);
}
Font* malloc_Font(int  baseSize, int  glyphCount, int  glyphPadding, Texture2D * texture, Rectangle * recs, GlyphInfo * glyphs) {
   Font* ptr = malloc(sizeof(Font));
   ptr->baseSize = baseSize;
   ptr->glyphCount = glyphCount;
   ptr->glyphPadding = glyphPadding;
   ptr->texture = *texture;
   ptr->recs = recs;
   ptr->glyphs = glyphs;
   return ptr;
}
void free_Font(Font* ptr){
   free(ptr);
}
Camera3D* malloc_Camera3D(Vector3 * position, Vector3 * target, Vector3 * up, float  fovy, int  projection) {
   Camera3D* ptr = malloc(sizeof(Camera3D));
   ptr->position = *position;
   ptr->target = *target;
   ptr->up = *up;
   ptr->fovy = fovy;
   ptr->projection = projection;
   return ptr;
}
void free_Camera3D(Camera3D* ptr){
   free(ptr);
}
Camera2D* malloc_Camera2D(Vector2 * offset, Vector2 * target, float  rotation, float  zoom) {
   Camera2D* ptr = malloc(sizeof(Camera2D));
   ptr->offset = *offset;
   ptr->target = *target;
   ptr->rotation = rotation;
   ptr->zoom = zoom;
   return ptr;
}
void free_Camera2D(Camera2D* ptr){
   free(ptr);
}
Mesh* malloc_Mesh(int  vertexCount, int  triangleCount, float * vertices, float * texcoords, float * texcoords2, float * normals, float * tangents,unsigned char * colors,unsigned short * indices, float * animVertices, float * animNormals,unsigned char * boneIds, float * boneWeights,unsigned int  vaoId,unsigned int * vboId) {
   Mesh* ptr = malloc(sizeof(Mesh));
   ptr->vertexCount = vertexCount;
   ptr->triangleCount = triangleCount;
   ptr->vertices = vertices;
   ptr->texcoords = texcoords;
   ptr->texcoords2 = texcoords2;
   ptr->normals = normals;
   ptr->tangents = tangents;
   ptr->colors = colors;
   ptr->indices = indices;
   ptr->animVertices = animVertices;
   ptr->animNormals = animNormals;
   ptr->boneIds = boneIds;
   ptr->boneWeights = boneWeights;
   ptr->vaoId = vaoId;
   ptr->vboId = vboId;
   return ptr;
}
void free_Mesh(Mesh* ptr){
   free(ptr);
}
Shader* malloc_Shader(unsigned int  id, int * locs) {
   Shader* ptr = malloc(sizeof(Shader));
   ptr->id = id;
   ptr->locs = locs;
   return ptr;
}
void free_Shader(Shader* ptr){
   free(ptr);
}
MaterialMap* malloc_MaterialMap(Texture2D * texture, Color * color, float  value) {
   MaterialMap* ptr = malloc(sizeof(MaterialMap));
   ptr->texture = *texture;
   ptr->color = *color;
   ptr->value = value;
   return ptr;
}
void free_MaterialMap(MaterialMap* ptr){
   free(ptr);
}
Material* malloc_Material(Shader * shader, MaterialMap * maps, float  params[4]) {
   Material* ptr = malloc(sizeof(Material));
   ptr->shader = *shader;
   ptr->maps = maps;
   ptr->params[4] = params[4];
   return ptr;
}
void free_Material(Material* ptr){
   free(ptr);
}
Transform* malloc_Transform(Vector3 * translation, Quaternion * rotation, Vector3 * scale) {
   Transform* ptr = malloc(sizeof(Transform));
   ptr->translation = *translation;
   ptr->rotation = *rotation;
   ptr->scale = *scale;
   return ptr;
}
void free_Transform(Transform* ptr){
   free(ptr);
}
BoneInfo* malloc_BoneInfo(char  name[32], int  parent) {
   BoneInfo* ptr = malloc(sizeof(BoneInfo));
   ptr->name[32] = name[32];
   ptr->parent = parent;
   return ptr;
}
void free_BoneInfo(BoneInfo* ptr){
   free(ptr);
}
Model* malloc_Model(Matrix * transform, int  meshCount, int  materialCount, Mesh * meshes, Material * materials, int * meshMaterial, int  boneCount, BoneInfo * bones, Transform * bindPose) {
   Model* ptr = malloc(sizeof(Model));
   ptr->transform = *transform;
   ptr->meshCount = meshCount;
   ptr->materialCount = materialCount;
   ptr->meshes = meshes;
   ptr->materials = materials;
   ptr->meshMaterial = meshMaterial;
   ptr->boneCount = boneCount;
   ptr->bones = bones;
   ptr->bindPose = bindPose;
   return ptr;
}
void free_Model(Model* ptr){
   free(ptr);
}
ModelAnimation* malloc_ModelAnimation(int  boneCount, int  frameCount, BoneInfo * bones, Transform ** framePoses, char  name[32]) {
   ModelAnimation* ptr = malloc(sizeof(ModelAnimation));
   ptr->boneCount = boneCount;
   ptr->frameCount = frameCount;
   ptr->bones = bones;
   ptr->framePoses = framePoses;
   ptr->name[32] = name[32];
   return ptr;
}
void free_ModelAnimation(ModelAnimation* ptr){
   free(ptr);
}
Ray* malloc_Ray(Vector3 * position, Vector3 * direction) {
   Ray* ptr = malloc(sizeof(Ray));
   ptr->position = *position;
   ptr->direction = *direction;
   return ptr;
}
void free_Ray(Ray* ptr){
   free(ptr);
}
RayCollision* malloc_RayCollision(bool  hit, float  distance, Vector3 * point, Vector3 * normal) {
   RayCollision* ptr = malloc(sizeof(RayCollision));
   ptr->hit = hit;
   ptr->distance = distance;
   ptr->point = *point;
   ptr->normal = *normal;
   return ptr;
}
void free_RayCollision(RayCollision* ptr){
   free(ptr);
}
BoundingBox* malloc_BoundingBox(Vector3 * min, Vector3 * max) {
   BoundingBox* ptr = malloc(sizeof(BoundingBox));
   ptr->min = *min;
   ptr->max = *max;
   return ptr;
}
void free_BoundingBox(BoundingBox* ptr){
   free(ptr);
}
Wave* malloc_Wave(unsigned int  frameCount,unsigned int  sampleRate,unsigned int  sampleSize,unsigned int  channels, void * data) {
   Wave* ptr = malloc(sizeof(Wave));
   ptr->frameCount = frameCount;
   ptr->sampleRate = sampleRate;
   ptr->sampleSize = sampleSize;
   ptr->channels = channels;
   ptr->data = data;
   return ptr;
}
void free_Wave(Wave* ptr){
   free(ptr);
}
AudioStream* malloc_AudioStream(rAudioBuffer * buffer, rAudioProcessor * processor,unsigned int  sampleRate,unsigned int  sampleSize,unsigned int  channels) {
   AudioStream* ptr = malloc(sizeof(AudioStream));
   ptr->buffer = buffer;
   ptr->processor = processor;
   ptr->sampleRate = sampleRate;
   ptr->sampleSize = sampleSize;
   ptr->channels = channels;
   return ptr;
}
void free_AudioStream(AudioStream* ptr){
   free(ptr);
}
Sound* malloc_Sound(AudioStream * stream,unsigned int  frameCount) {
   Sound* ptr = malloc(sizeof(Sound));
   ptr->stream = *stream;
   ptr->frameCount = frameCount;
   return ptr;
}
void free_Sound(Sound* ptr){
   free(ptr);
}
Music* malloc_Music(AudioStream * stream,unsigned int  frameCount, bool  looping, int  ctxType, void * ctxData) {
   Music* ptr = malloc(sizeof(Music));
   ptr->stream = *stream;
   ptr->frameCount = frameCount;
   ptr->looping = looping;
   ptr->ctxType = ctxType;
   ptr->ctxData = ctxData;
   return ptr;
}
void free_Music(Music* ptr){
   free(ptr);
}
VrDeviceInfo* malloc_VrDeviceInfo(int  hResolution, int  vResolution, float  hScreenSize, float  vScreenSize, float  vScreenCenter, float  eyeToScreenDistance, float  lensSeparationDistance, float  interpupillaryDistance, float  lensDistortionValues[4], float  chromaAbCorrection[4]) {
   VrDeviceInfo* ptr = malloc(sizeof(VrDeviceInfo));
   ptr->hResolution = hResolution;
   ptr->vResolution = vResolution;
   ptr->hScreenSize = hScreenSize;
   ptr->vScreenSize = vScreenSize;
   ptr->vScreenCenter = vScreenCenter;
   ptr->eyeToScreenDistance = eyeToScreenDistance;
   ptr->lensSeparationDistance = lensSeparationDistance;
   ptr->interpupillaryDistance = interpupillaryDistance;
   ptr->lensDistortionValues[4] = lensDistortionValues[4];
   ptr->chromaAbCorrection[4] = chromaAbCorrection[4];
   return ptr;
}
void free_VrDeviceInfo(VrDeviceInfo* ptr){
   free(ptr);
}
VrStereoConfig* malloc_VrStereoConfig(Matrix * projection[2], Matrix * viewOffset[2], float  leftLensCenter[2], float  rightLensCenter[2], float  leftScreenCenter[2], float  rightScreenCenter[2], float  scale[2], float  scaleIn[2]) {
   VrStereoConfig* ptr = malloc(sizeof(VrStereoConfig));
   ptr->projection[2] = *projection[2];
   ptr->viewOffset[2] = *viewOffset[2];
   ptr->leftLensCenter[2] = leftLensCenter[2];
   ptr->rightLensCenter[2] = rightLensCenter[2];
   ptr->leftScreenCenter[2] = leftScreenCenter[2];
   ptr->rightScreenCenter[2] = rightScreenCenter[2];
   ptr->scale[2] = scale[2];
   ptr->scaleIn[2] = scaleIn[2];
   return ptr;
}
void free_VrStereoConfig(VrStereoConfig* ptr){
   free(ptr);
}
FilePathList* malloc_FilePathList(unsigned int  capacity,unsigned int  count, char ** paths) {
   FilePathList* ptr = malloc(sizeof(FilePathList));
   ptr->capacity = capacity;
   ptr->count = count;
   ptr->paths = paths;
   return ptr;
}
void free_FilePathList(FilePathList* ptr){
   free(ptr);
}
