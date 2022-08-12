#include <AppKit/NSWindow.h>

NSWindow *window = nil;
NSApplication *application = nil;

__attribute__((constructor(0)))
static void initialise()
{
    if (window != nil && application != nil) return;
    application = NSApplication.sharedApplication;
	window = [[NSWindow alloc] initWithContentRect: (NSRect){0} 
									   styleMask: NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable | NSWindowStyleMaskMiniaturizable
									   backing: NSBackingStoreBuffered 
									   defer: false];

	window.title = @"libUtilities - This window should be hidden!";
	[window becomeMainWindow];
}
