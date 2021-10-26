/*
    Archivo para el usuario dueño de los objetos.

    Nombre estudiantes:
    - 
    - 

    Tabla de contenido del Archivo: 
    - Creacion de tablas: 2.1-
*/

/* 2.1 Creamos Tabla para los hoteles */
CREATE TABLE hoteles(
    ID         NUMBER(9)       NOT NULL,
    DIRECCION  VARCHAR(100)    NOT NULL,
    CIUDAD     VARCHAR(50)     NOT NULL,
    CONSTRAINT hoteles_pk PRIMARY KEY(ID)
);

/* 2.2 ingresar datos a la Tabla hoteles */
INSERT INTO hoteles (ID, DIRECCION, CIUDAD) VALUES (1, 'Carrera 1A', 'Popayán')
INSERT INTO hoteles (ID, DIRECCION, CIUDAD) VALUES (2, 'Carrera 1B', 'Cali')
INSERT INTO hoteles (ID, DIRECCION, CIUDAD) VALUES (3, 'Carrera 2A', 'Medellin')
INSERT INTO hoteles (ID, DIRECCION, CIUDAD) VALUES (4, 'Carrera 7A', 'Bogota')