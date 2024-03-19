#include <sourcemod>

#include "afk-detector/api"
#include "afk-detector/use-case"

#include "modules/api/forward.sp"
#include "modules/api/native.sp"
#include "modules/client.sp"
#include "modules/console-command.sp"
#include "modules/console-variable.sp"
#include "modules/use-case.sp"

#define AUTO_CREATE_YES true

public Plugin myinfo = {
    name = "AFK detector",
    author = "Dron-elektron",
    description = "Allows you to detect inactive players",
    version = "1.1.0",
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
    AutoExecConfig(AUTO_CREATE_YES, LIBRARY_AFK_DETECTOR);
}

public void OnClientPostAdminCheck(int client) {
    Client_Reset(client);
}

public void OnPlayerRunCmdPost(int client, int buttons, int impulse, const float velocity[3], const float angles[3], int weapon, int subType, int commandNumber, int tickCount, int seed, const int mouse[2]) {
    UseCase_CheckPlayer(client, buttons, mouse);
}

public void OnClientSayCommand_Post(int client, const char[] command, const char[] args) {
    UseCase_MarkPlayerAsActive(client);
}
