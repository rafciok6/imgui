project "ImGui"
    kind "StaticLib"
    language "C++"
	removeconfigurations "Runner_Release"
	removeconfigurations "Runner_Debug"
	configmap {
		["Editor_Debug"] = "Debug",
        ["Editor_Release"] = "Release"
    }
    
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
        "imconfig.h",
        "imgui.h",
        "imgui.cpp",
        "imgui_draw.cpp",
        "imgui_internal.h",
        "imgui_widgets.cpp",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",
        "imgui_demo.cpp"
    }
    
	filter "system:windows"
        systemversion "latest"
        cppdialect "C++17"
        staticruntime "On"
		toolset "v142"
        
    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"
		
