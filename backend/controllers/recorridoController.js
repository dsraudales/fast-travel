const db = require('../config/db.js');
const sql = require('mssql');

const getRecorridos = async (req, res) => {
    try {
        const pool = await sql.connect(db);
        const result = await pool.request().query(`select r.*, t.nombreRuta FROM Recorridos r
        INNER JOIN Rutas t ON r.idRuta = t.idRuta`);
        res.send({mensaje:'Recorridos encontrados', recorridos:result.recordset});
    } catch (error) {
        res.send({mensaje:'error al buscar recorridos'})
        console.log(err);
    }
};

const getRutas = async (req, res) => {
    try {
        const pool = await sql.connect(db);
        const result = await pool.request().query("select * from Rutas");
        res.send({mensaje:'Rutas encontradas', rutas:result.recordset});
    } catch (error) {
        res.send({mensaje:'error al buscar rutas'})
        console.log(err);
    }
};

const getRecorridosPre = async (req, res) => {
    const sector = req.params.sector;
    //console.log(sector);
    try {
        const pool = await sql.connect(db);
        const result = await pool.request().query(`SELECT DISTINCT r.* FROM Recorridos r
        INNER JOIN Puntos p ON r.idRuta = p.idRuta AND p.sector = '${sector}'`);
        res.send({mensaje:'Recorridos encontrados', recorridos:result.recordset});
    } catch (error) {
        res.send({mensaje:'error al buscar recorridos'})
        console.log(err);
    }
}

const getRecorridosByRuta = async (req, res) => {
    const idRuta = req.params.id;
    try {
        const pool = await sql.connect(db);
        const result = await pool.request().query(`select * from Recorridos WHERE idRuta = '${idRuta}'`);
        res.send({mensaje:'Recorridos encontrados', recorridos:result.recordset});
    } catch (error) {
        res.send({mensaje:'error al buscar recorridos'})
        console.log(err);
    }
}

const getRecorridoById = async (req, res) => {
    const idRecorrido = req.params.id;
    try {
        const pool = await sql.connect(db);
        const result = await pool.request().query(`select r.*, p.*, rut.* FROM Recorridos r 
        INNER JOIN Puntos p ON p.idRuta = r.idRuta 
        INNER JOIN Rutas rut ON r.idRecorrido = ${idRecorrido} AND p.final = 1`);
        res.send({mensaje:'Recorrido encontrado', recorrido:result.recordset});
    } catch (error) {
        res.send({mensaje:'error al buscar recorridos'})
        console.log(err);
    }
}

module.exports = {
    getRecorridos,
    getRutas,
    getRecorridosPre,
    getRecorridosByRuta,
    getRecorridoById
}


