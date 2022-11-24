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
        res.send({mensaje:'Alumno encontrado', alumno:result.recordset});
    } catch (error) {
        res.send({mensaje:'error al buscar alumno'})
        console.log(err);
    }
}

module.exports = {
    getRegistrosById,
    getAlumno
}