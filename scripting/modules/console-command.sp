static char g_voiceCommands[][] = {
    // Group 1
    "voice_attack",
    "voice_hold",
    "voice_left",
    "voice_right",
    "voice_sticktogether",
    "voice_cover",
    "voice_usesmoke",
    "voice_usegrens",
    "voice_ceasefire",
    // Group 2
    "voice_yessir",
    "voice_negative",
    "voice_backup",
    "voice_fireinhole",
    "voice_grenade",
    "voice_sniper",
    "voice_niceshot",
    "voice_thanks",
    "voice_areaclear",
    // Group 3
    "voice_dropweapons",
    "voice_displace",
    "voice_mgahead",
    "voice_enemybehind",
    "voice_wegothim",
    "voice_moveupmg",
    "voice_needammo",
    "voice_usebazooka",
    "voice_bazookaspotted",
    // Hidden
    "voice_wtf",
    "voice_tank",
    "voice_movewithtank",
    "voice_medic",
    "voice_fallback",
    "voice_enemyahead",
    "voice_coverflanks"
};

static char g_classCommands[][] = {
    // Allies
    "cls_garand",
    "cls_tommy",
    "cls_bar",
    "cls_spring",
    "cls_30cal",
    "cls_bazooka",
    // Axis
    "cls_k98",
    "cls_mp40",
    "cls_mp44",
    "cls_k98s",
    "cls_mg42",
    "cls_pschreck"
};

void Command_AddListeners() {
    for (int i = 0; i < sizeof(g_voiceCommands); i++) {
        AddCommandListener(CommandListener_Common, g_voiceCommands[i]);
    }

    for (int i = 0; i < sizeof(g_classCommands); i++) {
        AddCommandListener(CommandListener_Common, g_classCommands[i]);
    }

    AddCommandListener(CommandListener_Common, "jointeam");
}

public Action CommandListener_Common(int client, const char[] command, int argc) {
    UseCase_MarkPlayerAsActive(client);

    return Plugin_Continue;
}
