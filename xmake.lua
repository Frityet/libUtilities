local sanitizers = { "address", "leak", "undefined" }

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
    "c89"
}

add_rules("mode.debug", "mode.release")

add_requires(packages)

includes("platform")

target("Utilities")
do
    set_kind("shared")
    add_packages(packages)

    add_headerfiles("src/**.h")

    add_includedirs("src/", { public = true })

    add_cflags(cflags.regular)
    add_ldflags(ldflags.regular)

    if is_mode("debug") then
        add_cflags(cflags.debug)
        add_ldflags(ldflags.debug)

        add_defines("PROJECT_DEBUG")
    elseif is_mode("release") then
        add_cflags(cflags.release)
        add_ldflags(ldflags.release)
    end

	if is_plat("macosx") then add_frameworks("Cocoa") end

	add_deps("platform")
end
target_end()

includes("tests")
