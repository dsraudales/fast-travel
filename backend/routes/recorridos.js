const express = require('express');
const router = express.Router();
const recorridoController = require('../controllers/recorridoController');

// api/recorridos
router.get('/', recorridoController.getRecorridos);
router.get('/rutas', recorridoController.getRutas);
router.get('/predeterminado/:sector', recorridoController.getRecorridosPre);
router.get('/ruta/:id', recorridoController.getRecorridosByRuta);
router.get('/recorrido/:id', recorridoController.getRecorridoById);

module.exports = router;