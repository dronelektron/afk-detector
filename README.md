# AFK detector

Allows you to detect inactive players. Active players must do the following:

* Press buttons
* Move mouse
* Write messages to chat
* Use voice commands
* Change team
* Change class

### Supported Games

* Day of Defeat: Source

### Installation

* Download latest [release](https://github.com/dronelektron/afk-detector/releases) (compiled for SourceMod 1.11)
* Extract "plugins" folder to "addons/sourcemod" folder of your server

### Console Variables

* sm_afkdetector_check_interval - Player check interval (in seconds) [default: "5.0"]

### API

Called when the player is no longer AFK

```
forward void OnClientActive(int client);
```

Called when the player is AFK

```
forward void OnClientInactive(int client);
```

Checks if the client is active

```
native bool AfkDetector_IsClientActive(int client);
```

### Usage example

```
#include <sourcemod>

#include "afk-detector/api"

public Plugin myinfo = {
    name = "AFK notifier",
    author = "Dron-elektron",
    description = "Prints a message to the player that he is AFK or not",
    version = "",
    url = ""
};

public void OnAllPluginsLoaded() {
    if (!LibraryExists(LIBRARY_AFK_DETECTOR)) {
        SetFailState("Library '%s' is not found", LIBRARY_AFK_DETECTOR);
    }
}

public void OnClientActive(int client) {
    PrintToChat(client, "You are no longer AFK");
}

public void OnClientInactive(int client) {
    PrintToChat(client, "You are AFK");
}
```
