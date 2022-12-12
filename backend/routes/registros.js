const express = require('express');
const { RequestError } = require('mssql');
const router = express.Router();
const registroController = require('../controllers/registroController');

// api/registros

router.get('/alumnoreg/:id', registroController.getRegistrosById);
router.get('/historial/:id', registroController.getHistorial);
router.post('/alumno/', registroController.getAlumno);
router.post('/nuevoregistro', registroController.nuevoRegistro);
router.post('/comprobarregistro', registroController.comprobarRegistro);
router.post('/actualizarUbicacion', registroController.setUbicacion);

module.exports = router;