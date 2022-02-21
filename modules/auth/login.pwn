#include "YSI_Coding\y_hooks"
#define DIALOG_LOGIN 4

forward loadLoginData(playerid);

stock showLogin(playerid){
	    new query[520];
		mysql_format(MySQL, query, sizeof(query),"SELECT password FROM `users` WHERE `name`='%s'", getName(playerid));
 		mysql_pquery(MySQL, query, "loadLoginData","d", playerid);
        //Show the login dialog
		print(query);
		new isNameValid = nameValidator(playerid);
		if(isNameValid == 0){
			new string[86];
			format(string,86, "Tu nombre debe ser Nombre_Apellido, porfavor vuelva a ingresar con un nombre valido.");
			SendClientMessage(playerid, -1, string);
		}
		new welcome[100]; // TO:DO fijarse cuanto ocupa
		format(welcome,sizeof(welcome), "{FFFFFF}Bienvenido de nuevo {00CCFF}%s{FFFFFF}, introduce tu contraseña para entrar.", getName(playerid));
        ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{0080FF}Ingresar", welcome, "Login", "Exit"),
		getName(playerid);
}

public loadLoginData(playerid){
	print("cargando datos");
	new contra[64];
	cache_get_value_name(0,"password",contra);
	UserInfo[playerid][password] = contra;

	//print(contra);
	//print(UserInfo[playerid][password]);
	//cache_get_value_name_int(1,"id", );
	//Jugador[playerid][id] = cache_get_row_float(0, 4);
	return 1;
}





hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
 switch(dialogid){
		case DIALOG_LOGIN:
        	{
		    if(!response) Kick(playerid);
			//print(UserInfo[playerid][password]);
			//print(UserInfo[playerid][id]);
		    bcrypt_verify(playerid,"OnPassswordVerify",inputtext,UserInfo[playerid][password]);

		}
	}
 return 1;
}

forward OnPassswordVerify(playerid,bool:success);
 public OnPassswordVerify(playerid,bool:success){

 	if(success){
 		loadData(playerid);
 	} else{
 		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{0080FF}Ingresar", "Contrasña incorrecta", "Ingresar", "Salir");
 	}
 }