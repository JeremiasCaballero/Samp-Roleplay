//include "../example.pwn"
#include "YSI_Coding\y_hooks"

forward loadPlayerData(playerid);
forward savePlayerData(playerid); // insert fist data
forward saveData(playerid); // save the data when the player disconnect from server.
forward nameValidator(playerid);
forward setLastAccess(playerid);
forward setConfigPlayer(playerid);
forward setPlayeridResult(playerid);

forward OnQueryFinishData(playerid, typeConsult[]); // utilizada para obtener todas las consultas 
// defines 

#define DIALOG_CONFIG 7

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
    inventoryStatus,
    year,
    month,
    day,
    hour,
    minute,
    second,
    admin
};
new UserInfo[MAX_PLAYERS][p_info];

enum p_config {
    show_doubts_chat,
}
new UserConfig[MAX_PLAYERS][p_config];

stock getName(playerid){
	new name_user[24];
	GetPlayerName(playerid, name_user, sizeof(name_user));
    return name_user;
}

forward loadData(playerid);
public loadData(playerid){
    new query[520];
    new variant[] = "doubts";
    mysql_format(MySQL, query, sizeof(query),"SELECT show_doubts_chat FROM `user_account_configuration` INNER JOIN `users` ON user_account_configuration.user_id = users.id WHERE users.name='Dylan_Lampwick'");
    mysql_pquery(MySQL, query, "OnQueryFinishData", "is", playerid, variant);
    
    new variant2[] = "userData";
    mysql_format(MySQL, query, sizeof(query),"SELECT id,money,level,posx,posy,posz,skin,admin FROM `users` WHERE `name`='%s'", getName(playerid));
 	mysql_pquery(MySQL, query, "OnQueryFinishData","is", playerid, variant2);


    new variant3[] = "userAccess";

    mysql_format(MySQL, query, sizeof(query),"SELECT year,month,day,hour,minute,second FROM `user_access` INNER JOIN `users` ON user_access.user_id = users.id WHERE users.name='%s'", 
    getName(playerid)
    );
    mysql_pquery(MySQL, query, "OnQueryFinishData","is", playerid, variant3);
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
// guarda la info cuando el jugador se desconecta
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
    print("Guardando accesso");
    new anio,mes,dia,hora,minuto,segundo;
    gettime(hora, minuto, segundo);
    getdate(anio, mes, dia);
    new ip[16];
    GetPlayerIp(playerid, ip, sizeof(ip));
    mysql_format(MySQL, query, sizeof(query), "INSERT INTO `user_access` VALUES('null','%e','%i','%i','%i','%i','%i','%i','%i')",
    ip,
    anio,
    mes,
    dia,
    hora,
    minuto,
    segundo,
    UserInfo[playerid][id]
    );
    printf(query);
    mysql_tquery(MySQL, query);    
    mysql_format(MySQL, query, sizeof(query), "UPDATE `user_account_configuration` SET `show_doubts_chat` = '%i' WHERE `user_account_configuration`.`user_id` = '%i'",
    UserConfig[playerid][show_doubts_chat],
    UserInfo[playerid][id]);
    printf(UserInfo[playerid][id]);
    printf(query);
    mysql_tquery(MySQL, query);       
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
    mysql_format(MySQL, query, sizeof(query),"INSERT INTO `users` VALUES('null','%e','%e','%i','%e','%i','%i','%i','%i','%i','%e','%f','%f','%f','%i','%i',0)", 
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
    getPlayerIdFromDataBase(playerid);
    // Insertando Config
    
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
stock getPlayerIdFromDataBase(playerid){
    print("Obteniendo id desde la base de datos");
    new query[200];
    mysql_format(MySQL, query, sizeof(query),"SELECT id FROM `users` WHERE users.name='%s'", 
    getName(playerid)
    );
    printf(query);
    mysql_pquery(MySQL, query, "setPlayeridResult","d", playerid);
}

public setPlayeridResult(playerid){
    cache_get_value_name_int(0, "id" , UserInfo[playerid][id]);
    print("Seteando id");
    printf("'%d'", UserInfo[playerid][id]);
    print("Insertando user config");
    new query[520];
    mysql_format(MySQL, query, sizeof(query),"INSERT INTO `user_account_configuration` VALUES('null','%i','1')",UserInfo[playerid][id]);
    mysql_tquery(MySQL, query);
    printf(query);
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
    switch(dialogid)
	{
        case DIALOG_CONFIG:
        {
            if(response){
                switch(listitem){
                    case 0:{
                        if(UserConfig[playerid][show_doubts_chat] == 1){
                            UserConfig[playerid][show_doubts_chat] = 0;
                        }else{
                            UserConfig[playerid][show_doubts_chat] = 1;
                        }
                        showConfigPlayerOptions(playerid);
                    }
                }
            }
        }
    }
    return 1;
}
stock welcomeMessage(playerid)
{
    new string[200];
    format(string, 200, "Bienvenido de nuevo {00CCFF}%s{FFFFFF} te vimos por ultima vez el {00CCFF}%i-%i-%i{FFFFFF} a las {00CCFF}%i:%i:%i{FFFFFF}",
    getName(playerid),
    UserInfo[playerid][day],
    UserInfo[playerid][month],
    UserInfo[playerid][year],
    UserInfo[playerid][hour],
    UserInfo[playerid][minute],
    UserInfo[playerid][second]
    );
    SendClientMessage(playerid, -1, string);
}
/*
CMD:config(playerid, params[]){}
*/
CMD:config(playerid, params[]){
    return cmd_configuracion(playerid, params);	
}
CMD:configuracion(playerid, params[]){
    showConfigPlayerOptions(playerid);
    return 1;
}

          
stock showConfigPlayerOptions(playerid) {
    new option1[20],message[500]; 
    printf("'%d'", UserConfig[playerid][show_doubts_chat]);
    if(UserConfig[playerid][show_doubts_chat] == 1){
        format(option1, sizeof(option1), "{2BA30A}Activado");
    }
    else if(UserConfig[playerid][show_doubts_chat] == 0){
        format(option1, sizeof(option1), "{FA0505}Desactivado");
    }
    format(message, sizeof(message),"Opción\t \tEstado\n\
    Ver chat de dudas.\t \t%s", option1);
    ShowPlayerDialog(playerid, DIALOG_CONFIG, DIALOG_STYLE_TABLIST_HEADERS, "Configuracion de cuenta", message, "Cambiar", "Cerrar");
    return 1;
}
public OnQueryFinishData(playerid, typeConsult[]){
    new doubts[] = "doubts";
    new userData[] = "userData";
    new userAccess[] = "userAccess";


    if(!strcmp(doubts, typeConsult)) {
        cache_get_value_name_int(0, "show_doubts_chat" , UserConfig[playerid][show_doubts_chat]);
    }
    if(!strcmp(userData, typeConsult)) {
        cache_get_value_name_int(0, "id" , UserInfo[playerid][id]);
        cache_get_value_name_int(0, "level" , UserInfo[playerid][level]);
        cache_get_value_float(0, "posx", UserInfo[playerid][posx]);
        cache_get_value_float(0, "posy", UserInfo[playerid][posy]);
        cache_get_value_float(0, "posz", UserInfo[playerid][posz]);
        cache_get_value_int(0, "skin", UserInfo[playerid][skin]);
        cache_get_value_int(0, "money", UserInfo[playerid][money]);
        cache_get_value_int(0, "admin", UserInfo[playerid][admin]);
        UserInfo[playerid][logeado] = true;
        UserInfo[playerid][inventoryStatus] = 0;
        SetSpawnInfo(playerid, 0, UserInfo[playerid][skin], UserInfo[playerid][posx],UserInfo[playerid][posy],UserInfo[playerid][posz], 0.0000, 0,0,0,0,0,0);
        SpawnPlayer(playerid);
    }
    if(!strcmp(userAccess, typeConsult)) {
        cache_get_value_name_int(0, "year" , UserInfo[playerid][year]);
        cache_get_value_name_int(0, "month" , UserInfo[playerid][month]);
        cache_get_value_name_int(0, "day" , UserInfo[playerid][day]);
        cache_get_value_name_int(0, "hour" , UserInfo[playerid][hour]);
        cache_get_value_name_int(0, "minute" , UserInfo[playerid][minute]);
        cache_get_value_name_int(0, "second" , UserInfo[playerid][second]);
        welcomeMessage(playerid);
    }
    return 1;
}

CMD:ver(playerid, params[]){
    new message[2];
    format(message, 2, "%i", UserConfig[playerid][show_doubts_chat]);
    SendClientMessage(playerid, -1, message);
    return 1;
}