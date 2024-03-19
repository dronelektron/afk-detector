static ConVar g_inactivityDelay;

void Variable_Create() {
    g_inactivityDelay = CreateConVar("sm_afkdetector_inactivity_delay", "5.0");
}

float Variable_InactivityDelay() {
    return g_inactivityDelay.FloatValue;
}
