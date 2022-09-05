package("libxforms")
    set_homepage("http://xforms-toolkit.org/")
    set_description("XForms Toolkit (\"Forms Library for X\")")

    set_urls("https://download.savannah.nongnu.org/releases/xforms/xforms-$(version).tar.gz")
    add_versions("1.2.4", "78cc6b07071bbeaa1f906e0a22d5e9980e48f8913577bc082d661afe5cb75696")

	add_deps("libx11", "libjpeg")

    add_configs("shared", {description = "Build shared library.", default = true, type = "boolean"})

    on_install("macosx", "linux", function (package)
        local configs = {
            "--sysconfdir=" .. package:installdir("etc"),
            "--localstatedir=" .. package:installdir("var"),
            "--disable-dependency-tracking",
            "--disable-silent-rules",
            "--enable-unix-transport",
            "--enable-tcp-transport",
            "--enable-ipv6",
            "--enable-local-transport",
            "--enable-loadable-i18n",
            "--enable-xthreads",
            "--enable-specs=no",
            "--with-extra-lib=/usr/local/lib/",
            "--with-extra-inc=/usr/local/include/"
        }
        table.insert(configs, "--enable-static=" .. (package:config("shared") and "no" or "yes"))
        table.insert(configs, "--enable-shared=" .. (package:config("shared") and "yes" or "no"))

        if package:config("pic") then
            table.insert(configs, "--with-pic")
        end
        import("package.tools.autoconf").install(package, configs)
    end)

    on_test(function (package)
        assert(package:has_cfuncs("fl_initialize", { includes = "forms.h" }))
    end)
package_end()

--Config:
local packages = {
	"gtk+3",
	-- "libx11",
	-- "libxaw",
	-- "libxt",
    -- "libxforms"
}

local cflags = {
    release = {},
    debug = {
        "-Wno-unused-function", "-Wno-unused-parameter", "-Wno-unused-variable"
    },
    regular = {
        "-Wall", "-Wextra", "-Werror",
--         "-Wpedantic", "-ansi"
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

target("platform")
do
    set_kind("object")

	add_includedirs("../src")

	if is_plat("macosx") then
		-- add_files("cocoa/**.m")
		-- add_frameworks("Cocoa")

        -- set_languages("c99")
        -- if is_mode("debug") then add_mflags(cflags.debug) end
        -- add_mflags(cflags.regular)
        -- --Suck it, apple
        -- add_mflags("-Wno-deprecated-declarations")

        add_files("gtk/**.c")
        add_packages("gtk+3")
        -- add_packages("libx11", "libxaw", "libxt")
	elseif is_plat("linux") then
		add_files("gtk/**.c")
		add_packages("gtk")
	elseif is_plat("windows") then
		add_files("win32/**.c")
	else
		add_files("x11/**.c")
		add_packages("libx11", "libxaw", "libxt")
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

