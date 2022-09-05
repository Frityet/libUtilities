
#include "utilities/dialogues/message.h"

#include <Cocoa/Cocoa.h>
#include <Foundation/NSString.h>

#include "common.m.h"

int utilities_MessageDialogue_show(const struct utilities_MessageDialogue *messagebox, int *out)
{
	int tmp;
	if (out == NULL) out = &tmp;
	NSAlert *alert = [[NSAlert alloc] init];
    alert.messageText = [NSString fromCString: messagebox->window.title];
    alert.informativeText = [NSString fromCString: messagebox->message];

	/* For some reason, Cocao renders the buttons in reverse? */
    if (messagebox->options != NULL || messagebox->option_count > 0) {
		for (int i = messagebox->option_count; i > 0; i--)
			[alert addButtonWithTitle: [NSString fromCString: messagebox->options[i - 1]]];
	}

    *out = (int)([alert runModal] - 1000);
	return 0;
}
