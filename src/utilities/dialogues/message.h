#if !defined(LIBUTILS_DIALOGUES_MESSAGE)
#define LIBUTILS_DIALOGUES_MESSAGE

#include "dialogue.h"

#if defined (__cplusplus)
extern "C" {
#endif

struct utilities_MessageDialogue {
	struct utilities_Dialogue window;

	const char *message;

	size_t option_count;
	const char **options;
};


int utilities_MessageDialogue_show(const struct utilities_MessageDialogue *messagebox, int *out);

#if defined (__cplusplus)
}
#endif

#endif
