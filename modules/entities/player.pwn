//include "../example.pwn"
#include "YSI_Coding\y_hooks"

forward loadPlayerData(playerid);
forward savePlayerData(playerid); // insert fist data
forward saveData(playerid); // save the data when the player disconnect from server.
forward nameValidator(playerid);
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
    inventoryStatus
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
    UserInfo[playerid][inventoryStatus] = 0;
    print("seteando");
    printf("'%d'", UserInfo[playerid][inventoryStatus]);
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
public nameValidator(playerid){
    if(IsPlayerConnected(playerid))
    {
      new pname[MAX_PLAYER_NAME],underline=0;
      GetPlayerName(playerid, pname, sizeof(pname));
      if(strfind(pname,"[",true) != (-1)) return 0;
      else if(strfind(pname,"]",true) != (-1)) return 0;
      else if(strfind(pname,"$",true) != (-1)) return 0;
      else if(strfind(pname,"(",true) != (-1)) return 0;
      else if(strfind(pname,")",true) != (-1)) return 0;
      else if(strfind(pname,"=",true) != (-1)) return 0;
      else if(strfind(pname,"@",true) != (-1)) return 0;
      else if(strfind(pname,"1",true) != (-1)) return 0;
      else if(strfind(pname,"2",true) != (-1)) return 0;
      else if(strfind(pname,"3",true) != (-1)) return 0;
      else if(strfind(pname,"4",true) != (-1)) return 0;
      else if(strfind(pname,"5",true) != (-1)) return 0;
      else if(strfind(pname,"6",true) != (-1)) return 0;
      else if(strfind(pname,"7",true) != (-1)) return 0;
      else if(strfind(pname,"8",true) != (-1)) return 0;
      else if(strfind(pname,"9",true) != (-1)) return 0;
      new maxname = strlen(pname);
      for(new i=0; i<maxname; i++)
      {
        if(pname[i] == '_') underline ++;
      }
      if(underline != 1) return 0;
      pname[0] = toupper(pname[0]);
      for(new x=1; x<maxname; x++)
        {
            if(pname[x] == '_') pname[x+1] = toupper(pname[x+1]);
            else if(pname[x] != '_' && pname[x-1] != '_') pname[x] = tolower(pname[x]);
        }
      SetPlayerName(playerid, "New_Name"); //?Har? falta? ?Si? ?No? ?Quien sabe? ?WIki? ?AH, que hace falta? Ok pues lo dejo.
      SetPlayerName(playerid, pname);
      return 1;
    }
    return 0;
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
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
    if (newkeys == KEY_YES)
	{
        print("apretaste la y");
        printf("'%d'", UserInfo[playerid][inventoryStatus]);
		showInventory(playerid);
	}
	return 1;
}
CMD:reiniciar(playerid, params[]){
    SendRconCommand("gmx");
    SendClientMessageToAll(-1 , "The server is about to restart");
    return 1;
}
CMD:guardar(playerid, params[]){
    new query[520];
    new year,month,day,hour,minute,second;
    gettime(hour, minute, second);
    getdate(year, month, day);
    new ip[16];
    GetPlayerIp(playerid, ip, sizeof(ip));
    mysql_format(MySQL, query, sizeof(query), "INSERT INTO `user_access` VALUES('null','%e','0','%i','%i','%i','%i','%i','%i')",
    ip,
    year,
    month,
    day,
    hour,
    minute,
    second
    );
    printf(query);
    mysql_tquery(MySQL, query);
    return 1;
}