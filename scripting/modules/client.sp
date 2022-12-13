static float g_lastActivityTime[MAXPLAYERS + 1];
static bool g_isActive[MAXPLAYERS + 1];

void Client_Reset(int client) {
    Client_UpdateLastActivityTime(client);
    Client_MarkAsActive(client);
}

float Client_GetLastActivityTime(int client) {
    return g_lastActivityTime[client];
}

void Client_UpdateLastActivityTime(int client) {
    g_lastActivityTime[client] = GetGameTime();
}

bool Client_IsActive(int client) {
    return g_isActive[client];
}

bool Client_IsInactive(int client) {
    return !g_isActive[client];
}

void Client_MarkAsActive(int client) {
    g_isActive[client] = true;
}

void Client_MarkAsInactive(int client) {
    g_isActive[client] = false;
}
