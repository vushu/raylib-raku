#include <raylib.h>
#include <stdlib.h>
void SetWindowIcon_pointerized(Image* image){ SetWindowIcon(*image); }
void ClearBackground_pointerized(Color* color){ ClearBackground(*color); }
void BeginMode2D_pointerized(Camera2D* camera){ BeginMode2D(*camera); }
void BeginMode3D_pointerized(Camera3D* camera){ BeginMode3D(*camera); }
void BeginTextureMode_pointerized(RenderTexture2D* target){ BeginTextureMode(*target); }
void BeginShaderMode_pointerized(Shader* shader){ BeginShaderMode(*shader); }
void BeginVrStereoMode_pointerized(VrStereoConfig* config){ BeginVrStereoMode(*config); }
VrStereoConfig* LoadVrStereoConfig_pointerized(VrDeviceInfo* device){
    VrStereoConfig* pointer_value = malloc(sizeof(VrStereoConfig));
    VrStereoConfig ret = LoadVrStereoConfig(*device); 
    *pointer_value = ret; 
    return pointer_value;
}
void UnloadVrStereoConfig_pointerized(VrStereoConfig* config){ UnloadVrStereoConfig(*config); }
bool IsShaderReady_pointerized(Shader* shader){ return IsShaderReady(*shader); }
int GetShaderLocation_pointerized(Shader* shader,  char* uniformName){ return GetShaderLocation(*shader, uniformName); }
int GetShaderLocationAttrib_pointerized(Shader* shader,  char* attribName){ return GetShaderLocationAttrib(*shader, attribName); }
void SetShaderValue_pointerized(Shader* shader, int locIndex,  void* value, int uniformType){ SetShaderValue(*shader, locIndex, value, uniformType); }
void SetShaderValueV_pointerized(Shader* shader, int locIndex,  void* value, int uniformType, int count){ SetShaderValueV(*shader, locIndex, value, uniformType, count); }
void SetShaderValueMatrix_pointerized(Shader* shader, int locIndex, Matrix* mat){ SetShaderValueMatrix(*shader, locIndex, *mat); }
void SetShaderValueTexture_pointerized(Shader* shader, int locIndex, Texture2D* texture){ SetShaderValueTexture(*shader, locIndex, *texture); }
void UnloadShader_pointerized(Shader* shader){ UnloadShader(*shader); }
Ray* GetMouseRay_pointerized(Vector2* mousePosition, Camera* camera){
    Ray* pointer_value = malloc(sizeof(Ray));
    Ray ret = GetMouseRay(*mousePosition, *camera); 
    *pointer_value = ret; 
    return pointer_value;
}
Matrix* GetCameraMatrix_pointerized(Camera* camera){
    Matrix* pointer_value = malloc(sizeof(Matrix));
    Matrix ret = GetCameraMatrix(*camera); 
    *pointer_value = ret; 
    return pointer_value;
}
Matrix* GetCameraMatrix2D_pointerized(Camera2D* camera){
    Matrix* pointer_value = malloc(sizeof(Matrix));
    Matrix ret = GetCameraMatrix2D(*camera); 
    *pointer_value = ret; 
    return pointer_value;
}
Vector2* GetWorldToScreen_pointerized(Vector3* position, Camera* camera){
    Vector2* pointer_value = malloc(sizeof(Vector2));
    Vector2 ret = GetWorldToScreen(*position, *camera); 
    *pointer_value = ret; 
    return pointer_value;
}
Vector2* GetScreenToWorld2D_pointerized(Vector2* position, Camera2D* camera){
    Vector2* pointer_value = malloc(sizeof(Vector2));
    Vector2 ret = GetScreenToWorld2D(*position, *camera); 
    *pointer_value = ret; 
    return pointer_value;
}
Vector2* GetWorldToScreenEx_pointerized(Vector3* position, Camera* camera, int width, int height){
    Vector2* pointer_value = malloc(sizeof(Vector2));
    Vector2 ret = GetWorldToScreenEx(*position, *camera, width, height); 
    *pointer_value = ret; 
    return pointer_value;
}
Vector2* GetWorldToScreen2D_pointerized(Vector2* position, Camera2D* camera){
    Vector2* pointer_value = malloc(sizeof(Vector2));
    Vector2 ret = GetWorldToScreen2D(*position, *camera); 
    *pointer_value = ret; 
    return pointer_value;
}
char* LoadFileData_pointerized( char* fileName,  int* bytesRead){ return LoadFileData(fileName, bytesRead); }
void UnloadDirectoryFiles_pointerized(FilePathList* files){ UnloadDirectoryFiles(*files); }
void UnloadDroppedFiles_pointerized(FilePathList* files){ UnloadDroppedFiles(*files); }
void UpdateCameraPro_pointerized( Camera* camera, Vector3* movement, Vector3* rotation, float zoom){ UpdateCameraPro(camera, *movement, *rotation, zoom); }
void SetShapesTexture_pointerized(Texture2D* texture, Rectangle* source){ SetShapesTexture(*texture, *source); }
void DrawPixel_pointerized(int posX, int posY, Color* color){ DrawPixel(posX, posY, *color); }
void DrawPixelV_pointerized(Vector2* position, Color* color){ DrawPixelV(*position, *color); }
void DrawLine_pointerized(int startPosX, int startPosY, int endPosX, int endPosY, Color* color){ DrawLine(startPosX, startPosY, endPosX, endPosY, *color); }
void DrawLineV_pointerized(Vector2* startPos, Vector2* endPos, Color* color){ DrawLineV(*startPos, *endPos, *color); }
void DrawLineEx_pointerized(Vector2* startPos, Vector2* endPos, float thick, Color* color){ DrawLineEx(*startPos, *endPos, thick, *color); }
void DrawLineBezier_pointerized(Vector2* startPos, Vector2* endPos, float thick, Color* color){ DrawLineBezier(*startPos, *endPos, thick, *color); }
void DrawLineBezierQuad_pointerized(Vector2* startPos, Vector2* endPos, Vector2* controlPos, float thick, Color* color){ DrawLineBezierQuad(*startPos, *endPos, *controlPos, thick, *color); }
void DrawLineBezierCubic_pointerized(Vector2* startPos, Vector2* endPos, Vector2* startControlPos, Vector2* endControlPos, float thick, Color* color){ DrawLineBezierCubic(*startPos, *endPos, *startControlPos, *endControlPos, thick, *color); }
void DrawLineBSpline_pointerized( Vector2* points, int pointCount, float thick, Color* color){ DrawLineBSpline(points, pointCount, thick, *color); }
void DrawLineCatmullRom_pointerized( Vector2* points, int pointCount, float thick, Color* color){ DrawLineCatmullRom(points, pointCount, thick, *color); }
void DrawLineStrip_pointerized( Vector2* points, int pointCount, Color* color){ DrawLineStrip(points, pointCount, *color); }
void DrawCircle_pointerized(int centerX, int centerY, float radius, Color* color){ DrawCircle(centerX, centerY, radius, *color); }
void DrawCircleSector_pointerized(Vector2* center, float radius, float startAngle, float endAngle, int segments, Color* color){ DrawCircleSector(*center, radius, startAngle, endAngle, segments, *color); }
void DrawCircleSectorLines_pointerized(Vector2* center, float radius, float startAngle, float endAngle, int segments, Color* color){ DrawCircleSectorLines(*center, radius, startAngle, endAngle, segments, *color); }
void DrawCircleGradient_pointerized(int centerX, int centerY, float radius, Color* color1, Color* color2){ DrawCircleGradient(centerX, centerY, radius, *color1, *color2); }
void DrawCircleV_pointerized(Vector2* center, float radius, Color* color){ DrawCircleV(*center, radius, *color); }
void DrawCircleLines_pointerized(int centerX, int centerY, float radius, Color* color){ DrawCircleLines(centerX, centerY, radius, *color); }
void DrawEllipse_pointerized(int centerX, int centerY, float radiusH, float radiusV, Color* color){ DrawEllipse(centerX, centerY, radiusH, radiusV, *color); }
void DrawEllipseLines_pointerized(int centerX, int centerY, float radiusH, float radiusV, Color* color){ DrawEllipseLines(centerX, centerY, radiusH, radiusV, *color); }
void DrawRing_pointerized(Vector2* center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color* color){ DrawRing(*center, innerRadius, outerRadius, startAngle, endAngle, segments, *color); }
void DrawRingLines_pointerized(Vector2* center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color* color){ DrawRingLines(*center, innerRadius, outerRadius, startAngle, endAngle, segments, *color); }
void DrawRectangle_pointerized(int posX, int posY, int width, int height, Color* color){ DrawRectangle(posX, posY, width, height, *color); }
void DrawRectangleV_pointerized(Vector2* position, Vector2* size, Color* color){ DrawRectangleV(*position, *size, *color); }
void DrawRectangleRec_pointerized(Rectangle* rec, Color* color){ DrawRectangleRec(*rec, *color); }
void DrawRectanglePro_pointerized(Rectangle* rec, Vector2* origin, float rotation, Color* color){ DrawRectanglePro(*rec, *origin, rotation, *color); }
void DrawRectangleGradientV_pointerized(int posX, int posY, int width, int height, Color* color1, Color* color2){ DrawRectangleGradientV(posX, posY, width, height, *color1, *color2); }
void DrawRectangleGradientH_pointerized(int posX, int posY, int width, int height, Color* color1, Color* color2){ DrawRectangleGradientH(posX, posY, width, height, *color1, *color2); }
void DrawRectangleGradientEx_pointerized(Rectangle* rec, Color* col1, Color* col2, Color* col3, Color* col4){ DrawRectangleGradientEx(*rec, *col1, *col2, *col3, *col4); }
void DrawRectangleLines_pointerized(int posX, int posY, int width, int height, Color* color){ DrawRectangleLines(posX, posY, width, height, *color); }
void DrawRectangleLinesEx_pointerized(Rectangle* rec, float lineThick, Color* color){ DrawRectangleLinesEx(*rec, lineThick, *color); }
void DrawRectangleRounded_pointerized(Rectangle* rec, float roundness, int segments, Color* color){ DrawRectangleRounded(*rec, roundness, segments, *color); }
void DrawRectangleRoundedLines_pointerized(Rectangle* rec, float roundness, int segments, float lineThick, Color* color){ DrawRectangleRoundedLines(*rec, roundness, segments, lineThick, *color); }
void DrawTriangle_pointerized(Vector2* v1, Vector2* v2, Vector2* v3, Color* color){ DrawTriangle(*v1, *v2, *v3, *color); }
void DrawTriangleLines_pointerized(Vector2* v1, Vector2* v2, Vector2* v3, Color* color){ DrawTriangleLines(*v1, *v2, *v3, *color); }
void DrawTriangleFan_pointerized( Vector2* points, int pointCount, Color* color){ DrawTriangleFan(points, pointCount, *color); }
void DrawTriangleStrip_pointerized( Vector2* points, int pointCount, Color* color){ DrawTriangleStrip(points, pointCount, *color); }
void DrawPoly_pointerized(Vector2* center, int sides, float radius, float rotation, Color* color){ DrawPoly(*center, sides, radius, rotation, *color); }
void DrawPolyLines_pointerized(Vector2* center, int sides, float radius, float rotation, Color* color){ DrawPolyLines(*center, sides, radius, rotation, *color); }
void DrawPolyLinesEx_pointerized(Vector2* center, int sides, float radius, float rotation, float lineThick, Color* color){ DrawPolyLinesEx(*center, sides, radius, rotation, lineThick, *color); }
bool CheckCollisionRecs_pointerized(Rectangle* rec1, Rectangle* rec2){ return CheckCollisionRecs(*rec1, *rec2); }
bool CheckCollisionCircles_pointerized(Vector2* center1, float radius1, Vector2* center2, float radius2){ return CheckCollisionCircles(*center1, radius1, *center2, radius2); }
bool CheckCollisionCircleRec_pointerized(Vector2* center, float radius, Rectangle* rec){ return CheckCollisionCircleRec(*center, radius, *rec); }
bool CheckCollisionPointRec_pointerized(Vector2* point, Rectangle* rec){ return CheckCollisionPointRec(*point, *rec); }
bool CheckCollisionPointCircle_pointerized(Vector2* point, Vector2* center, float radius){ return CheckCollisionPointCircle(*point, *center, radius); }
bool CheckCollisionPointTriangle_pointerized(Vector2* point, Vector2* p1, Vector2* p2, Vector2* p3){ return CheckCollisionPointTriangle(*point, *p1, *p2, *p3); }
bool CheckCollisionPointPoly_pointerized(Vector2* point,  Vector2* points, int pointCount){ return CheckCollisionPointPoly(*point, points, pointCount); }
bool CheckCollisionLines_pointerized(Vector2* startPos1, Vector2* endPos1, Vector2* startPos2, Vector2* endPos2,  Vector2* collisionPoint){ return CheckCollisionLines(*startPos1, *endPos1, *startPos2, *endPos2, collisionPoint); }
bool CheckCollisionPointLine_pointerized(Vector2* point, Vector2* p1, Vector2* p2, int threshold){ return CheckCollisionPointLine(*point, *p1, *p2, threshold); }
Rectangle* GetCollisionRec_pointerized(Rectangle* rec1, Rectangle* rec2){
    Rectangle* pointer_value = malloc(sizeof(Rectangle));
    Rectangle ret = GetCollisionRec(*rec1, *rec2); 
    *pointer_value = ret; 
    return pointer_value;
}
Image* LoadImageFromTexture_pointerized(Texture2D* texture){
    Image* pointer_value = malloc(sizeof(Image));
    Image ret = LoadImageFromTexture(*texture); 
    *pointer_value = ret; 
    return pointer_value;
}
bool IsImageReady_pointerized(Image* image){ return IsImageReady(*image); }
void UnloadImage_pointerized(Image* image){ UnloadImage(*image); }
bool ExportImage_pointerized(Image* image,  char* fileName){ return ExportImage(*image, fileName); }
char* ExportImageToMemory_pointerized(Image* image,  char* fileType,  int* fileSize){ return ExportImageToMemory(*image, fileType, fileSize); }
bool ExportImageAsCode_pointerized(Image* image,  char* fileName){ return ExportImageAsCode(*image, fileName); }
Image* GenImageColor_pointerized(int width, int height, Color* color){
    Image* pointer_value = malloc(sizeof(Image));
    Image ret = GenImageColor(width, height, *color); 
    *pointer_value = ret; 
    return pointer_value;
}
Image* GenImageGradientLinear_pointerized(int width, int height, int direction, Color* start, Color* end){
    Image* pointer_value = malloc(sizeof(Image));
    Image ret = GenImageGradientLinear(width, height, direction, *start, *end); 
    *pointer_value = ret; 
    return pointer_value;
}
Image* GenImageGradientRadial_pointerized(int width, int height, float density, Color* inner, Color* outer){
    Image* pointer_value = malloc(sizeof(Image));
    Image ret = GenImageGradientRadial(width, height, density, *inner, *outer); 
    *pointer_value = ret; 
    return pointer_value;
}
Image* GenImageGradientSquare_pointerized(int width, int height, float density, Color* inner, Color* outer){
    Image* pointer_value = malloc(sizeof(Image));
    Image ret = GenImageGradientSquare(width, height, density, *inner, *outer); 
    *pointer_value = ret; 
    return pointer_value;
}
Image* GenImageChecked_pointerized(int width, int height, int checksX, int checksY, Color* col1, Color* col2){
    Image* pointer_value = malloc(sizeof(Image));
    Image ret = GenImageChecked(width, height, checksX, checksY, *col1, *col2); 
    *pointer_value = ret; 
    return pointer_value;
}
Image* ImageCopy_pointerized(Image* image){
    Image* pointer_value = malloc(sizeof(Image));
    Image ret = ImageCopy(*image); 
    *pointer_value = ret; 
    return pointer_value;
}
Image* ImageFromImage_pointerized(Image* image, Rectangle* rec){
    Image* pointer_value = malloc(sizeof(Image));
    Image ret = ImageFromImage(*image, *rec); 
    *pointer_value = ret; 
    return pointer_value;
}
Image* ImageText_pointerized( char* text, int fontSize, Color* color){
    Image* pointer_value = malloc(sizeof(Image));
    Image ret = ImageText(text, fontSize, *color); 
    *pointer_value = ret; 
    return pointer_value;
}
Image* ImageTextEx_pointerized(Font* font,  char* text, float fontSize, float spacing, Color* tint){
    Image* pointer_value = malloc(sizeof(Image));
    Image ret = ImageTextEx(*font, text, fontSize, spacing, *tint); 
    *pointer_value = ret; 
    return pointer_value;
}
void ImageToPOT_pointerized( Image* image, Color* fill){ ImageToPOT(image, *fill); }
void ImageCrop_pointerized( Image* image, Rectangle* crop){ ImageCrop(image, *crop); }
void ImageAlphaClear_pointerized( Image* image, Color* color, float threshold){ ImageAlphaClear(image, *color, threshold); }
void ImageAlphaMask_pointerized( Image* image, Image* alphaMask){ ImageAlphaMask(image, *alphaMask); }
void ImageResizeCanvas_pointerized( Image* image, int newWidth, int newHeight, int offsetX, int offsetY, Color* fill){ ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, *fill); }
void ImageColorTint_pointerized( Image* image, Color* color){ ImageColorTint(image, *color); }
void ImageColorReplace_pointerized( Image* image, Color* color, Color* replace){ ImageColorReplace(image, *color, *replace); }
Color* LoadImageColors_pointerized(Image* image){ return LoadImageColors(*image); }
Color* LoadImagePalette_pointerized(Image* image, int maxPaletteSize,  int* colorCount){ return LoadImagePalette(*image, maxPaletteSize, colorCount); }
Rectangle* GetImageAlphaBorder_pointerized(Image* image, float threshold){
    Rectangle* pointer_value = malloc(sizeof(Rectangle));
    Rectangle ret = GetImageAlphaBorder(*image, threshold); 
    *pointer_value = ret; 
    return pointer_value;
}
Color* GetImageColor_pointerized(Image* image, int x, int y){
    Color* pointer_value = malloc(sizeof(Color));
    Color ret = GetImageColor(*image, x, y); 
    *pointer_value = ret; 
    return pointer_value;
}
void ImageClearBackground_pointerized( Image* dst, Color* color){ ImageClearBackground(dst, *color); }
void ImageDrawPixel_pointerized( Image* dst, int posX, int posY, Color* color){ ImageDrawPixel(dst, posX, posY, *color); }
void ImageDrawPixelV_pointerized( Image* dst, Vector2* position, Color* color){ ImageDrawPixelV(dst, *position, *color); }
void ImageDrawLine_pointerized( Image* dst, int startPosX, int startPosY, int endPosX, int endPosY, Color* color){ ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, *color); }
void ImageDrawLineV_pointerized( Image* dst, Vector2* start, Vector2* end, Color* color){ ImageDrawLineV(dst, *start, *end, *color); }
void ImageDrawCircle_pointerized( Image* dst, int centerX, int centerY, int radius, Color* color){ ImageDrawCircle(dst, centerX, centerY, radius, *color); }
void ImageDrawCircleV_pointerized( Image* dst, Vector2* center, int radius, Color* color){ ImageDrawCircleV(dst, *center, radius, *color); }
void ImageDrawCircleLines_pointerized( Image* dst, int centerX, int centerY, int radius, Color* color){ ImageDrawCircleLines(dst, centerX, centerY, radius, *color); }
void ImageDrawCircleLinesV_pointerized( Image* dst, Vector2* center, int radius, Color* color){ ImageDrawCircleLinesV(dst, *center, radius, *color); }
void ImageDrawRectangle_pointerized( Image* dst, int posX, int posY, int width, int height, Color* color){ ImageDrawRectangle(dst, posX, posY, width, height, *color); }
void ImageDrawRectangleV_pointerized( Image* dst, Vector2* position, Vector2* size, Color* color){ ImageDrawRectangleV(dst, *position, *size, *color); }
void ImageDrawRectangleRec_pointerized( Image* dst, Rectangle* rec, Color* color){ ImageDrawRectangleRec(dst, *rec, *color); }
void ImageDrawRectangleLines_pointerized( Image* dst, Rectangle* rec, int thick, Color* color){ ImageDrawRectangleLines(dst, *rec, thick, *color); }
void ImageDraw_pointerized( Image* dst, Image* src, Rectangle* srcRec, Rectangle* dstRec, Color* tint){ ImageDraw(dst, *src, *srcRec, *dstRec, *tint); }
void ImageDrawText_pointerized( Image* dst,  char* text, int posX, int posY, int fontSize, Color* color){ ImageDrawText(dst, text, posX, posY, fontSize, *color); }
void ImageDrawTextEx_pointerized( Image* dst, Font* font,  char* text, Vector2* position, float fontSize, float spacing, Color* tint){ ImageDrawTextEx(dst, *font, text, *position, fontSize, spacing, *tint); }
Texture2D* LoadTextureFromImage_pointerized(Image* image){
    Texture2D* pointer_value = malloc(sizeof(Texture2D));
    Texture2D ret = LoadTextureFromImage(*image); 
    *pointer_value = ret; 
    return pointer_value;
}
TextureCubemap* LoadTextureCubemap_pointerized(Image* image, int layout){
    TextureCubemap* pointer_value = malloc(sizeof(TextureCubemap));
    TextureCubemap ret = LoadTextureCubemap(*image, layout); 
    *pointer_value = ret; 
    return pointer_value;
}
bool IsTextureReady_pointerized(Texture2D* texture){ return IsTextureReady(*texture); }
void UnloadTexture_pointerized(Texture2D* texture){ UnloadTexture(*texture); }
bool IsRenderTextureReady_pointerized(RenderTexture2D* target){ return IsRenderTextureReady(*target); }
void UnloadRenderTexture_pointerized(RenderTexture2D* target){ UnloadRenderTexture(*target); }
void UpdateTexture_pointerized(Texture2D* texture,  void* pixels){ UpdateTexture(*texture, pixels); }
void UpdateTextureRec_pointerized(Texture2D* texture, Rectangle* rec,  void* pixels){ UpdateTextureRec(*texture, *rec, pixels); }
void SetTextureFilter_pointerized(Texture2D* texture, int filter){ SetTextureFilter(*texture, filter); }
void SetTextureWrap_pointerized(Texture2D* texture, int wrap){ SetTextureWrap(*texture, wrap); }
void DrawTexture_pointerized(Texture2D* texture, int posX, int posY, Color* tint){ DrawTexture(*texture, posX, posY, *tint); }
void DrawTextureV_pointerized(Texture2D* texture, Vector2* position, Color* tint){ DrawTextureV(*texture, *position, *tint); }
void DrawTextureEx_pointerized(Texture2D* texture, Vector2* position, float rotation, float scale, Color* tint){ DrawTextureEx(*texture, *position, rotation, scale, *tint); }
void DrawTextureRec_pointerized(Texture2D* texture, Rectangle* source, Vector2* position, Color* tint){ DrawTextureRec(*texture, *source, *position, *tint); }
void DrawTexturePro_pointerized(Texture2D* texture, Rectangle* source, Rectangle* dest, Vector2* origin, float rotation, Color* tint){ DrawTexturePro(*texture, *source, *dest, *origin, rotation, *tint); }
void DrawTextureNPatch_pointerized(Texture2D* texture, NPatchInfo* nPatchInfo, Rectangle* dest, Vector2* origin, float rotation, Color* tint){ DrawTextureNPatch(*texture, *nPatchInfo, *dest, *origin, rotation, *tint); }
Color* Fade_pointerized(Color* color, float alpha){
    Color* pointer_value = malloc(sizeof(Color));
    Color ret = Fade(*color, alpha); 
    *pointer_value = ret; 
    return pointer_value;
}
int ColorToInt_pointerized(Color* color){ return ColorToInt(*color); }
Vector4* ColorNormalize_pointerized(Color* color){
    Vector4* pointer_value = malloc(sizeof(Vector4));
    Vector4 ret = ColorNormalize(*color); 
    *pointer_value = ret; 
    return pointer_value;
}
Color* ColorFromNormalized_pointerized(Vector4* normalized){
    Color* pointer_value = malloc(sizeof(Color));
    Color ret = ColorFromNormalized(*normalized); 
    *pointer_value = ret; 
    return pointer_value;
}
Vector3* ColorToHSV_pointerized(Color* color){
    Vector3* pointer_value = malloc(sizeof(Vector3));
    Vector3 ret = ColorToHSV(*color); 
    *pointer_value = ret; 
    return pointer_value;
}
Color* ColorTint_pointerized(Color* color, Color* tint){
    Color* pointer_value = malloc(sizeof(Color));
    Color ret = ColorTint(*color, *tint); 
    *pointer_value = ret; 
    return pointer_value;
}
Color* ColorBrightness_pointerized(Color* color, float factor){
    Color* pointer_value = malloc(sizeof(Color));
    Color ret = ColorBrightness(*color, factor); 
    *pointer_value = ret; 
    return pointer_value;
}
Color* ColorContrast_pointerized(Color* color, float contrast){
    Color* pointer_value = malloc(sizeof(Color));
    Color ret = ColorContrast(*color, contrast); 
    *pointer_value = ret; 
    return pointer_value;
}
Color* ColorAlpha_pointerized(Color* color, float alpha){
    Color* pointer_value = malloc(sizeof(Color));
    Color ret = ColorAlpha(*color, alpha); 
    *pointer_value = ret; 
    return pointer_value;
}
Color* ColorAlphaBlend_pointerized(Color* dst, Color* src, Color* tint){
    Color* pointer_value = malloc(sizeof(Color));
    Color ret = ColorAlphaBlend(*dst, *src, *tint); 
    *pointer_value = ret; 
    return pointer_value;
}
void SetPixelColor_pointerized( void* dstPtr, Color* color, int format){ SetPixelColor(dstPtr, *color, format); }
Font* LoadFontFromImage_pointerized(Image* image, Color* key, int firstChar){
    Font* pointer_value = malloc(sizeof(Font));
    Font ret = LoadFontFromImage(*image, *key, firstChar); 
    *pointer_value = ret; 
    return pointer_value;
}
bool IsFontReady_pointerized(Font* font){ return IsFontReady(*font); }
void UnloadFont_pointerized(Font* font){ UnloadFont(*font); }
bool ExportFontAsCode_pointerized(Font* font,  char* fileName){ return ExportFontAsCode(*font, fileName); }
void DrawText_pointerized( char* text, int posX, int posY, int fontSize, Color* color){ DrawText(text, posX, posY, fontSize, *color); }
void DrawTextEx_pointerized(Font* font,  char* text, Vector2* position, float fontSize, float spacing, Color* tint){ DrawTextEx(*font, text, *position, fontSize, spacing, *tint); }
void DrawTextPro_pointerized(Font* font,  char* text, Vector2* position, Vector2* origin, float rotation, float fontSize, float spacing, Color* tint){ DrawTextPro(*font, text, *position, *origin, rotation, fontSize, spacing, *tint); }
void DrawTextCodepoint_pointerized(Font* font, int codepoint, Vector2* position, float fontSize, Color* tint){ DrawTextCodepoint(*font, codepoint, *position, fontSize, *tint); }
void DrawTextCodepoints_pointerized(Font* font,  int* codepoints, int count, Vector2* position, float fontSize, float spacing, Color* tint){ DrawTextCodepoints(*font, codepoints, count, *position, fontSize, spacing, *tint); }
Vector2* MeasureTextEx_pointerized(Font* font,  char* text, float fontSize, float spacing){
    Vector2* pointer_value = malloc(sizeof(Vector2));
    Vector2 ret = MeasureTextEx(*font, text, fontSize, spacing); 
    *pointer_value = ret; 
    return pointer_value;
}
int GetGlyphIndex_pointerized(Font* font, int codepoint){ return GetGlyphIndex(*font, codepoint); }
GlyphInfo* GetGlyphInfo_pointerized(Font* font, int codepoint){
    GlyphInfo* pointer_value = malloc(sizeof(GlyphInfo));
    GlyphInfo ret = GetGlyphInfo(*font, codepoint); 
    *pointer_value = ret; 
    return pointer_value;
}
Rectangle* GetGlyphAtlasRec_pointerized(Font* font, int codepoint){
    Rectangle* pointer_value = malloc(sizeof(Rectangle));
    Rectangle ret = GetGlyphAtlasRec(*font, codepoint); 
    *pointer_value = ret; 
    return pointer_value;
}
void DrawLine3D_pointerized(Vector3* startPos, Vector3* endPos, Color* color){ DrawLine3D(*startPos, *endPos, *color); }
void DrawPoint3D_pointerized(Vector3* position, Color* color){ DrawPoint3D(*position, *color); }
void DrawCircle3D_pointerized(Vector3* center, float radius, Vector3* rotationAxis, float rotationAngle, Color* color){ DrawCircle3D(*center, radius, *rotationAxis, rotationAngle, *color); }
void DrawTriangle3D_pointerized(Vector3* v1, Vector3* v2, Vector3* v3, Color* color){ DrawTriangle3D(*v1, *v2, *v3, *color); }
void DrawTriangleStrip3D_pointerized( Vector3* points, int pointCount, Color* color){ DrawTriangleStrip3D(points, pointCount, *color); }
void DrawCube_pointerized(Vector3* position, float width, float height, float length, Color* color){ DrawCube(*position, width, height, length, *color); }
void DrawCubeV_pointerized(Vector3* position, Vector3* size, Color* color){ DrawCubeV(*position, *size, *color); }
void DrawCubeWires_pointerized(Vector3* position, float width, float height, float length, Color* color){ DrawCubeWires(*position, width, height, length, *color); }
void DrawCubeWiresV_pointerized(Vector3* position, Vector3* size, Color* color){ DrawCubeWiresV(*position, *size, *color); }
void DrawSphere_pointerized(Vector3* centerPos, float radius, Color* color){ DrawSphere(*centerPos, radius, *color); }
void DrawSphereEx_pointerized(Vector3* centerPos, float radius, int rings, int slices, Color* color){ DrawSphereEx(*centerPos, radius, rings, slices, *color); }
void DrawSphereWires_pointerized(Vector3* centerPos, float radius, int rings, int slices, Color* color){ DrawSphereWires(*centerPos, radius, rings, slices, *color); }
void DrawCylinder_pointerized(Vector3* position, float radiusTop, float radiusBottom, float height, int slices, Color* color){ DrawCylinder(*position, radiusTop, radiusBottom, height, slices, *color); }
void DrawCylinderEx_pointerized(Vector3* startPos, Vector3* endPos, float startRadius, float endRadius, int sides, Color* color){ DrawCylinderEx(*startPos, *endPos, startRadius, endRadius, sides, *color); }
void DrawCylinderWires_pointerized(Vector3* position, float radiusTop, float radiusBottom, float height, int slices, Color* color){ DrawCylinderWires(*position, radiusTop, radiusBottom, height, slices, *color); }
void DrawCylinderWiresEx_pointerized(Vector3* startPos, Vector3* endPos, float startRadius, float endRadius, int sides, Color* color){ DrawCylinderWiresEx(*startPos, *endPos, startRadius, endRadius, sides, *color); }
void DrawCapsule_pointerized(Vector3* startPos, Vector3* endPos, float radius, int slices, int rings, Color* color){ DrawCapsule(*startPos, *endPos, radius, slices, rings, *color); }
void DrawCapsuleWires_pointerized(Vector3* startPos, Vector3* endPos, float radius, int slices, int rings, Color* color){ DrawCapsuleWires(*startPos, *endPos, radius, slices, rings, *color); }
void DrawPlane_pointerized(Vector3* centerPos, Vector2* size, Color* color){ DrawPlane(*centerPos, *size, *color); }
void DrawRay_pointerized(Ray* ray, Color* color){ DrawRay(*ray, *color); }
Model* LoadModelFromMesh_pointerized(Mesh* mesh){
    Model* pointer_value = malloc(sizeof(Model));
    Model ret = LoadModelFromMesh(*mesh); 
    *pointer_value = ret; 
    return pointer_value;
}
bool IsModelReady_pointerized(Model* model){ return IsModelReady(*model); }
void UnloadModel_pointerized(Model* model){ UnloadModel(*model); }
BoundingBox* GetModelBoundingBox_pointerized(Model* model){
    BoundingBox* pointer_value = malloc(sizeof(BoundingBox));
    BoundingBox ret = GetModelBoundingBox(*model); 
    *pointer_value = ret; 
    return pointer_value;
}
void DrawModel_pointerized(Model* model, Vector3* position, float scale, Color* tint){ DrawModel(*model, *position, scale, *tint); }
void DrawModelEx_pointerized(Model* model, Vector3* position, Vector3* rotationAxis, float rotationAngle, Vector3* scale, Color* tint){ DrawModelEx(*model, *position, *rotationAxis, rotationAngle, *scale, *tint); }
void DrawModelWires_pointerized(Model* model, Vector3* position, float scale, Color* tint){ DrawModelWires(*model, *position, scale, *tint); }
void DrawModelWiresEx_pointerized(Model* model, Vector3* position, Vector3* rotationAxis, float rotationAngle, Vector3* scale, Color* tint){ DrawModelWiresEx(*model, *position, *rotationAxis, rotationAngle, *scale, *tint); }
void DrawBoundingBox_pointerized(BoundingBox* box, Color* color){ DrawBoundingBox(*box, *color); }
void DrawBillboard_pointerized(Camera* camera, Texture2D* texture, Vector3* position, float size, Color* tint){ DrawBillboard(*camera, *texture, *position, size, *tint); }
void DrawBillboardRec_pointerized(Camera* camera, Texture2D* texture, Rectangle* source, Vector3* position, Vector2* size, Color* tint){ DrawBillboardRec(*camera, *texture, *source, *position, *size, *tint); }
void DrawBillboardPro_pointerized(Camera* camera, Texture2D* texture, Rectangle* source, Vector3* position, Vector3* up, Vector2* size, Vector2* origin, float rotation, Color* tint){ DrawBillboardPro(*camera, *texture, *source, *position, *up, *size, *origin, rotation, *tint); }
void UpdateMeshBuffer_pointerized(Mesh* mesh, int index,  void* data, int dataSize, int offset){ UpdateMeshBuffer(*mesh, index, data, dataSize, offset); }
void UnloadMesh_pointerized(Mesh* mesh){ UnloadMesh(*mesh); }
void DrawMesh_pointerized(Mesh* mesh, Material* material, Matrix* transform){ DrawMesh(*mesh, *material, *transform); }
void DrawMeshInstanced_pointerized(Mesh* mesh, Material* material,  Matrix* transforms, int instances){ DrawMeshInstanced(*mesh, *material, transforms, instances); }
bool ExportMesh_pointerized(Mesh* mesh,  char* fileName){ return ExportMesh(*mesh, fileName); }
BoundingBox* GetMeshBoundingBox_pointerized(Mesh* mesh){
    BoundingBox* pointer_value = malloc(sizeof(BoundingBox));
    BoundingBox ret = GetMeshBoundingBox(*mesh); 
    *pointer_value = ret; 
    return pointer_value;
}
Mesh* GenMeshHeightmap_pointerized(Image* heightmap, Vector3* size){
    Mesh* pointer_value = malloc(sizeof(Mesh));
    Mesh ret = GenMeshHeightmap(*heightmap, *size); 
    *pointer_value = ret; 
    return pointer_value;
}
Mesh* GenMeshCubicmap_pointerized(Image* cubicmap, Vector3* cubeSize){
    Mesh* pointer_value = malloc(sizeof(Mesh));
    Mesh ret = GenMeshCubicmap(*cubicmap, *cubeSize); 
    *pointer_value = ret; 
    return pointer_value;
}
bool IsMaterialReady_pointerized(Material* material){ return IsMaterialReady(*material); }
void UnloadMaterial_pointerized(Material* material){ UnloadMaterial(*material); }
void SetMaterialTexture_pointerized( Material* material, int mapType, Texture2D* texture){ SetMaterialTexture(material, mapType, *texture); }
void UpdateModelAnimation_pointerized(Model* model, ModelAnimation* anim, int frame){ UpdateModelAnimation(*model, *anim, frame); }
void UnloadModelAnimation_pointerized(ModelAnimation* anim){ UnloadModelAnimation(*anim); }
bool IsModelAnimationValid_pointerized(Model* model, ModelAnimation* anim){ return IsModelAnimationValid(*model, *anim); }
bool CheckCollisionSpheres_pointerized(Vector3* center1, float radius1, Vector3* center2, float radius2){ return CheckCollisionSpheres(*center1, radius1, *center2, radius2); }
bool CheckCollisionBoxes_pointerized(BoundingBox* box1, BoundingBox* box2){ return CheckCollisionBoxes(*box1, *box2); }
bool CheckCollisionBoxSphere_pointerized(BoundingBox* box, Vector3* center, float radius){ return CheckCollisionBoxSphere(*box, *center, radius); }
RayCollision* GetRayCollisionSphere_pointerized(Ray* ray, Vector3* center, float radius){
    RayCollision* pointer_value = malloc(sizeof(RayCollision));
    RayCollision ret = GetRayCollisionSphere(*ray, *center, radius); 
    *pointer_value = ret; 
    return pointer_value;
}
RayCollision* GetRayCollisionBox_pointerized(Ray* ray, BoundingBox* box){
    RayCollision* pointer_value = malloc(sizeof(RayCollision));
    RayCollision ret = GetRayCollisionBox(*ray, *box); 
    *pointer_value = ret; 
    return pointer_value;
}
RayCollision* GetRayCollisionMesh_pointerized(Ray* ray, Mesh* mesh, Matrix* transform){
    RayCollision* pointer_value = malloc(sizeof(RayCollision));
    RayCollision ret = GetRayCollisionMesh(*ray, *mesh, *transform); 
    *pointer_value = ret; 
    return pointer_value;
}
RayCollision* GetRayCollisionTriangle_pointerized(Ray* ray, Vector3* p1, Vector3* p2, Vector3* p3){
    RayCollision* pointer_value = malloc(sizeof(RayCollision));
    RayCollision ret = GetRayCollisionTriangle(*ray, *p1, *p2, *p3); 
    *pointer_value = ret; 
    return pointer_value;
}
RayCollision* GetRayCollisionQuad_pointerized(Ray* ray, Vector3* p1, Vector3* p2, Vector3* p3, Vector3* p4){
    RayCollision* pointer_value = malloc(sizeof(RayCollision));
    RayCollision ret = GetRayCollisionQuad(*ray, *p1, *p2, *p3, *p4); 
    *pointer_value = ret; 
    return pointer_value;
}
bool IsWaveReady_pointerized(Wave* wave){ return IsWaveReady(*wave); }
Sound* LoadSoundFromWave_pointerized(Wave* wave){
    Sound* pointer_value = malloc(sizeof(Sound));
    Sound ret = LoadSoundFromWave(*wave); 
    *pointer_value = ret; 
    return pointer_value;
}
Sound* LoadSoundAlias_pointerized(Sound* source){
    Sound* pointer_value = malloc(sizeof(Sound));
    Sound ret = LoadSoundAlias(*source); 
    *pointer_value = ret; 
    return pointer_value;
}
bool IsSoundReady_pointerized(Sound* sound){ return IsSoundReady(*sound); }
void UpdateSound_pointerized(Sound* sound,  void* data, int sampleCount){ UpdateSound(*sound, data, sampleCount); }
void UnloadWave_pointerized(Wave* wave){ UnloadWave(*wave); }
void UnloadSound_pointerized(Sound* sound){ UnloadSound(*sound); }
void UnloadSoundAlias_pointerized(Sound* alias){ UnloadSoundAlias(*alias); }
bool ExportWave_pointerized(Wave* wave,  char* fileName){ return ExportWave(*wave, fileName); }
bool ExportWaveAsCode_pointerized(Wave* wave,  char* fileName){ return ExportWaveAsCode(*wave, fileName); }
void PlaySound_pointerized(Sound* sound){ PlaySound(*sound); }
void StopSound_pointerized(Sound* sound){ StopSound(*sound); }
void PauseSound_pointerized(Sound* sound){ PauseSound(*sound); }
void ResumeSound_pointerized(Sound* sound){ ResumeSound(*sound); }
bool IsSoundPlaying_pointerized(Sound* sound){ return IsSoundPlaying(*sound); }
void SetSoundVolume_pointerized(Sound* sound, float volume){ SetSoundVolume(*sound, volume); }
void SetSoundPitch_pointerized(Sound* sound, float pitch){ SetSoundPitch(*sound, pitch); }
void SetSoundPan_pointerized(Sound* sound, float pan){ SetSoundPan(*sound, pan); }
Wave* WaveCopy_pointerized(Wave* wave){
    Wave* pointer_value = malloc(sizeof(Wave));
    Wave ret = WaveCopy(*wave); 
    *pointer_value = ret; 
    return pointer_value;
}
float* LoadWaveSamples_pointerized(Wave* wave){ return LoadWaveSamples(*wave); }
bool IsMusicReady_pointerized(Music* music){ return IsMusicReady(*music); }
void UnloadMusicStream_pointerized(Music* music){ UnloadMusicStream(*music); }
void PlayMusicStream_pointerized(Music* music){ PlayMusicStream(*music); }
bool IsMusicStreamPlaying_pointerized(Music* music){ return IsMusicStreamPlaying(*music); }
void UpdateMusicStream_pointerized(Music* music){ UpdateMusicStream(*music); }
void StopMusicStream_pointerized(Music* music){ StopMusicStream(*music); }
void PauseMusicStream_pointerized(Music* music){ PauseMusicStream(*music); }
void ResumeMusicStream_pointerized(Music* music){ ResumeMusicStream(*music); }
void SeekMusicStream_pointerized(Music* music, float position){ SeekMusicStream(*music, position); }
void SetMusicVolume_pointerized(Music* music, float volume){ SetMusicVolume(*music, volume); }
void SetMusicPitch_pointerized(Music* music, float pitch){ SetMusicPitch(*music, pitch); }
void SetMusicPan_pointerized(Music* music, float pan){ SetMusicPan(*music, pan); }
float GetMusicTimeLength_pointerized(Music* music){ return GetMusicTimeLength(*music); }
float GetMusicTimePlayed_pointerized(Music* music){ return GetMusicTimePlayed(*music); }
bool IsAudioStreamReady_pointerized(AudioStream* stream){ return IsAudioStreamReady(*stream); }
void UnloadAudioStream_pointerized(AudioStream* stream){ UnloadAudioStream(*stream); }
void UpdateAudioStream_pointerized(AudioStream* stream,  void* data, int frameCount){ UpdateAudioStream(*stream, data, frameCount); }
bool IsAudioStreamProcessed_pointerized(AudioStream* stream){ return IsAudioStreamProcessed(*stream); }
void PlayAudioStream_pointerized(AudioStream* stream){ PlayAudioStream(*stream); }
void PauseAudioStream_pointerized(AudioStream* stream){ PauseAudioStream(*stream); }
void ResumeAudioStream_pointerized(AudioStream* stream){ ResumeAudioStream(*stream); }
bool IsAudioStreamPlaying_pointerized(AudioStream* stream){ return IsAudioStreamPlaying(*stream); }
void StopAudioStream_pointerized(AudioStream* stream){ StopAudioStream(*stream); }
void SetAudioStreamVolume_pointerized(AudioStream* stream, float volume){ SetAudioStreamVolume(*stream, volume); }
void SetAudioStreamPitch_pointerized(AudioStream* stream, float pitch){ SetAudioStreamPitch(*stream, pitch); }
void SetAudioStreamPan_pointerized(AudioStream* stream, float pan){ SetAudioStreamPan(*stream, pan); }
