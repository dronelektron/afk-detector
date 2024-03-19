#if defined _afk_detector_api_included
 #endinput
#endif
#define _afk_detector_api_included

forward void AfkDetector_OnClientActive(int client);

forward void AfkDetector_OnClientInactive(int client);

native bool AfkDetector_IsClientActive(int client);
