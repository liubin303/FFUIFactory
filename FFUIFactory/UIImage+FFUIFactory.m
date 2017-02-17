//
//  UIImage+FFUIFactory.m
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/18.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import "UIImage+FFUIFactory.h"
#import <Accelerate/Accelerate.h>

#define   ff_pi (3.14159265359)
#define   ff_degrees_to_radians(degrees)  ((ff_pi * degrees)/ 180)

@implementation UIImage (FFUIFactory)

#pragma mark - Instance
+ (UIImage *)ff_imageWithContentFileName:(NSString *)fileName{
    return [self ff_imageWithContentFileName:fileName ofType:@"png"];
}

+ (UIImage *)ff_imageWithContentFileName:(NSString *)fileName ofType:(NSString *)ext{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:ext];
    return [UIImage imageWithContentsOfFile:filePath];
}

+ (UIImage *)ff_imageWithColor:(UIColor *)color {
    return [self ff_imageWithColor:color size:CGSizeMake(1.0f, 1.0f)];
}

+ (UIImage *)ff_imageWithColor:(UIColor *)color size:(CGSize)size{
    if (color == nil) {
        NSAssert(NO, @"颜色不能为空");
        return nil;
    }
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)ff_imageWithColor:(UIColor *)color cornerRadius:(CGFloat)radius {
    CGFloat width = radius + 3;
    return [self ff_imageWithSize:CGSizeMake(width, width) color:color border:0.0f color:nil cornerRadius:radius];
}

+ (UIImage *)ff_imageWithColor:(UIColor *)color border:(CGFloat)width color:(UIColor *)borderColor cornerRadius:(CGFloat)radius {
    CGFloat awidth = radius + width + 3;
    return [self ff_imageWithSize:CGSizeMake(awidth, awidth) color:color border:width color:borderColor cornerRadius:radius];
}

+ (UIImage *)ff_imageWithSize:(CGSize)size color:(UIColor *)color border:(CGFloat)width color:(UIColor *)borderColor cornerRadius:(CGFloat)radius {
    
    UIColor *bcolor = color;
    if (!color) {
        bcolor = [UIColor clearColor];
    }
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    UIBezierPath *borderPath = nil;//
    CGFloat border_width = ceil(width);
    if (border_width > 0.0f) {//
        borderPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:radius];
        //        borderPath.lineWidth = border_width;
    }
    
    UIBezierPath *fillPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(border_width, border_width, size.width - border_width * 2, size.height - border_width * 2) cornerRadius:radius - border_width];
    
    if (borderPath) {
        [borderColor setFill];
        [borderPath fill];
    }
    
    [bcolor setFill];
    [fillPath fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)ff_imageWithSize:(CGSize)size gradientColor:(UIColor *)from to:(UIColor *)to cornerRadius:(CGFloat)radius {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSArray *aColors = @[(id)(from.CGColor),(id)(to.CGColor)];
    CGFloat aLocations[2] = {0.0f,1.0f};
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)aColors, aLocations);
    
    UIBezierPath *roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:radius];
    CGContextSaveGState(context);
    [roundedRectanglePath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(size.width / 2, 0), CGPointMake(size.width / 2, size.height), 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)ff_imageWithSize:(CGSize)size gradientColor:(UIColor *)from to:(UIColor *)to border:(CGFloat)width color:(UIColor *)borderColor cornerRadius:(CGFloat)radius {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSArray *aColors = @[(id)(from.CGColor),(id)(to.CGColor)];
    CGFloat aLocations[2] = {0.0f,1.0f};
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)aColors, aLocations);
    
    UIBezierPath *roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:radius];
    CGContextSaveGState(context);
    [roundedRectanglePath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(size.width / 2, 0), CGPointMake(size.width / 2, size.height), 0);
    CGContextRestoreGState(context);
    
    [borderColor setStroke];
    roundedRectanglePath.lineWidth = width;
    [roundedRectanglePath stroke];
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)ff_imageWithSize:(CGSize)size gradientColor:(UIColor *)from to:(UIColor *)to border:(CGFloat)width color:(UIColor *)borderColor blending:(CGFloat)blendingWidth color:(UIColor *)blendingColor cornerRadius:(CGFloat)radius {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSArray *aColors = @[(id)(from.CGColor),(id)(to.CGColor)];
    CGFloat aLocations[2] = {0.0f,1.0f};
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)aColors, aLocations);
    
    //TODO:If I use '[borderPath stroke]' when setting the path width to 0.5, it will look aliasing on its corner. So I use two rounded rectangle path to draw the image, one for border, the other for fill color. It looks good, but you will find the rgb value of the image corner is different using PhotoShop. -- By QingShan
    
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:radius];
    UIBezierPath *fillPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(width, width, size.width - width * 2, size.height - width * 2) cornerRadius:radius - width];
    
    //fill borderPath
    [borderColor setFill];
    [borderPath fill];
    //fill fillPath
    [blendingColor setFill];
    [fillPath fill];
    //draw gradient in fillPath
    CGContextSaveGState(context);
    [fillPath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(size.width / 2, width + blendingWidth), CGPointMake(size.width / 2, size.height - width), 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)ff_imageWithSize:(CGSize)size gradientColors:(NSArray *)colors gradientLocations:(const CGFloat [])locations border:(CGFloat)width color:(UIColor *)borderColor blending:(CGFloat)blendingWidth color:(UIColor *)blendingColor cornerRadius:(CGFloat)radius {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSMutableArray *aColors = [NSMutableArray array];
    for (UIColor *color in colors) {
        [aColors addObject:(id)(color.CGColor)];
    }
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)aColors, locations);
    
    //TODO:If I use '[borderPath stroke]' when setting the path width to 0.5, it will look aliasing on its corner. So I use two rounded rectangle path to draw the image, one for border, the other for fill color. It looks good, but you will find the rgb value of the image corner is different using PhotoShop. -- By QingShan
    
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:radius];
    UIBezierPath *fillPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(width, width, size.width - width * 2, size.height - width * 2) cornerRadius:radius - width];
    
    //fill borderPath
    [borderColor setFill];
    [borderPath fill];
    //fill fillPath
    [blendingColor setFill];
    [fillPath fill];
    //draw gradient in fillPath
    CGContextSaveGState(context);
    [fillPath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(size.width / 2, width + blendingWidth), CGPointMake(size.width / 2, size.height - width), 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)ff_lineWithColor:(UIColor *)color orientation:(UIInterfaceOrientation)orientation {
    
    CGFloat widthpx = [UIScreen mainScreen].scale; //px
    
    CGSize size = CGSizeZero;
    
    if (UIInterfaceOrientationLandscapeLeft == orientation || UIInterfaceOrientationLandscapeRight == orientation) {
        size.width = widthpx;
        size.height = 1;
    }
    else {
        size.width = 1;
        size.height = widthpx;
    }
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 1);
    
    [color set];
    switch (orientation) {
        case UIInterfaceOrientationPortrait:
            UIRectFill(CGRectMake(0, 0, 1, 1));
            if (widthpx > 1) {
                [[UIColor clearColor] set];
                UIRectFill(CGRectMake(0, 1, 1, widthpx - 1));
            }
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            UIRectFill(CGRectMake(0, widthpx - 1, 1, 1));
            if (widthpx > 1) {
                [[UIColor clearColor] set];
                UIRectFill(CGRectMake(0, 0, 1, widthpx - 1));
            }
            break;
        case UIInterfaceOrientationLandscapeLeft:
            UIRectFill(CGRectMake(widthpx - 1, 0, 1, 1));
            if (widthpx > 1) {
                [[UIColor clearColor] set];
                UIRectFill(CGRectMake(0, 0, widthpx - 1, 1));
            }
            break;
        case UIInterfaceOrientationLandscapeRight:
            UIRectFill(CGRectMake(0, 0, 1, 1));
            if (widthpx > 1) {
                [[UIColor clearColor] set];
                UIRectFill(CGRectMake(1, 0, widthpx - 1, 1));
            }
            break;
        default:
            UIRectFill(CGRectMake(0, 0, 1, 1));
            if (widthpx > 1) {
                [[UIColor clearColor] set];
                UIRectFill(CGRectMake(0, 1, 1, widthpx - 1));
            }
            break;
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)ff_circleLineWithDiameter:(CGFloat)diameter border:(CGFloat)width color:(UIColor *)borderColor {
    
    CGSize size = CGSizeMake(diameter, diameter);
    CGFloat radius = floor(diameter/2.0f);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    UIBezierPath* borderPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius)
                                                              radius:radius
                                                          startAngle:0
                                                            endAngle:ff_degrees_to_radians(360)
                                                           clockwise:YES];
    
    borderPath.lineWidth = width;
    borderPath.lineCapStyle = kCGLineCapRound; //线条拐角
    borderPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [borderColor setStroke]; //设置线条颜色
    [borderPath stroke];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)ff_circleLineWithDiameter:(CGFloat)diameter border:(CGFloat)width color:(UIColor *)borderColor backgroudColor:(UIColor *)backgroudColor {
    CGSize size = CGSizeMake(diameter, diameter);
    CGFloat radius = floor(diameter/2.0f);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    UIBezierPath* borderPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius)
                                                              radius:radius
                                                          startAngle:0
                                                            endAngle:ff_degrees_to_radians(360)
                                                           clockwise:YES];
    
    borderPath.lineWidth = width;
    borderPath.lineCapStyle = kCGLineCapRound; //线条拐角
    borderPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [borderColor setFill];
    [borderPath fill];
    
    CGSize fillsize = CGSizeMake(diameter - 2*width, diameter - 2*width);
    CGFloat fillradius = floor(fillsize.width/2.0f);
    
    UIBezierPath *fillPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius)
                                                            radius:fillradius
                                                        startAngle:0
                                                          endAngle:ff_degrees_to_radians(360)
                                                         clockwise:YES];
    [backgroudColor setFill];
    [fillPath fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)ff_circleWithDiameter:(CGFloat)diameter color:(UIColor *)color {
    
    CGSize size = CGSizeMake(diameter, diameter);
    CGFloat radius = floor(diameter/2.0f);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    UIBezierPath* borderPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius)
                                                              radius:radius
                                                          startAngle:0
                                                            endAngle:ff_degrees_to_radians(360)
                                                           clockwise:YES];
    
    [color setFill]; //设置颜色
    [borderPath fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - Modify
- (UIImage *)ff_centerStretchImage {
    CGSize size = self.size;
    CGFloat half_width = floor(size.width/2);
    CGFloat half_height = floor(size.height/2);
    return [self resizableImageWithCapInsets:UIEdgeInsetsMake(half_height, half_width, half_height, half_width)];
}

void ff_ImageBufferInitialized(vImage_Buffer *buffer, CGImageRef image) {
    memset(buffer, 0, sizeof(vImage_Buffer));
    
    buffer->width = CGImageGetWidth( image );
    buffer->height = CGImageGetHeight( image );
    buffer->rowBytes = CGImageGetBytesPerRow( image );
    buffer->data = malloc( buffer->rowBytes * buffer->height );
}

void ff_ImageBufferDestory(vImage_Buffer *buffer) {
    if (buffer->data) {
        free(buffer->data);
        buffer->data = NULL;
    }
    
    memset(buffer, 0, sizeof(vImage_Buffer));
}

- (UIImage *)ff_scaleImage {
    CGSize selfSize = self.size;
    CGFloat selfScale = self.scale;
    CGFloat screenScale = [UIScreen mainScreen].scale;
    CGSize targetSize = CGSizeMake(floor(selfSize.width * selfScale / screenScale), floor(selfSize.height * selfScale / screenScale));
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, screenScale);
    [self drawInRect:CGRectMake(0, 0, targetSize.width, targetSize.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)ff_gaussiafflurImage {
    
    uint32_t radius = 5;
    uint8_t iterations = 5;
    
    return [self ff_gaussiafflurImageWithRadius:radius iterations:iterations];
}

- (void)ff_gaussiafflurImageComplete:(void(^)(UIImage *image))complete {
    __weak typeof(self) w_self = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{__strong typeof(w_self) self = w_self;
        if (!self) {
            return ;
        }
        UIImage *image = [self ff_gaussiafflurImage];
        if (complete) {
            dispatch_async(dispatch_get_main_queue(), ^{
                complete(image);
            });
        }
    });
}

- (UIImage *)ff_gaussiafflurImageWithRadius:(NSUInteger)radius iterations:(NSUInteger)iterations {
    
    UIImage *image = [self ff_scaleImage];//先矫正图片
    
    CGImageRef cgimage = image.CGImage;
    
    vImage_Buffer tempImageBuffer;
    vImage_Buffer finalImageBuffer;
    
    ff_ImageBufferInitialized(&tempImageBuffer, cgimage);
    ff_ImageBufferInitialized(&finalImageBuffer, cgimage);
    
    CFDataRef dataSource = CGDataProviderCopyData( CGImageGetDataProvider( cgimage ));
    memcpy( tempImageBuffer.data, CFDataGetBytePtr( dataSource ), tempImageBuffer.rowBytes * tempImageBuffer.height );
    memcpy( finalImageBuffer.data, CFDataGetBytePtr( dataSource ), finalImageBuffer.rowBytes * finalImageBuffer.height );
    CFRelease(dataSource);
    
    // Radius must be an odd integer, or we'll get a kvImageInvalidKernelSize error. See
    // vImageBoxConvolve_ARGB8888 documentation for a better discussion
    uint32_t finalRadius = ( uint32_t )( radius * image.scale );
    if(( finalRadius & 1 ) == 0 ) {
        ++finalRadius;
    }
    
    // The reason of the loop below is that many convolve iterations generate a better blurred image
    // than applying a greater convolve radius
    for( uint16_t i = 0 ; i < iterations ; ++i )
    {
        vImage_Error error = vImageBoxConvolve_ARGB8888( &tempImageBuffer, &finalImageBuffer, NULL, 0, 0, finalRadius, finalRadius, NULL, kvImageEdgeExtend );
        if( error != kvImageNoError )
        {
            return nil;
        }
        
        void *temp = tempImageBuffer.data;
        tempImageBuffer.data = finalImageBuffer.data;
        finalImageBuffer.data = temp;
    }
    
    // The last processed image is being hold by tempImageBuffer. So let's fix it
    // by swaping buffers again
    void *temp = tempImageBuffer.data;
    tempImageBuffer.data = finalImageBuffer.data;
    finalImageBuffer.data = temp;
    
    CGColorSpaceRef colorSpace = CGImageGetColorSpace( cgimage );
    CGBitmapInfo info = CGImageGetBitmapInfo( cgimage );
    CGContextRef finalImageContext = CGBitmapContextCreate(finalImageBuffer.data,
                                                           finalImageBuffer.width,
                                                           finalImageBuffer.height,
                                                           8,
                                                           finalImageBuffer.rowBytes,
                                                           colorSpace,
                                                           info);
    
    // TODO : Here we could call a delegate with the context, so we could do a post process. Or
    // we could receive a block to do the same
    // ...
    
    CGImageRef finalImageRef = CGBitmapContextCreateImage( finalImageContext );
    UIImage *finalImage = [UIImage imageWithCGImage:finalImageRef scale:image.scale orientation: image.imageOrientation];
    CGImageRelease( finalImageRef );
    CGContextRelease( finalImageContext );
    
    //释放
    ff_ImageBufferDestory(&tempImageBuffer);
    ff_ImageBufferDestory(&finalImageBuffer);
    
    return finalImage;
}

- (void)ff_gaussiafflurImageWithRadius:(NSUInteger)radius iterations:(NSUInteger)iterations complete:(void(^)(UIImage *image))complete {
    __weak typeof(self) w_self = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{__strong typeof(w_self) self = w_self;
        if (!self) {
            return ;
        }
        UIImage *image = [self ff_gaussiafflurImageWithRadius:radius iterations:iterations];
        if (complete) {
            dispatch_async(dispatch_get_main_queue(), ^{
                complete(image);
            });
        }
    });
}

- (UIImage *)ff_mirroredImage {
    CGSize pSize = CGSizeMake(CGImageGetWidth(self.CGImage), CGImageGetHeight(self.CGImage));
    
    UIGraphicsBeginImageContextWithOptions(pSize, YES, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextDrawImage(context, CGRectMake(0, 0, pSize.width, pSize.height), self.CGImage);
    
    UIImage *mirrored = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return mirrored;
}


- (UIImage *)ff_rotateWithimageOrientation:(UIImageOrientation)imageOrientation {
    CGImageRef imgRef = self.CGImage;
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, width, height);
    CGFloat scaleRatio = 1;
    CGFloat boundHeight;
    
    switch(imageOrientation)
    {
        case UIImageOrientationUp: //EXIF = 1
            transform = CGAffineTransformIdentity;
            break;
        case UIImageOrientationUpMirrored: //EXIF = 2
            transform = CGAffineTransformMakeTranslation(width, 0.0);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            break;
        case UIImageOrientationDown: //EXIF = 3
            transform = CGAffineTransformMakeTranslation(width, height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
        case UIImageOrientationDownMirrored: //EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
            break;
        case UIImageOrientationLeftMirrored: //EXIF = 5
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(height, width);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
        case UIImageOrientationLeft: //EXIF = 6
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(0.0, width);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
        case UIImageOrientationRightMirrored: //EXIF = 7
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeScale(-1.0, 1.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
        case UIImageOrientationRight: //EXIF = 8
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(height, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
    }
    UIGraphicsBeginImageContext(bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (imageOrientation == UIImageOrientationRight || imageOrientation == UIImageOrientationLeft) {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -height, 0);
    }
    else {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -height);
    }
    CGContextConcatCTM(context, transform);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageCopy;
}

- (UIImage*)ff_rotatedByDegrees:(CGFloat)degrees {
    
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    CGSize rotatedSize;
    
    rotatedSize.width = width;
    rotatedSize.height = height;
    
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    CGContextRotateCTM(bitmap, degrees * M_PI / 180);
    CGContextRotateCTM(bitmap, M_PI);
    CGContextScaleCTM(bitmap, -1.0, 1.0);
    CGContextDrawImage(bitmap, CGRectMake(-rotatedSize.width/2, -rotatedSize.height/2, rotatedSize.width, rotatedSize.height), self.CGImage);
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)ff_scaleToSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    [self drawInRect:CGContextGetClipBoundingBox(context)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)ff_scaleToSizeIgnoreScreenScale:(CGSize)size {
    CGRect rect = CGRectMake(0.0, 0.0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    [self drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)ff_fillImageWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
