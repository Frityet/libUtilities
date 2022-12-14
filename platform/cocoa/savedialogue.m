#include "utilities/dialogues/save.h"

#include <AppKit/NSSavePanel.h>

#include "common.m.h"


int utilities_SaveDialogue_show(const struct utilities_SaveDialogue *dialogue, utilities_Path_t out)
{
    NSSavePanel *panel = NSSavePanel.savePanel;
    panel.title = [NSString fromCString: dialogue->window.title];
    panel.message = [NSString fromCString: dialogue->message];
    panel.canCreateDirectories = true;
    panel.allowsOtherFileTypes = (BOOL)(dialogue->filetypes == NULL);

    [panel makeKeyAndOrderFront: nil];

    if (dialogue->filetypes != NULL && dialogue->filetype_count > 0) {
        NSMutableArray<NSString *> *strs = [NSMutableArray arrayWithCapacity: dialogue->filetype_count];
        for (size_t i = 0; i < dialogue->filetype_count; i++)
            [strs addObject: [NSString fromCString: dialogue->filetypes[i]]];

        panel.allowedFileTypes = strs;
    }

    if ([panel runModal] != NSModalResponseOK) return 1;
    else {
        [panel.URL.absoluteString copyToCString: out length: PATH_MAX];
        return 0;
    }
}
