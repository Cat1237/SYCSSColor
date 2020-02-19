//
//  SYCSSColorBase.h
//  SYCSSColor
//
//  Created by Tino on 2020/2/19.
//  Copyright © 2020 Tino. All rights reserved.
//

#pragma once

#import <Foundation/Foundation.h>


FOUNDATION_EXTERN BOOL SYIsHTMLSpace(unsigned short character);

FOUNDATION_EXTERN unsigned short SYToASCIILowerUnchecked(unsigned short character);

FOUNDATION_EXTERN BOOL SYIsASCIIDigit(unsigned short character);

FOUNDATION_EXTERN BOOL SYIsASCIIHexDigit(unsigned short character);

FOUNDATION_EXTERN BOOL SYIsASCIIAlphaCaselessEqual(unsigned short inputCharacter, char expectedASCIILowercaseLetter);

FOUNDATION_EXTERN uint8_t SYToASCIIHexValue(unsigned short character);
