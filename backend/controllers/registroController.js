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
        console.log(err);
    }
}

const nuevoRegistro = async (req, res) => {
    const {idAlumno, idRecorrido} = req.body;
    try {
        const pool = await sql.connect(db);
        const result = await pool.request().query(); 
    } catch (error) {
        
    }
}

module.exports = {
    getRegistrosById,
    getAlumno
}