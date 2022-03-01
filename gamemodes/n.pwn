#include <a_samp>
#include <core>
#include <float>
#include <a_mysql>
#include "YSI_Coding\y_hooks"
#include <samp_bcrypt>
#include <zcmd>
#include <sscanf2>
#include "YSI_Data/y_iterate"
// ======================= Defines ============================
#define DEFAULT_COLOR       0xFFFFFF00
// ======================== DataBase instance =========================
new MySQL:MySQL;
// ===================== Constants ==================== 
#include "../constants/constants.pwn"
// ======================== MODULES =========================
#include "../modules/dataBase/connect.pwn"
#include "../modules/entities/player.pwn"
#include "../modules/inventory/inventory.pwn"
#include "../modules/main/onPlayerConnect.pwn"
#include "../modules/auth/register.pwn"
#include "../modules/auth/login.pwn"
#include "../modules/maps/entrada.pwn"
#include "../modules/admin/admin.pwn"
#include "../modules/doubtsChat/doubtsChat.pwn"
// ===================== Forwars ==================== 
forward cuadros(playerid);

main()
{
	print("\n----------------------------------");
	print("Amnesia Rolplay\n");
    print("Developed by Turquito\n");
    print("2018 - present\n");
    print("All rights reserved\n");
	print("----------------------------------\n");
}

public OnPlayerConnect(playerid)
{ 
	return 1;
}
public OnPlayerCommandText(playerid, cmdtext[])
{

	return 0;
}
public OnPlayerDeath(playerid, killerid, reason)
{
   	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnGameModeInit()
{
	
    //conectar();
    //register();
	return 1;
}


forward ColorJugadorDefault(playerid);
public ColorJugadorDefault(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		SetPlayerColor(playerid,DEFAULT_COLOR);//Color Blanco
	}
	return 1;
}
// set the player data
public OnPlayerSpawn(playerid){
	CrearTextDraws();
	if(UserInfo[playerid][logeado] == true){
		ColorJugadorDefault(playerid);
	    StopAudioStreamForPlayer(playerid);
	    SetPlayerScore(playerid, UserInfo[playerid][level]);
	    SetPlayerSkin(playerid, UserInfo[playerid][skin]);
		GivePlayerMoney(playerid,UserInfo[playerid][money]);
	    SetPlayerPos(playerid, UserInfo[playerid][posx], UserInfo[playerid][posy], UserInfo[playerid][posz]);
	}else{
		Kick(playerid);
	}
	return 1;
}
