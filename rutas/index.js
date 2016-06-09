var ruta=require('express').Router();
var usuario=require('../controller/ControladorUsuario.js')
ruta.get('/',function(peticion,respuesta){
	respuesta.send("Servidor iniciado");
});
ruta.get('/usuario/registro',usuario.registro);
module.exports=ruta;