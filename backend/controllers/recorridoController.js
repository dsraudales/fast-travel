const db = require('../config/db.js');
const sql = require('mssql');

const getRecorridos = async (req, res) => {
    const id = req.params.id;
    try {
        const pool = await sql.connect(db);
        const ubicacion = await pool.request().query(`SELECT ubicacion FROM Alumnos WHERE idAlumno = ${id}`);
        const result = await pool.request().query(`select r.*, t.nombreRuta FROM Recorridos r
        INNER JOIN Rutas t ON r.idRuta = t.idRuta WHERE nombreRuta = '${ubicacion.recordset[0].ubicacion}'`);
        res.send({mensaje:'Recorridos encontrados', recorridos:result.recordset});
    } catch (error) {
        res.send({mensaje:'error al buscar recorridos'})
        console.log(err);
    }
};

const getUbicaciones = async (req, res) => {
    try {
        const pool = await sql.connect(db);
        const resultUbicacion = await pool.request().query(`SELECT ubicacion FROM Alumnos GROUP BY ubicacion ORDER BY COUNT(ubicacion) DESC`);
        res.send({exito:1, ubicaciones:resultUbicacion.recordset, mensaje:'ubicaciones encontradas'});
    } catch (error) {
        res.send({exito:0, mensaje:'error al buscar ubicaciones'});
    }
}

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
            const result = await pool.request().query(`select r.*, rut.* FROM Recorridos r 
            INNER JOIN Rutas rut ON r.idRuta = rut.idRuta AND r.idRecorrido = ${idRecorrido}`);
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

const getRecorridoByIdOld = async (req, res) => {
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

const generarRecorridos = async() => {
    try {
        const pool = await sql.connect(db);
        const resultRecorridos = await pool.request().query("SELECT * FROM Recorridos WHERE fecha = CONVERT(date, GETDATE())");
        if(resultRecorridos.recordset.length==0){
            insertarRecorridos();
        }
    } catch (error) {
        console.log(error);
    }
}

const insertarRecorridos = async() => {
    try {
        const pool = await sql.connect(db);
        const resultTotalAlumnos = await pool.request().query("SELECT COUNT(idAlumno) AS Total FROM Alumnos");
        const resultRutas = await pool.request().query("SELECT idRuta, nombreRuta FROM Rutas");
        const resultUbicacion = await pool.request().query(`SELECT ubicacion, 100*COUNT(ubicacion)/${resultTotalAlumnos.recordset[0].Total} AS Total FROM Alumnos GROUP BY ubicacion ORDER BY COUNT(ubicacion) DESC`);
        const resultHoraInicio = await pool.request().query(`SELECT c.horaInicio, COUNT(horaInicio) AS Total FROM Matricula m 
            INNER JOIN Clases c ON m.idClase = c.idClase GROUP BY horaInicio ORDER BY COUNT(horaInicio) DESC`);
        const resultHoraFinal = await pool.request().query(`SELECT c.horaFinal, COUNT(horaFinal) AS Total FROM Matricula m 
            INNER JOIN Clases c ON m.idClase = c.idClase GROUP BY horaFinal ORDER BY COUNT(horaFinal) DESC`);

        resultUbicacion.recordset.forEach(async (ubicacion, index) => {
            
            let recorridos = Math.round(50*(ubicacion.Total/100))
            let id = resultRutas.recordset;
            id = id.findIndex(x => x.nombreRuta == ubicacion.ubicacion);
            for(let i=0; i<recorridos; i++){
                let j = i;
                if(j>=resultHoraInicio.recordset.length){
                    j = j % resultHoraInicio.recordset.length;
                }
                //console.log("insertar ruta "+ubicacion.ubicacion+" en hora: "+resultHoraInicio.recordset[j].horaInicio)
                const resultInsertRecorrido = await pool.request().query(`INSERT INTO Recorridos(idRuta, IdAutobus, horaSalida, horaEntrada, fecha) VALUES(${resultRutas.recordset[id].idRuta}, 5001, ${resultHoraInicio.recordset[j].horaInicio}, ${resultHoraInicio.recordset[j].horaInicio+100}, CONVERT(date, GETDATE()))`);
                //console.log(resultHoraInicio.recordset[i]);
            }
        });

        
    } catch (error) {
        console.log(err);
    }
}



module.exports = {
    getRecorridos,
    getUbicaciones,
    getRutas,
    getRecorridosPre,
    getRecorridosByRuta,
    getRecorridoById,
    generarRecorridos
}


