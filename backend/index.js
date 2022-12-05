const express = require('express');
const cron = require('node-cron');
const recorridos = require('./controllers/recorridoController');
const bodyParser= require('body-parser');
const cors = require('cors');

const app = express();
app.use(cors());

//INTERPRETE DE JSON
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended : false}));

app.use('/api/recorridos', require('./routes/recorridos'));
app.use('/api/registros', require('./routes/registros'));


cron.schedule('1 0 * * *', () => {
    recorridos.generarRecorridos();
});


recorridos.generarRecorridos();

/*
CROME JOB TIME
"* * * * * *"
 | | | | | |
 | | | | | |
 | | | | | day of week
 | | | | month
 | | | day of month
 | | hour
 | minute
 second(optional)
*/


app.listen(3000, ()=>{
    console.log('servidor corriendo');
})