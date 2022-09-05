#pragma once

#include <string.h>

#include <Foundation/NSString.h>
#include <AppKit/NSWindow.h>

#include "utilities/common.h"

#define block __block

extern NSWindow *window;
extern NSApplication *application;

@interface NSString(StringExtensions)

+ (NSString *)fromCString: (const char *)cstr;
- (const char *)copyToCString: (char *)buffer length: (size_t)len;

@end

@implementation NSString(StringExtensions)

+ (NSString *)fromCString: (const char *)cstr
{ return [NSString stringWithCString: cstr encoding: NSUTF8StringEncoding]; }

- (const char *)copyToCString: (char *)buf length: (size_t)len
{ return strncpy(buf, [self cStringUsingEncoding: NSUTF8StringEncoding], len); }

@end
