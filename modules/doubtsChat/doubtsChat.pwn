CMD:duda(playerid, params[]){
    new doubtText[71];
    if(!sscanf(params,"s[71]",doubtText)){
        if(UserConfig[playerid][show_doubts_chat] == 0){
            new message[400];
            format(message, 200, "{FFFFFF}Debes activar el canal de dudas para poder usarlo, utiliza {00CCFF}/config{FFFFFF} o {00CCFF}/configuracion{FFFFFF} para activarlo.");
            SendClientMessage(playerid, -1, message);
        }else{
            sendDoubt(playerid,doubtText);
        }
    }else SendClientMessage(playerid, -1, "utilize {DBED15}/duda <duda>{FFFFFF}, por ejemplo {DBED15}¿Comó veo mi inventario?{FFFFFF}.");
    return 1;
}



stock sendDoubt(playerid, string[]){
    new doubtText[140];
    format(doubtText, 140, "[Dudas] {FFFFFF}Jugador %s: (( %s ))",
    getName(playerid),
    string
    );
    foreach(new i : Player) {
        if(UserConfig[i][show_doubts_chat] == 1){
            SendClientMessage(i, COLOR_DOUBTS, doubtText);
        }
    }
    return 1;
}