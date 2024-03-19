static const bool SQUARED_YES = true;
static const float DISTANCE_THRESHOLD = 1.0;

static bool g_isActive[MAXPLAYERS + 1];
static int g_inactivitySeconds[MAXPLAYERS + 1];
static int g_lastButtons[MAXPLAYERS + 1];
static float g_lastAngles[MAXPLAYERS + 1][3];
static float g_lastPosition[MAXPLAYERS + 1][3];

void Client_Reset(int client) {
    Client_MarkAsActive(client);
    Client_ResetInactivitySeconds(client);
    GetClientEyeAngles(client, g_lastAngles[client]);
    GetClientEyePosition(client, g_lastPosition[client]);

    g_lastButtons[client] = GetClientButtons(client);
}

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

bool Client_AreButtonsChanged(int client) {
    int buttons = GetClientButtons(client);
    bool result = buttons != g_lastButtons[client];

    g_lastButtons[client] = buttons;

    return result;
}

bool Client_AreAnglesChanged(int client) {
    float angles[3];

    GetClientEyeAngles(client, angles);

    float distance = GetVectorDistance(g_lastAngles[client], angles, SQUARED_YES);

    g_lastAngles[client] = angles;

    return distance > DISTANCE_THRESHOLD;
}

bool Client_IsPositionChanged(int client) {
    float position[3];

    GetClientEyePosition(client, position);

    float distance = GetVectorDistance(g_lastPosition[client], position, SQUARED_YES);

    g_lastPosition[client] = position;

    return distance > DISTANCE_THRESHOLD;
}
