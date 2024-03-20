# AFK detector

Allows you to detect inactive players. Player is considered active if he does the following:

More than one action from this list:

* Press buttons
* Look around
* Move around

One action from this list:

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

* sm_afkdetector_inactivity_delay - Delay (in seconds) before calling `AfkDetector_OnClientInactive` forward [default: "5.0", min: "1.0"]

### API

Called when the `client` is no longer AFK

```sourcepawn
forward void AfkDetector_OnClientActive(int client);
```

Called when the `client` is AFK

```sourcepawn
forward void AfkDetector_OnClientInactive(int client);
```

Checks if the `client` is active

```sourcepawn
native bool AfkDetector_IsClientActive(int client);
```
