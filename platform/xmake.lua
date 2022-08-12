--Config:
local packages = {
	"gtk+3",
	"libx11"
}

local cflags = {
    release = {},
    debug = {
        "-Wno-unused-function", "-Wno-unused-parameter", "-Wno-unused-variable"
    },
    regular = {
        "-Wall", "-Wextra", "-Werror", "-Wpedantic", "-ansi"
    }
}

local ldflags = {
    release = {},
    debug = {},
    regular = {}
}

set_languages {
    "c89",
	"cxx98"
}

add_rules("mode.debug", "mode.release")

add_requires(packages)

target("platform")
do
    set_kind("object")

	add_includedirs("../src")

	if is_plat("macosx") then
		add_files("cocoa/**.m")
		add_frameworks("Cocoa")
	elseif is_plat("linux") then
		add_files("gtk/**.c")
		add_packages("gtk")
	elseif is_plat("windows") then
		add_files("win32/**.c")
	else
		add_files("x11/**.c")
		add_packages("libx11")
	end

	add_cflags(cflags.regular)
    add_ldflags(ldflags.regular)

    if is_mode("debug") then
        add_cflags(cflags.debug)
        add_mflags(cflags.debug)
        add_ldflags(ldflags.debug)

        add_defines("PROJECT_DEBUG")
    elseif is_mode("release") then
        add_cflags(cflags.release)
        add_mflags(cflags.release)
        add_ldflags(ldflags.release)
    end
end
target_end()

