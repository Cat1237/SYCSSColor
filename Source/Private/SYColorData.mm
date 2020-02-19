/* C++ code produced by gperf version 3.0.3 */
/* Command-line: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/gperf --key-positions='*' -D -s 2 --output-file=/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.mm /Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf  */

#if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
      && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
      && (')' == 41) && ('*' == 42) && ('+' == 43) && (',' == 44) \
      && ('-' == 45) && ('.' == 46) && ('/' == 47) && ('0' == 48) \
      && ('1' == 49) && ('2' == 50) && ('3' == 51) && ('4' == 52) \
      && ('5' == 53) && ('6' == 54) && ('7' == 55) && ('8' == 56) \
      && ('9' == 57) && (':' == 58) && (';' == 59) && ('<' == 60) \
      && ('=' == 61) && ('>' == 62) && ('?' == 63) && ('A' == 65) \
      && ('B' == 66) && ('C' == 67) && ('D' == 68) && ('E' == 69) \
      && ('F' == 70) && ('G' == 71) && ('H' == 72) && ('I' == 73) \
      && ('J' == 74) && ('K' == 75) && ('L' == 76) && ('M' == 77) \
      && ('N' == 78) && ('O' == 79) && ('P' == 80) && ('Q' == 81) \
      && ('R' == 82) && ('S' == 83) && ('T' == 84) && ('U' == 85) \
      && ('V' == 86) && ('W' == 87) && ('X' == 88) && ('Y' == 89) \
      && ('Z' == 90) && ('[' == 91) && ('\\' == 92) && (']' == 93) \
      && ('^' == 94) && ('_' == 95) && ('a' == 97) && ('b' == 98) \
      && ('c' == 99) && ('d' == 100) && ('e' == 101) && ('f' == 102) \
      && ('g' == 103) && ('h' == 104) && ('i' == 105) && ('j' == 106) \
      && ('k' == 107) && ('l' == 108) && ('m' == 109) && ('n' == 110) \
      && ('o' == 111) && ('p' == 112) && ('q' == 113) && ('r' == 114) \
      && ('s' == 115) && ('t' == 116) && ('u' == 117) && ('v' == 118) \
      && ('w' == 119) && ('x' == 120) && ('y' == 121) && ('z' == 122) \
      && ('{' == 123) && ('|' == 124) && ('}' == 125) && ('~' == 126))
/* The character set is not based on ISO-646.  */
#error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
#endif

#line 1 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"

#import <SYCSSColor/SYHashTools.h>
#import <string.h>

#if defined(__clang__)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wimplicit-fallthrough"
#endif

// Older versions of gperf like to use the `register` keyword.
#define register

namespace SY {
enum
  {
    TOTAL_KEYWORDS = 151,
    MIN_WORD_LENGTH = 3,
    MAX_WORD_LENGTH = 20,
    MIN_HASH_VALUE = 3,
    MAX_HASH_VALUE = 1055
  };

/* maximum key range = 1053, duplicates = 0 */

class ColorDataHash
{
private:
  static inline unsigned int colordata_hash_function (const char *str, unsigned int len);
public:
  static const struct SYNamedColor *findColorImpl (const char *str, unsigned int len);
};

inline unsigned int
ColorDataHash::colordata_hash_function (register const char *str, register unsigned int len)
{
  static const unsigned short asso_values[] =
    {
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056,    5,    0,  105,
         0,    0,   30,   40,   40,   10,    0,    0,   15,   60,
         0,    5,  255,   40,    0,   10,   15,  130,  300,  215,
         5,    0,    0, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
      1056, 1056, 1056, 1056, 1056, 1056, 1056
    };
  register unsigned int hval = len;

  switch (hval)
    {
      default:
        hval += asso_values[(unsigned char)str[19]];
      /*FALLTHROUGH*/
      case 19:
        hval += asso_values[(unsigned char)str[18]];
      /*FALLTHROUGH*/
      case 18:
        hval += asso_values[(unsigned char)str[17]];
      /*FALLTHROUGH*/
      case 17:
        hval += asso_values[(unsigned char)str[16]];
      /*FALLTHROUGH*/
      case 16:
        hval += asso_values[(unsigned char)str[15]];
      /*FALLTHROUGH*/
      case 15:
        hval += asso_values[(unsigned char)str[14]];
      /*FALLTHROUGH*/
      case 14:
        hval += asso_values[(unsigned char)str[13]];
      /*FALLTHROUGH*/
      case 13:
        hval += asso_values[(unsigned char)str[12]];
      /*FALLTHROUGH*/
      case 12:
        hval += asso_values[(unsigned char)str[11]];
      /*FALLTHROUGH*/
      case 11:
        hval += asso_values[(unsigned char)str[10]+1];
      /*FALLTHROUGH*/
      case 10:
        hval += asso_values[(unsigned char)str[9]];
      /*FALLTHROUGH*/
      case 9:
        hval += asso_values[(unsigned char)str[8]];
      /*FALLTHROUGH*/
      case 8:
        hval += asso_values[(unsigned char)str[7]];
      /*FALLTHROUGH*/
      case 7:
        hval += asso_values[(unsigned char)str[6]];
      /*FALLTHROUGH*/
      case 6:
        hval += asso_values[(unsigned char)str[5]];
      /*FALLTHROUGH*/
      case 5:
        hval += asso_values[(unsigned char)str[4]];
      /*FALLTHROUGH*/
      case 4:
        hval += asso_values[(unsigned char)str[3]];
      /*FALLTHROUGH*/
      case 3:
        hval += asso_values[(unsigned char)str[2]];
      /*FALLTHROUGH*/
      case 2:
        hval += asso_values[(unsigned char)str[1]];
      /*FALLTHROUGH*/
      case 1:
        hval += asso_values[(unsigned char)str[0]];
        break;
    }
  return hval;
}

static const struct SYNamedColor wordlist[] =
  {
#line 149 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"red", 0xffff0000},
#line 60 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkred", 0xff8b0000},
#line 166 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"tan", 0xffd2b48c},
#line 113 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"linen", 0xfffaf0e6},
#line 157 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"sienna", 0xffa0522d},
#line 87 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"indianred", 0xffcd5c5c},
#line 167 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"teal", 0xff008080},
#line 82 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"grey", 0xff808080},
#line 83 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"green", 0xff008000},
#line 81 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"gray", 0xff808080},
#line 53 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkgrey", 0xffa9a9a9},
#line 54 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkgreen", 0xff006400},
#line 33 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"beige", 0xfff5f5dc},
#line 134 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"orange", 0xffffa500},
#line 52 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkgray", 0xffa9a9a9},
#line 135 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"orangered", 0xffff4500},
#line 90 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"khaki", 0xfff0e68c},
#line 155 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"seagreen", 0xff2e8b57},
#line 79 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"gold", 0xffffd700},
#line 58 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkorange", 0xffff8c00},
#line 55 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkkhaki", 0xffbdb76b},
#line 88 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"indigo", 0xff4b0082},
#line 80 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"goldenrod", 0xffdaa520},
#line 115 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"maroon", 0xff800000},
#line 77 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"gainsboro", 0xffdcdcdc},
#line 111 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lime", 0xff00ff00},
#line 84 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"greenyellow", 0xffadff2f},
#line 51 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkgoldenrod", 0xffb8860b},
#line 162 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"slategrey", 0xff708090},
#line 161 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"slategray", 0xff708090},
#line 153 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"salmon", 0xfffa8072},
#line 62 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkseagreen", 0xff8fbc8f},
#line 156 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"seashell", 0xfffff5ee},
#line 61 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darksalmon", 0xffe9967a},
#line 169 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"tomato", 0xffff6347},
#line 168 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"thistle", 0xffd8bfd8},
#line 65 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkslategrey", 0xff2f4f4f},
#line 48 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"cyan", 0xff00ffff},
#line 75 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"forestgreen", 0xff228b22},
#line 71 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"dimgrey", 0xff696969},
#line 64 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkslategray", 0xff2f4f4f},
#line 127 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"mistyrose", 0xffffe4e1},
#line 70 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"dimgray", 0xff696969},
#line 50 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkcyan", 0xff008b8b},
#line 35 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"black", 0xff000000},
#line 114 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"magenta", 0xffff00ff},
#line 112 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"limegreen", 0xff32cd32},
#line 44 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"coral", 0xffff7f50},
#line 56 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkmagenta", 0xff8b008b},
#line 32 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"azure", 0xfff0ffff},
#line 37 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"blue", 0xff0000ff},
#line 131 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"oldlace", 0xfffdf5e6},
#line 46 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"cornsilk", 0xfffff8dc},
#line 49 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkblue", 0xff00008b},
#line 159 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"skyblue", 0xff87ceeb},
#line 73 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"firebrick", 0xffb22222},
#line 136 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"orchid", 0xffda70d6},
#line 100 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lightgrey", 0xffd3d3d3},
#line 101 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lightgreen", 0xff90ee90},
#line 110 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lightyellow", 0xffffffe0},
#line 99 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lightgray", 0xffd3d3d3},
#line 59 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkorchid", 0xff9932cc},
#line 151 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"royalblue", 0xff4169e1},
#line 30 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"aqua", 0xff00ffff},
#line 165 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"steelblue", 0xff4682b4},
#line 34 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"bisque", 0xffffe4c4},
#line 47 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"crimson", 0xffdc143c},
#line 160 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"slateblue", 0xff6a5acd},
#line 72 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"dodgerblue", 0xff1e90ff},
#line 36 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"blanchedalmond", 0xffffebcd},
#line 104 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lightseagreen", 0xff20b2aa},
#line 108 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lightslategrey", 0xff778899},
#line 107 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lightslategray", 0xff778899},
#line 39 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"brown", 0xffa52a2a},
#line 103 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lightsalmon", 0xffffa07a},
#line 163 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"snow", 0xfffffafa},
#line 97 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lightcyan", 0xffe0ffff},
#line 150 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"rosybrown", 0xffbc8f8f},
#line 154 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"sandybrown", 0xfff4a460},
#line 63 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkslateblue", 0xff483d8b},
#line 177 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"yellow", 0xffffff00},
#line 96 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lightcoral", 0xfff08080},
#line 126 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"mintcream", 0xfff5fffa},
#line 31 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"aquamarine", 0xff7fffd4},
#line 152 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"saddlebrown", 0xff8b4513},
#line 85 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"honeydew", 0xfff0fff0},
#line 144 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"pink", 0xffffc0cb},
#line 95 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lightblue", 0xffadd8e6},
#line 41 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"cadetblue", 0xff5f9ea0},
#line 174 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"wheat", 0xfff5deb3},
#line 93 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lawngreen", 0xff7cfc00},
#line 175 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"white", 0xffffffff},
#line 28 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"aliceblue", 0xfff0f8ff},
#line 43 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"chocolate", 0xffd2691e},
#line 178 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"yellowgreen", 0xff9acd32},
#line 128 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"moccasin", 0xffffe4b5},
#line 130 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"navy", 0xff000080},
#line 42 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"chartreuse", 0xff7fff00},
#line 89 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"ivory", 0xfffffff0},
#line 138 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"palegreen", 0xff98fb98},
#line 91 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lavender", 0xffe6e6fa},
#line 86 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"hotpink", 0xffff69b4},
#line 132 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"olive", 0xff808000},
#line 76 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"fuchsia", 0xffff00ff},
#line 120 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"mediumseagreen", 0xff3cb371},
#line 158 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"silver", 0xffc0c0c0},
#line 133 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"olivedrab", 0xff6b8e23},
#line 66 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkturquoise", 0xff00ced1},
#line 171 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"turquoise", 0xff40e0d0},
#line 172 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"violet", 0xffee82ee},
#line 173 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"violetred", 0xffd02090},
#line 67 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkviolet", 0xff9400d3},
#line 137 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"palegoldenrod", 0xffeee8aa},
#line 176 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"whitesmoke", 0xfff5f5f5},
#line 164 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"springgreen", 0xff00ff7f},
#line 40 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"burlywood", 0xffdeb887},
#line 143 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"peru", 0xffcd853f},
#line 74 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"floralwhite", 0xfffffaf0},
#line 102 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lightpink", 0xffffb6c1},
#line 57 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"darkolivegreen", 0xff556b2f},
#line 78 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"ghostwhite", 0xfff8f8ff},
#line 117 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"mediumblue", 0xff0000cd},
#line 118 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"mediumorchid", 0xffba55d3},
#line 109 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lightsteelblue", 0xffb0c4de},
#line 106 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lightslateblue", 0xff8470ff},
#line 170 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"transparent", 0x00000000},
#line 69 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"deepskyblue", 0xff00bfff},
#line 105 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lightskyblue", 0xff87cefa},
#line 98 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lightgoldenrodyellow", 0xfffafad2},
#line 145 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"plum", 0xffdda0dd},
#line 116 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"mediumaquamarine", 0xff66cdaa},
#line 121 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"mediumslateblue", 0xff7b68ee},
#line 38 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"blueviolet", 0xff8a2be2},
#line 125 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"midnightblue", 0xff191970},
#line 68 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"deeppink", 0xffff1493},
#line 94 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lemonchiffon", 0xfffffacd},
#line 29 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"antiquewhite", 0xfffaebd7},
#line 139 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"paleturquoise", 0xffafeeee},
#line 146 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"powderblue", 0xffb0e0e6},
#line 129 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"navajowhite", 0xffffdead},
#line 122 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"mediumspringgreen", 0xff00fa9a},
#line 45 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"cornflowerblue", 0xff6495ed},
#line 140 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"palevioletred", 0xffdb7093},
#line 124 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"mediumvioletred", 0xffc71585},
#line 147 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"purple", 0xff800080},
#line 148 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"rebeccapurple", 0xff663399},
#line 92 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"lavenderblush", 0xfffff0f5},
#line 123 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"mediumturquoise", 0xff48d1cc},
#line 142 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"peachpuff", 0xffffdab9},
#line 119 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"mediumpurple", 0xff9370db},
#line 141 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"
    {"papayawhip", 0xffffefd5}
  };

static const short lookup[] =
  {
     -1,  -1,  -1,   0,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,   1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,   2,  -1,  -1,  -1,  -1,  -1,  -1,
      3,   4,  -1,  -1,   5,  -1,  -1,  -1,  -1,   6,
     -1,  -1,  -1,  -1,   7,   8,  -1,  -1,  -1,   9,
     -1,  -1,  -1,  10,  11,  12,  13,  -1,  14,  15,
     16,  -1,  -1,  17,  18,  19,  -1,  -1,  -1,  20,
     -1,  21,  -1,  -1,  22,  -1,  -1,  -1,  -1,  -1,
     -1,  23,  -1,  -1,  24,  -1,  -1,  -1,  -1,  25,
     -1,  26,  -1,  27,  28,  -1,  -1,  -1,  -1,  29,
     -1,  30,  31,  32,  -1,  -1,  -1,  -1,  -1,  -1,
     33,  34,  35,  36,  37,  -1,  38,  39,  40,  41,
     -1,  -1,  42,  43,  -1,  -1,  -1,  -1,  -1,  -1,
     44,  -1,  45,  -1,  46,  47,  48,  -1,  -1,  -1,
     49,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  50,
     -1,  -1,  51,  52,  -1,  -1,  -1,  -1,  53,  -1,
     -1,  -1,  54,  -1,  55,  -1,  56,  -1,  -1,  57,
     58,  59,  -1,  -1,  60,  61,  -1,  -1,  -1,  62,
     -1,  -1,  -1,  -1,  63,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  64,  -1,  65,  66,  -1,  67,
     68,  -1,  -1,  -1,  69,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  70,  71,
     -1,  -1,  -1,  -1,  72,  73,  -1,  -1,  -1,  -1,
     -1,  74,  -1,  -1,  75,  -1,  -1,  -1,  -1,  76,
     -1,  -1,  -1,  -1,  77,  78,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  79,  -1,  -1,  80,  -1,  -1,  -1,
     81,  -1,  -1,  -1,  82,  83,  84,  -1,  85,  86,
     -1,  -1,  -1,  -1,  87,  -1,  -1,  -1,  -1,  88,
     89,  -1,  -1,  -1,  90,  91,  -1,  -1,  -1,  92,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  93,  -1,  94,  -1,  95,  96,
     -1,  -1,  -1,  -1,  -1,  97,  -1,  -1,  -1,  -1,
     98,  -1,  -1,  -1,  99,  -1,  -1,  -1, 100,  -1,
     -1,  -1, 101,  -1,  -1, 102,  -1, 103,  -1, 104,
     -1, 105,  -1,  -1, 106,  -1,  -1,  -1, 107, 108,
     -1, 109,  -1,  -1, 110,  -1,  -1,  -1,  -1,  -1,
    111,  -1,  -1, 112,  -1, 113,  -1,  -1,  -1,  -1,
     -1, 114,  -1,  -1,  -1,  -1,  -1,  -1,  -1, 115,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1, 116,
     -1, 117,  -1,  -1, 118,  -1,  -1,  -1,  -1, 119,
    120,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1, 121,  -1,  -1,  -1,  -1,
     -1,  -1, 122,  -1, 123,  -1,  -1,  -1,  -1, 124,
     -1, 125,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1, 126,  -1,  -1,  -1,  -1,  -1, 127,  -1,  -1,
    128,  -1,  -1,  -1, 129,  -1,  -1,  -1,  -1,  -1,
     -1, 130,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1, 131,  -1,  -1,  -1,  -1,
    132,  -1, 133,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1, 134,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1, 135,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1, 136,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1, 137,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
    138,  -1,  -1,  -1,  -1,  -1, 139, 140,  -1, 141,
     -1,  -1,  -1, 142,  -1,  -1,  -1,  -1,  -1,  -1,
    143,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1, 144,  -1,  -1,  -1,  -1,  -1,  -1, 145,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1, 146,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1, 147,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1, 148,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1, 149,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     -1,  -1,  -1,  -1,  -1, 150
  };

const struct SYNamedColor *
ColorDataHash::findColorImpl (register const char *str, register unsigned int len)
{
  if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
    {
      unsigned int key = colordata_hash_function (str, len);

      if (key <= MAX_HASH_VALUE)
        {
          register int index = lookup[key];

          if (index >= 0)
            {
              register const char *s = wordlist[index].name;

              if (*str == *s && !strncmp (str + 1, s + 1, len - 1) && s[len] == '\0')
                return &wordlist[index];
            }
        }
    }
  return 0;
}
#line 179 "/Users/ws/Documents/MyLib/SYCSSColorTest/Pods/../../SYCSSColor/Source/SYColorData.gperf"

const struct SYNamedColor* findColor(const char* str, unsigned int len)
{
    return ColorDataHash::findColorImpl(str, len);
}

} // namespace SY

#if defined(__clang__)
#pragma clang diagnostic pop
#endif
