//
//  SYCSSColorTests.m
//  SYCSSColorTests
//
//  Created by Tino on 2020/2/19.
//  Copyright © 2020 Tino. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SYCSSColor/SYColor.h>
@interface SYCSSColorTests : XCTestCase

@end

@implementation SYCSSColorTests


- (void)testExample {
    NSString *fuchsiaHex = @"#FF00FF";
    SYColor *fuchsia = [SYColor colorWithString: fuchsiaHex];
    XCTAssertEqual(fuchsia.red, 255);
    XCTAssertEqual(fuchsia.green, 0);
    XCTAssertEqual(fuchsia.blue, 255);
    
    fuchsia = nil;
    fuchsiaHex = [fuchsiaHex substringFromIndex:1];
    fuchsia = [SYColor colorWithString: fuchsiaHex];
    XCTAssertTrue(fuchsia.isValid);
    XCTAssertEqual(fuchsia.red, 255);
    XCTAssertEqual(fuchsia.green, 0);
    XCTAssertEqual(fuchsia.blue, 255);
    
    fuchsia = nil;
    fuchsia = [SYColor colorWithString:@"fuchsia"];
    XCTAssertTrue(fuchsia.isValid);
    XCTAssertEqual(fuchsia.red, 255);
    XCTAssertEqual(fuchsia.green, 0);
    XCTAssertEqual(fuchsia.blue, 255);
    
    fuchsia = nil;
    NSString *fuchsiaRGBPercent = @"rgb(100%, 0%, 100%)";
    fuchsia = [SYColor colorWithString: fuchsiaRGBPercent];
    XCTAssertTrue(fuchsia.isValid);
    XCTAssertEqual(fuchsia.red, 255);
    XCTAssertEqual(fuchsia.green, 0);
    XCTAssertEqual(fuchsia.blue, 255);
    
    fuchsia = nil;
    NSString *fuchsiaRGB = @"rgb(255, 0, 255)";
    fuchsia = [SYColor colorWithString: fuchsiaRGB];
    XCTAssertTrue(fuchsia.isValid);
    XCTAssertEqual(fuchsia.red, 255);
    XCTAssertEqual(fuchsia.green, 0);
    XCTAssertEqual(fuchsia.blue, 255);
    
    fuchsia = nil;
    NSString *fuchsiaRGBA = @"rgba(255, 0, 255, 0.8)";
    fuchsia = [SYColor colorWithString: fuchsiaRGBA];
    XCTAssertTrue(fuchsia.isValid);
    XCTAssertEqual(fuchsia.red, 255);
    XCTAssertEqual(fuchsia.green, 0);
    XCTAssertEqual(fuchsia.blue, 255);
    XCTAssertEqual(fuchsia.alpha, 204);

    SYColor *red = [SYColor colorWithString:@"red"];
    SYColor *green = [SYColor colorWithString:@"green"];
    SYColor *blendColor = [SYColor blendFrom:red to:green progress:0.9];
    NSLog(@"%@",blendColor);
}



@end
