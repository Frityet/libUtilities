#pragma once

#include <string.h>

#include <Foundation/NSString.h>
#include <AppKit/NSWindow.h>

#include "utilities/common.h"

#define block __block

extern NSWindow *window;
extern NSApplication *application;

static NSString *cstring_to_nsstring(const char *str)
{
	return [NSString stringWithCString: str
							   encoding: NSUTF8StringEncoding];
}

static char *nsstring_to_cstring(char *cstr, NSString *nsstr, size_t len)
{
	return strncpy(cstr, [nsstr cStringUsingEncoding: NSUTF8StringEncoding], len);
}
