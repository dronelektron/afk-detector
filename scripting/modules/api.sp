static GlobalForward g_onClientActive = null;
static GlobalForward g_onClientInactive = null;

void Api_Create() {
    g_onClientActive = new GlobalForward("OnClientActive", ET_Ignore, Param_Cell);
    g_onClientInactive = new GlobalForward("OnClientInactive", ET_Ignore, Param_Cell);
}

void Api_Destroy() {
    delete g_onClientActive;
    delete g_onClientInactive;
}

void Api_OnClientActive(int client) {
    Call_StartForward(g_onClientActive);
    Call_PushCell(client);
    Call_Finish();
}

void Api_OnClientInactive(int client) {
    Call_StartForward(g_onClientInactive);
    Call_PushCell(client);
    Call_Finish();
}

any Api_IsClientActive(Handle plugin, int numParams) {
    int client = GetNativeCell(1);

    return Client_IsActive(client);
}
