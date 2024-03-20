static bool g_isActive[MAXPLAYERS + 1];
static int g_inactivitySeconds[MAXPLAYERS + 1];
static int g_lastButtons[MAXPLAYERS + 1];
static float g_lastAngles[MAXPLAYERS + 1][3];

bool Client_IsActive(int client) {
    return g_isActive[client];
}

void Client_MarkAsActive(int client) {
    g_isActive[client] = true;
}

void Client_MarkAsInactive(int client) {
    g_isActive[client] = false;
}

void Client_ResetInactivitySeconds(int client) {
    g_inactivitySeconds[client] = 0;
}

int Client_IncrementInactivitySeconds(int client) {
    g_inactivitySeconds[client]++;

    return g_inactivitySeconds[client];
}

bool Client_ButtonsChanged(int client) {
    int buttons = GetClientButtons(client);
    bool result = buttons != g_lastButtons[client];

    g_lastButtons[client] = buttons;

    return result;
}

bool Client_AnglesChanged(int client) {
    float angles[3];
    float delta[3];

    GetClientEyeAngles(client, angles);
    SubtractVectors(g_lastAngles[client], angles, delta);

    g_lastAngles[client] = angles;

    return delta[PITCH] > 0.0 || delta[YAW] > 0.0;
}

bool Client_IsFirstPersonObserver(int client) {
    int observerMode = GetEntProp(client, Prop_Send, "m_iObserverMode");

    return observerMode == OBSERVER_MODE_FIRST_PERSON;
}
