#include "utilities/dialogues/input.h"

#include <AppKit/NSAlert.h>
#include <AppKit/NSTextField.h>


#include "common.m.h"

int utilities_InputDialogue_show(const struct utilities_InputDialogue *dialogue, char *out, size_t outc)
{
    NSAlert *alert = [[NSAlert alloc] init];
    alert.messageText = [NSString fromCString: dialogue->window.title];
    alert.informativeText = [NSString fromCString: dialogue->message];

    [alert addButtonWithTitle: dialogue->submit_text == NULL ? @"Submit" : [NSString fromCString: dialogue->submit_text]];

    NSTextField *input = [[NSTextField alloc] initWithFrame: NSMakeRect(0, 0, dialogue->size.x, dialogue->size.y)];
    [alert setAccessoryView: input];
    input.stringValue = dialogue->default_text == NULL ? @"" : [NSString fromCString: dialogue->default_text];

    long res = [alert runModal];
    if (res != NSAlertFirstButtonReturn) return 1;

    [input.stringValue copyToCString: out length: outc];
    
    return 0;
}
