void UseCase_CheckPlayers() {
    for (int client = 1; client <= MaxClients; client++) {
        if (IsClientInGame(client)) {
            UseCase_CheckPlayer(client);
        }
    }
}

static void UseCase_CheckPlayer(int client) {
    int actionsAmount = 0;

    if (Client_ButtonsChanged(client)) {
        actionsAmount++;
    }

    if (Client_AnglesChanged(client)) {
        actionsAmount++;
    }

    if (Client_PositionChanged(client)) {
        actionsAmount++;
    }

    if (actionsAmount > 1) {
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
