
SYCSSColor
==============

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/wangson1237/SYCSSColor/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/SYCSSColor.svg?style=flat)](http://cocoapods.org/pods/SYCSSColor)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/p/SYCSSColor.svg?style=flat)](http://cocoadocs.org/docsets/SYCSSColor)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS10+-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;
[![Build Status](https://github.com/wangson1237/SYCSSColor/workflows/build/badge.svg?branch=master)](https://github.com/wangson1237/SYCSSColor/actions?query=workflow%3Abuild)

SYCSSColor is a remarkably convenient  library for translated CSS color to CGColor or UIColor. It provides you a chance to use CSS color in your next app.

Base on CSS color for iOS.

## Features

- [x] All CSS Color Support
- [x] LRUCache to stored CGColor
- [x] Use  `gperf` to  generate a perfect hash function to store NameColor
- [x] Support ColorSpaceSRGB, ColorSpaceLinearRGB, ColorSpaceDisplayP3.
- [x] Support CMYK, HSL, HSV
- [x] Support blend color

### SYCSSColor

The simplest use-case to translated CSS color to CGColor or UIColor:

#### The string has prefix hash(#): 
```oc
NSString *fuchsiaString = @"#FF00FF";
SYColor *fuchsia = [SYColor colorWithString: fuchsiaString];
//   fuchsia.red == 255;
//   fuchsia.green == 0;
//   fuchsia.blue == 255;
```

#### The string is name color, like " fuchsia": 
```oc
SYColor *fuchsia = [SYColor colorWithString: @"fuchsia"];
//   fuchsia.red == 255;
//   fuchsia.green == 0;
//   fuchsia.blue == 255;
```

#### The string is rgb( ) syntax or rgba( ), it's  support percent(%): 
```oc

NSString *fuchsiaRgbString = @"rgb(100%, 0%, 100%)";
NSString *fuchsiaRgbPercentString = @"rgb(255, 0, 255)";
NSString *fuchsiaRgbaString = @"rgba(255, 0, 255, 0.8)";

SYColor *fuchsiaRgb = [SYColor colorWithString:@"fuchsia"];

SYColor *fuchsiaRgbPercent = [SYColor colorWithString:@"fuchsia"];

SYColor *fuchsiaRgba = [SYColor colorWithString:@"fuchsia"];

//   fuchsia.red == 255;
//   fuchsia.green == 0;
//   fuchsia.blue == 255;

```

### Blend Color

When two color blend  which One of them must not opaque:

```oc
SYColor *red = [SYColor colorWithString:@"red"];
SYColor *green = [SYColor colorWithString:@"green"];
SYColor *blendColor = [SYColor blendFrom:red to:green progress:0.9];

// blendColor.red == 26;
// blendColor.green == 115;
// blendColor.blue == 0;
```

### CachedCGColor

A `CachedCGColor` is  stored in `TinyLRUCache` to speed up.





Installation
==============

### CocoaPods

1. Add `pod 'SYCSSColor'` to your Podfile.
2. Run `pod install` or `pod update`.
3. Import \<SYCSSColor/SYCSSColor.h\>.

Requirements
==============
This library requires `iOS 10.0+` and `Xcode 11.0+`.

License
==============
SYCSSColor is provided under the MIT license. See LICENSE file for details.
