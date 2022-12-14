include "../premake/utils.lua"

workspace "EmberGUI"
location "."
architecture "x64"
startproject "core"

configurations {
    "Debug",
    "Release",
    "Retail"
}

project("core")
location "."
kind "StaticLib"
language "C++"
cppdialect "C++20"

output = "%{cfg.buildcfg}"
solutionDir = "%{wks.location}"
prjName = "%{prj.name}"

debugdir = "/builds/"
targetdir = "/builds/"
objdir = "/temp/"

trymkdir(os.realpath("builds/"))
trymkdir(os.realpath("temp/"))

flags {
    "MultiProcessorCompile"
}

includedirs {
    ".",
    "vendor/",
    "vendor/src/imgui",
    "vendor/src/"
}
links {
    "vendor"
}

files {
    "**.h",
    "**.hpp",
    "**.c",
    "**.cpp"
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

filter "configurations:Release"
defines "_RELEASE"
runtime "Release"
optimize "on"

filter "configurations:Retail"
defines "_RETAIL"
runtime "Release"
optimize "on"

include "vendor"

