-- =========================================
-- Catena-Matias-AP2
-- CREACIÓN DE LA BASE DE DATOS
-- =========================================

CREATE DATABASE libreria_jugueteria;

USE libreria_jugueteria;

-- =========================================
-- TABLA PRODUCTO
-- Guarda la información de los productos
-- disponibles en la librería y juguetería
-- =========================================

CREATE TABLE producto (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio DECIMAL(10,2),
    stock INT,
    stock_minimo INT
);

-- =========================================
-- TABLA EMPLEADO
-- Almacena los datos de los empleados
-- que realizan ventas y movimientos
-- =========================================

CREATE TABLE empleado (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    usuario VARCHAR(50) UNIQUE,
    contraseña VARCHAR(100)
);

-- =========================================
-- TABLA VENTA
-- Registra las ventas realizadas
-- por los empleados
-- =========================================

CREATE TABLE venta (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    total DECIMAL(10,2),
    id_empleado INT,
    
    FOREIGN KEY (id_empleado)
    REFERENCES empleado(id_empleado)
);

-- =========================================
-- TABLA DETALLE_VENTA
-- Guarda el detalle de productos
-- incluidos en cada venta
-- =========================================

CREATE TABLE detalle_venta (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT,
    codigo_producto INT,
    cantidad INT,
    subtotal DECIMAL(10,2),

    FOREIGN KEY (id_venta)
    REFERENCES venta(id_venta),

    FOREIGN KEY (codigo_producto)
    REFERENCES producto(codigo)
);

-- =========================================
-- TABLA MOVIMIENTO_STOCK
-- Registra entradas y salidas
-- de stock de productos
-- =========================================

CREATE TABLE movimiento_stock (
    id_movimiento INT PRIMARY KEY AUTO_INCREMENT,
    tipo_movimiento VARCHAR(50),
    fecha DATE,
    cantidad INT,
    codigo_producto INT,
    id_empleado INT,

    FOREIGN KEY (codigo_producto)
    REFERENCES producto(codigo),

    FOREIGN KEY (id_empleado)
    REFERENCES empleado(id_empleado)
);

-- =========================================
-- TABLA ADMINISTRADOR
-- Guarda los datos de los administradores
-- del sistema
-- =========================================

CREATE TABLE administrador (
    id_administrador INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    usuario VARCHAR(50) UNIQUE,
    contraseña VARCHAR(100)
);

-- =========================================
-- TABLA REPORTE
-- Almacena los reportes generados
-- por los administradores
-- =========================================

CREATE TABLE reporte (
    id_reporte INT PRIMARY KEY AUTO_INCREMENT,
    tipo_reporte VARCHAR(50),
    fecha_generacion DATE,
    id_administrador INT,

    FOREIGN KEY (id_administrador)
    REFERENCES administrador(id_administrador)
);