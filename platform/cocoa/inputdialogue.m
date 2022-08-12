#include "utilities/dialogues/input.h"

#include <AppKit/NSAlert.h>
#include <AppKit/NSTextField.h>

#include "common.m.h"

int utilities_InputDialogue_show(const struct utilities_InputDialogue *dialogue, char *out, size_t outc)
{
    NSAlert *alert = [[NSAlert alloc] init];
    alert.messageText = cstring_to_nsstring(dialogue->window.title);
    alert.informativeText = cstring_to_nsstring(dialogue->message);

    [alert addButtonWithTitle: dialogue->submit_text == NULL ? @"Submit" : cstring_to_nsstring(dialogue->submit_text)];

    NSTextField *input = [[NSTextField alloc] initWithFrame: NSMakeRect(0, 0, dialogue->size.x, dialogue->size.y)];
    [alert setAccessoryView: input];
    input.stringValue = dialogue->default_text == NULL ? @"" : cstring_to_nsstring(dialogue->default_text);

    long res = [alert runModal];
    if (res != NSAlertFirstButtonReturn) return 1;

    nsstring_to_cstring(out, input.stringValue, outc);
    return 0;
}
