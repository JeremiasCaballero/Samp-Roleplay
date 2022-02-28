CMD:traer(playerid, params[]){
    if(UserInfo[playerid][admin] == 1) {
        new secondPlayerId;
        if(!sscanf(params, "d", secondPlayerId)){
            if(IsPlayerConnected(secondPlayerId)){
                new Float:p_x,Float:p_y,Float:p_z;
                GetPlayerPos(playerid, p_x,p_y,p_z);
                SetPlayerPos(secondPlayerId, p_x,p_y,p_z);
                return SendClientMessage(secondPlayerId, -1, "Teleportado!");
            }else return SendClientMessage(playerid, -1, "jugador desconectado!");
        }else SendClientMessage(playerid, -1, "utilize traer <playerid>");
    }
    return 1;
}

CMD:ir(playerid, params[]){
    if(UserInfo[playerid][admin] == 1) {
        new secondPlayerId;
        if(!sscanf(params, "d", secondPlayerId)){
            if(IsPlayerConnected(secondPlayerId)){
                new Float:p_x,Float:p_y,Float:p_z;
                GetPlayerPos(secondPlayerId, p_x,p_y,p_z);
                SetPlayerPos(playerid, p_x,p_y,p_z);
                return SendClientMessage(secondPlayerId, -1, "Teleportado!");
            }else return SendClientMessage(playerid, -1, "jugador desconectado!");
        } else SendClientMessage(playerid, -1, "utilize traer <playerid>");
    }
    return 1;
}
CMD:kick(playerid, params[]){
    if(UserInfo[playerid][admin] == 1){
        new secondPlayerId;
        if(!sscanf(params, "d", secondPlayerId)){
            if(IsPlayerConnected(secondPlayerId)){
                Kick(secondPlayerId);
                SendClientMessage(secondPlayerId, -1, "Jugador kickeado!");
            }else return SendClientMessage(playerid, -1, "jugador desconectado!");
        }else SendClientMessage(playerid, -1, "utilize kick <playerid>");
    }
    return 1;
}
// COMMANDS
CMD:reiniciar(playerid, params[]){
    SendRconCommand("gmx");
    SendClientMessageToAll(-1 , "The server is about to restart");
    return 1;
}

