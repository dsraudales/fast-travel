const express = require('express');
const router = express.Router();
const recorridoController = require('../controllers/recorridoController');

// api/recorridos
router.get('/lista/:id', recorridoController.getRecorridos);
router.get('/ubicaciones/', recorridoController.getUbicaciones);
router.get('/rutas', recorridoController.getRutas);
router.get('/predeterminado/:sector', recorridoController.getRecorridosPre);
router.get('/ruta/:id', recorridoController.getRecorridosByRuta);
router.get('/recorrido/:id', recorridoController.getRecorridoById);

module.exports = router;