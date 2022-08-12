#if !defined(LIBUTILS_DIALOGUES_INPUT)
#define LIBUTILS_DIALOGUES_INPUT

#include "dialogue.h"

struct utilities_InputDialogue {
    struct utilities_Dialogue window;

    const char *message, *submit_text, *default_text;
    struct utilities_Point size;
};

int utilities_InputDialogue_show(const struct utilities_InputDialogue *dialogue, char *out, size_t outc);

#endif
