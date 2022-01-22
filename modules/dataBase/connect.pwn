#define mysql_host    "localhost"
#define mysql_user    "root"
#define mysql_db        "server"
#define mysql_pass         ""
#define mysql_debugging_enabled             (true)
#define SQL_EDIFICIO_TABLE                    "edificio"
#define SQL_PLAYERS_TABLE                    "user"

hook OnGameModeInit(){

   	MySQL = mysql_connect(mysql_host,mysql_user,mysql_pass,mysql_db);
	print("Estableciendo Conexion con la base de datos");
	if(mysql_errno() != 0)
	{
		print("No se pudo conectar, prende el xampp o fijate los parametros");
	}
	else
	{
	    print("Conexion exitosa!");
	}
	return 1;
}