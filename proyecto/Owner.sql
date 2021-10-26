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