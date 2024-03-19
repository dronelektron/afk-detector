void Native_Create() {
    CreateNative("AfkDetector_IsClientActive", Native_IsClientActive);

    RegPluginLibrary(LIBRARY_AFK_DETECTOR);
}

any Native_IsClientActive(Handle plugin, int numParams) {
    int client = GetNativeCell(1);

    return Client_IsActive(client);
}
