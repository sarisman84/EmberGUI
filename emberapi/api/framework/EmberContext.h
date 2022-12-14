#pragma once
#include <cstdint>
#include <vector>
#include <memory>
#include <string>

namespace ember
{
	class EmberGUI;
	class EmberContext
	{
		friend EmberGUI;
	public:
		EmberContext();
	public:
		virtual void OnInit() = 0;
		virtual void OnEarlyGUI() {};
		virtual void OnGUI(const float aTimeDelta) = 0;
		virtual void OnLateGUI() {};
	public: //Public utility methods
		void AddChild(EmberContext* const aNewEditor);
	private: //Utility Methods
		void OnChildUpdate(const float aTimeDelta);
	protected: //API Access 
		EmberGUI* myAPI;
	private: //DATA
		std::vector<std::unique_ptr<EmberContext>> myChildContexts;
		std::string myName;
		bool myActiveState = true;
	private: //ID
		uint32_t myID;
	};



	
}


