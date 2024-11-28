SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Creamos la base de datos
CREATE DATABASE alquilercanchasdb;

-- Seleccionamos la base de datos
USE alquilercanchasdb;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canchas`
--

CREATE TABLE `canchas` (
  `Id` int(3) NOT NULL,
  `IdCategoria` int(3) NOT NULL,
  `IdPiso` int(3) NOT NULL,
  `IdSector` int(3) NOT NULL,
  `PrecioPorHora` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `Id` int(3) NOT NULL,
  `Nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Id` int(3) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(30) NOT NULL,
  `DNI` int(8) NOT NULL,
  `Telefono` int(10) NOT NULL,
  `Mail` varchar(50) NOT NULL,
  `FechaAlta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `Id` int(3) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodosdepago`
--

CREATE TABLE `metodosdepago` (
  `Id` int(3) NOT NULL,
  `Descripcion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `Id` int(3) NOT NULL,
  `MontoTotal` int(100) NOT NULL,
  `FechaDePago` date NOT NULL,
  `IdMetodoDePago` int(3) NOT NULL,
  `IdPromocion` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pisos`
--

CREATE TABLE `pisos` (
  `Id` INT(3) NOT NULL,
  `Tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id` int(3) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descuento` int(2) NOT NULL,
  `IdMetodoDePago` int(3) DEFAULT NULL,
  `Desde` datetime(6) NOT NULL,
  `Hasta` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `Id` int(3) NOT NULL,
  `IdCliente` int(3) NOT NULL,
  `IdCancha` int(3) NOT NULL,
  `IdPago` int(3) NOT NULL,
  `Fecha` date NOT NULL,
  `HoraInicio` time(6) NOT NULL,
  `HoraFin` time(6) NOT NULL,
  `IdEstado` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sectores`
--

CREATE TABLE `sectores` (
  `Id` int(11) NOT NULL,
  `Ubicacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `canchas`
--
ALTER TABLE `canchas`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdPiso` (`IdPiso`),
  ADD KEY `IdSector` (`IdSector`),
  ADD KEY `IdCategoria` (`IdCategoria`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `metodosdepago`
--
ALTER TABLE `metodosdepago`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdMetodoDePago` (`IdMetodoDePago`),
  ADD KEY `IdPromocion` (`IdPromocion`);

--
-- Indices de la tabla `pisos`
--
ALTER TABLE `pisos`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IdMetodoDePago` (`IdMetodoDePago`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdCliente` (`IdCliente`),
  ADD KEY `IdCancha` (`IdCancha`),
  ADD KEY `IdPago` (`IdPago`),
  ADD KEY `IdEstado` (`IdEstado`);

--
-- Indices de la tabla `sectores`
--
ALTER TABLE `sectores`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `canchas`
--
ALTER TABLE `canchas`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodosdepago`
--
ALTER TABLE `metodosdepago`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pisos`
--
ALTER TABLE `pisos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sectores`
--
ALTER TABLE `sectores`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `canchas`
--
ALTER TABLE `canchas`
  ADD CONSTRAINT `canchas_ibfk_1` FOREIGN KEY (`IdCategoria`) REFERENCES `categorias` (`Id`),
  ADD CONSTRAINT `canchas_ibfk_2` FOREIGN KEY (`IdSector`) REFERENCES `sectores` (`Id`),
  ADD CONSTRAINT `canchas_ibfk_3` FOREIGN KEY (`IdPiso`) REFERENCES `pisos` (`Id`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`IdPromocion`) REFERENCES `promociones` (`id`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`IdMetodoDePago`) REFERENCES `metodosdepago` (`Id`);

--
-- Filtros para la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD CONSTRAINT `promociones_ibfk_1` FOREIGN KEY (`IdMetodoDePago`) REFERENCES `metodosdepago` (`Id`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`IdCancha`) REFERENCES `canchas` (`Id`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`Id`),
  ADD CONSTRAINT `reservas_ibfk_3` FOREIGN KEY (`IdPago`) REFERENCES `pagos` (`Id`),
  ADD CONSTRAINT `reservas_ibfk_4` FOREIGN KEY (`IdEstado`) REFERENCES `estados` (`Id`);
COMMIT;

-- Llenar de datos las tablas 

INSERT INTO `metodosdepago` (`Id`, `Descripcion`) VALUES
(1, 'Tarjeta de Crédito'),
(2, 'Tarjeta de Débito'),
(3, 'Efectivo'),
(4, 'Transferencia Bancaria'),
(5, 'Billetera Virtual');

INSERT INTO `promociones` (`id`, `Nombre`, `Descuento`, `IdMetodoDePago`, `Desde`, `Hasta`) VALUES
(1, 'Promo Tarjeta Crédito', 15, 1, '2024-11-01 00:00:00', '2024-12-31 23:59:59'),
(2, 'Promo Billetera Virtual', 20, 5, '2024-11-15 00:00:00', '2024-11-30 23:59:59'),
(3, 'Promo Transferencia', 10, 4, '2024-10-01 00:00:00', '2024-12-31 23:59:59'),
(4, 'Promo Tarjeta Débito', 5, 2, '2024-11-01 00:00:00', '2024-12-15 23:59:59'),
(5, 'Promo Efectivo', 8, 3, '2024-11-20 00:00:00', '2024-12-31 23:59:59');

INSERT INTO `pagos` (`Id`, `MontoTotal`, `FechaDePago`, `IdMetodoDePago`, `IdPromocion`) VALUES
(1, 1000, '2024-11-05', 1, 1),
(2, 2000, '2024-11-16', 5, 2),
(3, 1500, '2024-11-10', 3, NULL), 
(4, 2500, '2024-11-20', 4, 3), 
(5, 800, '2024-11-25', 2, 4); 

INSERT INTO `clientes` (`Id`, `Nombre`, `Apellido`, `DNI`, `Telefono`, `Mail`, `FechaAlta`) VALUES
(1, 'Juan', 'Pérez', 30123456, 1123456789, 'juan.perez@example.com', '2024-01-15'),
(2, 'María', 'Gómez', 32123457, 1167894321, 'maria.gomez@example.com', '2024-02-20'),
(3, 'Carlos', 'López', 29123458, 1176543210, 'carlos.lopez@example.com', '2024-03-10'),
(4, 'Ana', 'Martínez', 33123459, 1198765432, 'ana.martinez@example.com', '2024-04-05'),
(5, 'Sofía', 'Fernández', 34123460, 1112345678, 'sofia.fernandez@example.com', '2024-05-25'),
(6, 'Lucas', 'Rodríguez', 35123461, 1134567890, 'lucas.rodriguez@example.com', '2024-06-15'),
(7, 'Florencia', 'Romero', 36123462, 1129876543, 'florencia.romero@example.com', '2024-07-10'),
(8, 'Martín', 'Sánchez', 37123463, 1145678901, 'martin.sanchez@example.com', '2024-08-01'),
(9, 'Julieta', 'Álvarez', 38123464, 1156789012, 'julieta.alvarez@example.com', '2024-09-12'),
(10, 'Mateo', 'Giménez', 39123465, 1167890123, 'mateo.gimenez@example.com', '2024-10-20');


INSERT INTO `categorias` (`Id`, `Nombre`) VALUES
(1, 'Fútbol 5'),
(2, 'Fútbol 7'),
(3, 'Fútbol 11');

INSERT INTO `estados` (`Id`, `Descripcion`) VALUES
(1, 'Disponible'),
(2, 'Reservada'),
(3, 'En mantenimiento'),
(4, 'Cerrada'),
(5, 'Bloqueada por evento');

INSERT INTO `pisos` (`Id`, `Tipo`) VALUES
(1, 'Césped natural'),
(2, 'Césped sintético'),
(3, 'Cemento'),
(4, 'Goma'),
(5, 'Polvo de ladrillo');

INSERT INTO `sectores` (`Id`, `Ubicacion`) VALUES
(1, 'Norte'),
(2, 'Sur'),
(3, 'Este'),
(4, 'Oeste'),
(5, 'Centro');


INSERT INTO `canchas` (`Id`, `IdCategoria`, `IdPiso`, `IdSector`, `PrecioPorHora`) VALUES
(1, 1, 2, 1, 1500),
(2, 2, 2, 2, 2500), 
(3, 3, 1, 3, 4000),
(4, 1, 5, 4, 2000), 
(5, 2, 3, 5, 1800),
(6, 1, 2, 1, 1500),
(7, 3, 4, 2, 1800); 

INSERT INTO `reservas` (`Id`, `IdCliente`, `IdCancha`, `IdPago`, `Fecha`, `HoraInicio`, `HoraFin`, `IdEstado`) VALUES
(1, 1, 1, 1, '2024-11-25', '10:00:00', '11:00:00', 2), 
(2, 2, 3, 2, '2024-11-26', '15:00:00', '16:30:00', 2),
(3, 3, 4, 3, '2024-11-27', '18:00:00', '19:30:00', 1), 
(4, 4, 2, 3, '2024-11-28', '09:00:00', '10:00:00', 3), 
(5, 5, 5, 4, '2024-11-29', '20:00:00', '21:30:00', 2), 
(6, 6, 1, 5, '2024-12-01', '08:00:00', '09:00:00', 1), 
(7, 7, 2, 3, '2024-12-02', '13:00:00', '14:30:00', 5); 

