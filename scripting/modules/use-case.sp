void UseCase_CheckPlayer(int client, int buttons, const int mouse[MOUSE_SIZE]) {
    bool hasPressedButtons = buttons != NO_BUTTONS;
    bool hasMovedMouseX = mouse[MOUSE_X] != NO_MOUSE_DIRECTION;
    bool hasMovedMouseY = mouse[MOUSE_Y] != NO_MOUSE_DIRECTION;
    bool hasActivity = hasPressedButtons || hasMovedMouseX || hasMovedMouseY;

    if (hasActivity) {
        UseCase_MarkPlayerAsActive(client);
    } else {
        float currentTime = GetGameTime();
        float lastActivityTime = Client_GetLastActivityTime(client);
        float checkInterval = Variable_CheckInterval();
        bool noActivityLongTime = currentTime > lastActivityTime + checkInterval;

        if (noActivityLongTime) {
            UseCase_MarkPlayerAsInactive(client);
        }
    }
}

void UseCase_MarkPlayerAsActive(int client) {
    Client_UpdateLastActivityTime(client);

    if (Client_IsActive(client)) {
        return;
    }

    Client_MarkAsActive(client);
    Api_OnClientActive(client);
}

void UseCase_MarkPlayerAsInactive(int client) {
    if (Client_IsInactive(client)) {
        return;
    }

    Client_MarkAsInactive(client);
    Api_OnClientInactive(client);
}
