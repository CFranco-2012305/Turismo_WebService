var ruta=require('express').Router();
var usuario=require('../controller/ControladorUsuario.js')
ruta.get('/',function(peticion,respuesta){
	respuesta.send("Servidor iniciado");
});
ruta.post('/usuario/registro',usuario.registro);
module.exports=ruta;