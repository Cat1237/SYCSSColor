//
//  SYColor.h
//  SYCSSColor
//
//  Created by Tino on 2018/9/17.
//  Copyright © 2018年 Tino. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef unsigned SYRGBA32;


typedef NS_ENUM(int32_t, SYColorSpace){
    kCLColorSpaceSRGB,
    kCLColorSpaceLinearRGB,
    kCLColorSpaceDisplayP3
};

NS_ASSUME_NONNULL_BEGIN

CG_EXTERN CGColorSpaceRef sRGBColorSpaceRef(void);
CG_EXTERN CGColorSpaceRef extendedSRGBColorSpaceRef(void);
CG_EXTERN CGColorSpaceRef displayP3ColorSpaceRef(void);
CG_EXTERN CGColorSpaceRef linearRGBColorSpaceRef(void);
static inline CGColorSpaceRef cachedCGColorSpace(SYColorSpace colorSpace)
{
    switch (colorSpace) {
        case kCLColorSpaceSRGB:
            return sRGBColorSpaceRef();
        case kCLColorSpaceLinearRGB:
            return linearRGBColorSpaceRef();
        case kCLColorSpaceDisplayP3:
            return displayP3ColorSpaceRef();
    }
    return sRGBColorSpaceRef();
}


@interface SYExtendedColor :NSObject
+ (SYExtendedColor *)extendedColor:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a colorSpace:(SYColorSpace)colorSpace;
- (CGFloat)red;
- (CGFloat)green;
- (CGFloat)blue;
- (CGFloat)alpha;
- (SYColorSpace)colorSpace;
@end



@interface SYColor : NSObject

// Convenience methods for creating colors
+ (instancetype)colorWithUIColor:(UIColor *)color;

+ (instancetype)colorWithCGColor:(CGColorRef)color;

+ (instancetype)color:(SYRGBA32)color;

+ (instancetype)colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue
                       alpha:(CGFloat)alpha;

// This creates an ExtendedColor.
// If the colorSpace is sRGB and the values can all be
// converted exactly to integers, we should make a normal Color.
+ (instancetype)colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue
                       alpha:(CGFloat)alpha
                  colorSpace:(SYColorSpace)colorSpace;

+ (instancetype)colorWithIntRed:(int)red
                          green:(int)green
                           blue:(int)blue;

+ (instancetype)colorWithIntRed:(int)red
                          green:(int)green
                           blue:(int)blue
                          alpha:(int)alpha;

// Creates a new color from the specific CMYK and alpha values.
+ (instancetype)colorWithCyan:(CGFloat)cyan
                      magenta:(CGFloat)magenta
                       yellow:(CGFloat)yellow
                        black:(CGFloat)black
                        alpha:(CGFloat)alpha;

+ (instancetype)colorWithHue:(CGFloat)hue
                  saturation:(CGFloat)saturation
                  brightness:(CGFloat)brightness
                       alpha:(CGFloat)alpha;

/// Returns a new SYColor of the given color string.
/// In this example, we used fuchsia Color
///
///    NSString *fuchsiaString = @"#FF00FF";
///    // fuchsiaString  = [fuchsiaString substringFromIndex:1];
///    // https://www.w3schools.com/cssref/func_rgb.asp
///    The rgb() function define colors using the Red-green-blue (RGB) model.

///    An RGB color value is specified with: rgb(red, green, blue). Each parameter defines the intensity of that color and can be an integer between 0 and 255 or a percentage value (from 0% to 100%).

///    For example, the rgb(0,0,255) value is rendered as blue, because the blue parameter is set to its highest value (255) and the others are set to 0.
///    // NSString *fuchsiaString = @"rgb(100%, 0%, 100%)";
///    // NSString *fuchsiaString = @"rgb(255, 0, 255)";
///    // NSString *fuchsiaString = @"rgba(255, 0, 255, 0.8)";

///    SYColor *fuchsia = [SYColor colorWithString: fuchsiaString];
///
///    // name color
///    // SYColor *fuchsia = [SYColor colorWithString:@"fuchsia"];

///   fuchsia.isValid;
///   // YES
///   fuchsia.red == 255;
///   // YES
///   fuchsia.green == 0;
///   // YES
///   fuchsia.blue == 255;
///   // YES
///   fuchsia.alpha == 204;
///   // YES

+ (SYColor * _Nullable)colorWithString:(NSString *)string;


// Initializers for creating colors
- (instancetype)initWithUIColor:(UIColor *)color;

- (instancetype)initWithCGColor:(CGColorRef)color;

- (instancetype)initWithRGBA:(SYRGBA32)color;


- (instancetype)initWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue
                       alpha:(CGFloat)alpha;

// This creates an ExtendedColor.
// If the colorSpace is sRGB and the values can all be
// converted exactly to integers, we should make a normal Color.
- (instancetype)initWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue
                       alpha:(CGFloat)alpha
                  colorSpace:(SYColorSpace)colorSpace;

- (instancetype)initWithIntRed:(int)red
                          green:(int)green
                           blue:(int)blue;

- (instancetype)initWithIntRed:(int)red
                          green:(int)green
                           blue:(int)blue
                          alpha:(int)alpha;

// Creates a new color from the specific CMYK and alpha values.
- (instancetype)initWithCyan:(CGFloat)cyan
                      magenta:(CGFloat)magenta
                       yellow:(CGFloat)yellow
                        black:(CGFloat)black
                        alpha:(CGFloat)alpha;

- (instancetype)initWithHue:(CGFloat)hue
                  saturation:(CGFloat)saturation
                  brightness:(CGFloat)brightness
                       alpha:(CGFloat)alpha;

+ (int)differenceSquared:(SYColor *)color1 color2:(SYColor *)color2;

@property (class, nonatomic, readonly) SYColor *black;
@property (class, nonatomic, readonly) SYColor *white;
@property (class, nonatomic, readonly) SYColor *transparent;
@property (nonatomic, readonly) SYColor *dark;
@property (nonatomic, readonly) SYColor *light;

@property (nonatomic, readonly, getter=isValid) BOOL valid;
@property (nonatomic, readonly, getter=isExtended) BOOL extended;
@property (nonatomic, readonly, getter=isOpaque) BOOL opaque;
@property (nonatomic, readonly, getter=isVisible) BOOL visible;

// Return NSString like 0xFFFFB6C1
@property (nonatomic, readonly) NSString *hexString;

@property (nonatomic, readonly) int red;
@property (nonatomic, readonly) int green;
@property (nonatomic, readonly) int blue;
@property (nonatomic, readonly) int alpha;
@property (nonatomic, readonly) SYRGBA32 rgb;

@property (nonatomic, readonly) CGColorRef cachedCGColor;
@property (nonatomic, readonly) SYColor *blendWithWhite;
@property (nonatomic, readonly) CGFloat alphaAsCGFloat;
@property (nonatomic, readonly) SYColor *opaqueColor;

+ (BOOL)parseColorString:(NSString *)name rgb:(SYRGBA32 *)rgb;

// Convenience methods for getting components.
// If the receiver is of a compatible color space, any non-NULL parameters are populated and 'YES' is returned. Otherwise, the parameters are left unchanged and 'NO' is returned.
- (BOOL)getRed:(nullable CGFloat *)red
         green:(nullable CGFloat *)green
          blue:(nullable CGFloat *)blue
         alpha:(nullable CGFloat *)alpha;

- (BOOL)getHue:(nullable CGFloat *)hue
    saturation:(nullable CGFloat *)saturation
    brightness:(nullable CGFloat *)brightness
         alpha:(nullable CGFloat *)alpha;

- (BOOL)getHue:(nullable CGFloat *)hue
    saturation:(nullable CGFloat *)saturation
         value:(nullable CGFloat *)value
         alpha:(nullable CGFloat *)alpha;


// Source color must have alpha and is not opaque
- (SYColor *)blend:(SYColor *)source;

+ (SYColor *)blendFrom:(SYColor *)from to:(SYColor *)to  progress:(CGFloat)progress;

+ (SYColor *)blendFrom:(SYColor *)from to:(SYColor *)to  progress:(CGFloat)progress blendPremultiplied:(BOOL)blendPremultiplied;

- (SYColor *)blend:(SYColor *)to progress:(CGFloat)progress;

- (SYColor *)blend:(SYColor *)to progress:(CGFloat)progress blendPremultiplied:(BOOL)blendPremultiplied;

- (SYColor *)colorWithAlphaMultipliedBy:(CGFloat)amount;

// Returns a color in the same color space as the receiver with the specified alpha component.
- (SYColor *)colorWithAlpha:(CGFloat)alpha;
@end
NS_ASSUME_NONNULL_END
