-- DDL
-- CREATE DATABASE IF NOT EXISTS central_medica;
USE central_medica;

DROP TABLE IF EXISTS Empleados;
DROP TABLE IF EXISTS Pacientes;
DROP TABLE IF EXISTS Medicos;

-- Crear tabla de Empleados con estructura reorganizada
CREATE TABLE Empleados (
    ID_Empleado VARCHAR(4) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    Ciudad VARCHAR(50) NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    Codigo_Postal VARCHAR(10) NOT NULL,
    Total_Dias_Vacaciones INT NOT NULL DEFAULT 20,
    Dias_Tomados INT NOT NULL DEFAULT 0,
    Dias_Pendientes INT NOT NULL DEFAULT 20,
    Fecha_Vacacion_1 VARCHAR(50) NULL,
    Fecha_Vacacion_2 VARCHAR(50) NULL,
    Fecha_Vacacion_3 VARCHAR(50) NULL,
    Fecha_Vacacion_4 VARCHAR(50) NULL
);

-- Crear tabla de Médicos con estructura reorganizada
CREATE TABLE Medicos (
    ID_Medico VARCHAR(4) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Especialidad VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    Ciudad VARCHAR(50) NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    Codigo_Postal VARCHAR(10) NOT NULL,
    No_Seguro_Social VARCHAR(11) NOT NULL,
    No_Cedula VARCHAR(8) NOT NULL,
    Tipo_Medico ENUM('Titular', 'Interno', 'Sustituto') NOT NULL,
    Total_Dias_Vacaciones INT NOT NULL DEFAULT 20,
    Dias_Tomados INT NOT NULL DEFAULT 0,
    Dias_Pendientes INT NOT NULL DEFAULT 20,
    Fecha_Vacacion_1 VARCHAR(50) NULL,
    Fecha_Vacacion_2 VARCHAR(50) NULL,
    Fecha_Vacacion_3 VARCHAR(50) NULL,
    Fecha_Vacacion_4 VARCHAR(50) NULL
);

-- 3. Crear tabla de Pacientes
CREATE TABLE Pacientes (
    ID_Paciente VARCHAR(4) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    Codigo_Postal VARCHAR(10) NOT NULL,
    No_Seguro_Social VARCHAR(11) NOT NULL,
    ID_Medico VARCHAR(4) NOT NULL,
    Fecha_Ingreso DATETIME NOT NULL,
    Fecha_Analisis_Clinico DATETIME NULL,
    Fecha_Intervencion DATETIME NULL,
    Fecha_Alta DATETIME NULL,
    FOREIGN KEY (ID_Medico) REFERENCES Medicos(ID_Medico)
);

-- DML
INSERT INTO Empleados (ID_Empleado, Nombre, Apellido, Direccion, Telefono, Ciudad, Estado, Codigo_Postal, Total_Dias_Vacaciones, Dias_Tomados, Dias_Pendientes, Fecha_Vacacion_1, Fecha_Vacacion_2, Fecha_Vacacion_3, Fecha_Vacacion_4) VALUES
('E001', 'María', 'González', 'Calle Primavera 12', '555-1111', 'Ciudad de México', 'Ciudad de México', '12345', 20, 17, 3, '2024-03-01 al 2024-03-07', '2024-05-15 al 2024-05-18', '2025-01-10 al 2025-01-15', NULL),
('E002', 'Pedro', 'Sánchez', 'Av. Libertad 34', '555-2222', 'Guadalajara', 'Jalisco', '23456', 20, 19, 1, '2024-04-05 al 2024-04-10', '2024-07-20 al 2024-07-25', '2024-12-01 al 2024-12-05', '2025-03-15 al 2025-03-17'),
('E003', 'Lucía', 'Torres', 'Blvd. Norte 56', '555-3333', 'Monterrey', 'Nuevo León', '34567', 20, 18, 2, '2024-02-10 al 2024-02-15', '2025-06-15 al 2025-06-20', '2025-10-10 al 2025-10-15', NULL),
('E004', 'Roberto', 'Vega', 'Calle Sol 78', '555-4444', 'Puebla', 'Puebla', '45678', 20, 19, 1, '2024-03-15 al 2024-03-20', '2024-08-10 al 2024-08-15', '2025-02-20 al 2025-02-25', '2025-07-10 al 2025-07-11'),
('E005', 'Ana', 'Morales', 'Av. Paz 90', '555-5555', 'Tijuana', 'Baja California', '56789', 20, 18, 2, '2024-01-20 al 2024-01-25', '2024-06-15 al 2024-06-20', '2024-10-10 al 2024-10-15', NULL),
('E006', 'José', 'Ramírez', 'Blvd. Este 101', '555-6666', 'León', 'Guanajuato', '67890', 20, 19, 1, '2024-04-05 al 2024-04-10', '2025-09-15 al 2025-09-20', '2026-01-10 al 2026-01-15', '2026-04-20 al 2026-04-21'),
('E007', 'Carmen', 'Díaz', 'Calle Oeste 202', '555-7777', 'Mérida', 'Yucatán', '78901', 20, 18, 2, '2024-02-10 al 2024-02-15', '2024-07-25 al 2024-07-30', '2025-03-15 al 2025-03-20', NULL),
('E008', 'Francisco', 'Romero', 'Av. Sur 303', '555-8888', 'Querétaro', 'Querétaro', '89012', 20, 19, 1, '2024-03-15 al 2024-03-20', '2024-09-01 al 2024-09-06', '2024-11-20 al 2024-11-25', '2025-05-15 al 2025-05-16'),
('E009', 'Isabel', 'Herrera', 'Blvd. Norte 404', '555-9999', 'Cancún', 'Quintana Roo', '90123', 20, 18, 2, '2024-05-20 al 2024-05-25', '2025-10-10 al 2025-10-15', '2026-02-20 al 2026-02-25', NULL),
('E010', 'Diego', 'Núñez', 'Calle Central 505', '555-0000', 'San Luis Potosí', 'San Luis Potosí', '1234', 20, 19, 1, '2024-04-01 al 2024-04-06', '2024-08-15 al 2024-08-20', '2025-01-10 al 2025-01-15', '2025-06-20 al 2025-06-21'),
('E011', 'Rosa', 'Santos', 'Av. Este 606', '555-1212', 'Aguascalientes', 'Aguascalientes', '12345', 20, 18, 2, '2024-01-10 al 2024-01-15', '2024-06-20 al 2024-06-25', '2025-11-15 al 2025-11-20', NULL),
('E012', 'Antonio', 'Guerrero', 'Blvd. Oeste 707', '555-2323', 'Mexicali', 'Baja California', '23456', 20, 19, 1, '2024-03-05 al 2024-03-10', '2024-07-25 al 2024-07-30', '2024-11-15 al 2024-11-20', '2025-04-10 al 2025-04-11'),
('E013', 'Teresa', 'Flores', 'Calle Sur 808', '555-3434', 'Saltillo', 'Coahuila', '34567', 20, 18, 2, '2024-04-15 al 2024-04-20', '2025-09-10 al 2025-09-15', '2026-01-20 al 2026-01-25', NULL),
('E014', 'Manuel', 'Méndez', 'Av. Norte 909', '555-4545', 'Morelia', 'Michoacán', '45678', 20, 19, 1, '2024-02-20 al 2024-02-25', '2024-09-10 al 2024-09-15', '2025-03-15 al 2025-03-20', '2025-08-01 al 2025-08-02'),
('E015', 'Eva', 'Romero', 'Blvd. Central 1010', '555-5656', 'Culiacán', 'Sinaloa', '56789', 20, 19, 1, '2024-05-01 al 2024-05-06', '2024-08-20 al 2024-08-25', '2024-12-10 al 2024-12-15', '2025-05-20 al 2025-05-21'),
('E016', 'Jorge', 'Navarro', 'Calle Este 1111', '555-6767', 'Chihuahua', 'Chihuahua', '67890', 20, 18, 2, '2024-03-10 al 2024-03-15', '2025-10-25 al 2025-10-30', '2026-02-15 al 2026-02-20', NULL),
('E017', 'Silvia', 'Iglesias', 'Av. Oeste 1212', '555-7878', 'Veracruz', 'Veracruz', '78901', 20, 19, 1, '2024-01-15 al 2024-01-20', '2024-06-25 al 2024-06-30', '2025-11-10 al 2025-11-15', '2026-04-15 al 2026-04-16'),
('E018', 'Ángel', 'Pardo', 'Blvd. Sur 1313', '555-8989', 'Oaxaca', 'Oaxaca', '89012', 20, 19, 1, '2024-04-20 al 2024-04-25', '2024-10-05 al 2024-10-10', '2025-03-20 al 2025-03-25', '2025-09-10 al 2025-09-11'),
('E019', 'Olga', 'Benítez', 'Calle Norte 1414', '555-9090', 'Toluca', 'Estado de México', '90123', 20, 19, 1, '2024-02-01 al 2024-02-06', '2024-07-15 al 2024-07-20', '2024-11-10 al 2024-11-15', '2025-06-20 al 2025-06-21'),
('E020', 'Fernando', 'Crespo', 'Av. Central 1515', '555-0101', 'Torreón', 'Coahuila', '1234', 20, 18, 2, '2024-05-10 al 2024-05-15', '2025-09-20 al 2025-09-25', '2026-01-10 al 2026-01-15', NULL),
('E021', 'Lucía', 'Marín', 'Blvd. Este 1616', '555-1212', 'Acapulco', 'Guerrero', '12345', 20, 19, 1, '2024-01-25 al 2024-01-30', '2024-08-15 al 2024-08-20', '2025-12-10 al 2025-12-15', '2026-05-15 al 2026-05-16'),
('E022', 'Víctor', 'León', 'Calle Oeste 1717', '555-2323', 'Tampico', 'Tamaulipas', '23456', 20, 19, 1, '2024-03-05 al 2024-03-10', '2024-09-20 al 2024-09-25', '2024-12-10 al 2024-12-15', '2025-04-20 al 2025-04-21'),
('E023', 'Nuria', 'Peña', 'Av. Sur 1818', '555-3434', 'Cuernavaca', 'Morelos', '34567', 20, 18, 2, '2024-04-15 al 2024-04-20', '2025-10-10 al 2025-10-15', '2026-02-20 al 2026-02-25', NULL),
('E024', 'Alberto', 'Soto', 'Blvd. Norte 1919', '555-4545', 'Durango', 'Durango', '45678', 20, 19, 1, '2024-02-20 al 2024-02-25', '2024-10-01 al 2024-10-06', '2025-04-15 al 2025-04-20', '2025-09-10 al 2025-09-11'),
('E025', 'Beatriz', 'Gil', 'Calle Central 2020', '555-5656', 'Villahermosa', 'Tabasco', '56789', 20, 19, 1, '2024-05-10 al 2024-05-15', '2024-07-25 al 2024-07-30', '2025-11-20 al 2025-11-25', '2026-03-15 al 2026-03-16'),
('E026', 'Carlos', 'Mendoza', 'Av. Este 2121', '555-6767', 'Mazatlán', 'Sinaloa', '67890', 20, 19, 1, '2024-01-01 al 2024-01-06', '2024-06-15 al 2024-06-20', '2024-11-05 al 2024-11-10', '2025-04-20 al 2025-04-21'),
('E027', 'Laura', 'Gómez', 'Blvd. Oeste 2222', '555-7878', 'Xalapa', 'Veracruz', '78901', 20, 18, 2, '2024-03-20 al 2024-03-25', '2025-10-15 al 2025-10-20', '2026-02-10 al 2026-02-15', NULL),
('E028', 'Javier', 'López', 'Calle Sur 2323', '555-8989', 'Hermosillo', 'Sonora', '89012', 20, 19, 1, '2024-04-05 al 2024-04-10', '2024-09-15 al 2024-09-20', '2025-01-20 al 2025-01-25', '2025-06-10 al 2025-06-11'),
('E029', 'Elena', 'Ruiz', 'Av. Norte 2424', '555-9090', 'Tuxtla Gutiérrez', 'Chiapas', '90123', 20, 19, 1, '2024-02-10 al 2024-02-15', '2024-08-25 al 2024-08-30', '2024-12-20 al 2024-12-25', '2025-05-15 al 2025-05-16'),
('E030', 'Miguel', 'Torres', 'Blvd. Central 2525', '555-0101', 'Zacatecas', 'Zacatecas', '1234', 20, 19, 1, '2024-03-15 al 2024-03-20', '2024-07-10 al 2024-07-15', '2025-11-20 al 2025-11-25', '2026-04-10 al 2026-04-11');

INSERT INTO Medicos (ID_Medico, Nombre, Apellido, Especialidad, Direccion, Telefono, Ciudad, Estado, Codigo_Postal, No_Seguro_Social, No_Cedula, Tipo_Medico, Total_Dias_Vacaciones, Dias_Tomados, Dias_Pendientes, Fecha_Vacacion_1, Fecha_Vacacion_2, Fecha_Vacacion_3, Fecha_Vacacion_4) VALUES
('M001', 'Carlos', 'Mendoza', 'Cardiología', 'Av. Siempre Viva 123', '555-1234', 'Ciudad de México', 'Ciudad de México', '12345', '123-45-6789', '12345678', 'Titular', 20, 17, 3, '2024-03-01 al 2024-03-07', '2024-05-15 al 2024-05-18', '2025-01-10 al 2025-01-15', NULL),
('M002', 'Laura', 'Gómez', 'Pediatría', 'Calle Falsa 456', '555-5678', 'Guadalajara', 'Jalisco', '23456', '234-56-7890', '23456789', 'Interno', 20, 19, 1, '2024-04-05 al 2024-04-10', '2024-07-20 al 2024-07-25', '2024-12-01 al 2024-12-05', '2025-03-15 al 2025-03-17'),
('M003', 'Javier', 'López', 'Dermatología', 'Blvd. Central 789', '555-9012', 'Monterrey', 'Nuevo León', '34567', '345-67-8901', '34567890', 'Sustituto', 20, 18, 2, '2024-02-10 al 2024-02-15', '2025-06-15 al 2025-06-20', '2025-10-10 al 2025-10-15', NULL),
('M004', 'Elena', 'Ruiz', 'Ginecología', 'Av. Revolución 101', '555-3456', 'Puebla', 'Puebla', '45678', '456-78-9012', '45678901', 'Titular', 20, 19, 1, '2024-03-15 al 2024-03-20', '2024-08-10 al 2024-08-15', '2025-02-20 al 2025-02-25', '2025-07-10 al 2025-07-11'),
('M005', 'Miguel', 'Torres', 'Ortopedia', 'Calle Luna 202', '555-7890', 'Tijuana', 'Baja California', '56789', '567-89-0123', '56789012', 'Interno', 20, 18, 2, '2024-01-20 al 2024-01-25', '2024-06-15 al 2024-06-20', '2024-10-10 al 2024-10-15', NULL),
('M006', 'Ana', 'Morales', 'Neurología', 'Av. Paz 303', '555-2345', 'León', 'Guanajuato', '67890', '678-90-1234', '67890123', 'Sustituto', 20, 19, 1, '2024-04-05 al 2024-04-10', '2025-09-15 al 2025-09-20', '2026-01-10 al 2026-01-15', '2026-04-20 al 2026-04-21'),
('M007', 'Roberto', 'Vega', 'Oftalmología', 'Blvd. Sur 404', '555-6789', 'Mérida', 'Yucatán', '78901', '789-01-2345', '78901234', 'Titular', 20, 18, 2, '2024-02-10 al 2024-02-15', '2024-07-25 al 2024-07-30', '2025-03-15 al 2025-03-20', NULL),
('M008', 'Sofía', 'Castro', 'Psiquiatría', 'Calle Este 505', '555-0123', 'Querétaro', 'Querétaro', '89012', '890-12-3456', '89012345', 'Interno', 20, 19, 1, '2024-03-15 al 2024-03-20', '2024-09-01 al 2024-09-06', '2024-11-20 al 2024-11-25', '2025-05-15 al 2025-05-16'),
('M009', 'Diego', 'Ortiz', 'Urología', 'Av. Norte 606', '555-4567', 'Cancún', 'Quintana Roo', '90123', '901-23-4567', '90123456', 'Sustituto', 20, 18, 2, '2024-05-20 al 2024-05-25', '2025-10-10 al 2025-10-15', '2026-02-20 al 2026-02-25', NULL),
('M010', 'Carmen', 'Ríos', 'Endocrinología', 'Blvd. Oeste 707', '555-8901', 'San Luis Potosí', 'San Luis Potosí', '1234', '012-34-5678', '1234567', 'Titular', 20, 19, 1, '2024-04-01 al 2024-04-06', '2024-08-15 al 2024-08-20', '2025-01-10 al 2025-01-15', '2025-06-20 al 2025-06-21'),
('M011', 'Francisco', 'Núñez', 'Gastroenterología', 'Calle Central 808', '555-2345', 'Aguascalientes', 'Aguascalientes', '12345', '234-56-7890', '12345678', 'Interno', 20, 18, 2, '2024-01-10 al 2024-01-15', '2024-06-20 al 2024-06-25', '2025-11-15 al 2025-11-20', NULL),
('M012', 'Isabel', 'Herrera', 'Nefrología', 'Av. Libertad 909', '555-6789', 'Mexicali', 'Baja California', '23456', '345-67-8901', '23456789', 'Sustituto', 20, 19, 1, '2024-03-05 al 2024-03-10', '2024-07-25 al 2024-07-30', '2024-11-15 al 2024-11-20', '2025-04-10 al 2025-04-11'),
('M013', 'Ricardo', 'Jiménez', 'Neumología', 'Blvd. Justicia 101', '555-0123', 'Saltillo', 'Coahuila', '34567', '456-78-9012', '34567890', 'Titular', 20, 18, 2, '2024-04-15 al 2024-04-20', '2025-09-10 al 2025-09-15', '2026-01-20 al 2026-01-25', NULL),
('M014', 'Patricia', 'Díaz', 'Oncología', 'Calle Verdad 202', '555-4567', 'Morelia', 'Michoacán', '45678', '567-89-0123', '45678901', 'Interno', 20, 19, 1, '2024-02-20 al 2024-02-25', '2024-09-10 al 2024-09-15', '2025-03-15 al 2025-03-20', '2025-08-01 al 2025-08-02'),
('M015', 'José', 'Moreno', 'Reumatología', 'Av. Esperanza 303', '555-8901', 'Culiacán', 'Sinaloa', '56789', '678-90-1234', '56789012', 'Sustituto', 20, 19, 1, '2024-05-01 al 2024-05-06', '2024-08-20 al 2024-08-25', '2024-12-10 al 2024-12-15', '2025-05-20 al 2025-05-21'),
('M016', 'Rosa', 'Santos', 'Traumatología', 'Blvd. Unión 404', '555-2345', 'Chihuahua', 'Chihuahua', '67890', '789-01-2345', '67890123', 'Titular', 20, 18, 2, '2024-03-10 al 2024-03-15', '2025-10-25 al 2025-10-30', '2026-02-15 al 2026-02-20', NULL),
('M017', 'Antonio', 'Guerrero', 'Alergología', 'Calle Progreso 505', '555-6789', 'Veracruz', 'Veracruz', '78901', '890-12-3456', '78901234', 'Interno', 20, 19, 1, '2024-01-15 al 2024-01-20', '2024-06-25 al 2024-06-30', '2025-11-10 al 2025-11-15', '2026-04-15 al 2026-04-16'),
('M018', 'Terez', 'Flores', 'Hematología', 'Av. Desarrollo 606', '555-0123', 'Oaxaca', 'Oaxaca', '89012', '901-23-4567', '89012345', 'Sustituto', 20, 19, 1, '2024-04-20 al 2024-04-25', '2024-10-05 al 2024-10-10', '2025-03-20 al 2025-03-25', '2025-09-10 al 2025-09-11'),
('M019', 'Manuel', 'Méndez', 'Infectología', 'Blvd. Innovación 707', '555-4567', 'Toluca', 'Estado de México', '90123', '012-34-5678', '90123456', 'Titular', 20, 19, 1, '2024-02-01 al 2024-02-06', '2024-07-15 al 2024-07-20', '2024-11-10 al 2024-11-15', '2025-06-20 al 2025-06-21'),
('M020', 'Eva', 'Romero', 'Medicina General', 'Calle Creatividad 808', '555-8901', 'Torreón', 'Coahuila', '1234', '123-45-6789', '1234567', 'Interno', 20, 18, 2, '2024-05-10 al 2024-05-15', '2025-09-20 al 2025-09-25', '2026-01-10 al 2026-01-15', NULL),
('M021', 'Jorge', 'Navarro', 'Cardiología', 'Av. Imaginación 909', '555-2345', 'Acapulco', 'Guerrero', '12345', '234-56-7890', '12345678', 'Sustituto', 20, 19, 1, '2024-01-25 al 2024-01-30', '2024-08-15 al 2024-08-20', '2025-12-10 al 2025-12-15', '2026-05-15 al 2026-05-16'),
('M022', 'Silvia', 'Iglesias', 'Pediatría', 'Blvd. Inspiración 101', '555-6789', 'Tampico', 'Tamaulipas', '23456', '345-67-8901', '23456789', 'Titular', 20, 19, 1, '2024-03-05 al 2024-03-10', '2024-09-20 al 2024-09-25', '2024-12-10 al 2024-12-15', '2025-04-20 al 2025-04-21'),
('M023', 'Ángel', 'Pardo', 'Dermatología', 'Calle Visión 202', '555-0123', 'Cuernavaca', 'Morelos', '34567', '456-78-9012', '34567890', 'Interno', 20, 18, 2, '2024-04-15 al 2024-04-20', '2025-10-10 al 2025-10-15', '2026-02-20 al 2026-02-25', NULL),
('M024', 'Olga', 'Benítez', 'Ginecología', 'Av. Misión 303', '555-4567', 'Durango', 'Durango', '45678', '567-89-0123', '45678901', 'Sustituto', 20, 19, 1, '2024-02-20 al 2024-02-25', '2024-10-01 al 2024-10-06', '2025-04-15 al 2025-04-20', '2025-09-10 al 2025-09-11'),
('M025', 'Fernando', 'Crespo', 'Ortopedia', 'Blvd. Valores 404', '555-8901', 'Villahermosa', 'Tabasco', '56789', '678-90-1234', '56789012', 'Titular', 20, 19, 1, '2024-05-10 al 2024-05-15', '2024-07-25 al 2024-07-30', '2025-11-20 al 2025-11-25', '2026-03-15 al 2026-03-16'),
('M026', 'Lucía', 'Marín', 'Neurología', 'Calle Ética 505', '555-2345', 'Mazatlán', 'Sinaloa', '67890', '789-01-2345', '67890123', 'Interno', 20, 19, 1, '2024-01-01 al 2024-01-06', '2024-06-15 al 2024-06-20', '2024-11-05 al 2024-11-10', '2025-04-20 al 2025-04-21'),
('M027', 'Víctor', 'León', 'Oftalmología', 'Av. Honestidad 606', '555-6789', 'Xalapa', 'Veracruz', '78901', '890-12-3456', '78901234', 'Sustituto', 20, 18, 2, '2024-03-20 al 2024-03-25', '2025-10-15 al 2025-10-20', '2026-02-10 al 2026-02-15', NULL),
('M028', 'Nuria', 'Peña', 'Psiquiatría', 'Blvd. Responsabilidad 707', '555-0123', 'Hermosillo', 'Sonora', '89012', '901-23-4567', '89012345', 'Titular', 20, 19, 1, '2024-04-05 al 2024-04-10', '2024-09-15 al 2024-09-20', '2025-01-20 al 2025-01-25', '2025-06-10 al 2025-06-11'),
('M029', 'Alberto', 'Soto', 'Urología', 'Calle Integridad 808', '555-4567', 'Tuxtla Gutiérrez', 'Chiapas', '90123', '012-34-5678', '90123456', 'Interno', 20, 19, 1, '2024-02-10 al 2024-02-15', '2024-08-25 al 2024-08-30', '2024-12-20 al 2024-12-25', '2025-05-15 al 2025-05-16'),
('M030', 'Beatriz', 'Gil', 'Endocrinología', 'Av. Respeto 909', '555-8901', 'Zacatecas', 'Zacatecas', '1234', '123-45-6789', '1234567', 'Sustituto', 20, 19, 1, '2024-03-15 al 2024-03-20', '2024-07-10 al 2024-07-15', '2025-11-20 al 2025-11-25', '2026-04-10 al 2026-04-11');

INSERT INTO Pacientes (ID_Paciente, Nombre, Apellido, Direccion, Telefono, Codigo_Postal, No_Seguro_Social, ID_Medico, Fecha_Ingreso, Fecha_Analisis_Clinico, Fecha_Intervencion, Fecha_Alta) VALUES
('P001', 'Juan', 'Pérez', 'Av. Central 123', '555-4444', '12345', '111-22-3333', 'M001', '2024-01-10 00:00:00', NULL, NULL, '2024-01-20 00:00:00'),
('P002', 'Sofía', 'Ramírez', 'Calle Sur 456', '555-5555', '23456', '222-33-4444', 'M002', '2024-02-15 00:00:00', '2024-02-20 00:00:00', NULL, '2024-03-01 00:00:00'),
('P003', 'Miguel', 'Ortiz', 'Blvd. Este 789', '555-6666', '34567', '333-44-5555', 'M003', '2024-03-05 00:00:00', NULL, '2024-03-10 00:00:00', '2024-03-15 00:00:00'),
('P004', 'Elena', 'Castro', 'Calle Oeste 101', '555-7777', '45678', '444-55-6666', 'M004', '2024-01-20 00:00:00', '2024-01-25 00:00:00', '2024-01-30 00:00:00', '2024-02-05 00:00:00'),
('P005', 'Roberto', 'Mendoza', 'Av. Norte 202', '555-8888', '56789', '555-66-7777', 'M005', '2024-02-10 00:00:00', NULL, NULL, '2024-02-20 00:00:00'),
('P006', 'Carmen', 'Ríos', 'Blvd. Sur 303', '555-9999', '67890', '666-77-8888', 'M006', '2024-03-15 00:00:00', NULL, NULL, '2024-03-25 00:00:00'),
('P007', 'Francisco', 'Núñez', 'Calle Este 404', '555-0000', '78901', '777-88-9999', 'M007', '2024-01-25 00:00:00', '2024-01-30 00:00:00', NULL, '2024-02-05 00:00:00'),
('P008', 'Isabel', 'Herrera', 'Av. Oeste 505', '555-1212', '89012', '888-99-0000', 'M008', '2024-02-20 00:00:00', NULL, '2024-02-25 00:00:00', '2024-03-02 00:00:00'),
('P009', 'Diego', 'Torres', 'Blvd. Central 606', '555-2323', '90123', '999-00-1111', 'M009', '2024-03-25 00:00:00', '2024-03-30 00:00:00', '2024-04-05 00:00:00', '2024-04-10 00:00:00'),
('P010', 'Rosa', 'Santos', 'Calle Norte 707', '555-3434', '1234', '000-11-2222', 'M010', '2024-01-30 00:00:00', NULL, NULL, '2024-02-10 00:00:00'),
('P011', 'Antonio', 'Guerrero', 'Av. Sur 808', '555-4545', '12345', '111-22-3334', 'M011', '2024-02-25 00:00:00', '2024-03-01 00:00:00', NULL, '2024-03-10 00:00:00'),
('P012', 'Teresa', 'Flores', 'Blvd. Este 909', '555-5656', '23456', '222-33-4445', 'M012', '2024-03-30 00:00:00', NULL, '2024-04-05 00:00:00', '2024-04-10 00:00:00'),
('P013', 'Manual', 'Méndez', 'Calle Oeste 1010', '555-6767', '34567', '333-44-5556', 'M013', '2024-01-15 00:00:00', '2024-01-20 00:00:00', '2024-01-25 00:00:00', '2024-02-01 00:00:00'),
('P014', 'Eva', 'Romero', 'Av. Norte 1111', '555-7878', '45678', '444-55-6667', 'M014', '2024-02-05 00:00:00', NULL, NULL, '2024-02-15 00:00:00'),
('P015', 'Jorge', 'Navarro', 'Blvd. Sur 1212', '555-8989', '56789', '555-66-7778', 'M015', '2024-03-10 00:00:00', '2024-03-15 00:00:00', NULL, '2024-03-25 00:00:00'),
('P016', 'Silvia', 'Iglesias', 'Calle Este 1313', '555-9090', '67890', '666-77-8889', 'M016', '2024-01-20 00:00:00', NULL, '2024-01-25 00:00:00', '2024-02-05 00:00:00'),
('P017', 'Ángel', 'Pardo', 'Av. Oeste 1414', '555-0101', '78901', '777-88-9990', 'M017', '2024-02-15 00:00:00', '2024-02-20 00:00:00', '2024-02-25 00:00:00', '2024-03-05 00:00:00'),
('P018', 'Olga', 'Benítez', 'Blvd. Central 1515', '555-1212', '89012', '888-99-0001', 'M018', '2024-03-20 00:00:00', NULL, NULL, '2024-03-30 00:00:00'),
('P019', 'Fernando', 'Crespo', 'Calle Norte 1616', '555-2323', '90123', '999-00-1112', 'M019', '2024-01-25 00:00:00', '2024-01-30 00:00:00', NULL, '2024-02-10 00:00:00'),
('P020', 'Lucía', 'Marín', 'Av. Sur 1717', '555-3434', '1234', '000-11-2223', 'M020', '2024-02-28 00:00:00', NULL, '2024-03-05 00:00:00', '2024-03-15 00:00:00'),
('P021', 'Víctor', 'León', 'Blvd. Este 1818', '555-4545', '12345', '111-22-3335', 'M021', '2024-03-15 00:00:00', '2024-03-20 00:00:00', '2024-03-25 00:00:00', '2024-04-01 00:00:00'),
('P022', 'Nuria', 'Peña', 'Calle Oeste 1919', '555-5656', '23456', '222-33-4446', 'M022', '2024-01-10 00:00:00', NULL, NULL, '2024-01-20 00:00:00'),
('P023', 'Alberto', 'Soto', 'Av. Norte 2020', '555-6767', '34567', '333-44-5557', 'M023', '2024-02-12 00:00:00', '2024-02-17 00:00:00', NULL, '2024-02-25 00:00:00'),
('P024', 'Beatriz', 'Gil', 'Blvd. Sur 2121', '555-7878', '45678', '444-55-6668', 'M024', '2024-03-18 00:00:00', NULL, '2024-03-23 00:00:00', '2024-03-28 00:00:00'),
('P025', 'Carlos', 'Mendoza', 'Calle Este 2222', '555-8989', '56789', '555-66-7779', 'M025', '2024-01-22 00:00:00', '2024-01-27 00:00:00', '2024-02-01 00:00:00', '2024-02-10 00:00:00'),
('P026', 'Laura', 'Gómez', 'Av. Oeste 2323', '555-9090', '67890', '666-77-8890', 'M026', '2024-02-14 00:00:00', NULL, NULL, '2024-02-24 00:00:00'),
('P027', 'Javier', 'López', 'Blvd. Central 2424', '555-0101', '78901', '777-88-9991', 'M027', '2024-03-08 00:00:00', '2024-03-13 00:00:00', '2024-03-18 00:00:00', '2024-03-25 00:00:00'),
('P028', 'Elena', 'Ruiz', 'Calle Norte 2525', '555-1212', '89012', '888-99-0002', 'M028', '2024-01-30 00:00:00', NULL, NULL, '2024-02-09 00:00:00'),
('P029', 'Miguel', 'Torres', 'Av. Sur 2626', '555-2323', '90123', '999-00-1113', 'M029', '2024-02-22 00:00:00', '2024-02-27 00:00:00', NULL, '2024-03-05 00:00:00'),
('P030', 'Ana', 'Morales', 'Blvd. Este 2727', '555-3434', '1234', '000-11-2224', 'M030', '2024-03-12 00:00:00', NULL, '2024-03-17 00:00:00', '2024-03-25 00:00:00');

-- DQL
-- Consulta 1
SELECT Nombre 
FROM Medicos 
WHERE (Fecha_Vacacion_1 LIKE '2024-%' AND Fecha_Vacacion_1 < '2024-07%')
   OR (Fecha_Vacacion_2 LIKE '2024-%' AND Fecha_Vacacion_2 < '2024-07%')
   OR (Fecha_Vacacion_3 LIKE '2024-%' AND Fecha_Vacacion_3 < '2024-07%')
   OR (Fecha_Vacacion_4 LIKE '2024-%' AND Fecha_Vacacion_4 < '2024-07%')
ORDER BY Nombre;

-- Consulta 2
SELECT Nombre 
FROM Medicos 
WHERE Tipo_Medico IN ('Interno', 'Sustituto')
  AND ((Fecha_Vacacion_1 IS NOT NULL) + 
       (Fecha_Vacacion_2 IS NOT NULL) + 
       (Fecha_Vacacion_3 IS NOT NULL) + 
       (Fecha_Vacacion_4 IS NOT NULL)) = 3
  AND ((Fecha_Vacacion_1 LIKE '2024-%' AND Fecha_Vacacion_1 < '2024-07%')
    OR (Fecha_Vacacion_2 LIKE '2024-%' AND Fecha_Vacacion_2 < '2024-07%')
    OR (Fecha_Vacacion_3 LIKE '2024-%' AND Fecha_Vacacion_3 < '2024-07%')
    OR (Fecha_Vacacion_4 LIKE '2024-%' AND Fecha_Vacacion_4 < '2024-07%'))
ORDER BY Nombre;

-- Consulta 3
SELECT Nombre 
FROM Medicos 
WHERE Tipo_Medico IN ('Interno', 'Sustituto')
  AND ((Fecha_Vacacion_1 IS NOT NULL) + 
       (Fecha_Vacacion_2 IS NOT NULL) + 
       (Fecha_Vacacion_3 IS NOT NULL) + 
       (Fecha_Vacacion_4 IS NOT NULL)) = 3
  AND ((DATEDIFF(
          STR_TO_DATE(SUBSTRING_INDEX(Fecha_Vacacion_1, ' al ', -1), '%Y-%m-%d'),
          STR_TO_DATE(SUBSTRING_INDEX(Fecha_Vacacion_1, ' al ', 1), '%Y-%m-%d')
        ) + 1 < 3)
    OR (DATEDIFF(
          STR_TO_DATE(SUBSTRING_INDEX(Fecha_Vacacion_2, ' al ', -1), '%Y-%m-%d'),
          STR_TO_DATE(SUBSTRING_INDEX(Fecha_Vacacion_2, ' al ', 1), '%Y-%m-%d')
        ) + 1 < 3)
    OR (DATEDIFF(
          STR_TO_DATE(SUBSTRING_INDEX(Fecha_Vacacion_3, ' al ', -1), '%Y-%m-%d'),
          STR_TO_DATE(SUBSTRING_INDEX(Fecha_Vacacion_3, ' al ', 1), '%Y-%m-%d')
        ) + 1 < 3)
    OR (DATEDIFF(
          STR_TO_DATE(SUBSTRING_INDEX(Fecha_Vacacion_4, ' al ', -1), '%Y-%m-%d'),
          STR_TO_DATE(SUBSTRING_INDEX(Fecha_Vacacion_4, ' al ', 1), '%Y-%m-%d')
        ) + 1 < 3))
ORDER BY Nombre;

-- Consulta 4
SELECT Nombre 
FROM Medicos 
WHERE Tipo_Medico = 'Sustituto'
  AND ((Fecha_Vacacion_1 LIKE '2024-02%' OR Fecha_Vacacion_1 LIKE '2024-04%' OR Fecha_Vacacion_1 LIKE '2024-06%')
    OR (Fecha_Vacacion_2 LIKE '2024-02%' OR Fecha_Vacacion_2 LIKE '2024-04%' OR Fecha_Vacacion_2 LIKE '2024-06%')
    OR (Fecha_Vacacion_3 LIKE '2024-02%' OR Fecha_Vacacion_3 LIKE '2024-04%' OR Fecha_Vacacion_3 LIKE '2024-06%')
    OR (Fecha_Vacacion_4 LIKE '2024-02%' OR Fecha_Vacacion_4 LIKE '2024-04%' OR Fecha_Vacacion_4 LIKE '2024-06%'))
  AND ((Fecha_Vacacion_1 IS NOT NULL) + 
       (Fecha_Vacacion_2 IS NOT NULL) + 
       (Fecha_Vacacion_3 IS NOT NULL) + 
       (Fecha_Vacacion_4 IS NOT NULL)) = 3
ORDER BY Nombre;

-- Consulta 5
SELECT 
    m.Nombre AS Nombre_Medico,
    m.Fecha_Vacacion_1 AS Periodo_Vacacional,
    p.Nombre AS Nombre_Paciente,
    p.Fecha_Intervencion
FROM Medicos m
JOIN Pacientes p ON m.ID_Medico = p.ID_Medico
WHERE (m.Fecha_Vacacion_1 LIKE '2025-02%' OR m.Fecha_Vacacion_1 LIKE '2025-03%'
    OR m.Fecha_Vacacion_2 LIKE '2025-02%' OR m.Fecha_Vacacion_2 LIKE '2025-03%'
    OR m.Fecha_Vacacion_3 LIKE '2025-02%' OR m.Fecha_Vacacion_3 LIKE '2025-03%'
    OR m.Fecha_Vacacion_4 LIKE '2025-02%' OR m.Fecha_Vacacion_4 LIKE '2025-03%')
    AND p.Fecha_Intervencion IS NOT NULL
ORDER BY p.Fecha_Intervencion;

-- Consulta 6
SELECT 
    m.Nombre AS Nombre_Medico,
    m.Fecha_Vacacion_1 AS Periodo_Vacacional,
    p.Nombre AS Nombre_Paciente,
    p.Fecha_Intervencion
FROM Medicos m
JOIN Pacientes p ON m.ID_Medico = p.ID_Medico
WHERE m.Tipo_Medico = 'Sustituto'
    AND (m.Fecha_Vacacion_1 LIKE '2025-02%' OR m.Fecha_Vacacion_1 LIKE '2025-03%'
        OR m.Fecha_Vacacion_2 LIKE '2025-02%' OR m.Fecha_Vacacion_2 LIKE '2025-03%'
        OR m.Fecha_Vacacion_3 LIKE '2025-02%' OR m.Fecha_Vacacion_3 LIKE '2025-03%'
        OR m.Fecha_Vacacion_4 LIKE '2025-02%' OR m.Fecha_Vacacion_4 LIKE '2025-03%')
    AND p.Fecha_Intervencion IS NOT NULL
ORDER BY p.Fecha_Intervencion, m.Nombre;

-- Consulta 7
SELECT 
    m.Nombre AS Nombre_Medico,
    m.Fecha_Vacacion_1 AS Periodo_Vacacional,
    p.Nombre AS Nombre_Paciente,
    p.Fecha_Analisis_Clinico
FROM Medicos m
JOIN Pacientes p ON m.ID_Medico = p.ID_Medico
WHERE m.Tipo_Medico = 'Interno'
    AND (m.Fecha_Vacacion_1 LIKE '2025-02%' OR m.Fecha_Vacacion_1 LIKE '2025-03%'
        OR m.Fecha_Vacacion_2 LIKE '2025-02%' OR m.Fecha_Vacacion_2 LIKE '2025-03%'
        OR m.Fecha_Vacacion_3 LIKE '2025-02%' OR m.Fecha_Vacacion_3 LIKE '2025-03%'
        OR m.Fecha_Vacacion_4 LIKE '2025-02%' OR m.Fecha_Vacacion_4 LIKE '2025-03%')
    AND p.Fecha_Analisis_Clinico IS NOT NULL
ORDER BY p.Fecha_Analisis_Clinico, m.Nombre;

select * from empleados;
select * from medicos;
select * from pacientes;