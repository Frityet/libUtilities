--Config:
local packages = {

}

local sanitizers = { "address", "leak", "undefined" }

local cflags = {
    release = {},
    debug = {
        "-Wno-unused-function", "-Wno-unused-parameter", "-Wno-unused-variable",
        "-Wno-gnu-designator"
    },
    regular = {
        "-Wall", "-Wextra", "-Werror"
    }
}

local ldflags = {
    release = {},
    debug = {},
    regular = {}
}

set_languages {
    "gnu2x"
}

add_rules("mode.debug", "mode.release")

add_requires(packages)

target("Tests")
do
    set_kind("binary")
    add_packages(packages)

    add_files("src/**.c")
    add_headerfiles("src/**.h")

    add_includedirs("src/", { public = true })

    add_cflags(cflags.regular)
    add_ldflags(ldflags.regular)

    if is_mode("debug") then
        add_cflags(cflags.debug)
        add_ldflags(ldflags.debug)

        for _, v in ipairs(sanitizers) do
            add_cxflags("-fsanitize=" .. v)
            add_ldflags("-fsanitize=" .. v)
        end

        add_defines("PROJECT_DEBUG")
    elseif is_mode("release") then
        add_cflags(cflags.release)
        add_ldflags(ldflags.release)
    end

	if is_plat("macosx") then
    	add_frameworks("Cocoa")

--         add_packages("libx11", "libxaw", "libxt")
    elseif is_plat("linux") then
--     	add_packages("gtk")
    else
--     	add_packages("libx11", "libxaw", "libxt")
    end

	add_deps("Utilities")
end
target_end()
