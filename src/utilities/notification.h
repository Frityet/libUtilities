#if !defined(LIBUTILS_NOTIFICATION)
#define LIBUTILS_NOTIFICATION

#include "common.h"

struct utilities_Notification {
    const char *title, *description;

    size_t option_count;
    const char **options;
};

int utilities_Notification_show(const struct utilities_Notification *notification, int *resp);

#endif
