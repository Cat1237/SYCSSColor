//
//  SYHashTools.h
//  SYCSSColor
//
//  Created by Tino on 2018/10/10.
//  Copyright © 2018 Tino. All rights reserved.
//

#pragma once

#ifndef SYHashTools_h
#define SYHashTools_h

namespace SY {
    
    struct SYNamedColor {
        const char* name;
        unsigned ARGBValue;
    };
    
    const SYNamedColor *findColor(const char* str, unsigned len);
} // namespace SY

#endif /* SYHashTools_h */
