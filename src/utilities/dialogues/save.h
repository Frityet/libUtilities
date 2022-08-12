#if !defined(LIBUTILS_DIALOGUES_SAVE)
#define LIBUTILS_DIALOGUES_SAVE

#include "dialogue.h"

struct utilities_SaveDialogue {
    struct utilities_Dialogue window;

    const char *message;

    size_t filetype_count;
    const char **filetypes;
};

int utilities_SaveDialogue_show(const struct utilities_SaveDialogue *dialogue, utilities_Path_t out);

#endif
