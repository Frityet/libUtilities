#if !defined(LIBUTILS_DIALOGUES_OPEN)
#define LIBUTILS_DIALOGUES_OPEN

#include "dialogue.h"

struct utilities_OpenDialogue {
	struct utilities_Dialogue window;

    bool file, folder;
	size_t filetype_count;
	const char **filetypes;
	bool select_many, show_hidden;
};

int utilities_OpenDialogue_show(const struct utilities_OpenDialogue *dialogue, utilities_Path_t paths[], size_t outc);

#endif
