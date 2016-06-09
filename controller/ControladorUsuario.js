var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'db_TurismoGuate'
});

var usuario={
    registro:function(peticion,respuesta){
		respuesta.send("Servicio Iniciado");

		connection.query("CALL sp_registroUsuario('"+peticion.body.nombre+"','"+peticion.body.correo+"','"+peticion.body.contraseña+"','"+peticion.body.nick+"','"+peticion.body.telefono+"','"+peticion.body.nacionalidad+"','"+peticion.body.id_Rol+"');", function(err) {
			if (err) throw err;
			else
				respuesta.send({"mensaje":"registro correcto","status":"200"})
	});
	
	}
};
module.exports=usuario;