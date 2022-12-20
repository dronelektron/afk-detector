#include <sourcemod>

#include "afkd/math"
#include "afkd/use-case"

#include "modules/api.sp"
#include "modules/client.sp"
#include "modules/console-command.sp"
#include "modules/console-variable.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "AFK detector",
    author = "Dron-elektron",
    description = "Allows you to detect inactive players",
    version = "1.0.2",
    url = "https://github.com/dronelektron/afk-detector"
};

public APLRes AskPluginLoad2(Handle plugin, bool late, char[] error, int errorMax) {
    RegPluginLibrary("afk-detector");

    return APLRes_Success;
}

public void OnPluginStart() {
    Api_Create();
    Command_AddVoiceListeners();
    Variable_Create();
    AutoExecConfig(true, "afk-detector");
}

public void OnPluginEnd() {
    Api_Destroy();
}

public void OnClientPostAdminCheck(int client) {
    Client_Reset(client);
}

public void OnPlayerRunCmdPost(int client, int buttons, int impulse, const float velocity[VECTOR_SIZE], const float angles[VECTOR_SIZE], int weapon, int subType, int commandNumber, int tickCount, int seed, const int mouse[MOUSE_SIZE]) {
    UseCase_CheckPlayer(client, buttons, mouse);
}

public void OnClientSayCommand_Post(int client, const char[] command, const char[] args) {
    UseCase_MarkPlayerAsActive(client);
}
