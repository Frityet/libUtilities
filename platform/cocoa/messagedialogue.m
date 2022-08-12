
#include "utilities/dialogues/message.h"

#include <Cocoa/Cocoa.h>
#include <Foundation/NSString.h>

#include "common.m.h"

static void initalise()
{
	[NSApplication sharedApplication];
}

int utilities_MessageDialogue_show(const struct utilities_MessageDialogue *messagebox, int *out)
{
	NSAlert *alert = [[NSAlert alloc] init];
    alert.messageText = cstring_to_nsstring(messagebox->window.title);
    alert.informativeText = cstring_to_nsstring(messagebox->message);

    if (messagebox->options == NULL || messagebox->option_count < 1) {
		[alert addButtonWithTitle:@"Yes"];
		[alert addButtonWithTitle:@"No"];
	} else {
		for (int i = 0; i < messagebox->option_count; i++)
			[alert addButtonWithTitle: cstring_to_nsstring(messagebox->options[i])];
	}

    *out = (int)([alert runModal] - 1000);
	return 0;
}
