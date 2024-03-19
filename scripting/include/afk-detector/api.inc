#if defined _afkd_api_included
 #endinput
#endif
#define _afkd_api_included

#define LIBRARY_AFK_DETECTOR "afk-detector"

forward void OnClientActive(int client);

forward void OnClientInactive(int client);

native bool AfkDetector_IsClientActive(int client);
