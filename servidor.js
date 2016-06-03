var express=require('express');
var bodyParser=require('body-parser');
var morgan=require('morgan');
var mysql=require('mysql');
var puerto=3000;
var app=express();

app.use(bodyParser.urlencoded({
	extended:false	
}));

app.use(bodyParser.json());
app.use(morgan('dev'));
app.use('/api/v1',require('./rutas'));

app.listen(puerto,function(){
	console.log("Servidor iniciado en el puerto numero "+puerto);
});