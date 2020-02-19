
//
//  SYColor.m
//  SYCSSColor
//
//  Created by Tino on 2018/9/17.
//  Copyright © 2018年 Tino. All rights reserved.
//

#import <SYCSSColor/SYColor.h>
#import <SYCSSColor/SYTinyLRUCache.h>
#import <SYCSSColor/SYHashTools.h>
#import <SYCSSColor/SYCSSColorASCII.h>


CGColorSpaceRef sRGBColorSpaceRef()
{
    static CGColorSpaceRef sRGBColorSpace;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        sRGBColorSpace = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
    });
    return sRGBColorSpace;
}

CGColorSpaceRef linearRGBColorSpaceRef()
{
    static CGColorSpaceRef linearRGBColorSpace;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 10.0, *)) {
            linearRGBColorSpace = CGColorSpaceCreateWithName(kCGColorSpaceLinearSRGB);
        } else {
            // Fallback on earlier versions
        }

    });
    return linearRGBColorSpace;
}

CGColorSpaceRef extendedSRGBColorSpaceRef()
{
    static CGColorSpaceRef extendedSRGBColorSpace;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGColorSpaceRef colorSpace = NULL;
        colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceExtendedSRGB);
        // If there is no support for extended sRGB, fall back to sRGB.
        if (!colorSpace)
            colorSpace = sRGBColorSpaceRef();
        
        extendedSRGBColorSpace = colorSpace;
    });
    return extendedSRGBColorSpace;
}

CGColorSpaceRef displayP3ColorSpaceRef()
{
    static CGColorSpaceRef displayP3ColorSpace;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        displayP3ColorSpace = CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
    });
    return displayP3ColorSpace;
}


@interface SYExtendedColor()
{
    float _red;
    float _green;
    float _blue;
    float _alpha;
    SYColorSpace _colorSpace;
}
@end

@implementation SYExtendedColor
+ (SYExtendedColor *)extendedColor:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a colorSpace:(SYColorSpace)colorSpace
{
    SYExtendedColor *e = [SYExtendedColor new];
    e->_red = r;
    e->_blue = b;
    e->_green = g;
    e->_alpha = a;
    e->_colorSpace = colorSpace;
    return e;
}
- (CGFloat)red
{
    return _red;
}
- (CGFloat)blue
{
    return _blue;
}
- (CGFloat)green
{
    return _green;
}
- (CGFloat)alpha
{
    return _alpha;
}
- (SYColorSpace)colorSpace
{
    return _colorSpace;
}

- (NSString *)description {
    NSMutableString *builder = [NSMutableString stringWithCapacity:40];
    [builder appendString:@"color("];
    switch (_colorSpace) {
        
        case kCLColorSpaceSRGB:
            [builder appendString:@"srgb "];
            break;
        case kCLColorSpaceDisplayP3:
            [builder appendString:@"display-p3 "];
            break;
        default:
            return @"";
    }
    [builder appendFormat:@"%f", self.red];
    [builder appendString:@" "];
    [builder appendFormat:@"%f", self.green];
    [builder appendString:@" "];
    
    [builder appendString:@" / "];
    [builder appendFormat:@"%f", self.alpha];

    [builder appendString:@")"];
    return builder;
}
@end

@interface SYColor ()
{
    uint64_t _rgbaAndFlags;
    SYExtendedColor *_extendedColor;
}
- (SYExtendedColor *)asExtended;
@end

namespace SY {
    static UIColor *leakCGColor(const SYColor *color)
    {
        CGFloat components[4];
        if (color.isExtended) {
            SYExtendedColor *extendedColor = color.asExtended;
            components[0] = extendedColor.red;
            components[1] = extendedColor.green;
            components[2] = extendedColor.blue;
            components[3] = extendedColor.alpha;
            switch (extendedColor.colorSpace) {
                case kCLColorSpaceSRGB:
                {
                    CGColorRef colorCG = CGColorCreate(sRGBColorSpaceRef(), components);
                    UIColor *colorUI = [UIColor colorWithCGColor:colorCG];
                    CGColorRelease(colorCG);
                    return colorUI;
                }
                case kCLColorSpaceDisplayP3:
                {
                    CGColorRef colorCG = CGColorCreate(displayP3ColorSpaceRef(), components);
                    UIColor *colorUI = [UIColor colorWithCGColor:colorCG];
                    CGColorRelease(colorCG);
                    return colorUI;
                }
                case kCLColorSpaceLinearRGB:
                {
                    // FIXME: Do we ever create CGColorRefs in these spaces? It may only be ImageBuffers.

                    CGColorRef colorCG = CGColorCreate(sRGBColorSpaceRef(), components);
                    UIColor *colorUI = [UIColor colorWithCGColor:colorCG];
                    CGColorRelease(colorCG);
                    return colorUI;
                }
            }
        }
        [color getRed:&(components[0]) green:&(components[1]) blue:&(components[2]) alpha:&(components[3])];
        CGColorRef colorCG = CGColorCreate(sRGBColorSpaceRef(), components);
        UIColor *colorUI = [UIColor colorWithCGColor:colorCG];
        CGColorRelease(colorCG);
        return colorUI;
    }
    template<>
    UIColor *TinyLRUCachePolicy<SYColor *, UIColor *>::createValueForKey(SYColor *__strong const &color)
    {
        return leakCGColor(color);
    }
   
}

@implementation SYColor
static const uint64_t validRGBAColor = 0x3;
static const uint64_t invalidRGBAColor = 0x1;
static const uint64_t validRGBAColorBit = 0x2;
static const SYRGBA32 SYColorBlack = 0xFF000000;
static const SYRGBA32 SYColorWhite = 0xFFFFFFFF;
static const SYRGBA32 SYColordDarkenedWhite = 0xFFABABAB;
static const SYRGBA32 SYLightenedBlack = 0xFF545454;
static const SYRGBA32 SYColorTransparent = 0x00000000;
static inline int redChannel(SYRGBA32 color) { return (color >> 16) & 0xFF; }
static inline int greenChannel(SYRGBA32 color) { return (color >> 8) & 0xFF; }
static inline int blueChannel(SYRGBA32 color) { return color & 0xFF; }
static inline int alphaChannel(SYRGBA32 color) { return (color >> 24) & 0xFF; }

static inline SYRGBA32 makeRGB(int r, int g, int b)
{
    return 0xFF000000 | MAX(0, MIN(r, 255)) << 16 | MAX(0, MIN(g, 255)) << 8 | MAX(0, MIN(b, 255));
}
static inline SYRGBA32 makeRGBA(int r, int g, int b, int a)
{
    return MAX(0, MIN(a, 255)) << 24 | MAX(0, MIN(r, 255)) << 16 | MAX(0, MIN(g, 255)) << 8 | MAX(0, MIN(b, 255));
}
static inline uint16_t divideBy255(uint16_t value)
{
    // While this is an approximate algorithm for division by 255, it gives perfectly accurate results for 16-bit values.
    // Since this gives accurate results for 16-bit values, we should get this optimization into compilers like clang.
    uint16_t approximation = value >> 8;
    uint16_t remainder = value - (approximation * 255) + 1;
    return approximation + (remainder >> 8);
}

static inline unsigned premultipliedChannel(unsigned c, unsigned a, bool ceiling)
{
    return divideBy255(ceiling ? c * a + 254 : c * a);
}

static SYRGBA32 makePremultipliedRGBA(int r, int g, int b, int a, bool ceiling)
{
    return makeRGBA(premultipliedChannel(r, a, ceiling), premultipliedChannel(g, a, ceiling), premultipliedChannel(b, a, ceiling), a);
}
__attribute__((overloadable)) static SYRGBA32 makePremultipliedRGBA(int r, int g, int b, int a)
{
    return makePremultipliedRGBA(r, g, b, a, YES);
}

static SYRGBA32 premultipliedARGBFromColor(SYColor *color)
{
    if (color.isOpaque) {
        if (color.isExtended)
            
            return makeRGB(color.asExtended.red * 255, color.asExtended.green * 255, color.asExtended.blue * 255);
        return color.rgb;
    }
    
    if (color.isExtended)
        return makePremultipliedRGBA(color.asExtended.red * 255, color.asExtended.green * 255, color.asExtended.blue * 255, color.asExtended.alpha * 255);
    
    return makePremultipliedRGBA(color.red, color.green, color.blue, color.alpha);
}
static inline uint16_t multiplyBy255(uint16_t value)
{
    return (value << 8) - value;
}
static inline unsigned unpremultipliedChannel(unsigned c, unsigned a)
{
    return (multiplyBy255(c) + a - 1) / a;
}

static inline int colorFloatToRGBAByte(CGFloat f)
{
    // We use lroundf and 255 instead of nextafterf(256, 0) to match CG's rounding
    return std::max(0, std::min((int)(lroundf(255.0f * f)), 255));
}

static inline SYRGBA32 makeRGBA32FromFloats(CGFloat r, CGFloat g, CGFloat b, CGFloat a)
{
    return colorFloatToRGBAByte(a) << 24 | colorFloatToRGBAByte(r) << 16 | colorFloatToRGBAByte(g) << 8 | colorFloatToRGBAByte(b);
}

static inline SYRGBA32 makeRGBAFromCMYKA(CGFloat c, CGFloat m, CGFloat y, CGFloat k, CGFloat a)
{
    double colors = 1 - k;
    int r = (int)(nextafter(256, 0) * (colors * (1 - c)));
    int g = (int)(nextafter(256, 0) * (colors * (1 - m)));
    int b = (int)(nextafter(256, 0) * (colors * (1 - y)));
    return makeRGBA(r, g, b, (CGFloat)(nextafter(256, 0) * a));
}
static SYRGBA32 makeUnPremultipliedRGBA(int r, int g, int b, int a)
{
    return makeRGBA(unpremultipliedChannel(r, a), unpremultipliedChannel(g, a), unpremultipliedChannel(b, a), a);
}

static int blendComponent(int c, int a)
{
    // We use white.
    float alpha = a / 255.0f;
    int whiteBlend = 255 - a;
    c -= whiteBlend;
    return (int)(c / alpha);
}
static inline int blend(int from, int to, double progress)
{
    return (int)(lround((double)(from) + (double)(to - from) * progress));
}

// Hue is in the range 0-6, other args in 0-1.
static CGFloat calcHue(CGFloat temp1, CGFloat temp2, CGFloat hueVal)
{
    if (hueVal < 0.0f)
        hueVal += 6.0f;
    else if (hueVal >= 6.0f)
        hueVal -= 6.0f;
    if (hueVal < 1.0f)
        return temp1 + (temp2 - temp1) * hueVal;
    if (hueVal < 3.0f)
        return temp2;
    if (hueVal < 4.0f)
        return temp1 + (temp2 - temp1) * (4.0f - hueVal);
    return temp1;
}

// Returns the number of characters which form a valid double
// and are terminated by the given terminator character
static int checkForValidDouble(const char* string, const char* end, const char terminator)
{
    int length = (int)(end - string);
    if (length < 1)
        return 0;

    bool decimalMarkSeen = false;
    int processedLength = 0;

    for (int i = 0; i < length; ++i) {
        if (string[i] == terminator) {
            processedLength = i;
            break;
        }
        if (!SYIsASCIIDigit(string[i])) {
            if (!decimalMarkSeen && string[i] == '.')
                decimalMarkSeen = true;
            else
                return 0;
        }
    }

    if (decimalMarkSeen && processedLength == 1)
        return 0;

    return processedLength;
}

static inline bool isTenthAlpha(const char* string, const int length)
{
    // "0.X"
    if (length == 3 && string[0] == '0' && string[1] == '.' && SYIsASCIIDigit(string[2]))
        return true;

    // ".X"
    if (length == 2 && string[0] == '.' && SYIsASCIIDigit(string[1]))
        return true;

    return false;
}

// Returns the number of characters consumed for parsing a valid double
// terminated by the given terminator character
static int parseDouble(const char* string, const char* end, const char terminator, double& value)
{
    int length = checkForValidDouble(string, end, terminator);
    if (!length)
        return 0;

    int position = 0;
    double localValue = 0;

    // The consumed characters here are guaranteed to be
    // ASCII digits with or without a decimal mark
    for (; position < length; ++position) {
        if (string[position] == '.')
            break;
        localValue = localValue * 10 + string[position] - '0';
    }

    if (++position == length) {
        value = localValue;
        return length;
    }

    double fraction = 0;
    double scale = 1;

    const double maxScale = 1000000;
    while (position < length && scale < maxScale) {
        fraction = fraction * 10 + string[position++] - '0';
        scale *= 10;
    }

    value = localValue + fraction / scale;
    return length;
}

static inline bool parseAlphaValue(const char*& string, const char* end, const char terminator, int& value)
{
    while (string != end && SYIsHTMLSpace(*string))
        string++;

    bool negative = false;

    if (string != end && *string == '-') {
        negative = true;
        string++;
    }

    value = 0;

    int length = (int)(end - string);
    if (length < 2)
        return false;

    if (string[length - 1] != terminator || !SYIsASCIIDigit(string[length - 2]))
        return false;

    if (string[0] != '0' && string[0] != '1' && string[0] != '.') {
        if (checkForValidDouble(string, end, terminator)) {
            value = negative ? 0 : 255;
            string = end;
            return true;
        }
        return false;
    }

    if (length == 2 && string[0] != '.') {
        value = !negative && string[0] == '1' ? 255 : 0;
        string = end;
        return true;
    }

    if (isTenthAlpha(string, length - 1)) {
        static const int tenthAlphaValues[] = { 0, 25, 51, 76, 102, 127, 153, 179, 204, 230 };
        value = negative ? 0 : tenthAlphaValues[string[length - 2] - '0'];
        string = end;
        return true;
    }

    double alpha = 0;
    if (!parseDouble(string, end, terminator, alpha))
        return false;
    value = negative ? 0 : static_cast<int>(alpha * nextafter(256.0, 0.0));
    string = end;
    return true;
}

// originally moved here from the CSS parser
static inline bool parseHexColorInternal(const char* name, unsigned length, SYRGBA32& rgb)
{
    if (length != 3 && length != 4 && length != 6 && length != 8)
        return false;
    unsigned value = 0;
    for (unsigned i = 0; i < length; ++i) {
        if (!SYIsASCIIHexDigit(name[i]))
            return false;
        value <<= 4;
        value |= SYToASCIIHexValue(name[i]);
    }
    if (length == 6) {
        rgb = 0xFF000000 | value;
        return true;
    }
    if (length == 8) {
        // We parsed the values into RGBA order, but the RGBA32 type
        // expects them to be in ARGB order, so we right rotate eight bits.
        rgb = value << 24 | value >> 8;
        return true;
    }
    if (length == 4) {
        // #abcd converts to ddaabbcc in RGBA32.
        rgb = (value & 0xF) << 28 | (value & 0xF) << 24
            | (value & 0xF000) << 8 | (value & 0xF000) << 4
            | (value & 0xF00) << 4 | (value & 0xF00)
            | (value & 0xF0) | (value & 0xF0) >> 4;
        return true;
    }
    // #abc converts to #aabbcc
    rgb = 0xFF000000
        | (value & 0xF00) << 12 | (value & 0xF00) << 8
        | (value & 0xF0) << 8 | (value & 0xF0) << 4
        | (value & 0xF) << 4 | (value & 0xF);
    return true;
}

// originally moved here from the CSS parser
template <typename CharacterType>
static inline bool parseNameColorInternal(const CharacterType* name, unsigned length, SYRGBA32& rgb) {
    const SY::SYNamedColor *namedColor = SY::findColor(name, length);
    if (namedColor) {
        rgb = namedColor->ARGBValue;
        return YES;
    }
    return false;
}
enum ColorValueType {
    UNKNOWN,
    NUMBER,
    PERCENTAGE
};

static bool parseColorIntOrPercentage(const char*& string, const char* end, const char terminator, ColorValueType& expect, int& value)
{
    const char* current = string;
    double localValue = 0;
    bool negative = false;
    while (current != end && SYIsHTMLSpace(*current))
        current++;
    if (current != end && *current == '-') {
        negative = true;
        current++;
    }
    if (current == end || !SYIsASCIIDigit(*current))
        return false;
    while (current != end && SYIsASCIIDigit(*current)) {
        double newValue = localValue * 10 + *current++ - '0';
        if (newValue >= 255) {
            // Clamp values at 255.
            localValue = 255;
            while (current != end && SYIsASCIIDigit(*current))
                ++current;
            break;
        }
        localValue = newValue;
    }

    if (current == end)
        return false;

    if (expect == NUMBER && (*current == '.' || *current == '%'))
        return false;

    if (*current == '.') {
        // We already parsed the integral part, try to parse
        // the fraction part of the percentage value.
        double percentage = 0;
        int numCharactersParsed = parseDouble(current, end, '%', percentage);
        if (!numCharactersParsed)
            return false;
        current += numCharactersParsed;
        if (*current != '%')
            return false;
        localValue += percentage;
    }

    if (expect == PERCENTAGE && *current != '%')
        return false;

    if (*current == '%') {
        expect = PERCENTAGE;
        localValue = localValue / 100.0 * 256.0;
        // Clamp values at 255 for percentages over 100%
        if (localValue > 255)
            localValue = 255;
        current++;
    } else {
        expect = NUMBER;
    }

    while (current != end && SYIsHTMLSpace(*current))
        current++;
    if (current == end || *current++ != terminator)
        return false;
    // Clamp negative values at zero.
    value = negative ? 0 : static_cast<int>(localValue);
    string = current;
    return true;
}
static inline bool mightBeRGB(const char* characters, unsigned length)
{
    if (length < 4)
        return false;
    return characters[3] == '('
        && SYIsASCIIAlphaCaselessEqual(characters[0], 'r')
        && SYIsASCIIAlphaCaselessEqual(characters[1], 'g')
        && SYIsASCIIAlphaCaselessEqual(characters[2], 'b');
}

static inline bool mightBeRGBA(const char* characters, unsigned length)
{
    if (length < 5)
        return false;
    return characters[4] == '('
        && SYIsASCIIAlphaCaselessEqual(characters[0], 'r')
        && SYIsASCIIAlphaCaselessEqual(characters[1], 'g')
        && SYIsASCIIAlphaCaselessEqual(characters[2], 'b')
        && SYIsASCIIAlphaCaselessEqual(characters[3], 'a');
}

static SYColor *parseColorInternal(const char* characters, unsigned length)
{
    ColorValueType expect = UNKNOWN;
    if (length >= 4 && characters[0] == '#') {
        SYRGBA32 rgb;
        if (parseHexColorInternal(characters + 1, length - 1, rgb))
            return [SYColor color:rgb];
    }

    if (length == 3 || length == 6) {
        SYRGBA32 rgb;
        if (parseHexColorInternal(characters, length, rgb)) {
            return [SYColor color:rgb];
        }
    }

    // Try rgba() syntax.
    if (mightBeRGBA(characters, length)) {
        const char* current = characters + 5;
        const char* end = characters + length;
        int red;
        int green;
        int blue;
        int alpha;

        if (!parseColorIntOrPercentage(current, end, ',', expect, red))
            return [SYColor new];
        if (!parseColorIntOrPercentage(current, end, ',', expect, green))
            return [SYColor new];
        if (!parseColorIntOrPercentage(current, end, ',', expect, blue))
            return [SYColor new];
        if (!parseAlphaValue(current, end, ')', alpha))
            return [SYColor new];;
        if (current != end)
            return [SYColor new];
        return [SYColor color:makeRGBA(red, green, blue, alpha)];
    }

    // Try rgb() syntax.
    if (mightBeRGB(characters, length)) {
        const char* current = characters + 4;
        const char* end = characters + length;
        int red;
        int green;
        int blue;
        if (!parseColorIntOrPercentage(current, end, ',', expect, red))
            return [SYColor new];
        if (!parseColorIntOrPercentage(current, end, ',', expect, green))
            return [SYColor new];
        if (!parseColorIntOrPercentage(current, end, ')', expect, blue))
            return [SYColor new];
        if (current != end)
            return [SYColor new];
        return [SYColor color:makeRGB(red, green, blue)];
    }

    return [SYColor new];
}

static SYColor *blend(SYColor *from, SYColor *to, CGFloat progress, BOOL blendPremultiplied) {
    // FIXME: ExtendedColor - needs to handle color spaces.
    // We need to preserve the state of the valid flag at the end of the animation
    if (progress == 1 && !to.isValid)
        return [SYColor new];
    
    if (blendPremultiplied) {
        // Contrary to the name, RGBA32 actually stores ARGB, so we can initialize Color directly from premultipliedARGBFromColor().
        // Also, premultipliedARGBFromColor() bails on zero alpha, so special-case that.
        SYColor *premultFrom = [SYColor color:from.alpha ?    premultipliedARGBFromColor(from) : 0];
        SYColor *premultTo = [SYColor color:to.alpha ? premultipliedARGBFromColor(to) : 0];
        SYColor *premultBlended = [SYColor colorWithIntRed:blend(premultFrom.red, premultTo.red, progress) green:blend(premultFrom.green, premultTo.green, progress) blue:blend(premultFrom.blue, premultTo.blue, progress) alpha:blend(premultFrom.alpha, premultTo.alpha, progress)];
        
        return [SYColor colorFromPremultipliedARGB:premultBlended.rgb];
    }
    return [SYColor colorWithIntRed:blend(from.red, to.red, progress) green:blend(from.green, to.green, progress) blue:blend(from.blue, to.blue, progress) alpha:blend(from.alpha, to.alpha, progress)];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _rgbaAndFlags = invalidRGBAColor;
    }
    return self;
}

+ (instancetype)colorWithUIColor:(UIColor *)color {
    return [self colorWithCGColor:color.CGColor];
}

+ (instancetype)colorWithCGColor:(CGColorRef)color
{
    SYColor *c = [SYColor new];
    if (!color) {
        c->_rgbaAndFlags = invalidRGBAColor;
        return c;
    }
    
    size_t numComponents = CGColorGetNumberOfComponents(color);
    const CGFloat* components = CGColorGetComponents(color);
    
    float r = 0;
    float g = 0;
    float b = 0;
    float a = 0;
    
    switch (numComponents) {
        case 2:
            r = g = b = components[0];
            a = components[1];
            break;
        case 4:
            r = components[0];
            g = components[1];
            b = components[2];
            a = components[3];
            break;
        default: ;
    }
    [c setRGB:makeRGBA(r * 255, g * 255, b * 255, a * 255)];
    return c;
}

+ (instancetype)color:(SYRGBA32)color
{
    SYColor *c = [SYColor new];
    [c setRGB:color];
   return c;
}

+ (instancetype)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha colorSpace:(SYColorSpace)colorSpace {
    SYColor *c = [SYColor new];

    // Zero the union, just in case a 32-bit system only assigns the
    // top 32 bits when copying the extendedColor pointer below.
    c->_rgbaAndFlags = 0;
    SYExtendedColor *extendedColor = [SYExtendedColor extendedColor:red g:green b:blue a:alpha colorSpace:colorSpace];
    c->_extendedColor = extendedColor;
    NSCParameterAssert(c.isExtended);
    return c;
}

+ (instancetype)colorWithIntRed:(int)red green:(int)green blue:(int)blue {
    SYColor *c = [SYColor new];
    [c setRGB:makeRGB(red, green, blue)];
    return c;
}

+ (instancetype)colorWithIntRed:(int)red green:(int)green blue:(int)blue alpha:(int)alpha {
    SYColor *c = [SYColor new];
    [c setRGB:makeRGBA(red, green, blue, alpha)];
    return c;
}

+ (instancetype)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    SYColor *c = [SYColor new];
    [c setRGB:makeRGBA32FromFloats(red, green, blue, alpha)];
    return c;
}

+ (instancetype)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha {
    SYColor *c = [SYColor new];
    [c setRGB:makeRGBAFromCMYKA(cyan, magenta, yellow, black, alpha)];
    return c;
}

// Explanation of this algorithm can be found in the CSS Color 4 Module
// specification at https://drafts.csswg.org/css-color-4/#hsl-to-rgb with
// further explanation available at http://en.wikipedia.org/wiki/HSL_color_space
+ (instancetype)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha {
    
    // Convert back to RGB.
    if (!saturation) {
        return [SYColor colorWithRed:brightness green:brightness blue:brightness alpha:alpha];
    }
    
    CGFloat temp2 = brightness <= 0.5f ? brightness * (1.0f + saturation) : brightness + saturation - brightness * saturation;
    CGFloat temp1 = 2.0f * brightness - temp2;
    
    hue *= 6.0f; // calcHue() wants hue in the 0-6 range.
    return [SYColor colorWithRed:calcHue(temp1, temp2, hue + 2.0f) green:calcHue(temp1, temp2, hue) blue:calcHue(temp1, temp2, hue - 2.0f) alpha:alpha];
}

+ (SYColor *)colorWithString:(NSString *)string {
    if (!string.length) {
        return [SYColor new];
    }
    unsigned length = (unsigned)string.length;
    const char *chars = string.lowercaseString.UTF8String;
    SYRGBA32 rgb;
    if (parseNameColorInternal(chars, length, rgb)) {
        return [SYColor color:rgb];
    }
    return parseColorInternal(chars, length);
}

+ (int)differenceSquared:(SYColor *)c1 color2:(SYColor *)c2 {
    // This is assuming that the colors are in the same colorspace.
    // This should probably return a floating point number, but many of the call
    // sites have picked comparison values based on feel. We'd need to break out
    // our logarithm tables to change them
    int c1Red = c1.isExtended ? c1.asExtended.red * 255 : c1.red;
    int c1Green = c1.isExtended ? c1.asExtended.green * 255 : c1.green;
    int c1Blue = c1.isExtended ? c1.asExtended.blue * 255 : c1.blue;
    int c2Red = c2.isExtended ? c2.asExtended.red * 255 : c2.red;
    int c2Green = c2.isExtended ? c2.asExtended.green * 255 : c2.green;
    int c2Blue = c2.isExtended ? c2.asExtended.blue * 255 : c2.blue;
    int dR = c1Red - c2Red;
    int dG = c1Green - c2Green;
    int dB = c1Blue - c2Blue;
    return dR * dR + dG * dG + dB * dB;
}


- (instancetype)initWithUIColor:(UIColor *)color {
    return [self.class colorWithUIColor:color];
}

- (instancetype)initWithCGColor:(CGColorRef)color {
    return [self.class colorWithCGColor:color];
}

- (instancetype)initWithRGBA:(SYRGBA32)color {
    return [self.class color:color];
}

- (instancetype)initWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue
                      alpha:(CGFloat)alpha {
    return [self.class colorWithRed:red green:green blue:blue alpha:alpha];
}

// This creates an ExtendedColor.
// If the colorSpace is sRGB and the values can all be
// converted exactly to integers, we should make a normal Color.
- (instancetype)initWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue
                       alpha:(CGFloat)alpha
                 colorSpace:(SYColorSpace)colorSpace {
    return [self.class colorWithRed:red green:green blue:blue alpha:alpha colorSpace:colorSpace];
}

- (instancetype)initWithIntRed:(int)red
                          green:(int)green
                          blue:(int)blue {
    return [self.class colorWithIntRed:red green:green blue:blue];
}

- (instancetype)initWithIntRed:(int)red
                          green:(int)green
                           blue:(int)blue
                         alpha:(int)alpha {
    return [self.class colorWithIntRed:red green:green blue:blue alpha:alpha];
}

// Creates a new color from the specific CMYK and alpha values.
- (instancetype)initWithCyan:(CGFloat)cyan
                      magenta:(CGFloat)magenta
                       yellow:(CGFloat)yellow
                        black:(CGFloat)black
                       alpha:(CGFloat)alpha {
    return [self.class colorWithCyan:cyan magenta:magenta yellow:yellow black:black alpha:alpha];
}

- (instancetype)initWithHue:(CGFloat)hue
                  saturation:(CGFloat)saturation
                  brightness:(CGFloat)brightness
                      alpha:(CGFloat)alpha {
    return [self.class colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}


+ (SYColor *)transparent
{
    return [self color:SYColorTransparent];
}
+ (SYColor *)black
{
    return [self color:SYColorBlack];
}
+ (SYColor *)white
{
    return [self color:SYColorWhite];
}

- (SYExtendedColor *)asExtended
{
    return _extendedColor;
}
- (NSString *)hexString {
    return [NSString stringWithFormat:@"0x%lX",
    (unsigned long)self.rgb];
}
- (BOOL)isValid
{
    return [self isExtended] || (_rgbaAndFlags & validRGBAColorBit);
}
- (BOOL)isExtended
{
    return !(_rgbaAndFlags & invalidRGBAColor);
}
- (void)setRGB:(SYRGBA32)rgb
{
    _rgbaAndFlags = (uint64_t)(rgb) << 32;
    [self tagAsValid];
}
- (SYColor *)dark
{
    // Hardcode this common case for speed.
    if (self.rgb == SYColorWhite)
        return [SYColor color:SYColordDarkenedWhite];
    
    const CGFloat scaleFactor = nextafterf(256.0f, 0.0f);
    CGFloat r, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    
    CGFloat v = std::max(r, std::max(g, b));
    CGFloat multiplier = std::max(0.0, (v - 0.33) / v);
    return [SYColor colorWithIntRed:multiplier * r * scaleFactor green:multiplier * g * scaleFactor blue:multiplier * b * scaleFactor alpha:self.alpha];
}
- (SYColor *)light
{
    // Hardcode this common case for speed.
    if (self.rgb == SYColorBlack)
        return [SYColor color:SYLightenedBlack];
    
    const CGFloat scaleFactor = nextafterf(256.0f, 0.0f);

    CGFloat r, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    
    CGFloat v = MAX(r, MAX(g, b));
    if (v == 0.0f)
        return [SYColor colorWithIntRed:0x54 green:0x54 blue:0x54 alpha:self.alpha];
        // Lightened black with alpha.
    CGFloat multiplier = std::min(1.0, v + 0.33) / v;
    return [SYColor colorWithIntRed:(int)(multiplier * r * scaleFactor) green:(int)(multiplier * g * scaleFactor) blue:(int)(multiplier * b * scaleFactor) alpha:self.alpha];
}

- (BOOL)isDark {
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    CGFloat largestNonAlphaChannel = std::max(red, std::max(green, blue));
    return alpha > 0.5 && largestNonAlphaChannel < 0.5;
}

- (BOOL)getRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha
{
    *red = self.red / 255.0;
    *green = self.green / 255.0;
    *blue = self.blue / 255.0;
    *alpha = self.alpha / 255.0;
    return self.isValid;
}

- (BOOL)getHue:(CGFloat *)hue saturation:(CGFloat *)saturation brightness:(CGFloat *)brightness alpha:(CGFloat *)alpha {
    // http://en.wikipedia.org/wiki/HSL_color_space. This is a direct copy of
    // the algorithm therein, although it's 360^o based and we end up wanting
    // [0...6) based. It's clearer if we stick to 360^o until the end.
    CGFloat r = (CGFloat)(self.red) / 255.0;
    CGFloat g = (CGFloat)(self.green) / 255.0;
    CGFloat b = (CGFloat)(self.blue) / 255.0;
    *alpha = (CGFloat)(self.alpha) / 255.0;

    CGFloat max = std::max(std::max(r, g), b);
    CGFloat min = std::min(std::min(r, g), b);
    CGFloat chroma = max - min;

    if (!chroma)
        *hue = 0;
    else if (max == r)
        *hue = (60.0f * ((g - b) / chroma)) + 360.0f;
    else if (max == g)
        *hue = (60.0f * ((b - r) / chroma)) + 120.0f;
    else
        *hue = (60.0f * ((r - g) / chroma)) + 240.0f;

    if (*hue >= 360.0f)
        *hue -= 360.0f;

    *hue /= 360.0f;

    *brightness = 0.5f * (max + min);
    if (!chroma)
        *saturation = 0;
    else if (*brightness <= 0.5f)
        *saturation = (chroma / (max + min));
    else
        *saturation = (chroma / (2.0f - (max + min)));
    return self.isValid;
}

- (BOOL)getHue:(CGFloat *)hue saturation:(CGFloat *)saturation value:(CGFloat *)value  alpha:(CGFloat *)alpha  {
    CGFloat r = (CGFloat)(self.red) / 255.0;
    CGFloat g = (CGFloat)(self.green) / 255.0;
    CGFloat b = (CGFloat)(self.blue) / 255.0;
    *alpha = (CGFloat)(self.alpha) / 255.0;

    CGFloat max = std::max(std::max(r, g), b);
    CGFloat min = std::min(std::min(r, g), b);
    CGFloat chroma = max - min;

    if (!chroma)
        *hue = 0.0;
    else if (max == r)
        *hue = (60.0 * ((g - b) / chroma)) + 360.0;
    else if (max == g)
        *hue = (60.0 * ((b - r) / chroma)) + 120.0;
    else
        *hue = (60.0 * ((r - g) / chroma)) + 240.0;

    if (*hue >= 360.0)
        *hue -= 360.0;

    *hue /= 360.0;

    if (!max)
        *saturation = 0;
    else
        *saturation = chroma / max;

    *value = max;
    return self.isValid;
}

- (int)red { return redChannel([self rgb]); }
- (int)green { return greenChannel([self rgb]); }
- (int)blue { return blueChannel([self rgb]); }
- (int)alpha { return alphaChannel([self rgb]); }
- (SYRGBA32)rgb
{
    // We should ASSERT(!isExtended) here, or produce
    // an RGBA32 equivalent for an ExtendedColor. Ideally the former,
    // so we can audit all the rgb() call sites to handle extended.
    return (SYRGBA32)(_rgbaAndFlags >> 32);
}
- (void)tagAsValid
{
    _rgbaAndFlags |= validRGBAColor;
}

+ (BOOL)parseColorString:(NSString *)string rgb:(SYRGBA32 *)rgb {
    SYColor *color = [self colorWithString:string];
    *rgb = color.rgb;
    return color.isValid;
}

+ (SYColor *)colorFromPremultipliedARGB:(SYRGBA32)pixelColor
{
    int alpha = alphaChannel(pixelColor);
    if (alpha && alpha < 255)
        pixelColor = makeUnPremultipliedRGBA(redChannel(pixelColor), greenChannel(pixelColor), blueChannel(pixelColor), alpha);
    return [SYColor color:pixelColor];
}
- (CGColorRef)cachedCGColor
{
    if (!self.isExtended) {
        switch (self.rgb) {
            case SYColorTransparent: {
                CGColorRef transparentCGColor = SY::leakCGColor(self).CGColor;
                return transparentCGColor;
            }
            case SYColorBlack: {
                CGColorRef blackCGColor = SY::leakCGColor(self).CGColor;
                return blackCGColor;
            }
            case SYColorWhite: {
                CGColorRef whiteCGColor = SY::leakCGColor(self).CGColor;
                return whiteCGColor;
            }
        }
    }
    NSAssert(self.isExtended || self.rgb, @"");
    static dispatch_once_t onceToken;
    static SY::TinyLRUCache<SYColor *,UIColor *, 32> cache_;
    dispatch_once(&onceToken, ^{
        cache_ = SY::TinyLRUCache<SYColor *,UIColor *, 32>();
    });
    return cache_.get(self).CGColor;
}

const int cStartAlpha = 153; // 60%
const int cEndAlpha = 204; // 80%;
const int cAlphaIncrement = 17; // Increments in between.
- (SYColor *)blendWithWhite {
    // If the color contains alpha already, we leave it alone.
    if (!self.isOpaque)
        return self;

    SYColor *newColor;
    for (int alpha = cStartAlpha; alpha <= cEndAlpha; alpha += cAlphaIncrement) {
        // We have a solid color.  Convert to an equivalent color that looks the same when blended with white
        // at the current alpha.  Try using less transparency if the numbers end up being negative.
        int r = blendComponent(self.red, alpha);
        int g = blendComponent(self.green, alpha);
        int b = blendComponent(self.blue, alpha);
        
        newColor = [SYColor colorWithIntRed:r green:g blue:b alpha:alpha];

        if (r >= 0 && g >= 0 && b >= 0)
            break;
    }

    return newColor;
}
- (SYColor *)blend:(SYColor *)source {
    if (!self.isVisible || source.isOpaque)
        return source;
    
    if (!source.alpha)
        return self;
    
    int d = 255 * (self.alpha + source.alpha) - self.alpha * source.alpha;
    int a = d / 255;
    int r = (self.red * self.alpha * (255 - source.alpha) + 255 * source.alpha * source.red) / d;
    int g = (self.green * self.alpha * (255 - source.alpha) + 255 * source.alpha * source.green) / d;
    int b = (self.blue * self.alpha * (255 - source.alpha) + 255 * source.alpha * source.blue) / d;
    return [SYColor colorWithIntRed:r green:g blue:b alpha:a];
}

+ (SYColor *)blendFrom:(SYColor *)from to:(SYColor *)to  progress:(CGFloat)progress {
    return blend(from, to, progress, YES);
}

+ (SYColor *)blendFrom:(SYColor *)from to:(SYColor *)to  progress:(CGFloat)progress blendPremultiplied:(BOOL)blendPremultiplied {
    return blend(from, to, progress, blendPremultiplied);
}

- (SYColor *)blend:(SYColor *)to progress:(CGFloat)progress {
    return blend(self, to, progress, YES);
}

- (SYColor *)blend:(SYColor *)to progress:(CGFloat)progress blendPremultiplied:(BOOL)blendPremultiplied {
    return blend(self, to, progress, blendPremultiplied);
}

- (BOOL)isOpaque
{
    return [self isValid] && (self.isExtended ? [self asExtended].alpha == 1.0 : [self alpha] == 255);
}
- (BOOL)isVisible
{
    return self.isValid && [self isExtended] ? [self asExtended].alpha > 0.0 : [self alpha] > 0;
}


- (SYColor *)colorWithAlphaMultipliedBy:(CGFloat)amount {
    CGFloat newAlpha = amount * (self.isExtended ? _extendedColor.alpha : (CGFloat)(self.alpha) / 255);
    return [self colorWithAlpha:newAlpha];
}
- (SYColor *)colorWithAlpha:(CGFloat)alpha
{
    if ([self isExtended])
        return [SYColor colorWithRed:_extendedColor.red green:_extendedColor.green blue:_extendedColor.blue alpha:_extendedColor.alpha colorSpace:_extendedColor.colorSpace];
    
    int newAlpha = alpha * 255;
    SYColor *result = [SYColor colorWithIntRed:self.red green:self.green blue:self.blue alpha:newAlpha];
    return result;
}
- (BOOL)isEqual:(SYColor *)other
{
    return self->_rgbaAndFlags ==  other->_rgbaAndFlags;
}
- (CGFloat)alphaAsCGFloat
{
    return [self isExtended] ? [self asExtended].alpha : (CGFloat)(alphaChannel(self.rgb)) / 255;
}
- (SYColor *)opaqueColor
{
    return [self colorWithAlpha:1.0f];
}

// his will give different values for ExtendedColors that
// should be identical, since the respective pointer will be different.
- (NSUInteger)hash {
    uint64_t key = _rgbaAndFlags;
    key += ~(key << 32);
    key ^= (key >> 22);
    key += ~(key << 13);
    key ^= (key >> 8);
    key += (key << 3);
    key ^= (key >> 15);
    key += ~(key << 27);
    key ^= (key >> 31);
    return (NSUInteger)key;
}
- (NSString *)description {
    if (self.isExtended) {
        return [self asExtended].description;
    }
    NSMutableString *builder = [NSMutableString stringWithCapacity:28];
    BOOL colorHasAlpha = !self.isOpaque;
    if (colorHasAlpha)
        [builder appendString:@"rgba("];
    else
        [builder appendString:@"rgb("];
    [builder appendFormat:@"%d", self.red];
    [builder appendString:@", "];

    [builder appendFormat:@"%d", self.green];
    [builder appendString:@", "];

    [builder appendFormat:@"%d", self.blue];

    if (colorHasAlpha) {
        [builder appendString:@", "];
        [builder appendFormat:@"%f", self.alpha / 255.0f];
    }
    [builder appendString:@")"];

    return builder;
}
@end
