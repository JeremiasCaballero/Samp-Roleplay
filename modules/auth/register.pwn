
#include "YSI_Coding\y_hooks"
#define DIALOG_SEXO 2
#define DIALOG_EMAIL 16

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
    switch(dialogid){
        case DIALOG_REGISTER:
        {
            if(!response) return Kick(playerid); // si le da a cancerlar
            if(strlen(inputtext) < 5) // si la respuesta es menor a 5 (la clave)
            {
                ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "{0080FF}Registro", "La contraseña debe ser de mas de 5 caracteres", "Aceptar", "Salir");
                return 1;
            }
            bcrypt_hash(playerid,"OnPassswordHash",inputtext,12);
            ShowPlayerDialog(playerid, DIALOG_SEXO, DIALOG_STYLE_MSGBOX, "{0080FF}Tipo de Personaje", "Elija el genero de su personaje", "Masculino", "Femenino");
        }
        case DIALOG_SEXO:
        {   
            switch(response){
                 case 0:
                    {
                        UserInfo[playerid][sexo] = 0;
                        UserInfo[playerid][skin] = 188;
                        SendClientMessage(playerid, -1, "Elegiste Mujer");
                        ShowPlayerDialog(playerid, DIALOG_EMAIL,  DIALOG_STYLE_INPUT,"Registrar Email", "Registre un Email", "Registrarse", "");
                    }
                case 1:
                    {
                        UserInfo[playerid][sexo] = 1;
                        UserInfo[playerid][skin] = 188;
                        SendClientMessage(playerid, -1, "Elegiste Hombre");
                        ShowPlayerDialog(playerid, DIALOG_EMAIL,  DIALOG_STYLE_INPUT,"Registrar Email", "Registre un Email", "Registrarse", "");
                    }
            }
        }
        case DIALOG_EMAIL:
        { 
            switch(response){
                case 0:{
                    Kick(playerid);
                }     
                case 1:
                {
                   // for(new i = 0; i < strlen( inputtext ); i++) if (inputtext[i] == ' ') return SendClientMessageEx(playerid, COLORGRAD2, "Porfavor usar ''(Guión bajo) - Nombre_Apellido.");
                    //strval convierte el valor del inputtext a numerico

                    strmid(UserInfo[playerid][mail], inputtext, 0, strlen(inputtext), 24);

                    UserInfo[playerid][posx] = 1728.1860;
                    UserInfo[playerid][posy] = -1269.4098;
                    UserInfo[playerid][posz] = 13.5454;
                    UserInfo[playerid][level] = 1;
                    UserInfo[playerid][money] = 6000;
                   // strmid(UserInfo[playerid][ipRegister], dest, 0, strlen(dest), 24);
                    new ipPlayer[16];
                    GetPlayerIp(playerid,ipPlayer,sizeof(ipPlayer));
                    strmid(UserInfo[playerid][ipRegister], ipPlayer, 0, strlen(ipPlayer), 16);
                    UserInfo[playerid][name] = getName(playerid);
                    UserInfo[playerid][logeado] = true;
                    savePlayerData(playerid);
                    SetSpawnInfo(playerid, 0, UserInfo[playerid][skin], UserInfo[playerid][posx],UserInfo[playerid][posy],UserInfo[playerid][posz], 0.0000, 0,0,0,0,0,0);
                    SpawnPlayer(playerid);
                }
             }
         }
    }
    return 1;
}
forward OnPassswordHash(playerid);
public OnPassswordHash(playerid){
    new dest[BCRYPT_HASH_LENGTH];
    bcrypt_get_hash(dest);
    strmid(UserInfo[playerid][password], dest, 0, strlen(dest), 64);
}