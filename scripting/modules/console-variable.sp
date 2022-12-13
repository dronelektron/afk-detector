static ConVar g_checkInterval = null;

void Variable_Create() {
    g_checkInterval = CreateConVar("sm_afkdetector_check_interval", "5.0", "Player check interval (in seconds)");
}

float Variable_CheckInterval() {
    return g_checkInterval.FloatValue;
}
