CREATE DATABASE IF NOT EXISTS dilanmotos;
USE dilanmotos;

-- 1. Tabla usuario
CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador único del usuario',
    nombre VARCHAR(100),
    correo VARCHAR(100) UNIQUE,
    contrasena VARCHAR(6),
    habilitado tinyint(1) NOT NULL DEFAULT 1,
    CONSTRAINT CHK_Minimo_Caracteres CHECK (char_length(contrasena) >= 6)
) ENGINE=InnoDB;

-- 2. Tabla marca (marca de la MOTO)
CREATE TABLE marca (
    id_marca INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador de la marca de moto',
    nombre VARCHAR(50)
) ENGINE=InnoDB;

-- 3. Tabla referencia_motos
CREATE TABLE referencia_motos (
    id_referencia INT PRIMARY KEY AUTO_INCREMENT,
    id_marca INT,
    nombre VARCHAR(100),
    cilindraje DECIMAL(5,1),
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
) ENGINE=InnoDB;

-- 4. Tabla moto
CREATE TABLE moto (
    id_moto INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador único de la moto',
    id_usuario INT,
    id_marca INT,
    modelo VARCHAR(50),
    cilindraje DECIMAL(5,1),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
) ENGINE=InnoDB;

-- 5. Tabla caracteristicas
CREATE TABLE caracteristicas (
    id_caracteristica INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador de la característica',
    id_moto INT,
    descripcion TEXT,
    FOREIGN KEY (id_moto) REFERENCES moto(id_moto)
) ENGINE=InnoDB;

-- 6. Tabla categoria (categoria de PRODUCTO: Aceite, Llanta, Kit de arrastre)
CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador de la categoría',
    nombre VARCHAR(50)
) ENGINE=InnoDB;

-- 7. Tabla marca_producto (NUEVA: marca del PRODUCTO, ligada a categoria)
CREATE TABLE marca_producto (
    id_marca INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador de la marca del producto',
    nombre VARCHAR(50) NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
) ENGINE=InnoDB;

-- 8. Tabla productos (ACTUALIZADA: + disponible, id_marca, stock)
CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador del producto',
    id_categoria INT,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10,2),
    imagenUrl VARCHAR(255),
    disponible TINYINT(1) NOT NULL DEFAULT 1,
    id_marca INT,
    stock INT NOT NULL DEFAULT 0,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    FOREIGN KEY (id_marca) REFERENCES marca_producto(id_marca)
) ENGINE=InnoDB;

-- 9. Tabla mecanico
CREATE TABLE mecanico (
    id_mecanico INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador del mecánico',
    nombre VARCHAR(100),
    especialidad VARCHAR(100),
    telefono VARCHAR(20)
) ENGINE=InnoDB;

-- 10. Tabla tiposervicio
CREATE TABLE tiposervicio (
    id_tipo_servicio INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador del tipo de servicio',
    nombre VARCHAR(50),
    descripcion TEXT
) ENGINE=InnoDB;

-- 11. Tabla servicio
CREATE TABLE servicio (
    id_servicio INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador del servicio',
    id_usuario INT,
    id_mecanico INT,
    id_tipo_servicio INT,
    fecha_servicio DATE,
    estado_servicio VARCHAR(20),
    comentario TEXT,
    puntuacion INT CHECK (puntuacion BETWEEN 1 AND 5),
    visible_en_historial BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_mecanico) REFERENCES mecanico(id_mecanico),
    FOREIGN KEY (id_tipo_servicio) REFERENCES tiposervicio(id_tipo_servicio)
) ENGINE=InnoDB;

-- 12. Tabla historial
CREATE TABLE historial (
    id_historial INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador del evento',
    id_usuario INT,
    id_servicio INT,
    accion VARCHAR(50),
    fecha DATE,
    detalle TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio)
) ENGINE=InnoDB;

-- 13. Tabla pqrs
CREATE TABLE pqrs (
    id_pqrs INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador de la solicitud PQRS',
    id_usuario INT,
    tipo VARCHAR(20),
    asunto VARCHAR(100),
    descripcion VARCHAR(1000) NOT NULL,
    fecha_envio DATE,
    respuesta_admin TEXT,
    fecha_respuesta DATE,
    calificacion_servicio INT CHECK (calificacion_servicio BETWEEN 1 AND 5),
    comentario_usuario TEXT,
    CONSTRAINT CHK_Minimo_Caracteres CHECK (char_length(comentario_usuario) >= 6),
    CONSTRAINT CHK_Minimo_Caracteres1 CHECK (char_length(descripcion) >= 6),
    CONSTRAINT CHK_Minimo_Caracteres2 CHECK (char_length(asunto) >= 6),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
) ENGINE=InnoDB;

-- 14. Tabla cotizacion
CREATE TABLE cotizacion (
    id_cotizacion INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Identificador de la cotización',
    id_usuario INT,
    producto VARCHAR(100),
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    fecha DATE,
    producto_agregado BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
) ENGINE=InnoDB;
