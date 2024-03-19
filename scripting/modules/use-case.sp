void UseCase_CheckPlayers() {
    for (int client = 1; client <= MaxClients; client++) {
        if (IsClientInGame(client)) {
            UseCase_CheckPlayer(client);
        }
    }
}

void UseCase_CheckPlayer(int client) {
    PrintToServer("[DEBUG] UseCase_CheckPlayer: client %d", client);

    bool buttonsChanged = Client_AreButtonsChanged(client);
    bool anglesChanged = Client_AreAnglesChanged(client);
    bool positionChanged = Client_IsPositionChanged(client);

    if (buttonsChanged || anglesChanged || positionChanged) {
        UseCase_MarkPlayerAsActive(client);
    } else {
        UseCase_IncrementInactivitySeconds(client);
    }
}

void UseCase_IncrementInactivitySeconds(int client) {
    if (Client_IsActive(client)) {
        int seconds = Client_IncrementInactivitySeconds(client);

        if (seconds >= Variable_InactivityDelay()) {
            UseCase_MarkPlayerAsInactive(client);
        }
    }
}

void UseCase_MarkPlayerAsActive(int client) {
    Client_ResetInactivitySeconds(client);

    if (Client_IsActive(client)) {
        return;
    }

    Client_MarkAsActive(client);
    Forward_OnClientActive(client);
}

void UseCase_MarkPlayerAsInactive(int client) {
    if (Client_IsActive(client)) {
        Client_MarkAsInactive(client);
        Forward_OnClientInactive(client);
    }
}
