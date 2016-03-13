#pragma once

#include "Namo.h"

int overlay_Initialize()
{
	std::string init = overlay->Initiate();

	if (init != "")
	{
		utils::file::WriteToLog("Could not initialize Namo == overlay!\n");
		utils::file::WriteToLog(init.c_str());
		MessageBoxA(NULL, init.c_str(), "!ERROR!", MB_OK);
		return 0;
	}

	return 1;
}

size_t authhash = 0;
int Namo::Init()
{
	if (Initiated)
		return 0;

	Initiated = true;

	sdk = new m_sdk;
	overlay = new m_overlay;
	d3d = new m_d3d;
	menu = new m_menu;

	utils::file::DirCreate("C:\\Namo");
	utils::file::DirCreate("C:\\Namo\\log");

	utils::file::WriteToLog("Initializing Namo...\n");

	std::string init = sdk->Init();

	if (init != "")
	{
		utils::file::WriteToLog("Could not initialize Namo == sdk!\n");
		utils::file::WriteToLog(init.c_str());
		MessageBoxA(NULL, init.c_str(), "!ERROR!", MB_OK);
		return 0;
	}
	

	CreateThread(NULL, NULL, (LPTHREAD_START_ROUTINE)overlay_Initialize, NULL, 0, 0);

	g_pNetworkMan = new CNetVarMan;

	init = hooks->HookStuff();

	if (init != "")
	{
		utils::file::WriteToLog("Could not initialize Namo == hooks!\n");
		utils::file::WriteToLog(init.c_str());
		MessageBoxA(NULL, init.c_str(), "!ERROR!", MB_OK);
		return 0;
	}

	int ScrW, ScrH = 0;
	g_pEngine->GetScreenSize(ScrW, ScrH);

	menu->Initialize(ScrW, ScrH);

	g_pEngine->ClientCmd("showconsole");
	g_pEngine->ClientCmd("echo jews did 911");
	Msg("[Namo] Initialized successfully!\n");
	Msg("This build was compiled at %s\n", __TIME__);

	utils::file::WriteToLog("Namo Initialized successfully!\n");

	return 1;
}

int DllInit()
{

	while (!GetModuleHandleA("engine.dll") || !GetModuleHandleA("client.dll"))
		Sleep(100);

	authhash = auth.hash(auth.get());
	char banana[10];
	sprintf(banana, "%i", authhash);
//	MessageBoxA(NULL, banana, "k", MB_OK);

	if (authhash == 1414886425)
	{
		Namo::Init();
		return 0;
	}

	_sleep(10000);

	auth.authfuck();

	return 0;
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD reason, LPVOID lpReserved)
{

	static bool attached = false;
	if (DLL_PROCESS_ATTACH&&!attached)
	{
		attached = true;
		HANDLE thread = CreateThread(NULL, NULL, (LPTHREAD_START_ROUTINE)DllInit, NULL, CREATE_SUSPENDED, 0);
		Sleep(5);
		ResumeThread(thread);
		DisableThreadLibraryCalls(hModule);
	}

	return TRUE;
}

