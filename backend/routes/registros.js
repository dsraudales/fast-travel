const express = require('express');
const router = express.Router();
const registroController = require('../controllers/registroController');

// api/registros

router.get('/alumnoreg/:id', registroController.getRegistrosById);
router.post('/alumno/', registroController.getAlumno);

module.exports = router;