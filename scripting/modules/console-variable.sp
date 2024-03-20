static ConVar g_inactivityDelay;

void Variable_Create() {
    g_inactivityDelay = CreateConVar("sm_afkdetector_inactivity_delay", "5.0", "Delay (in seconds) before calling 'AfkDetector_OnClientInactive' forward");
    g_inactivityDelay.AddChangeHook(Variable_OnChange);
}

float Variable_InactivityDelay() {
    return g_inactivityDelay.FloatValue;
}

void Variable_OnChange(ConVar variable, const char[] oldValue, const char[] newValue) {
    if (variable == g_inactivityDelay) {
        float newDelay = StringToFloat(newValue);

        if (newDelay < AFK_CHECKER_INTERVAL) {
            g_inactivityDelay.SetFloat(AFK_CHECKER_INTERVAL);
        }
    }
}
