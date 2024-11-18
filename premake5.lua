project "spdlog"
	kind "StaticLib"
	language "C++"
	staticruntime "On"

	-- --location "%{prj.name}"
	-- targetdir ("%{wks.location}/" .. TargetDirBase .. OutputDir .. "%{prj.name}")
    -- objdir ("%{wks.location}/" .. ObjDirBase .. OutputDir .. "%{prj.name}")

	files
	{
		"src/**.cpp",
		"include/**.h"
	}

	includedirs
	{
		"include/",
	}

	defines
	{
		"SPDLOG_COMPILED_LIB",
		-- SPDLOG_BUILD_PIC, -- position independent code?
	}

	filter "system:windows"
		systemversion "latest"
		buildoptions
		{
			"/utf-8"
		}

	filter "system:linux"
		pic "On"
		systemversion "latest"

	filter "configurations:*Debug"
		runtime "Debug"
		optimize "Off"
		symbols "On"

	filter "configurations:*Release"
		runtime "Release"
		optimize "On"
		symbols "Off"
		
	-- filter { "system:windows", "configurations:Debug" }
    --     buildoptions "/MTd"
		
    -- filter { "system:windows", "configurations:Release" }
    --     buildoptions "/MT"