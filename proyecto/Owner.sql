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
    PISCINA    NUMBER(1,0)     NOT NULL,
    JACUZZI    NUMBER(1,0)     NOT NULL,
    SAUNA      NUMBER(1,0)     NOT NULL,
    MASAJES    NUMBER(1,0)     NOT NULL,
    TURCO      NUMBER(1,0)     NOT NULL,
    JUEGOS     NUMBER(1,0)     NOT NULL,
    PLAYA      NUMBER(1,0)     NOT NULL,
    BAR        NUMBER(1,0)     NOT NULL,
    DISCOTECA  NUMBER(1,0)     NOT NULL,
    CONSTRAINT hoteles_pk PRIMARY KEY(ID)
);

/* 2.2 Creamos la secuencia para la PK de Tabla hoteles */
CREATE SEQUENCE hoteles_seq START WITH 1;

CREATE OR REPLACE TRIGGER hoteles_bir 
BEFORE INSERT ON hoteles 
FOR EACH ROW
BEGIN
  SELECT hoteles_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;

/* 2.3 ingresar datos a la Tabla hoteles */
INSERT INTO hoteles 
(DIRECCION, CIUDAD, PISCINA, JACUZZI, SAUNA, MASAJES, TURCO, JUEGOS, PLAYA, BAR, DISCOTECA)
VALUES ('Carrera 1A', 'Popayán', 0, 0, 0, 0, 0, 0, 0, 0, 0);

INSERT INTO hoteles 
(DIRECCION, CIUDAD, PISCINA, JACUZZI, SAUNA, MASAJES, TURCO, JUEGOS, PLAYA, BAR, DISCOTECA)
VALUES ('Calle 1B', 'Cali', 0, 0, 1, 0, 0, 1, 0, 0, 1);

INSERT INTO hoteles 
(DIRECCION, CIUDAD, PISCINA, JACUZZI, SAUNA, MASAJES, TURCO, JUEGOS, PLAYA, BAR, DISCOTECA)
VALUES ('Carrera 2A', 'Medellin', 1, 0, 1, 1, 0, 1, 1, 0, 1);

INSERT INTO hoteles 
(DIRECCION, CIUDAD, PISCINA, JACUZZI, SAUNA, MASAJES, TURCO, JUEGOS, PLAYA, BAR, DISCOTECA)
VALUES ('Caller 7A', 'Bogota', 1, 1, 1, 1, 1, 1, 1, 1, 1);

COMMIT;

/* 2.4 Creamos la Tabla de clientes */
CREATE TABLE clientes(
    ID         NUMBER(9)       NOT NULL,
    NOMBRES    VARCHAR(100)    NOT NULL,
    CEDULA     VARCHAR(50)     NOT NULL,
    CONSTRAINT clientes_pk PRIMARY KEY(ID),
    CONSTRAINT UQCEDULA UNIQUE(CEDULA)
);

/* 2.5 Creamos la secuencia para la PK de Tabla Clientes */
CREATE SEQUENCE clientes_seq START WITH 1;

CREATE OR REPLACE TRIGGER clientes_bir 
BEFORE INSERT ON clientes 
FOR EACH ROW
BEGIN
  SELECT clientes_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;

/* 2.6 Creamos la Tabla de temporadas para los hoteles */
CREATE TABLE temporadas(
    ID              NUMBER(9)       NOT NULL,
    HOTEL           NUMBER(9)       NOT NULL,
    TEMPORADA       VARCHAR(100)    NOT NULL,
    FECHA_INICIO    DATE            NOT NULL,
    FECHA_FINAL     DATE            NOT NULL,
    CONSTRAINT temporadas_pk PRIMARY KEY(ID),
    CONSTRAINT HOTEL FOREIGN KEY (HOTEL) REFERENCES hoteles(hoteles_pk))
    CONSTRAINT CHTEMPORADA CHECK(TEMPORADA='ALTA' OR TEMPORADA='MEDIA' OR TEMPORADA='BAJA')
);

/* 2.7 Creamos la secuencia para la PK de Tabla Clientes */
CREATE SEQUENCE temporadas_seq START WITH 1;

CREATE OR REPLACE TRIGGER temporadas_bir 
BEFORE INSERT ON temporadas 
FOR EACH ROW
BEGIN
  SELECT temporadas_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;

/* 2.8 Creamos la Tabla de reservas */
CREATE TABLE reservas(
    ID         NUMBER(9)       NOT NULL,
    CLIENTE    NUMBER(9)       NOT NULL,
    HOTEL      NUMBER(9)       NOT NULL,
    FECHA      DATE            NOT NULL,
    VALOR      FLOAT(3)        NOT NULL,
    TEMPORADA  NUMBER(9)       NOT NULL,
    CONSTRAINT reservas_pk PRIMARY KEY(ID),
    CONSTRAINT CLIENTE FOREIGN KEY (CLIENTE) REFERENCES clientes(clientes_pk)),
    CONSTRAINT HOTEL FOREIGN KEY (HOTEL) REFERENCES hoteles(hoteles_pk)),
    CONSTRAINT TEMPORADA FOREIGN KEY (TEMPORADA) REFERENCES temporadas(temporadas_pk)),
    CONSTRAINT CHVALOR CHECK(VALOR>0)
);

/* 2.9 Creamos la secuencia para la PK de Tabla Reservas (DATE='10-Oct-2013, 04:00 PM')*/
CREATE SEQUENCE reservas_seq START WITH 1;

CREATE OR REPLACE TRIGGER reservas_bir 
BEFORE INSERT ON reservas 
FOR EACH ROW
BEGIN
  SELECT reservas_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;