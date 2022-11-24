const express = require('express');
const db = require('./config/db.js');
const bodyParser= require('body-parser');
const cors = require('cors');

const app = express();
app.use(cors());

//INTERPRETE DE JSON
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended : false}));

app.use('/api/recorridos', require('./routes/recorridos'));
app.use('/api/registros', require('./routes/registros'));

app.listen(3000, ()=>{
    console.log('servidor corriendo');
})