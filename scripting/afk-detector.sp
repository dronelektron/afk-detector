#include <sourcemod>
#include <sdktools>

#include "afk-detector/client"
#include "afk-detector/timer"

#include "modules/api/forward.sp"
#include "modules/api/native.sp"
#include "modules/client.sp"
#include "modules/console-command.sp"
#include "modules/console-variable.sp"
#include "modules/timer.sp"
#include "modules/use-case.sp"

#define AUTO_CREATE_YES true

public Plugin myinfo = {
    name = "AFK detector",
    author = "Dron-elektron",
    description = "Allows you to detect inactive players",
    version = "2.1.1",
    url = "https://github.com/dronelektron/afk-detector"
};

public APLRes AskPluginLoad2(Handle plugin, bool late, char[] error, int errorMax) {
    Native_Create();

    return APLRes_Success;
}

public void OnPluginStart() {
    Forward_Create();
    Command_AddListeners();
    Variable_Create();
    AutoExecConfig(AUTO_CREATE_YES, "afk-detector");
}

public void OnMapStart() {
    Timer_CreateAfkChecker();
}

public void OnClientPostAdminCheck(int client) {
    Client_MarkAsActive(client);
}

public void OnClientSayCommand_Post(int client, const char[] command, const char[] args) {
    UseCase_MarkPlayerAsActive(client);
}
