-- 1. NO uses CREATE DATABASE. Railway ya te da una base de datos con nombre aleatorio.
-- Solo asegúrate de que las tablas se creen en la base de datos que te asignaron.

-- 2. Agregamos IF NOT EXISTS para que el script no falle si lo corres dos veces.
CREATE TABLE IF NOT EXISTS empleados (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(15),
    activo TINYINT(1) DEFAULT 1
);

CREATE TABLE IF NOT EXISTS Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50) NOT NULL,
    correo_electronico VARCHAR(100),
    numero_telefono VARCHAR(20)
) ENGINE=InnoDB; -- Aseguramos el motor InnoDB para que las llaves foráneas funcionen.

CREATE TABLE IF NOT EXISTS Equipo_computo (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    tipo_de_equipo VARCHAR(50) NOT NULL,
    -- Usamos DATETIME para mayor compatibilidad en la nube
    fecha_de_llegada DATETIME DEFAULT CURRENT_TIMESTAMP, 
    marca VARCHAR(50),
    modelo VARCHAR(100),
    descripcion_falla TEXT,
    CONSTRAINT fk_equipo_cliente 
        FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Folios (
    id_folio INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_equipo INT NOT NULL,
    folio VARCHAR(50) UNIQUE NOT NULL,
    CONSTRAINT fk_folio_cliente 
        FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente) ON DELETE CASCADE,
    CONSTRAINT fk_folio_equipo 
        FOREIGN KEY (id_equipo) REFERENCES Equipo_computo(id_equipo) ON DELETE CASCADE
) ENGINE=InnoDB;
