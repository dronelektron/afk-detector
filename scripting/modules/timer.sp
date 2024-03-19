void Timer_CreateAfkChecker() {
    CreateTimer(AFK_CHECKER_INTERVAL, Timer_AfkChecker, _, AFK_CHECKER_FLAGS);
}

public Action Timer_AfkChecker(Handle timer) {
    UseCase_CheckPlayers();

    return Plugin_Continue;
}
