#include "utilities/dialogues/message.h"

#include <X11/Xaw/XawInit.h>

static Widget window = NULL;
static XtAppContext context = NULL;

int utilities_MessageDialogue_show(const struct utilities_MessageDialogue *messagebox, int *out)
{
    int argc = 0;
    char *argv[] = { NULL };
    if (window == NULL) window = XtOpenApplication(&context,
                                                   "net.frityet.libutilities.x11.messagebox",
                                                   NULL, 0,
                                                   &argc, argv,
                                                   NULL,
                                                   NULL,
                                                   NULL, 0);

    return 0;
}
