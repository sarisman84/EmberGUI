#include "EmberContext.h"
#include "imgui.h"

ember::EmberContext::EmberContext()
{
	static uint32_t id = 0;
	myID = id++;
}

void ember::EmberContext::AddChild(EmberContext* const aNewEditor)
{
	myChildContexts.push_back(std::unique_ptr<EmberContext>(aNewEditor));
}

void ember::EmberContext::OnChildUpdate(const float aTimeDelta)
{
	for (size_t i = 0; i < myChildContexts.size(); i++)
	{
		auto& context = myChildContexts[i];
		ImGui::Begin(myName.c_str(), &myActiveState);
		context->OnEarlyGUI();
		context->OnGUI(aTimeDelta);
		context->OnLateGUI();
		ImGui::End();
		context->OnChildUpdate(aTimeDelta);
	}
}
