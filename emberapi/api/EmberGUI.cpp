#include "EmberGUI.h"
#include "framework/EmberContext.h"

#include <d3d11.h>

#pragma comment(lib,"d3d11.lib")

#include "imgui.h"
#include "backends/imgui_impl_win32.h"
#include "backends/imgui_impl_dx11.h"
#include "imguizmo/ImGuizmo.h"

#include "editors/Root.h"

ember::EmberGUI::EmberGUI() = default;
const uint32_t ember::EmberGUI::Initialize(ID3D11Device* const aDevice, ID3D11DeviceContext* const aDeviceContext)
{

	InitIMGUI();

	myRootContext.reset(new Root());

	return 0; //OK
}

void ember::EmberGUI::UpdateAPI(const float aDT)
{
	//How do i get the camera data if i dont know what a camera is.
	BeginIMGUI();
	myRootContext->OnEarlyGUI();
	myRootContext->OnGUI(aDT);
	myRootContext->OnLateGUI();

	myRootContext->OnChildUpdate(aDT);
	EndIMGUI(); //IMGUI RENDER CALL


}

void ember::EmberGUI::AddEditor(EmberContext* const aNewEditor)
{
	myRootContext->myChildContexts.push_back(std::unique_ptr<EmberContext>(aNewEditor));
}



void ember::EmberGUI::InitIMGUI()
{
	IMGUI_CHECKVERSION();
	ImGui::CreateContext();
	ImGuiIO& io = ImGui::GetIO();
	io.ConfigFlags |= ImGuiConfigFlags_DockingEnable;
	io.ConfigFlags |= ImGuiConfigFlags_ViewportsEnable;
	io.BackendFlags |= ImGuiBackendFlags_PlatformHasViewports | ImGuiBackendFlags_RendererHasViewports;

	if (!ImGui_ImplWin32_Init(myDevice.Get()))
	{
		//Logger stuff
	}
	if (!ImGui_ImplDX11_Init(myDevice.Get(), myDeviceContext.Get()))
	{
		//Logger stuff
	}
	ImGui::StyleColorsDark();

	ImGuiStyle& style = ImGui::GetStyle();
	if (io.ConfigFlags & ImGuiConfigFlags_ViewportsEnable)
	{
		style.WindowRounding = 0.0f;
		style.Colors[ImGuiCol_WindowBg].w = 1.0f;
	}

}

void ember::EmberGUI::BeginIMGUI()
{
	ImGuiIO& io = ImGui::GetIO();
	ImGui_ImplDX11_NewFrame();
	ImGui_ImplWin32_NewFrame();
	ImGui::NewFrame();
	ImGuizmo::BeginFrame();
}



void ember::EmberGUI::EndIMGUI()
{
	ImGui_ImplDX11_Shutdown();
	ImGui_ImplWin32_Shutdown();
	ImGui::DestroyContext();
}

