const db = require('../config/db.js');
const sql = require('mssql');

const getRegistrosById = async (req, res) => {
    const idAlumno = req.params.id;
    try {
        const pool = await sql.connect(db);
        const result = await pool.request().query(`select * from Registros WHERE idAlumno = '${idAlumno}'`);
        res.send({mensake:'Registros encontrados', registros:result.recordset});
    } catch (error) {
        res.send({mensake:'error al buscar registros'})
        console.log(err);
    }
}

const getAlumno = async (req, res) => {
    const {correo} = req.body;
    try {
        const pool = await sql.connect(db);
        const result = await pool.request().query(`SELECT idAlumno, CONCAT(nombre,' ',apellido) nombre from Alumnos WHERE email = '${correo}'`);
        if(result.recordset[0]){
            res.send({encontrado:1, mensaje:'Alumno encontrado', alumno:result.recordset});
        }else{
            res.send({encontrado:0, mensaje:'Alumno no encontrado'});
        }
    } catch (error) {
        res.send({mensaje:'error al buscar alumno'})
        console.log(error);
    }
}

const nuevoRegistro = async (req, res) => {
    const {idAlumno, idRecorrido} = req.body;
    try {
        
        const pool = await sql.connect(db);
        const result = await pool.request().query(`SELECT * FROM Registros WHERE idAlumno = ${idAlumno} AND idRecorrido = ${idRecorrido}`);
        
        if(result.recordset[0]){
            res.send({exito:0,mensaje:'recorrido ya registrado'});
        }else{
            const result2 = await pool.request().query(`INSERT INTO Registros(idAlumno, idRecorrido, horaIngreso, horaSalida) VALUES (${idAlumno}, ${idRecorrido}, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)`);
            res.send({exito:1,mensaje:'recorrido registrado'});
        }
    } catch (error) {
        res.send({exito:0,mensaje:'error agregando registro'});
    }
}

const comprobarRegistro = async (req, res) => {
    const {idAlumno, idRecorrido} = req.body;
    try {
        
        const pool = await sql.connect(db);
        const result = await pool.request().query(`SELECT * FROM Registros WHERE idAlumno = ${idAlumno} AND idRecorrido = ${idRecorrido}`);
        
        if(result.recordset[0]){
            res.send({exito:0,mensaje:'recorrido ya registrado'});
        }else{
            res.send({exito:1,mensaje:'recorrido no registrado'});
        }
    } catch (error) {
        res.send({exito:0,mensaje:'error buscando registro'});
    }
}

const getHistorial = async (req, res) => {
    const idAlumno = req.params.id;
    try {
        const pool = await sql.connect(db);
        const result = await pool.request().query(`SELECT reg.idRegistro, reg.horaIngreso, rut.precio, rut.* FROM Registros reg 
        INNER JOIN Recorridos r ON reg.idRecorrido = r.idRecorrido 
        INNER JOIN Rutas rut ON rut.idRuta = r.idRuta AND idAlumno = ${idAlumno}`);
        if(result.recordset[0]){
            res.send({exito:1, encontrado:1, historial:result.recordset, mensaje:'historial encontrado'});
        }else{
            res.send({exito:1, encotrado:0, mensaje:'Historial vacio'});
        }
        
    } catch (error) {
        res.send({mensaje:'error obteniendo historial'})
        
    }
}

module.exports = {
    getRegistrosById,
    getAlumno,
    nuevoRegistro,
    comprobarRegistro,
    getHistorial
}