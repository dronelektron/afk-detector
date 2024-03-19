static GlobalForward g_onClientActive = null;
static GlobalForward g_onClientInactive = null;

void Forward_Create() {
    g_onClientActive = new GlobalForward("OnClientActive", ET_Ignore, Param_Cell);
    g_onClientInactive = new GlobalForward("OnClientInactive", ET_Ignore, Param_Cell);
}

void Forward_OnClientActive(int client) {
    Call_StartForward(g_onClientActive);
    Call_PushCell(client);
    Call_Finish();
}

void Forward_OnClientInactive(int client) {
    Call_StartForward(g_onClientInactive);
    Call_PushCell(client);
    Call_Finish();
}
