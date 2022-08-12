#if !defined(LIBUTILS_COMMON)
#define LIBUTILS_COMMON

#include <stddef.h>
#include <sys/syslimits.h>

#if !defined(bool)
#	if !defined(true) && !defined(false)
		typedef enum Boolean
#		if !defined(__STRICT_ANSI__) && (defined(__llvm__) && defined (__clang__))
		: _Bool
#		endif
		{
			true = 1,
			false = 0
		} bool;
#	else
	typedef unsigned char bool;
#	endif
#endif

typedef char utilities_Path_t[PATH_MAX];

struct utilities_Point {
    int x, y;
};

#endif
