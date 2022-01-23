//include "../example.pwn"
#include "YSI_Coding\y_hooks"
forward loadPlayerData(playerid);
forward savePlayerData(playerid); // insert fist data
forward saveData(playerid); // save the data when the player disconnect from server.
enum p_info
{
    id,
    name[24],
    password[64],
    Float:posx,
    Float:posy,
    Float:posz,
    skin,
    sexo,
    level,
    mail[24],
    bool:logeado,
    money,
    ipRegister[16],
    phone,
};
new UserInfo[MAX_PLAYERS][p_info];




stock getName(playerid){
	new name_user[24];
	GetPlayerName(playerid, name_user, sizeof(name_user));
    return name_user;
}
stock loadData(playerid){
    new query[520];
    mysql_format(MySQL, query, sizeof(query),"SELECT money,level,posx,posy,posz,skin FROM `users` WHERE `name`='%s'", getName(playerid));
 	mysql_pquery(MySQL, query, "loadPlayerData","d", playerid);
}
// this callback load the player data.
// Look the enums and compare this fuction with the data of enums.
public loadPlayerData(playerid){
   // new int_dest;
    cache_get_value_name_int(0, "level" , UserInfo[playerid][level]);
    cache_get_value_float(0, "posx", UserInfo[playerid][posx]);
    cache_get_value_float(0, "posy", UserInfo[playerid][posy]);
    cache_get_value_float(0, "posz", UserInfo[playerid][posz]);
    cache_get_value_int(0, "skin", UserInfo[playerid][skin]);
    cache_get_value_int(0, "money", UserInfo[playerid][money]);
    UserInfo[playerid][logeado] = true;
    printf("'%d'", UserInfo[playerid][money]);
    SetSpawnInfo(playerid, 0, UserInfo[playerid][skin], UserInfo[playerid][posx],UserInfo[playerid][posy],UserInfo[playerid][posz], 0.0000, 0,0,0,0,0,0);
    SpawnPlayer(playerid);
    return 1;
}


hook OnPlayerDisconnect(playerid, reason){
    if(UserInfo[playerid][logeado] == true){
        saveData(playerid);
    }else{
        return 1;
    }
    return 1;
}

public saveData(playerid){
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    new query[520];
    mysql_format(MySQL, query, sizeof(query),"UPDATE  `users` SET `money`='%i',`posx`='%f',`posy`='%f',`posz`='%f' WHERE `name`= '%s'", 
    UserInfo[playerid][money],
    x,
    y,
    z,
    getName(playerid)
    );
    printf(query);
    mysql_tquery(MySQL, query);
    printf("Se esta guardando la cuenta de %s",getName(playerid));       
    return 1;
}


public savePlayerData(playerid){
    print(getName(playerid));
    print("ejecutando consulta");
    new query[520];
    mysql_format(MySQL, query, sizeof(query),"INSERT INTO `users` VALUES('null','%e','%e','%i','%e','%i','%i','%i','%i','%i','%e','%f','%f','%f','%i','%i')", 
    getName(playerid),
    UserInfo[playerid][password],
    0,
    UserInfo[playerid][mail],
    UserInfo[playerid][skin],
    UserInfo[playerid][skin],
    //phone
    13,
    0,
    UserInfo[playerid][money],
    UserInfo[playerid][ipRegister],
    UserInfo[playerid][posx],
    UserInfo[playerid][posy],
    UserInfo[playerid][posz],
    UserInfo[playerid][level],
    UserInfo[playerid][sexo]
    );
    printf(query);
    mysql_tquery(MySQL, query);
    return 1;
}