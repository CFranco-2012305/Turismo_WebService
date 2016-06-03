var express=require('express');
var bodyparser=require('body-parser');
var morgan=require('morgan');
var puerto=3000;
var app=express();


app.listen(puerto,function(){
	console.log("Servidor iniciado en el puerto numero"+puerto);
});