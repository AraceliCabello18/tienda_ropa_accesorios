create database tienda;
use tienda;

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

INSERT INTO `clientes` (`id`, `name`, `email`, `phone`, `address`, `created`, `modified`, `status`) VALUES
(1, 'Alicia Alvarado', 'Alicia@gmail.com', '5504356789', 'calle san juan, Mexico', '2018-02-17 08:21:25', '2018-02-17 08:21:25', '1');


CREATE TABLE IF NOT EXISTS `mis_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cosa` varchar(255),
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` float(10,2) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;


INSERT INTO `mis_productos` (`id`, `cosa`,`name`, `description`, `price`, `created`, `modified`, `status`) VALUES
(1, 'accesorio', 'Zapatos de Tacon', 'La plataforma mide aproximadamente 1.25,Acabado con una plantilla de piel sintética ligeramente acolchada', 727.00, '2016-08-17 08:21:25', '2016-08-17 08:21:25', '1'),
(2, 'accesorio', 'Smartwatch', 'producto contiene correas negras y rosas, por lo que no necesita preocuparse por si es negro o rosa', 500.00, '2016-08-17 08:21:25', '2016-08-17 08:21:25', '1'),
(3, 'accesorio', 'Juego de Collar y Aretes con Brillante ', 'Juego de Collar y Aretes con Brillante Zirconia Cúbica en Aleación de Cobre Bañado en Oro Blanco 18K', 300.00, '2016-08-17 08:21:25', '2016-08-17 08:21:25', '1'),
(4, 'accesorio', 'Collar De Estrella', 'Collar De Estrella De Ocho Puntas En Capas De Plata Esterlina Con Baño De Oro De 18 K', 250.00, '2016-08-17 08:21:25', '2016-08-17 08:21:25', '1'),
(5, 'ropa', 'Vestido De Rayas', 'Vestido Juvenil De Rayas Con Botón Corte A Talla del Artículo M', 200.00, '2016-08-17 08:21:25', '2016-08-17 08:21:25', '1'),
(6, 'ropa', 'Camisa de franela', 'camisa de franela para mujer no se decolora, con 2 bolsillos en el pecho, camisa de franela a cuadros, camisa de manga larga con botones', 320.00, '2016-08-17 08:21:25', '2016-08-17 08:21:25', '1'),
(7, 'ropa', 'Blusa de Mangas Larga', 'Blusa de Mangas Larga y Cuello en V con botones de madera estampado en la parte inferior diseño para acercarte a la naturaleza', 150.00, '2016-08-17 08:21:25', '2016-08-17 08:21:25', '1'),
(8, 'ropa', 'Chaqueta impermeable con capucha', 'Cierre de Cremallera El material exterior y el forro están hechos de 100% poliéster que es suficiente para soportar cualquier cosa de llovizna en un momento. ', 700.00, '2016-08-17 08:21:25', '2016-08-17 08:21:25', '1');

CREATE TABLE IF NOT EXISTS `orden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `total_price` float(10,2) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

CREATE TABLE IF NOT EXISTS `orden_articulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

ALTER TABLE `orden`
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `orden_articulos`
  ADD CONSTRAINT `orden_articulos_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orden` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

