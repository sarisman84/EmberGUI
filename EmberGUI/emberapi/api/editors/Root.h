#pragma once
#include "api/framework/EmberContext.h"
namespace ember
{
	class Root : public EmberContext
	{
	public:
		// Inherited via EmberContext
		void OnEarlyGUI() override;
		void OnInit() override;
		void OnGUI(const float aTimeDelta) override;
		void OnLateGUI() override;
	};

}


