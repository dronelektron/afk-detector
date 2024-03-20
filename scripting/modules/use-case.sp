void UseCase_CheckPlayers() {
    for (int client = 1; client <= MaxClients; client++) {
        if (IsClientInGame(client)) {
            UseCase_CheckPlayer(client);
        }
    }
}

static void UseCase_CheckPlayer(int client) {
    bool firstPersonObserver = Client_IsFirstPersonObserver(client);
    bool buttonsChanged = Client_ButtonsChanged(client);
    bool anglesChanged = Client_AnglesChanged(client);
    bool active = false;

    if (firstPersonObserver) {
        active = buttonsChanged;
    } else {
        active = buttonsChanged || anglesChanged;
    }

    if (active) {
        UseCase_MarkPlayerAsActive(client);
    } else {
        UseCase_IncrementInactivitySeconds(client);
    }
}

static void UseCase_IncrementInactivitySeconds(int client) {
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

static void UseCase_MarkPlayerAsInactive(int client) {
    Client_MarkAsInactive(client);
    Forward_OnClientInactive(client);
}
