/*
  Archivo para el usuario dueño de los objetos.

  Nombre estudiantes:
  - 
  - 

  Tabla de contenido del Archivo: 
  - Creacion de tablas: 2.1-
*/

-- 2.1 Creamos Tabla para los hoteles

CREATE TABLE HOTELES(
  ID         INT             NOT NULL,
  DIRECCION  VARCHAR2(50)    NOT NULL,
  CIUDAD     VARCHAR2(50)    NOT NULL,
  PISCINA    NUMBER(1,0)     NOT NULL,
  JACUZZI    NUMBER(1,0)     NOT NULL,
  SAUNA      NUMBER(1,0)     NOT NULL,
  MASAJES    NUMBER(1,0)     NOT NULL,
  TURCO      NUMBER(1,0)     NOT NULL,
  JUEGOS     NUMBER(1,0)     NOT NULL,
  PLAYA      NUMBER(1,0)     NOT NULL,
  BAR        NUMBER(1,0)     NOT NULL,
  DISCOTECA  NUMBER(1,0)     NOT NULL,
  CONSTRAINT PK_HOTEL PRIMARY KEY(ID)
);

-- 2.2 Creamos la secuencia para la PK de Tabla hoteles

CREATE SEQUENCE SQ_HOTELES_AUTOINCREMENT INCREMENT BY 1 START WITH 1 MAXVALUE 10000 MINVALUE 1;

CREATE OR REPLACE TRIGGER TR_GHOTELES_AUTOINCREMENT
BEFORE INSERT ON HOTELES 
FOR EACH ROW
BEGIN
  SELECT SQ_HOTELES_AUTOINCREMENT.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/

-- 2.3 ingresar datos a la Tabla hoteles

INSERT INTO HOTELES 
(DIRECCION, CIUDAD, PISCINA, JACUZZI, SAUNA, MASAJES, TURCO, JUEGOS, PLAYA, BAR, DISCOTECA)
VALUES
('Carrera 1A', 'Popayán', 0, 0, 0, 0, 0, 0, 0, 0, 0);

INSERT INTO HOTELES 
(DIRECCION, CIUDAD, PISCINA, JACUZZI, SAUNA, MASAJES, TURCO, JUEGOS, PLAYA, BAR, DISCOTECA)
VALUES
('Calle 1B', 'Cali', 0, 0, 1, 0, 0, 1, 0, 0, 1);

INSERT INTO HOTELES 
(DIRECCION, CIUDAD, PISCINA, JACUZZI, SAUNA, MASAJES, TURCO, JUEGOS, PLAYA, BAR, DISCOTECA)
VALUES
('Carrera 2A', 'Medellin', 1, 0, 1, 1, 0, 1, 1, 0, 1);

INSERT INTO HOTELES 
(DIRECCION, CIUDAD, PISCINA, JACUZZI, SAUNA, MASAJES, TURCO, JUEGOS, PLAYA, BAR, DISCOTECA)
VALUES
('Caller 7A', 'Bogota', 1, 1, 1, 1, 1, 1, 1, 1, 1);

COMMIT;

-- 2.4 Creamos la Tabla de clientes

CREATE TABLE CLIENTES(
  ID         INT             NOT NULL,
  NOMBRES    VARCHAR2(50)    NOT NULL,
  CEDULA     VARCHAR2(50)    NOT NULL,
  CONSTRAINT PK_CLIENTE PRIMARY KEY(ID),
  CONSTRAINT UQ_CEDULA UNIQUE(CEDULA)
);

-- 2.5 Creamos la secuencia para la PK de Tabla Clientes

CREATE SEQUENCE SQ_CLIENTES_AUTOINCREMENT INCREMENT BY 1 START WITH 1 MAXVALUE 10000 MINVALUE 1;

CREATE OR REPLACE TRIGGER TR_GCLIENTES_AUTOINCREMENT
BEFORE INSERT ON CLIENTES 
FOR EACH ROW
BEGIN
  SELECT SQ_CLIENTES_AUTOINCREMENT.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/

-- 2.6 ingresar datos a la Tabla CLIENTES

INSERT INTO CLIENTES
(NOMBRES, CEDULA)
VALUES
('CAMILO MARTINEZ', '1061765345');

INSERT INTO CLIENTES
(NOMBRES, CEDULA)
VALUES
('NATALIA NARVAEZ', '6543546587');

INSERT INTO CLIENTES
(NOMBRES, CEDULA)
VALUES
('JHON LEYTON', '4352657654');

INSERT INTO CLIENTES
(NOMBRES, CEDULA)
VALUES
('SANDRA BELTRAN', '1067233654');

INSERT INTO CLIENTES
(NOMBRES, CEDULA)
VALUES
('ESTEBAN VALENCIA', '8907234567');

COMMIT;

/* 2.7 Creamos la Tabla de temporadas para los hoteles */
CREATE TABLE TEMPORADAS(
  ID              INT             NOT NULL,
  HOTEL           INT             NOT NULL,
  TEMPORADA       VARCHAR2(50)    NOT NULL,
  FECHA_INICIO    DATE            NOT NULL,
  FECHA_FINAL     DATE            NOT NULL,
  CONSTRAINT PK_TEMPORADA PRIMARY KEY(ID),
  CONSTRAINT FK_TEMPORADA_HOTEL FOREIGN KEY (HOTEL) REFERENCES HOTELES,
  CONSTRAINT CH_TEMPORADA_VALOR CHECK(TEMPORADA in ('ALTA','MEDIA','BAJA'))
);

/* 2.8 Creamos la secuencia para la PK de Tabla Clientes */
CREATE SEQUENCE SQ_TEMPORADAS_AUTOINCREMENT INCREMENT BY 1 START WITH 1 MAXVALUE 10000 MINVALUE 1;

CREATE OR REPLACE TRIGGER TRG_TEMPORADAS_AUTOINCREMENT
BEFORE INSERT ON TEMPORADAS 
FOR EACH ROW
BEGIN
  SELECT SQ_TEMPORADAS_AUTOINCREMENT.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/

-- 2.9 ingresar datos a la Tabla TEMPORADAS

INSERT INTO TEMPORADAS
(HOTEL, TEMPORADA, FECHA_INICIO, FECHA_FINAL)
VALUES
(1, 'ALTA', TO_DATE('10/10/2021', 'MM/DD/YYYY'), TO_DATE('11/27/2021', 'MM/DD/YYYY'));

INSERT INTO TEMPORADAS
(HOTEL, TEMPORADA, FECHA_INICIO, FECHA_FINAL)
VALUES
(2, 'BAJA', TO_DATE('10/10/2021', 'MM/DD/YYYY'), TO_DATE('12/12/2021', 'MM/DD/YYYY'));

INSERT INTO TEMPORADAS
(HOTEL, TEMPORADA, FECHA_INICIO, FECHA_FINAL)
VALUES
(3, 'MEDIA', TO_DATE('10/10/2021', 'MM/DD/YYYY'), TO_DATE('12/22/2021', 'MM/DD/YYYY'));

INSERT INTO TEMPORADAS
(HOTEL, TEMPORADA, FECHA_INICIO, FECHA_FINAL)
VALUES
(4, 'ALTA', TO_DATE('10/10/2021', 'MM/DD/YYYY'), TO_DATE('12/27/2021', 'MM/DD/YYYY'));

COMMIT;

-- 2.10 Creamos la Tabla de reservas

CREATE TABLE RESERVAS(
  ID         INT             NOT NULL,
  CLIENTE    INT             NOT NULL,
  HOTEL      INT             NOT NULL,
  FECHA      DATE            NOT NULL,
  VALOR      FLOAT(3)        NOT NULL,
  TEMPORADA  INT             NOT NULL,
  CONSTRAINT PK_RESERVA PRIMARY KEY(ID),
  CONSTRAINT FK_RESERVA_CLIENTE FOREIGN KEY (CLIENTE) REFERENCES CLIENTES,
  CONSTRAINT FK_RESERVA_HOTEL FOREIGN KEY (HOTEL) REFERENCES HOTELES,
  CONSTRAINT FK_RESERVA_TEMPORADA FOREIGN KEY (TEMPORADA) REFERENCES TEMPORADAS,
  CONSTRAINT CH_VALOR CHECK(VALOR>0)
);

-- 2.11 Creamos la secuencia para la PK de Tabla Reservas

CREATE SEQUENCE SQ_RESERVAS_AUTOINCREMENT INCREMENT BY 1 START WITH 1 MAXVALUE 10000 MINVALUE 1;

CREATE OR REPLACE TRIGGER TRG_RESERVAS_AUTOINCREMENT
BEFORE INSERT ON RESERVAS 
FOR EACH ROW
BEGIN
  SELECT SQ_RESERVAS_AUTOINCREMENT.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/

-- 2.9 ingresar datos a la Tabla TEMPORADAS

INSERT INTO RESERVAS
(CLIENTE, HOTEL, FECHA, VALOR, TEMPORADA)
VALUES
(1, 1, TO_DATE('10/10/2021', 'MM/DD/YYYY'), 100000, 1);

INSERT INTO RESERVAS
(CLIENTE, HOTEL, FECHA, VALOR, TEMPORADA)
VALUES
(2, 2, TO_DATE('10/10/2021', 'MM/DD/YYYY'), 100000, 2);

INSERT INTO RESERVAS
(CLIENTE, HOTEL, FECHA, VALOR, TEMPORADA)
VALUES
(3, 3, TO_DATE('10/10/2021', 'MM/DD/YYYY'), 100000, 3);

INSERT INTO RESERVAS
(CLIENTE, HOTEL, FECHA, VALOR, TEMPORADA)
VALUES
(4, 4, TO_DATE('10/10/2021', 'MM/DD/YYYY'), 100000, 4);

INSERT INTO RESERVAS
(CLIENTE, HOTEL, FECHA, VALOR, TEMPORADA)
VALUES
(5, 4, TO_DATE('10/10/2021', 'MM/DD/YYYY'), 100000, 4);

COMMIT;

-- 3.1 Crear vista para consultar las reservas por hotel

CREATE OR REPLACE VIEW GET_RESERVAS_BY_HOTEL(ID_HOTEL)
AS
SELECT R.CLIENTE, R.FECHA, R.TEMPORADA FROM RESERVAS R WHERE R.HOTEL=ID_HOTEL; 