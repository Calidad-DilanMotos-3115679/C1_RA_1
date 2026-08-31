-- ============================== SEED DATA ==============================

INSERT INTO usuario (nombre, correo, contrasena) VALUES 
('Juan Andres Cruz', 'juancruz@gmail.com', 'flow12'),
('Laura Martinez', 'lauram@gmail.com', 'secure'),
('Carlos Rios', 'carlosr@gmail.com', 'pass78'),
('Jorge Bautista','jorg@gmail.com','jor123'),
('Esneydah Manrique','esneydah@gmail.com','esn343');

INSERT INTO marca (id_marca, nombre) VALUES
(1, 'Suzuki'), (2, 'Yamaha'), (3, 'Honda'), (4, 'Kawasaki'),
(5, 'KTM'), (6, 'BMW'), (9, 'Bajaj'), (15, 'CFMOTO');

INSERT INTO referencia_motos (id_marca, nombre, cilindraje) VALUES  
(1, 'Gixxer 250 SF', 249.0), (1, 'DR 650', 650.0), (1, 'Gixxer 150 Fi', 155.0),
(2, 'MT-03', 321.0), (2, 'MT-09', 890.0), (2, 'R15 V4', 155.0), (2, 'XTZ 150', 149.0),
(3, 'CB 1000R', 998.0), (3, 'XRE 300', 291.0), (3, 'CB 190R', 184.0),
(4, 'Ninja 400', 399.0), (4, 'Z900', 948.0),
(5, 'Duke 200', 199.0), (5, 'RC 390', 373.0),
(9, 'Pulsar NS 200', 199.5), (9, 'Dominar 400', 373.0),
(15, '450SR', 449.0), (15, '450NK', 449.0), (15, '250SR', 249.0), (15, '800MT', 799.0),
(6, 'R 1250 GS', 1254.0), (6, 'S 1000 RR', 999.0);


INSERT INTO moto (id_usuario, id_marca, modelo, cilindraje, placa) VALUES
(1, 1, 'Gixxer 250', 250.0, 'ABC12D'), 
(2, 2, 'FZ 150', 150.0, 'XYZ98F'), 
(3, 3, 'CBR 500', 500.0, 'MTO123'),
(4, 4, 'TNT 600', 600.0, 'BKP456'), 
(5, 5, 'Duke 390', 373.2, 'RDR789');

INSERT INTO caracteristicas (id_moto, descripcion) VALUES
(1, 'Moto deportiva Suzuki, ideal para ciudad y carretera con buen equilibrio'),
(2, 'Moto urbana Yamaha, económica y eficiente para el día a día'),
(3, 'Moto deportiva Honda, equilibrada para principiantes y uso mixto'),
(4, 'Moto naked Benelli, ágil y potente para aventuras urbanas'),
(5, 'Moto naked KTM, agresiva y ligera para jóvenes entusiastas');

INSERT INTO categoria (nombre) VALUES ('Aceite'), ('Llanta'), ('Kit de arrastre');

-- marca_producto: marcas de PRODUCTO, agrupadas por categoria
INSERT INTO marca_producto (nombre, id_categoria) VALUES
-- Marcas originales (IDs 1 al 9)
('ProMax', 1),
('Mobil', 1),
('Castrol', 1),
('Pirelli', 2),
('Michelin', 2),
('Dunlop', 2),
('RK', 3),
('DID', 3),
('Cassarella', 3),
-- Marcas nuevas de Aceites 
('Motul', 1),
('Yamalube', 1),
('Liqui Moly', 1),
-- Marcas nuevas de Llantas
('Metzeler', 2),
('Continental', 2),
('IRC', 2),
-- Marcas nuevas de Kits de Arrastre 
('Choho', 3),
('Revo', 3),
('Riffel', 3);

INSERT INTO productos (id_categoria, nombre, descripcion, precio, imagen_url, disponible, id_marca, stock) VALUES
-- ACEITES (id_categoria = 1)
(1, 'Aceite - ProMax 10W-40', 'Lubricante sintético para alto rendimiento', 45999, 'https://i.ibb.co/1Gv5jW4J/Aceite-Pro-Max-10-W-40.png', 1, 1, 5),
(1, 'Aceite - MOBIL Super 2000 10W-40', 'Tecnología semisintética para una protección superior en la conducción diaria', 49990, 'https://i.ibb.co/JTrtXgR/Aceite-MOBIL-Super-2000-10-W-40.png', 1, 2, 7),
(1, 'Aceite - Castrol Power1 10W-40', 'Lubricante sintético con tecnología de carreras para máxima aceleración', 52900, 'https://i.ibb.co/dw2CMkTp/Aceite-Castrol-Power1-10-W-40.png', 1, 3, 8),
(1, 'Aceite - Motul 7100 4T 10W-40', 'Lubricante 100% sintético con tecnología Ester para motos de alto desempeño', 75000, 'https://i.ibb.co/zHWdXGFY/Aceite-Motul710010-W404-Tiempos-Sintetico4-Litros.webp', 1, 10, 9),
(1, 'Aceite - Yamalube 4T 20W-50 Mineral', 'Aceite mineral multigrado formulado especialmente para motores Yamaha', 32000, 'https://i.ibb.co/4ZDZkLYM/2.webp', 1, 11, 7),
(1, 'Aceite - Liqui Moly Street 4T 10W-40', 'Aceite motor de alta tecnología y baja fricción para uso diario', 58000, 'https://i.ibb.co/pj3dCFP9/3.webp', 1, 12, 5),

-- LLANTAS (id_categoria = 2)
(2, 'Llanta - Pirelli Angel City', 'Llanta versátil para ciudad y carretera', 195100, 'https://i.ibb.co/yBZxc6wv/Llanta-Pirelli-Angel-City.png', 1, 4, 6),
(2, 'Llanta - Michelin Pilot Street 2 90/90-18 TL', 'Llanta Sellomatic para motos de baja cilindrada', 235900, 'https://i.ibb.co/chvYJcG4/Llanta-Michelin-Pilot-Street-2-90-90-18-TL.png', 1, 5, 7),
(2, 'Llanta - Dunlop Sportmax GPR-300', 'Llanta de alto agarre y excelente rendimiento en piso mojado y seco', 245000, 'https://i.ibb.co/k2FSbbSc/Llanta-Dunlop-Sportmax-GPR-300.png', 1, 6, 4),
(2, 'Llanta - Metzeler ME Speed 110/80-17', 'Diseño de labrado optimizado para durabilidad y agarre en mojado', 215000, 'https://i.ibb.co/LDDktf31/1.avif', 1, 13, 3),
(2, 'Llanta - Continental ContiGo 100/90-18 TT', 'Llanta convencional ideal para motos de trabajo y desplazamiento urbano', 178000, 'https://i.ibb.co/Z6zJWsBn/Pneus-Moto-Continental-100-90-R18-56-V-CONTIROADATTACK-3.webp', 1, 14, 4),
(2, 'Llanta - IRC NR77 90/90-17 TL', 'Llanta económica de excelente agarre para motos urbanas', 145000, 'https://i.ibb.co/60Q4Hx83/17600862497809754.webp', 1, 15, 6),

-- KITS DE ARRASTRE (id_categoria = 3)
(3, 'Kit de arrastre - RK Takasago 14/45', 'Kit reforzado para motos deportivas', 210000, 'https://i.ibb.co/0WS1qYz/Kit-de-arrastre-RK-Takasago-14-45.png', 1, 7, 2),
(3, 'Kit de arrastre - DID Professional 15/46', 'Kit reforzado para motos', 225000, 'https://i.ibb.co/XxgYR1px/Kit-de-arrastre-DID-Professional-15-46.png', 1, 8, 6),
(3, 'Kit de arrastre - Cassarella Racing 14/42', 'Kit reforzado de alta durabilidad con acero certificado para competencia', 185000, 'https://i.ibb.co/Txjq5Ttc/Kit-de-arrastre-Cassarella-Racing-14-42.png', 1, 9, 6),
(3, 'Kit de arrastre - Choho O-Ring 14/43', 'Kit con cadena O-Ring de máxima retención de lubricante y bajo mantenimiento', 165000, 'https://i.ibb.co/HJKKdJS/images.jpg', 1, 16, 6),
(3, 'Kit de arrastre - Revo Carbono 15/45', 'Kit reforzado paso 428 H fabricado en acero de alta resistencia', 135000, 'https://i.ibb.co/b5xTTx9G/D-NQ-NP-918669-MLA107538490580-032026-O.webp', 1, 17, 8),
(3, 'Kit de arrastre - Riffel Titanium 14/44', 'Relación reforzada con cadena dorada premium para alta exigencia', 198000, 'https://i.ibb.co/B2Tbnz21/images.jpg', 1, 18, 8);

INSERT INTO mecanico (nombre, especialidad, telefono) VALUES
('Juan Perez','Mantenimiento general','3136405768'),
('Pablo Mendez','Mantenimiento general','3215647898'),
('Kevin Serpa','Mantenimiento general','3132456783'),
('Alan Manrique','Mantenimiento general','3224567890'),
('Miguel Rodriguez','Diagnóstico eléctrico','3124312345');

INSERT INTO tiposervicio (nombre, descripcion) VALUES
('Mantenimiento','Cambio de aceite, revisión general'),
('Reparacion', 'Solución de fallas mecánicas'),
('Diagnostico', 'Evaluación de componentes electrónicos'),
('Kit Arrastre', 'Revisión y ajuste del kit de arrastre'),
('Ruedas', 'Montaje, desmontaje y balanceo de llantas');

INSERT INTO servicio (id_usuario, id_mecanico, id_tipo_servicio, fecha_servicio, estado_servicio, comentario, puntuacion, visible_en_historial) VALUES
(1, 1, 1, '2025-10-01', 'Completado', 'Excelente atención y rapidez', 5, TRUE),
(2, 2, 3, '2025-10-03', 'Pendiente', 'Falta revisión de sensores', 4, FALSE),
(3, 1, 2, '2025-10-05', 'Completado', 'Reparación rápida y efectiva', 5, TRUE),
(4, 3, 4, '2025-10-07', 'Completado', 'El servicio fue insatisfactorio', 2, TRUE),
(5, 5, 5, '2025-10-09', 'Pendiente', 'Falta verificar la presión de las llantas', 4, FALSE);

INSERT INTO historial (id_usuario, id_servicio, accion, fecha, detalle) VALUES
(1, 1, 'Evaluación de servicio', '2025-10-01', 'Se calificó el servicio con 5 estrellas'),
(2, 3, 'Evaluación de servicio', '2025-10-05', 'Reparación completada con éxito'),
(3, 2, 'Cambio de kit de arrastre', '2025-10-08', 'Cambio realizado con éxito'),
(4, 5, 'Cambio de llantas', '2025-10-12', 'Cambio realizado con éxito'),
(5, 4, 'Cambio de aceite', '2025-10-15', 'Cambio realizado con éxito');

INSERT INTO pqrs (id_usuario, tipo, asunto, descripcion, fecha_envio) VALUES
(1, 'Peticion', 'Cambio de aceite', 'Solicito cambiar aceite por Motul', '2025-10-02');

INSERT INTO cotizacion (id_usuario, producto, cantidad, precio_unitario, fecha) VALUES
(1, 'Aceite ProMax 10W-40', 1, 45999, '2025-10-02');
ALTER TABLE usuario ADD COLUMN reset_token VARCHAR(100);
ALTER TABLE usuario ADD COLUMN token_expiracion TIMESTAMP;
ALTER TABLE usuario ADD COLUMN rol VARCHAR(20) DEFAULT 'USER';
ALTER TABLE usuario MODIFY COLUMN contrasena VARCHAR(255);