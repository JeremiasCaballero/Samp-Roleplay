
    new Text:Textdraw0;
    new Text:Textdraw1;
    new Text:Textdraw2;
    new Text:Textdraw3;
    new Text:Textdraw4;
    new Text:Textdraw5;
    new Text:Textdraw6;
    new Text:Textdraw7;
    new Text:Textdraw8;
    new Text:Textdraw9;
    new Text:Textdraw10;
    new Text:Textdraw11;
    new Text:Textdraw12;
    new Text:Textdraw13;
    new Text:Textdraw14;
    new Text:Textdraw15;
    new Text:Textdraw16;
    new Text:Textdraw17;
    new Text:Textdraw18;
    new Text:Textdraw19;
    new Text:Textdraw20;
    new Text:Box;
stock CrearTextDraws(){
   // new obtenerSkin = GetPlayerSkin(playerid);
    Textdraw0 = TextDrawCreate(135.000000, 125.000000, "Inventario");
	TextDrawBackgroundColor(Textdraw0, 255);
	TextDrawFont(Textdraw0, 1);
	TextDrawLetterSize(Textdraw0, 0.500000, 1.000000);
	TextDrawColor(Textdraw0, -1);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawSetProportional(Textdraw0, 1);
	TextDrawSetShadow(Textdraw0, 1);
	TextDrawSetSelectable(Textdraw0, 1);

	Textdraw1 = TextDrawCreate(220.000000, 125.000000, "Banda");
	TextDrawBackgroundColor(Textdraw1, 255);
	TextDrawFont(Textdraw1, 1);
	TextDrawLetterSize(Textdraw1, 0.500000, 1.000000);
	TextDrawColor(Textdraw1, -1);
	TextDrawSetOutline(Textdraw1, 0);
	TextDrawSetProportional(Textdraw1, 1);
	TextDrawSetShadow(Textdraw1, 1);
	TextDrawSetSelectable(Textdraw1, 1);

	Textdraw2 = TextDrawCreate(271.000000, 125.000000, "Mapa");
	TextDrawBackgroundColor(Textdraw2, 255);
	TextDrawFont(Textdraw2, 1);
	TextDrawLetterSize(Textdraw2, 0.500000, 1.000000);
	TextDrawColor(Textdraw2, -1);
	TextDrawSetOutline(Textdraw2, 0);
	TextDrawSetProportional(Textdraw2, 1);
	TextDrawSetShadow(Textdraw2, 1);
	TextDrawSetSelectable(Textdraw2, 1);

	Textdraw3 = TextDrawCreate(136.000000, 155.000000, "cuerpo");
	TextDrawBackgroundColor(Textdraw3, 1717987071);
	TextDrawFont(Textdraw3, 5);
	TextDrawLetterSize(Textdraw3, 0.500000, 1.000000);
	TextDrawColor(Textdraw3, -1);
	TextDrawSetOutline(Textdraw3, 0);
	TextDrawSetProportional(Textdraw3, 1);
	TextDrawSetShadow(Textdraw3, 1);
	TextDrawUseBox(Textdraw3, 1);
	TextDrawBoxColor(Textdraw3, 255);
	TextDrawTextSize(Textdraw3, 55.000000, 40.000000);
	TextDrawSetSelectable(Textdraw3, 0);

	Textdraw4 = TextDrawCreate(136.000000, 197.000000, "cuerpo2");
	TextDrawBackgroundColor(Textdraw4, 1717987071);
	TextDrawFont(Textdraw4, 5);
	TextDrawLetterSize(Textdraw4, 0.500000, 1.000000);
	TextDrawColor(Textdraw4, -1);
	TextDrawSetOutline(Textdraw4, 0);
	TextDrawSetProportional(Textdraw4, 1);
	TextDrawSetShadow(Textdraw4, 1);
	TextDrawUseBox(Textdraw4, 1);
	TextDrawBoxColor(Textdraw4, 255);
	TextDrawTextSize(Textdraw4, 55.000000, 40.000000);
	TextDrawSetSelectable(Textdraw4, 1);

	Textdraw5 = TextDrawCreate(136.000000, 239.000000, "cuerpo3");
	TextDrawBackgroundColor(Textdraw5, 1717987071);
	TextDrawFont(Textdraw5, 5);
	TextDrawLetterSize(Textdraw5, 0.500000, 1.000000);
	TextDrawColor(Textdraw5, -1);
	TextDrawSetOutline(Textdraw5, 0);
	TextDrawSetProportional(Textdraw5, 1);
	TextDrawSetShadow(Textdraw5, 1);
	TextDrawUseBox(Textdraw5, 1);
	TextDrawBoxColor(Textdraw5, 255);
	TextDrawTextSize(Textdraw5, 55.000000, 40.000000);
	TextDrawSetSelectable(Textdraw5, 1);

	Textdraw6 = TextDrawCreate(136.000000, 281.000000, "cuerpo4");
	TextDrawBackgroundColor(Textdraw6, 1717987071);
	TextDrawFont(Textdraw6, 5);
	TextDrawLetterSize(Textdraw6, 0.500000, 1.000000);
	TextDrawColor(Textdraw6, -1);
	TextDrawSetOutline(Textdraw6, 0);
	TextDrawSetProportional(Textdraw6, 1);
	TextDrawSetShadow(Textdraw6, 1);
	TextDrawUseBox(Textdraw6, 1);
	TextDrawBoxColor(Textdraw6, 255);
	TextDrawTextSize(Textdraw6, 55.000000, 40.000000);
	TextDrawSetSelectable(Textdraw6, 1);

	Textdraw7 = TextDrawCreate(136.000000, 323.000000, "cuerpo5");
	TextDrawBackgroundColor(Textdraw7, 1717987071);
	TextDrawFont(Textdraw7, 5);
	TextDrawLetterSize(Textdraw7, 0.500000, 1.000000);
	TextDrawColor(Textdraw7, -1);
	TextDrawSetOutline(Textdraw7, 0);
	TextDrawSetProportional(Textdraw7, 1);
	TextDrawSetShadow(Textdraw7, 1);
	TextDrawUseBox(Textdraw7, 1);
	TextDrawBoxColor(Textdraw7, 255);
	TextDrawTextSize(Textdraw7, 55.000000, 40.000000);
	TextDrawSetSelectable(Textdraw7, 1);

	Textdraw8 = TextDrawCreate(155.000000, 157.000000, "skin");
	TextDrawBackgroundColor(Textdraw8, 0);
	TextDrawFont(Textdraw8, 5);
	TextDrawLetterSize(Textdraw8, 0.500000, 1.000000);
	TextDrawColor(Textdraw8, -1);
	TextDrawSetOutline(Textdraw8, 0);
	TextDrawSetProportional(Textdraw8, 1);
	TextDrawSetShadow(Textdraw8, 0);
	TextDrawUseBox(Textdraw8, 1);
	TextDrawBoxColor(Textdraw8, 255);
	TextDrawTextSize(Textdraw8, 181.000000, 204.000000);
	TextDrawSetPreviewModel(Textdraw8, 120);
	TextDrawSetPreviewRot(Textdraw8, -16.000000, 0.000000, 20.000000, 1.000000);
	TextDrawSetSelectable(Textdraw8, 0);

	Textdraw9 = TextDrawCreate(390.000000, 318.000000, "obj2");
	TextDrawBackgroundColor(Textdraw9, 1717987071);
	TextDrawFont(Textdraw9, 5);
	TextDrawLetterSize(Textdraw9, 0.500000, 1.000000);
	TextDrawColor(Textdraw9, -1);
	TextDrawSetOutline(Textdraw9, 0);
	TextDrawSetProportional(Textdraw9, 1);
	TextDrawSetShadow(Textdraw9, 1);
	TextDrawUseBox(Textdraw9, 1);
	TextDrawBoxColor(Textdraw9, 255);
	TextDrawTextSize(Textdraw9, 55.000000, 45.000000);
	TextDrawSetSelectable(Textdraw9, 1);

	Textdraw10 = TextDrawCreate(334.000000, 318.000000, "obj3");
	TextDrawBackgroundColor(Textdraw10, 1717987071);
	TextDrawFont(Textdraw10, 5);
	TextDrawLetterSize(Textdraw10, 0.500000, 1.000000);
	TextDrawColor(Textdraw10, -1);
	TextDrawSetOutline(Textdraw10, 0);
	TextDrawSetProportional(Textdraw10, 1);
	TextDrawSetShadow(Textdraw10, 1);
	TextDrawUseBox(Textdraw10, 1);
	TextDrawBoxColor(Textdraw10, 255);
	TextDrawTextSize(Textdraw10, 55.000000, 45.000000);
	TextDrawSetSelectable(Textdraw10, 1);

	Textdraw11 = TextDrawCreate(334.000000, 272.000000, "obj4");
	TextDrawBackgroundColor(Textdraw11, 1717987071);
	TextDrawFont(Textdraw11, 5);
	TextDrawLetterSize(Textdraw11, 0.500000, 1.000000);
	TextDrawColor(Textdraw11, -1);
	TextDrawSetOutline(Textdraw11, 0);
	TextDrawSetProportional(Textdraw11, 1);
	TextDrawSetShadow(Textdraw11, 1);
	TextDrawUseBox(Textdraw11, 1);
	TextDrawBoxColor(Textdraw11, 255);
	TextDrawTextSize(Textdraw11, 55.000000, 45.000000);
	TextDrawSetSelectable(Textdraw11, 1);

	Textdraw12 = TextDrawCreate(390.000000, 272.000000, "obj5");
	TextDrawBackgroundColor(Textdraw12, 1717987071);
	TextDrawFont(Textdraw12, 5);
	TextDrawLetterSize(Textdraw12, 0.500000, 1.000000);
	TextDrawColor(Textdraw12, -1);
	TextDrawSetOutline(Textdraw12, 0);
	TextDrawSetProportional(Textdraw12, 1);
	TextDrawSetShadow(Textdraw12, 1);
	TextDrawUseBox(Textdraw12, 1);
	TextDrawBoxColor(Textdraw12, 255);
	TextDrawTextSize(Textdraw12, 55.000000, 45.000000);
	TextDrawSetSelectable(Textdraw12, 1);

	Textdraw13 = TextDrawCreate(446.000000, 272.000000, "obj6");
	TextDrawBackgroundColor(Textdraw13, 1717987071);
	TextDrawFont(Textdraw13, 5);
	TextDrawLetterSize(Textdraw13, 0.500000, 1.000000);
	TextDrawColor(Textdraw13, -1);
	TextDrawSetOutline(Textdraw13, 0);
	TextDrawSetProportional(Textdraw13, 1);
	TextDrawSetShadow(Textdraw13, 1);
	TextDrawUseBox(Textdraw13, 1);
	TextDrawBoxColor(Textdraw13, 255);
	TextDrawTextSize(Textdraw13, 55.000000, 45.000000);
	TextDrawSetSelectable(Textdraw13, 1);

	Textdraw14 = TextDrawCreate(446.000000, 226.000000, "obj7");
	TextDrawBackgroundColor(Textdraw14, 1717987071);
	TextDrawFont(Textdraw14, 5);
	TextDrawLetterSize(Textdraw14, 0.500000, 1.000000);
	TextDrawColor(Textdraw14, -1);
	TextDrawSetOutline(Textdraw14, 0);
	TextDrawSetProportional(Textdraw14, 1);
	TextDrawSetShadow(Textdraw14, 1);
	TextDrawUseBox(Textdraw14, 1);
	TextDrawBoxColor(Textdraw14, 255);
	TextDrawTextSize(Textdraw14, 55.000000, 45.000000);
	TextDrawSetSelectable(Textdraw14, 1);

	Textdraw15 = TextDrawCreate(446.000000, 318.000000, "obj8");
	TextDrawBackgroundColor(Textdraw15, 1717987071);
	TextDrawFont(Textdraw15, 5);
	TextDrawLetterSize(Textdraw15, 0.500000, 1.000000);
	TextDrawColor(Textdraw15, -1);
	TextDrawSetOutline(Textdraw15, 0);
	TextDrawSetProportional(Textdraw15, 1);
	TextDrawSetShadow(Textdraw15, 1);
	TextDrawUseBox(Textdraw15, 1);
	TextDrawBoxColor(Textdraw15, 255);
	TextDrawTextSize(Textdraw15, 55.000000, 45.000000);
	TextDrawSetSelectable(Textdraw15, 1);

	Textdraw16 = TextDrawCreate(390.000000, 226.000000, "obj9");
	TextDrawBackgroundColor(Textdraw16, 1717987071);
	TextDrawFont(Textdraw16, 5);
	TextDrawLetterSize(Textdraw16, 0.500000, 1.000000);
	TextDrawColor(Textdraw16, -1);
	TextDrawSetOutline(Textdraw16, 0);
	TextDrawSetProportional(Textdraw16, 1);
	TextDrawSetShadow(Textdraw16, 1);
	TextDrawUseBox(Textdraw16, 1);
	TextDrawBoxColor(Textdraw16, 255);
	TextDrawTextSize(Textdraw16, 55.000000, 45.000000);
	TextDrawSetSelectable(Textdraw16, 1);

	Textdraw17 = TextDrawCreate(334.000000, 226.000000, "obj10");
	TextDrawBackgroundColor(Textdraw17, 1717987071);
	TextDrawFont(Textdraw17, 5);
	TextDrawLetterSize(Textdraw17, 0.500000, 1.000000);
	TextDrawColor(Textdraw17, -1);
	TextDrawSetOutline(Textdraw17, 0);
	TextDrawSetProportional(Textdraw17, 1);
	TextDrawSetShadow(Textdraw17, 1);
	TextDrawUseBox(Textdraw17, 1);
	TextDrawBoxColor(Textdraw17, 255);
	TextDrawTextSize(Textdraw17, 55.000000, 45.000000);
	TextDrawSetSelectable(Textdraw17, 1);

	Textdraw18 = TextDrawCreate(334.000000, 180.000000, "obj11");
	TextDrawBackgroundColor(Textdraw18, 1717987071);
	TextDrawFont(Textdraw18, 5);
	TextDrawLetterSize(Textdraw18, 0.500000, 1.000000);
	TextDrawColor(Textdraw18, -1);
	TextDrawSetOutline(Textdraw18, 0);
	TextDrawSetProportional(Textdraw18, 1);
	TextDrawSetShadow(Textdraw18, 1);
	TextDrawUseBox(Textdraw18, 1);
	TextDrawBoxColor(Textdraw18, 255);
	TextDrawTextSize(Textdraw18, 55.000000, 45.000000);
	TextDrawSetSelectable(Textdraw18, 1);

	Textdraw19 = TextDrawCreate(390.000000, 180.000000, "obj12");
	TextDrawBackgroundColor(Textdraw19, 1717987071);
	TextDrawFont(Textdraw19, 5);
	TextDrawLetterSize(Textdraw19, 0.500000, 1.000000);
	TextDrawColor(Textdraw19, -1);
	TextDrawSetOutline(Textdraw19, 0);
	TextDrawSetProportional(Textdraw19, 1);
	TextDrawSetShadow(Textdraw19, 1);
	TextDrawUseBox(Textdraw19, 1);
	TextDrawBoxColor(Textdraw19, 255);
	TextDrawTextSize(Textdraw19, 55.000000, 45.000000);
	TextDrawSetSelectable(Textdraw19, 1);

	Textdraw20 = TextDrawCreate(446.000000, 180.000000, "obj13");
	TextDrawBackgroundColor(Textdraw20, 1717987071);
	TextDrawFont(Textdraw20, 5);
	TextDrawLetterSize(Textdraw20, 0.500000, 1.000000);
	TextDrawColor(Textdraw20, -1);
	TextDrawSetOutline(Textdraw20, 0);
	TextDrawSetProportional(Textdraw20, 1);
	TextDrawSetShadow(Textdraw20, 1);
	TextDrawUseBox(Textdraw20, 1);
	TextDrawBoxColor(Textdraw20, 255);
	TextDrawTextSize(Textdraw20, 55.000000, 45.000000);
	TextDrawSetSelectable(Textdraw20, 1);

	Box = TextDrawCreate(512.117675, 121.666664, "usebox");
	TextDrawLetterSize(Box, 0.000000, 27.488893);
	TextDrawTextSize(Box, 126.941177, 0.000000);
	TextDrawAlignment(Box, 1);
	TextDrawColor(Box, 0);
	TextDrawUseBox(Box, true);
	TextDrawBoxColor(Box, 102);
	TextDrawSetShadow(Box, 0);
	TextDrawSetOutline(Box, 0);
	TextDrawFont(Box, 0);
    return 1;
}

stock showInventory(playerid){
    TextDrawShowForPlayer(playerid, Textdraw0);
    TextDrawShowForPlayer(playerid, Textdraw1);
    TextDrawShowForPlayer(playerid, Textdraw2);
    TextDrawShowForPlayer(playerid, Textdraw3);
    TextDrawShowForPlayer(playerid, Textdraw4);
    TextDrawShowForPlayer(playerid, Textdraw5);
    TextDrawShowForPlayer(playerid, Textdraw6);
    TextDrawShowForPlayer(playerid, Textdraw7);
    TextDrawShowForPlayer(playerid, Textdraw8);
    TextDrawShowForPlayer(playerid, Textdraw9);
    TextDrawShowForPlayer(playerid, Textdraw10);
    TextDrawShowForPlayer(playerid, Textdraw11);
    TextDrawShowForPlayer(playerid, Textdraw12);
    TextDrawShowForPlayer(playerid, Textdraw13);
    TextDrawShowForPlayer(playerid, Textdraw14);
    TextDrawShowForPlayer(playerid, Textdraw15);
    TextDrawShowForPlayer(playerid, Textdraw16);
    TextDrawShowForPlayer(playerid, Textdraw17);
    TextDrawShowForPlayer(playerid, Textdraw18);
    TextDrawShowForPlayer(playerid, Textdraw19);
    TextDrawShowForPlayer(playerid, Textdraw20);
    TextDrawShowForPlayer(playerid, Box);
    /*
    PlayerTextDrawShow(playerid, Textdraw0);
    PlayerTextDrawShow(playerid, Textdraw1);
    PlayerTextDrawShow(playerid, Textdraw2);
    PlayerTextDrawShow(playerid, Textdraw3);
    PlayerTextDrawShow(playerid, Textdraw4);
    PlayerTextDrawShow(playerid, Textdraw5);
    PlayerTextDrawShow(playerid, Textdraw6);
    PlayerTextDrawShow(playerid, Textdraw7);
    PlayerTextDrawShow(playerid, Textdraw8);
    PlayerTextDrawShow(playerid, Textdraw9);
    PlayerTextDrawShow(playerid, Textdraw10);
    PlayerTextDrawShow(playerid, Textdraw11);
    PlayerTextDrawShow(playerid, Textdraw12);
    PlayerTextDrawShow(playerid, Textdraw13);
    PlayerTextDrawShow(playerid, Textdraw14);
    PlayerTextDrawShow(playerid, Textdraw15);
    PlayerTextDrawShow(playerid, Textdraw16);
    PlayerTextDrawShow(playerid, Textdraw17);
    PlayerTextDrawShow(playerid, Textdraw18);
    PlayerTextDrawShow(playerid, Textdraw19);
    PlayerTextDrawShow(playerid, Textdraw20);
    PlayerTextDrawShow(playerid, Box);
    
   */

    /*
    if(EstadoInventario == 0){
        SendClientMessage(playerid, -1, "Abriste el inventario");
	    for(new i = 0; i <23; i++){
 			PlayerTextDrawShow(playerid, PlayerTD[playerid][i]);
		}
        UserInfo[playerid][inventoryStatus] = 1;
	}else{
	    SendClientMessage(playerid, -1, "Cerraste el inventario");
	    for(new i = 0; i<23; i++){
			PlayerTextDrawHide(playerid, PlayerTD[playerid][i]);
		}
        UserInfo[playerid][inventoryStatus] = 0;
	}
    print(UserInfo[playerid][inventoryStatus]);
    */
}