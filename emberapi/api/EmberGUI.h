#pragma once
#include <unordered_map>
#include <memory>
#include <wrl/client.h>
using Microsoft::WRL::ComPtr;

struct ID3D11Device;
struct ID3D11DeviceContext;


namespace ember
{
	class EmberContext;

	class EmberGUI
	{
	public:
		EmberGUI();
	public:
		const uint32_t Initialize(ID3D11Device* const aDevice, ID3D11DeviceContext* const aDeviceContext);
	public:
		void UpdateAPI(const float aDT);
		void AddEditor(EmberContext* const aNewEditor);
	private://IMGUI Logic
		void InitIMGUI();
		void BeginIMGUI();
		void EndIMGUI();


	private: //D3D11 Stuff
		ComPtr<ID3D11Device> myDevice;
		ComPtr<ID3D11DeviceContext> myDeviceContext;
	private: //Data
		std::unique_ptr<EmberContext> myRootContext;
	};
}


