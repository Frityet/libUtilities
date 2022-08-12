#include "utilities/dialogues/open.h"

#include <AppKit/NSWindow.h>
#include <AppKit/NSOpenPanel.h>

#include "common.m.h"

int utilities_OpenDialogue_show(const struct utilities_OpenDialogue *dialogue, utilities_Path_t paths[], size_t outc)
{
	NSOpenPanel *panel = NSOpenPanel.openPanel;
	panel.title = cstring_to_nsstring(dialogue->window.title);

	panel.canChooseFiles = dialogue->file;
	panel.canChooseDirectories = dialogue->folder;
	panel.allowsMultipleSelection = dialogue->select_many;

    [panel makeKeyAndOrderFront: nil];

    if (dialogue->filetypes != NULL && dialogue->filetype_count > 0) {
		NSMutableArray<NSString *> *strs = [NSMutableArray arrayWithCapacity: dialogue->filetype_count];
		for (size_t i = 0; i < dialogue->filetype_count; i++)
			[strs addObject: cstring_to_nsstring(dialogue->filetypes[i])];

		panel.allowedFileTypes = strs;
	}

	NSModalResponse retc = [panel runModal];
	if (retc != NSModalResponseOK) {
		memset(paths, 0, outc * sizeof(char *));
		return 1;
	} else {
		NSArray<NSURL *> *urls = [panel URLs];
		for (size_t i = 0; i < [urls count] && i < outc; i++) 
			nsstring_to_cstring(paths[i], [urls[i] absoluteString], PATH_MAX);
		return 0;
	}
}
