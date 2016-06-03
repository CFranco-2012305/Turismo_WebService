var ruta=require('express').Router();
ruta.get('/',function(peticion,respuesta){
	respuesta.send("Servidor iniciado");
});

module.exports=ruta;