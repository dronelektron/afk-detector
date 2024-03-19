# AFK detector

Allows you to detect inactive players who do not:

* Press buttons
* Look around
* Move around
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

* sm_afkdetector_inactivity_delay - Delay (in seconds) before calling `AfkDetector_OnClientInactive` forward [default: "5.0"]

### API

Called when the player is no longer AFK

```
forward void AfkDetector_OnClientActive(int client);
```

Called when the player is AFK

```
forward void AfkDetector_OnClientInactive(int client);
```

Checks if the client is active

```
native bool AfkDetector_IsClientActive(int client);
```
