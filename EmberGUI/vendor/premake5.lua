include "../premake/utils.lua"

print("\nInitializing vendor")
project("vendor")
location "."
kind "StaticLib"
language "C++"
cppdialect "C++20"

output = "%{cfg.buildcfg}"
solutionDir = "%{wks.location}"
prjName = "%{prj.name}"

setDebugDir(os.realpath("../lib"))
setTargetDir(os.realpath("../lib"))
setObjDir(os.realpath("../temp/lib"))

targetname("%{prj.name}_%{cfg.buildcfg}")

flags {
    "MultiProcessorCompile"
}

includedirs {
    "src/",
    "src/imgui/"
}

files {
    "src/**.h",
    "src/**.hpp",
    "src/**.c",
    "src/**.cpp"
}
removefiles {
    "src/imgui/**.h",
    "src/imgui/**.cpp",
    "**/vcpkg/**",
    "**/examples/**",
    "**/example/**",
    "**/vcpkg-example/**"
}
files {
    "src/imgui/imgui.h",
    "src/imgui/imgui.cpp",
    "src/imgui/backends/imgui_impl_dx11.h",
    "src/imgui/backends/imgui_impl_dx11.cpp",
    "src/imgui/backends/imgui_impl_win32.h",
    "src/imgui/backends/imgui_impl_win32.cpp"
}

filter "configurations:Debug"
defines "_DEBUG"
runtime "Debug"
symbols "on"

filter "configurations:Release"
defines "_RELEASE"
runtime "Release"
optimize "off"

filter "configurations:Retail"
defines "_RETAIL"
runtime "Release"
optimize "off"

