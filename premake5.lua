
print("Generating EmberGUI")

workspace "EmberGUI"
location "."
architecture "x64"
startproject "emberapi"

configurations {
    "Debug",
    "Release",
    "Retail"
}

include "emberapi"
include "vendor"



