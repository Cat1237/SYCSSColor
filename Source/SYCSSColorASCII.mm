//
//  SYCSSColorBase.m
//  SYCSSColor
//
//  Created by Tino on 2020/2/19.
//  Copyright © 2020 Tino. All rights reserved.
//

#import <SYCSSColor/SYCSSColorASCII.h>


// Inline implementations of some of the functions declared above.

BOOL SYIsHTMLSpace(unsigned short character)
{
    // Histogram from Apple's page load test combined with some ad hoc broTinoing some other test suites.
    //
    //     82%: 216330 non-space characters, all > U+0020
    //     11%:  30017 plain space characters, U+0020
    //      5%:  12099 newline characters, U+000A
    //      2%:   5346 tab characters, U+0009
    //
    // No other characters seen. No U+000C or U+000D, and no other control characters.
    // Accordingly, we check for non-spaces first, then space, then newline, then tab, then the other characters.

    return character <= ' ' && (character == ' ' || character == '\n' || character == '\t' || character == '\r' || character == '\f');
}
unsigned short SYToASCIILowerUnchecked(unsigned short character)
{
    // This function can be used for comparing any input character
    // to a lowercase English character. The isASCIIAlphaCaselessEqual
    // below should be used for regular comparison of ASCII alpha
    // characters, but switch statements in CSS tokenizer instead make
    // direct use of this function.
    return character | 0x20;
}
BOOL SYIsASCIIDigit(unsigned short character)
{
    return character >= '0' && character <= '9';
}
BOOL SYIsASCIIHexDigit(unsigned short character)
{
    return SYIsASCIIDigit(character) || (SYToASCIILowerUnchecked(character) >= 'a' && SYToASCIILowerUnchecked(character) <= 'f');
}

BOOL SYIsASCIIAlphaCaselessEqual(unsigned short inputCharacter, char expectedASCIILowercaseLetter)
{
    // Name of this argument says this must be a lowercase letter, but it can actually be:
    //   - a lowercase letter
    //   - a numeric digit
    //   - a space
    //   - punctuation in the range 0x21-0x3F, including "-", "/", and "+"
    // It cannot be:
    //   - an uppercase letter
    //   - a non-ASCII character
    //   - other punctuation, such as underscore and backslash
    //   - a control character such as "\n"
    // FIXME: Would be nice to make both the function name and expectedASCIILowercaseLetter argument name clearer.
    assert(SYToASCIILowerUnchecked(expectedASCIILowercaseLetter) == expectedASCIILowercaseLetter);
    return SYToASCIILowerUnchecked(inputCharacter) == expectedASCIILowercaseLetter;
}


uint8_t SYToASCIIHexValue(unsigned short character)
{
   assert(SYIsASCIIHexDigit(character));
   return character < 'A' ? character - '0' : (character - 'A' + 10) & 0xF;
}
