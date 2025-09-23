DROP TABLE IF EXISTS Pacientes;
DROP TABLE IF EXISTS Empleados;
DROP TABLE IF EXISTS Medicos;

CREATE DATABASE IF NOT EXISTS central_medica;
USE central_medica;

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

INSERT INTO Medicos (ID_Medico, Nombre, Apellido, Especialidad, Direccion, Telefono, Ciudad, Estado, Codigo_Postal, No_Seguro_Social, No_Cedula, Tipo_Medico, Fecha_Vacacion_1, Fecha_Vacacion_2, Fecha_Vacacion_3, Fecha_Vacacion_4) VALUES
('M001', 'Carlos', 'Mendoza', 'Cardiología', 'Av. Central 123', '555-1111', 'Ciudad de México', 'CDMX', '12345', '111-22-3333', '12345678', 'Titular', '2024-03-01 al 2024-03-07', '2024-05-15 al 2024-05-18', NULL, NULL),
('M002', 'Laura', 'Gómez', 'Pediatría', 'Calle Norte 456', '555-2222', 'Guadalajara', 'Jalisco', '23456', '222-33-4444', '23456789', 'Interno', '2024-04-05 al 2024-04-10', '2024-06-20 al 2024-06-25', NULL, NULL),
('M003', 'Javier', 'López', 'Dermatología', 'Blvd. Sur 789', '555-3333', 'Monterrey', 'Nuevo León', '34567', '333-44-5555', '34567890', 'Sustituto', '2024-02-10 al 2024-02-15', '2024-04-15 al 2024-04-20', '2024-06-01 al 2024-06-03', NULL),
('M004', 'Elena', 'Ruiz', 'Ginecología', 'Av. Este 101', '555-4444', 'Puebla', 'Puebla', '45678', '444-55-6666', '45678901', 'Interno', '2024-01-15 al 2024-01-20', '2024-03-15 al 2024-03-20', '2024-05-10 al 2024-05-12', NULL),
('M005', 'Miguel', 'Torres', 'Ortopedia', 'Calle Oeste 202', '555-5555', 'Tijuana', 'Baja California', '56789', '555-66-7777', '56789012', 'Interno', '2024-02-01 al 2024-02-02', '2024-04-10 al 2024-04-15', '2024-06-05 al 2024-06-10', NULL),
('M006', 'Ana', 'Morales', 'Neurología', 'Av. Norte 303', '555-6666', 'León', 'Guanajuato', '67890', '666-77-8888', '67890123', 'Sustituto', '2024-01-10 al 2024-01-11', '2024-03-20 al 2024-03-25', '2024-05-15 al 2024-05-20', NULL),
('M007', 'Roberto', 'Vega', 'Oftalmología', 'Blvd. Central 404', '555-7777', 'Mérida', 'Yucatán', '78901', '777-88-9999', '78901234', 'Sustituto', '2024-02-05 al 2024-02-05', '2024-04-12 al 2024-04-17', '2024-06-08 al 2024-06-13', NULL),
('M008', 'Sofía', 'Castro', 'Psiquiatría', 'Calle Sur 505', '555-8888', 'Querétaro', 'Querétaro', '89012', '888-99-0000', '89012345', 'Sustituto', '2024-02-14 al 2024-02-16', '2024-04-18 al 2024-04-22', '2024-06-20 al 2024-06-24', NULL),
('M009', 'Diego', 'Ortiz', 'Urología', 'Av. Oeste 606', '555-9999', 'Cancún', 'Quintana Roo', '90123', '999-00-1111', '90123456', 'Sustituto', '2024-02-20 al 2024-02-22', '2024-04-25 al 2024-04-29', '2024-06-25 al 2024-06-29', NULL),
('M010', 'Carmen', 'Ríos', 'Endocrinología', 'Blvd. Este 707', '555-0000', 'San Luis Potosí', 'SLP', '1234', '000-11-2222', '1234567', 'Titular', '2025-02-10 al 2025-02-17', '2025-03-15 al 2025-03-20', NULL, NULL),
('M011', 'Francisco', 'Núñez', 'Gastroenterología', 'Calle Norte 808', '555-1212', 'Aguascalientes', 'Aguascalientes', '12345', '111-22-3334', '12345678', 'Interno', '2025-02-14 al 2025-02-21', '2025-03-18 al 2025-03-23', NULL, NULL),
('M012', 'Isabel', 'Herrera', 'Nefrología', 'Av. Sur 909', '555-2323', 'Mexicali', 'Baja California', '23456', '222-33-4445', '23456789', 'Sustituto', '2025-02-12 al 2025-02-19', '2025-03-16 al 2025-03-21', NULL, NULL),
('M013', 'Ricardo', 'Jiménez', 'Neumología', 'Blvd. Oeste 101', '555-3434', 'Saltillo', 'Coahuila', '34567', '333-44-5556', '34567890', 'Titular', '2024-07-01 al 2024-07-10', NULL, NULL, NULL),
('M014', 'Patricia', 'Díaz', 'Oncología', 'Calle Central 202', '555-4545', 'Morelia', 'Michoacán', '45678', '444-55-6667', '45678901', 'Interno', '2024-08-15 al 2024-08-25', NULL, NULL, NULL),
('M015', 'José', 'Moreno', 'Reumatología', 'Av. Este 303', '555-5656', 'Culiacán', 'Sinaloa', '56789', '555-66-7778', '56789012', 'Sustituto', '2024-09-10 al 2024-09-20', NULL, NULL, NULL),
('M016', 'Rosa', 'Santos', 'Traumatología', 'Blvd. Norte 404', '555-6767', 'Chihuahua', 'Chihuahua', '67890', '666-77-8889', '67890123', 'Titular', '2024-10-05 al 2024-10-15', NULL, NULL, NULL),
('M017', 'Antonio', 'Guerrero', 'Alergología', 'Calle Sur 505', '555-7878', 'Veracruz', 'Veracruz', '78901', '777-88-9990', '78901234', 'Interno', '2024-11-20 al 2024-11-30', NULL, NULL, NULL),
('M018', 'Teresa', 'Flores', 'Hematología', 'Av. Oeste 606', '555-8989', 'Oaxaca', 'Oaxaca', '89012', '888-99-0001', '89012345', 'Sustituto', '2024-12-15 al 2024-12-25', NULL, NULL, NULL),
('M019', 'Manuel', 'Méndez', 'Infectología', 'Blvd. Central 707', '555-9090', 'Toluca', 'Estado de México', '90123', '999-00-1112', '90123456', 'Titular', '2025-04-01 al 2025-04-10', NULL, NULL, NULL),
('M020', 'Eva', 'Romero', 'Medicina General', 'Calle Este 808', '555-0101', 'Torreón', 'Coahuila', '1234', '000-11-2223', '1234567', 'Interno', '2025-05-15 al 2025-05-25', NULL, NULL, NULL),
('M021', 'Jorge', 'Navarro', 'Cardiología', 'Av. Norte 909', '555-1212', 'Acapulco', 'Guerrero', '12345', '111-22-3335', '12345678', 'Sustituto', '2025-06-10 al 2025-06-20', NULL, NULL, NULL),
('M022', 'Silvia', 'Iglesias', 'Pediatría', 'Blvd. Sur 101', '555-2323', 'Tampico', 'Tamaulipas', '23456', '222-33-4446', '23456789', 'Titular', '2025-07-05 al 2025-07-15', NULL, NULL, NULL),
('M023', 'Ángel', 'Pardo', 'Dermatología', 'Calle Oeste 202', '555-3434', 'Cuernavaca', 'Morelos', '34567', '333-44-5557', '34567890', 'Interno', '2025-08-20 al 2025-08-30', NULL, NULL, NULL),
('M024', 'Olga', 'Benítez', 'Ginecología', 'Av. Central 303', '555-4545', 'Durango', 'Durango', '45678', '444-55-6668', '45678901', 'Sustituto', '2025-09-15 al 2025-09-25', NULL, NULL, NULL),
('M025', 'Fernando', 'Crespo', 'Ortopedia', 'Blvd. Este 404', '555-5656', 'Villahermosa', 'Tabasco', '56789', '555-66-7779', '56789012', 'Titular', '2025-10-10 al 2025-10-20', NULL, NULL, NULL),
('M026', 'Lucía', 'Marín', 'Neurología', 'Calle Norte 505', '555-6767', 'Mazatlán', 'Sinaloa', '67890', '666-77-8890', '67890123', 'Interno', '2025-11-05 al 2025-11-15', NULL, NULL, NULL),
('M027', 'Víctor', 'León', 'Oftalmología', 'Av. Sur 606', '555-7878', 'Xalapa', 'Veracruz', '78901', '777-88-9991', '78901234', 'Sustituto', '2025-12-20 al 2025-12-30', NULL, NULL, NULL),
('M028', 'Nuria', 'Peña', 'Psiquiatría', 'Blvd. Oeste 707', '555-8989', 'Hermosillo', 'Sonora', '89012', '888-99-0002', '89012345', 'Titular', '2026-01-10 al 2026-01-20', NULL, NULL, NULL),
('M029', 'Alberto', 'Soto', 'Urología', 'Calle Central 808', '555-9090', 'Tuxtla Gutiérrez', 'Chiapas', '90123', '999-00-1113', '90123456', 'Interno', '2026-02-15 al 2026-02-25', NULL, NULL, NULL),
('M030', 'Beatriz', 'Gil', 'Endocrinología', 'Av. Este 909', '555-0101', 'Zacatecas', 'Zacatecas', '1234', '000-11-2224', '1234567', 'Sustituto', '2026-03-10 al 2026-03-20', NULL, NULL, NULL);

INSERT INTO Pacientes (ID_Paciente, Nombre, Apellido, Direccion, Telefono, Codigo_Postal, No_Seguro_Social, ID_Medico, Fecha_Ingreso, Fecha_Analisis_Clinico, Fecha_Intervencion, Fecha_Alta) VALUES
('P001', 'Juan', 'Pérez', 'Av. Central 123', '555-4444', '12345', '111-22-3333', 'M010', '2025-01-15 00:00:00', '2025-01-20 00:00:00', '2025-02-12 00:00:00', '2025-02-20 00:00:00'),
('P002', 'Sofía', 'Ramírez', 'Calle Norte 456', '555-5555', '23456', '222-33-4444', 'M011', '2025-01-20 00:00:00', '2025-01-25 00:00:00', '2025-02-16 00:00:00', '2025-02-25 00:00:00'),
('P003', 'Miguel', 'Ortiz', 'Blvd. Sur 789', '555-6666', '34567', '333-44-5555', 'M012', '2025-01-25 00:00:00', '2025-01-30 00:00:00', '2025-03-18 00:00:00', '2025-03-25 00:00:00'),
('P004', 'Elena', 'Castro', 'Av. Este 101', '555-7777', '45678', '444-55-6666', 'M010', '2025-02-01 00:00:00', '2025-02-05 00:00:00', '2025-03-20 00:00:00', '2025-03-28 00:00:00'),
('P005', 'Roberto', 'Mendoza', 'Calle Oeste 202', '555-8888', '56789', '555-66-7777', 'M011', '2025-02-10 00:00:00', '2025-02-15 00:00:00', NULL, '2025-02-25 00:00:00'),
('P006', 'Carmen', 'Ríos', 'Av. Norte 303', '555-9999', '67890', '666-77-8888', 'M012', '2025-02-15 00:00:00', '2025-02-20 00:00:00', NULL, '2025-03-01 00:00:00'),
('P007', 'Francisco', 'Núñez', 'Blvd. Central 404', '555-0000', '78901', '777-88-9999', 'M011', '2025-03-01 00:00:00', '2025-03-05 00:00:00', NULL, '2025-03-15 00:00:00'),
('P008', 'Isabel', 'Herrera', 'Calle Sur 505', '555-1212', '89012', '888-99-0000', 'M001', '2024-03-01 00:00:00', '2024-03-05 00:00:00', '2024-03-10 00:00:00', '2024-03-15 00:00:00'),
('P009', 'Diego', 'Torres', 'Av. Oeste 606', '555-2323', '90123', '999-00-1111', 'M002', '2024-04-01 00:00:00', '2024-04-05 00:00:00', '2024-04-10 00:00:00', '2024-04-15 00:00:00'),
('P010', 'Rosa', 'Santos', 'Blvd. Este 707', '555-3434', '1234', '000-11-2222', 'M003', '2024-05-01 00:00:00', '2024-05-05 00:00:00', '2024-05-10 00:00:00', '2024-05-15 00:00:00'),
('P011', 'Antonio', 'Guerrero', 'Calle Norte 808', '555-4545', '12345', '111-22-3334', 'M004', '2024-06-01 00:00:00', '2024-06-05 00:00:00', '2024-06-10 00:00:00', '2024-06-15 00:00:00'),
('P012', 'Teresa', 'Flores', 'Av. Sur 909', '555-5656', '23456', '222-33-4445', 'M005', '2024-07-01 00:00:00', '2024-07-05 00:00:00', '2024-07-10 00:00:00', '2024-07-15 00:00:00'),
('P013', 'Manuel', 'Méndez', 'Blvd. Oeste 101', '555-6767', '34567', '333-44-5556', 'M006', '2024-08-01 00:00:00', '2024-08-05 00:00:00', '2024-08-10 00:00:00', '2024-08-15 00:00:00'),
('P014', 'Eva', 'Romero', 'Calle Central 202', '555-7878', '45678', '444-55-6667', 'M007', '2024-09-01 00:00:00', '2024-09-05 00:00:00', '2024-09-10 00:00:00', '2024-09-15 00:00:00'),
('P015', 'Jorge', 'Navarro', 'Av. Este 303', '555-8989', '56789', '555-66-7778', 'M008', '2024-10-01 00:00:00', '2024-10-05 00:00:00', '2024-10-10 00:00:00', '2024-10-15 00:00:00'),
('P016', 'Silvia', 'Iglesias', 'Blvd. Norte 404', '555-9090', '67890', '666-77-8889', 'M009', '2024-11-01 00:00:00', '2024-11-05 00:00:00', '2024-11-10 00:00:00', '2024-11-15 00:00:00'),
('P017', 'Ángel', 'Pardo', 'Calle Sur 505', '555-0101', '78901', '777-88-9990', 'M013', '2024-12-01 00:00:00', '2024-12-05 00:00:00', '2024-12-10 00:00:00', '2024-12-15 00:00:00'),
('P018', 'Olga', 'Benítez', 'Av. Oeste 606', '555-1212', '89012', '888-99-0001', 'M014', '2025-04-01 00:00:00', '2025-04-05 00:00:00', '2025-04-10 00:00:00', '2025-04-15 00:00:00'),
('P019', 'Fernando', 'Crespo', 'Blvd. Central 707', '555-2323', '90123', '999-00-1112', 'M015', '2025-05-01 00:00:00', '2025-05-05 00:00:00', '2025-05-10 00:00:00', '2025-05-15 00:00:00'),
('P020', 'Lucía', 'Marín', 'Calle Este 808', '555-3434', '1234', '000-11-2223', 'M016', '2025-06-01 00:00:00', '2025-06-05 00:00:00', '2025-06-10 00:00:00', '2025-06-15 00:00:00'),
('P021', 'Víctor', 'León', 'Av. Norte 909', '555-4545', '12345', '111-22-3335', 'M017', '2025-07-01 00:00:00', '2025-07-05 00:00:00', '2025-07-10 00:00:00', '2025-07-15 00:00:00'),
('P022', 'Nuria', 'Peña', 'Blvd. Sur 101', '555-5656', '23456', '222-33-4446', 'M018', '2025-08-01 00:00:00', '2025-08-05 00:00:00', '2025-08-10 00:00:00', '2025-08-15 00:00:00'),
('P023', 'Alberto', 'Soto', 'Calle Oeste 202', '555-6767', '34567', '333-44-5557', 'M019', '2025-09-01 00:00:00', '2025-09-05 00:00:00', '2025-09-10 00:00:00', '2025-09-15 00:00:00'),
('P024', 'Beatriz', 'Gil', 'Av. Central 303', '555-7878', '45678', '444-55-6668', 'M020', '2025-10-01 00:00:00', '2025-10-05 00:00:00', '2025-10-10 00:00:00', '2025-10-15 00:00:00'),
('P025', 'Carlos', 'Mendoza', 'Blvd. Este 404', '555-8989', '56789', '555-66-7779', 'M021', '2025-11-01 00:00:00', '2025-11-05 00:00:00', '2025-11-10 00:00:00', '2025-11-15 00:00:00'),
('P026', 'Laura', 'Gómez', 'Calle Norte 505', '555-9090', '67890', '666-77-8890', 'M022', '2025-12-01 00:00:00', '2025-12-05 00:00:00', '2025-12-10 00:00:00', '2025-12-15 00:00:00'),
('P027', 'Javier', 'López', 'Av. Sur 606', '555-0101', '78901', '777-88-9991', 'M023', '2026-01-01 00:00:00', '2026-01-05 00:00:00', '2026-01-10 00:00:00', '2026-01-15 00:00:00'),
('P028', 'Elena', 'Ruiz', 'Blvd. Oeste 707', '555-1212', '89012', '888-99-0002', 'M024', '2026-02-01 00:00:00', '2026-02-05 00:00:00', '2026-02-10 00:00:00', '2026-02-15 00:00:00'),
('P029', 'Miguel', 'Torres', 'Calle Central 808', '555-2323', '90123', '999-00-1113', 'M025', '2026-03-01 00:00:00', '2026-03-05 00:00:00', '2026-03-10 00:00:00', '2026-03-15 00:00:00'),
('P030', 'Ana', 'Morales', 'Av. Este 909', '555-3434', '1234', '000-11-2224', 'M026', '2026-04-01 00:00:00', '2026-04-05 00:00:00', '2026-04-10 00:00:00', '2026-04-15 00:00:00');

INSERT INTO Empleados (ID_Empleado, Nombre, Apellido, Direccion, Telefono, Ciudad, Estado, Codigo_Postal, Fecha_Vacacion_1, Fecha_Vacacion_2, Fecha_Vacacion_3, Fecha_Vacacion_4) VALUES
('E001', 'María', 'González', 'Calle Primavera 12', '555-1111', 'Ciudad de México', 'CDMX', '12345', '2024-03-01 al 2024-03-07', '2024-05-15 al 2024-05-18', NULL, NULL),
('E002', 'Pedro', 'Sánchez', 'Av. Libertad 34', '555-2222', 'Guadalajara', 'Jalisco', '23456', '2024-04-05 al 2024-04-10', '2024-07-20 al 2024-07-25', NULL, NULL),
('E003', 'Lucía', 'Torres', 'Blvd. Norte 56', '555-3333', 'Monterrey', 'Nuevo León', '34567', '2024-02-10 al 2024-02-15', '2025-06-15 al 2025-06-20', NULL, NULL),
('E004', 'Roberto', 'Vega', 'Calle Sol 78', '555-4444', 'Puebla', 'Puebla', '45678', '2024-03-15 al 2024-03-20', '2024-08-10 al 2024-08-15', NULL, NULL),
('E005', 'Ana', 'Morales', 'Av. Paz 90', '555-5555', 'Tijuana', 'Baja California', '56789', '2024-01-20 al 2024-01-25', '2024-06-15 al 2024-06-20', NULL, NULL),
('E006', 'José', 'Ramírez', 'Blvd. Este 101', '555-6666', 'León', 'Guanajuato', '67890', '2024-04-05 al 2024-04-10', '2025-09-15 al 2025-09-20', NULL, NULL),
('E007', 'Carmen', 'Díaz', 'Calle Oeste 202', '555-7777', 'Mérida', 'Yucatán', '78901', '2024-02-10 al 2024-02-15', '2024-07-25 al 2024-07-30', NULL, NULL),
('E008', 'Francisco', 'Romero', 'Av. Sur 303', '555-8888', 'Querétaro', 'Querétaro', '89012', '2024-03-15 al 2024-03-20', '2024-09-01 al 2024-09-06', NULL, NULL),
('E009', 'Isabel', 'Herrera', 'Blvd. Norte 404', '555-9999', 'Cancún', 'Quintana Roo', '90123', '2024-05-20 al 2024-05-25', '2025-10-10 al 2025-10-15', NULL, NULL),
('E010', 'Diego', 'Núñez', 'Calle Central 505', '555-0000', 'San Luis Potosí', 'SLP', '1234', '2024-04-01 al 2024-04-06', '2024-08-15 al 2024-08-20', NULL, NULL),
('E011', 'Rosa', 'Santos', 'Av. Este 606', '555-1212', 'Aguascalientes', 'Aguascalientes', '12345', '2024-01-10 al 2024-01-15', '2024-06-20 al 2024-06-25', NULL, NULL),
('E012', 'Antonio', 'Guerrero', 'Blvd. Oeste 707', '555-2323', 'Mexicali', 'Baja California', '23456', '2024-03-05 al 2024-03-10', '2024-07-25 al 2024-07-30', NULL, NULL),
('E013', 'Teresa', 'Flores', 'Calle Sur 808', '555-3434', 'Saltillo', 'Coahuila', '34567', '2024-04-15 al 2024-04-20', '2025-09-10 al 2025-09-15', NULL, NULL),
('E014', 'Manuel', 'Méndez', 'Av. Norte 909', '555-4545', 'Morelia', 'Michoacán', '45678', '2024-02-20 al 2024-02-25', '2024-09-10 al 2024-09-15', NULL, NULL),
('E015', 'Eva', 'Romero', 'Blvd. Central 1010', '555-5656', 'Culiacán', 'Sinaloa', '56789', '2024-05-01 al 2024-05-06', '2024-08-20 al 2024-08-25', NULL, NULL),
('E016', 'Jorge', 'Navarro', 'Calle Este 1111', '555-6767', 'Chihuahua', 'Chihuahua', '67890', '2024-03-10 al 2024-03-15', '2025-10-25 al 2025-10-30', NULL, NULL),
('E017', 'Silvia', 'Iglesias', 'Av. Oeste 1212', '555-7878', 'Veracruz', 'Veracruz', '78901', '2024-01-15 al 2024-01-20', '2024-06-25 al 2024-06-30', NULL, NULL),
('E018', 'Ángel', 'Pardo', 'Blvd. Sur 1313', '555-8989', 'Oaxaca', 'Oaxaca', '89012', '2024-04-20 al 2024-04-25', '2024-10-05 al 2024-10-10', NULL, NULL),
('E019', 'Olga', 'Benítez', 'Calle Norte 1414', '555-9090', 'Toluca', 'Estado de México', '90123', '2024-02-01 al 2024-02-06', '2024-07-15 al 2024-07-20', NULL, NULL),
('E020', 'Fernando', 'Crespo', 'Av. Central 1515', '555-0101', 'Torreón', 'Coahuila', '1234', '2024-05-10 al 2024-05-15', '2025-09-20 al 2025-09-25', NULL, NULL),
('E021', 'Lucía', 'Marín', 'Blvd. Este 1616', '555-1212', 'Acapulco', 'Guerrero', '12345', '2024-01-25 al 2024-01-30', '2024-08-15 al 2024-08-20', NULL, NULL),
('E022', 'Víctor', 'León', 'Calle Oeste 1717', '555-2323', 'Tampico', 'Tamaulipas', '23456', '2024-03-05 al 2024-03-10', '2024-09-20 al 2024-09-25', NULL, NULL),
('E023', 'Nuria', 'Peña', 'Av. Sur 1818', '555-3434', 'Cuernavaca', 'Morelos', '34567', '2024-04-15 al 2024-04-20', '2025-10-10 al 2025-10-15', NULL, NULL),
('E024', 'Alberto', 'Soto', 'Blvd. Norte 1919', '555-4545', 'Durango', 'Durango', '45678', '2024-02-20 al 2024-02-25', '2024-10-01 al 2024-10-06', NULL, NULL),
('E025', 'Beatriz', 'Gil', 'Calle Central 2020', '555-5656', 'Villahermosa', 'Tabasco', '56789', '2024-05-10 al 2024-05-15', '2024-07-25 al 2024-07-30', NULL, NULL),
('E026', 'Carlos', 'Mendoza', 'Av. Este 2121', '555-6767', 'Mazatlán', 'Sinaloa', '67890', '2024-01-01 al 2024-01-06', '2024-06-15 al 2024-06-20', NULL, NULL),
('E027', 'Laura', 'Gómez', 'Blvd. Oeste 2222', '555-7878', 'Xalapa', 'Veracruz', '78901', '2024-03-20 al 2024-03-25', '2025-10-15 al 2025-10-20', NULL, NULL),
('E028', 'Javier', 'López', 'Calle Sur 2323', '555-8989', 'Hermosillo', 'Sonora', '89012', '2024-04-05 al 2024-04-10', '2024-09-15 al 2024-09-20', NULL, NULL),
('E029', 'Elena', 'Ruiz', 'Av. Norte 2424', '555-9090', 'Tuxtla Gutiérrez', 'Chiapas', '90123', '2024-02-10 al 2024-02-15', '2024-08-25 al 2024-08-30', NULL, NULL),
('E030', 'Miguel', 'Torres', 'Blvd. Central 2525', '555-0101', 'Zacatecas', 'Zacatecas', '1234', '2024-03-15 al 2024-03-20', '2024-07-10 al 2024-07-15', NULL, NULL);

SELECT Nombre 
FROM Medicos 
WHERE (Fecha_Vacacion_1 LIKE '2024-%' AND Fecha_Vacacion_1 < '2024-07%')
   OR (Fecha_Vacacion_2 LIKE '2024-%' AND Fecha_Vacacion_2 < '2024-07%')
   OR (Fecha_Vacacion_3 LIKE '2024-%' AND Fecha_Vacacion_3 < '2024-07%')
   OR (Fecha_Vacacion_4 LIKE '2024-%' AND Fecha_Vacacion_4 < '2024-07%')
ORDER BY Nombre;

SELECT Nombre, Tipo_Medico
FROM Medicos 
WHERE Tipo_Medico IN ('Interno', 'Sustituto')
  AND ((Fecha_Vacacion_1 IS NOT NULL) + 
       (Fecha_Vacacion_2 IS NOT NULL) + 
       (Fecha_Vacacion_3 IS NOT NULL) + 
       (Fecha_Vacacion_4 IS NOT NULL)) = 3
ORDER BY Nombre;

SELECT Nombre, Tipo_Medico
FROM Medicos 
WHERE Tipo_Medico IN ('Interno', 'Sustituto')
  AND ((Fecha_Vacacion_1 IS NOT NULL) + 
       (Fecha_Vacacion_2 IS NOT NULL) + 
       (Fecha_Vacacion_3 IS NOT NULL) + 
       (Fecha_Vacacion_4 IS NOT NULL)) = 3
  AND (
    -- Verificar si algún periodo tiene menos de 3 días
    (Fecha_Vacacion_1 IS NOT NULL AND 
     DATEDIFF(
       STR_TO_DATE(SUBSTRING_INDEX(Fecha_Vacacion_1, ' al ', -1), '%Y-%m-%d'),
       STR_TO_DATE(SUBSTRING_INDEX(Fecha_Vacacion_1, ' al ', 1), '%Y-%m-%d')
     ) + 1 < 3)
    OR
    (Fecha_Vacacion_2 IS NOT NULL AND 
     DATEDIFF(
       STR_TO_DATE(SUBSTRING_INDEX(Fecha_Vacacion_2, ' al ', -1), '%Y-%m-%d'),
       STR_TO_DATE(SUBSTRING_INDEX(Fecha_Vacacion_2, ' al ', 1), '%Y-%m-%d')
     ) + 1 < 3)
    OR
    (Fecha_Vacacion_3 IS NOT NULL AND 
     DATEDIFF(
       STR_TO_DATE(SUBSTRING_INDEX(Fecha_Vacacion_3, ' al ', -1), '%Y-%m-%d'),
       STR_TO_DATE(SUBSTRING_INDEX(Fecha_Vacacion_3, ' al ', 1), '%Y-%m-%d')
     ) + 1 < 3)
    OR
    (Fecha_Vacacion_4 IS NOT NULL AND 
     DATEDIFF(
       STR_TO_DATE(SUBSTRING_INDEX(Fecha_Vacacion_4, ' al ', -1), '%Y-%m-%d'),
       STR_TO_DATE(SUBSTRING_INDEX(Fecha_Vacacion_4, ' al ', 1), '%Y-%m-%d')
     ) + 1 < 3)
  )
ORDER BY Nombre;

SELECT Nombre
FROM Medicos 
WHERE Tipo_Medico = 'Sustituto'
  AND (
    -- Verificar vacaciones en febrero
    (Fecha_Vacacion_1 LIKE '2024-02%' OR Fecha_Vacacion_2 LIKE '2024-02%' OR 
     Fecha_Vacacion_3 LIKE '2024-02%' OR Fecha_Vacacion_4 LIKE '2024-02%')
    AND
    -- Verificar vacaciones en abril
    (Fecha_Vacacion_1 LIKE '2024-04%' OR Fecha_Vacacion_2 LIKE '2024-04%' OR 
     Fecha_Vacacion_3 LIKE '2024-04%' OR Fecha_Vacacion_4 LIKE '2024-04%')
    AND
    -- Verificar vacaciones en junio
    (Fecha_Vacacion_1 LIKE '2024-06%' OR Fecha_Vacacion_2 LIKE '2024-06%' OR 
     Fecha_Vacacion_3 LIKE '2024-06%' OR Fecha_Vacacion_4 LIKE '2024-06%')
  )
ORDER BY Nombre;

SELECT 
    m.Nombre AS Nombre_Medico,
    m.Tipo_Medico,
    COALESCE(
        CASE WHEN m.Fecha_Vacacion_1 LIKE '2025-02%' OR m.Fecha_Vacacion_1 LIKE '2025-03%' THEN m.Fecha_Vacacion_1 END,
        CASE WHEN m.Fecha_Vacacion_2 LIKE '2025-02%' OR m.Fecha_Vacacion_2 LIKE '2025-03%' THEN m.Fecha_Vacacion_2 END,
        CASE WHEN m.Fecha_Vacacion_3 LIKE '2025-02%' OR m.Fecha_Vacacion_3 LIKE '2025-03%' THEN m.Fecha_Vacacion_3 END,
        CASE WHEN m.Fecha_Vacacion_4 LIKE '2025-02%' OR m.Fecha_Vacacion_4 LIKE '2025-03%' THEN m.Fecha_Vacacion_4 END
    ) AS Periodo_Vacacional,
    p.Nombre AS Nombre_Paciente,
    p.Fecha_Intervencion
FROM Medicos m
JOIN Pacientes p ON m.ID_Medico = p.ID_Medico
WHERE (m.Fecha_Vacacion_1 LIKE '2025-02%' OR m.Fecha_Vacacion_1 LIKE '2025-03%'
    OR m.Fecha_Vacacion_2 LIKE '2025-02%' OR m.Fecha_Vacacion_2 LIKE '2025-03%'
    OR m.Fecha_Vacacion_3 LIKE '2025-02%' OR m.Fecha_Vacacion_3 LIKE '2025-03%'
    OR m.Fecha_Vacacion_4 LIKE '2025-02%' OR m.Fecha_Vacacion_4 LIKE '2025-03%')
    AND p.Fecha_Intervencion IS NOT NULL
    AND YEAR(p.Fecha_Intervencion) = 2025 
    AND MONTH(p.Fecha_Intervencion) IN (2, 3)
ORDER BY p.Fecha_Intervencion;

SELECT 
    m.Nombre AS Nombre_Medico,
    COALESCE(
        CASE WHEN m.Fecha_Vacacion_1 LIKE '2025-02%' OR m.Fecha_Vacacion_1 LIKE '2025-03%' THEN m.Fecha_Vacacion_1 END,
        CASE WHEN m.Fecha_Vacacion_2 LIKE '2025-02%' OR m.Fecha_Vacacion_2 LIKE '2025-03%' THEN m.Fecha_Vacacion_2 END,
        CASE WHEN m.Fecha_Vacacion_3 LIKE '2025-02%' OR m.Fecha_Vacacion_3 LIKE '2025-03%' THEN m.Fecha_Vacacion_3 END,
        CASE WHEN m.Fecha_Vacacion_4 LIKE '2025-02%' OR m.Fecha_Vacacion_4 LIKE '2025-03%' THEN m.Fecha_Vacacion_4 END
    ) AS Periodo_Vacacional,
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
    AND YEAR(p.Fecha_Intervencion) = 2025 
    AND MONTH(p.Fecha_Intervencion) IN (2, 3)
ORDER BY p.Fecha_Intervencion, m.Nombre;

SELECT 
    m.Nombre AS Nombre_Medico,
    m.Tipo_Medico,
    COALESCE(
        CASE WHEN m.Fecha_Vacacion_1 LIKE '2025-02%' OR m.Fecha_Vacacion_1 LIKE '2025-03%' THEN m.Fecha_Vacacion_1 END,
        CASE WHEN m.Fecha_Vacacion_2 LIKE '2025-02%' OR m.Fecha_Vacacion_2 LIKE '2025-03%' THEN m.Fecha_Vacacion_2 END,
        CASE WHEN m.Fecha_Vacacion_3 LIKE '2025-02%' OR m.Fecha_Vacacion_3 LIKE '2025-03%' THEN m.Fecha_Vacacion_3 END,
        CASE WHEN m.Fecha_Vacacion_4 LIKE '2025-02%' OR m.Fecha_Vacacion_4 LIKE '2025-03%' THEN m.Fecha_Vacacion_4 END
    ) AS Periodo_Vacacional,
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
    AND YEAR(p.Fecha_Analisis_Clinico) = 2025 
    AND MONTH(p.Fecha_Analisis_Clinico) IN (2, 3)
ORDER BY p.Fecha_Analisis_Clinico, m.Nombre;

select * from empleados;
select * from medicos;
select * from pacientes;
