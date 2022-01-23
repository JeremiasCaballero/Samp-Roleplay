/*
      This module contains the functionality when any player connect to server
*/

#define DIALOG_REGISTER 3 


forward cuadros(playerid);
forward verifyPlayer(playerid);
hook OnPlayerConnect(playerid){
   new query[520];
   
   mysql_format(MySQL, query, sizeof(query), "SELECT name FROM `users` WHERE `name`='%e'", getName(playerid));
   mysql_pquery(MySQL, query, "verifyPlayer","d", playerid);
   //print(query);
   SetTimerEx("cuadros", 1000, false, "i", playerid);
   //print(query);
   return 1;
}


public cuadros(playerid){
      PlayAudioStreamForPlayer(playerid, "http://186.152.70.14:80/musica/musica.mp3");
      SetPlayerCameraPos(playerid, 1533.2587, -1763.7717, 73.6204);
      SetPlayerCameraLookAt(playerid, 1532.9288, -1762.8286, 73.0504);
      //verifyPlayer(playerid);
}


// this function verify if the player is register o not
public verifyPlayer(playerid){
   new rows;
   cache_get_row_count(rows);
   if(rows){ // if the player exits.. 
      //ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "{0080FF}Registro", "Ingrese una contraseña para su cuenta", "Aceptar", "Salir");
       showLogin(playerid);
       print("tu cuenta existe");
   }else{
        ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "{0080FF}Registro", "Ingrese una contraseña para su cuenta", "Aceptar", "Salir");
        print("tu cuenta no existe");
      }
   return 1;
}