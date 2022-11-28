const express = require('express');
const router = express.Router();
const registroController = require('../controllers/registroController');

// api/registros

router.get('/alumnoreg/:id', registroController.getRegistrosById);
router.get('/historial/:id', registroController.getHistorial);
router.post('/alumno/', registroController.getAlumno);
router.post('/nuevoregistro', registroController.nuevoRegistro);
router.post('/comprobarregistro', registroController.comprobarRegistro);

module.exports = router;