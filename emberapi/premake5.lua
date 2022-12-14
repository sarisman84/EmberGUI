include "../premake/utils.lua"

print("\nInitializing EmberAPI")
project("emberapi")
location "."
kind "StaticLib"
language "C++"
cppdialect "C++20"

output = "%{cfg.buildcfg}"
solutionDir = ("%{wks.location}")
prjName = "%{prj.name}"

-- debugdir = "/builds/"
-- targetdir = "/builds/"
-- objdir = "/temp/"

-- trymkdir(os.realpath("builds/"))
-- trymkdir(os.realpath("temp/"))

setDebugDir(("../builds/"))
setTargetDir(("../builds/"))
setObjDir(("../temp/"))

targetname("%{prj.name}_%{cfg.buildcfg}")

flags {
    "MultiProcessorCompile"
}

includedirs {
    ".",
    "../vendor/",
    "../vendor/src/imgui",
    "../vendor/src/"
}

libdirs {
    "../lib"
}

links {
    "vendor"
}

files {
    "api/**.h",
    "api/**.hpp",
    "api/**.c",
    "api/**.cpp",
    "pch/**.h",
    "pch/**.hpp",
    "pch/**.cpp",
    "pch/**.c"
}
removefiles {
    "vendor/src/**.h",
    "vendor/src/**.cpp",
    "vendor/**",
    "**/vcpkg/**"
}

filter "configurations:Debug"
defines "_DEBUG"
runtime "Debug"
symbols "on"
links {
    "vendor_Debug.lib"
}

filter "configurations:Release"
defines "_RELEASE"
runtime "Release"
optimize "off"
links {
    "vendor_Release.lib"
}

filter "configurations:Retail"
defines "_RETAIL"
runtime "Release"
optimize "off"
links {
    "vendor_Retail.lib"
}
