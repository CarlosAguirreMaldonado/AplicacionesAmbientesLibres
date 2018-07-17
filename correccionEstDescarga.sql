DROP TABLE IF EXISTS `objetoaprendizaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objetoaprendizaje` (
  `idOA` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 NOT NULL,
  `autor` varchar(100) CHARACTER SET utf8 NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `fecha` date NOT NULL,
  `p_clave` varchar(200) CHARACTER SET utf8 NOT NULL,
  `institucion` varchar(100) CHARACTER SET utf8 NOT NULL,
  `tamano` varchar(100) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `fecha_ing` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta_zip` varchar(200) NOT NULL,
  `idProfesor` int(11) NOT NULL,
  `estDescargas` int
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

-- InsertarObjetoAprendizaje

DROP procedure IF EXISTS `insertarOA`;

DELIMITER $$
CREATE PROCEDURE `insertarOA` (
	IN nombreOA varchar(50),
    IN autorOA varchar(100),
    IN descripcionOA varchar(1000),
    IN fechaOA date,
    IN p_claveOA varchar(200),
    IN institucionOA varchar(100),
    IN tamanoOA varchar(100),
    IN tipoOA varchar(10),
    IN ruta_zipOA varchar(200),
    IN idProfesorOA int(11))
BEGIN

	INSERT INTO objetoaprendizaje (nombre, autor, descripcion, fecha, p_clave, institucion, tamano, tipo, ruta_zip, idProfesor, estDescargas)
                VALUES (nombreOA, autorOA, descripcionOA, fechaOA, p_claveOA, institucionOA, tamanoOA, tipoOA, ruta_zipOA, idProfesorOA, 0);

END$$

DELIMITER ;

--
-- InsertarEstDescarga

DROP procedure IF EXISTS `spInsertDescarga`;

DELIMITER $$
CREATE PROCEDURE `spInsertDescarga` (
	IN idOAN int
)
BEGIN

	INSERT INTO objetoaprendizaje (estDescarga) VALUES ((select estDescargas from objetoaprendizaje where idOA=idOAN)+1);

END$$

DELIMITER ;