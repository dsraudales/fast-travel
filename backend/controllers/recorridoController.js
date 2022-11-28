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
    const idRecorrido = parseInt(req.params.id);
    try {
        const pool = await sql.connect(db);
        if(4000<=idRecorrido && idRecorrido<5000){
            const result = await pool.request().query(`select r.*, p.*, rut.* FROM Recorridos r 
            INNER JOIN Puntos p ON p.idRuta = r.idRuta 
            INNER JOIN Rutas rut ON r.idRecorrido = ${idRecorrido} AND p.final = 1`);
            res.send({mensaje:'Recorrido encontrado', recorrido:result.recordset});
        }else if(6000<=idRecorrido && idRecorrido<7000){
            const result = await pool.request().query(`select r.*, p.*, rut.* FROM Registros reg 
            INNER JOIN Recorridos r ON reg.idRecorrido = r.idRecorrido 
            INNER JOIN Rutas rut ON rut.idRuta = r.idRuta 
            INNER JOIN Puntos p ON p.idRuta = rut.idRuta WHERE reg.idRegistro = ${idRecorrido} AND p.final = 1`);
            res.send({mensaje:'Recorrido encontrado', recorrido:result.recordset});
        }
    } catch (error) {
        res.send({mensaje:'error al buscar recorrido'})
        console.log(error);
    }
}

module.exports = {
    getRecorridos,
    getRutas,
    getRecorridosPre,
    getRecorridosByRuta,
    getRecorridoById
}


