/*
  Archivo para el usuario dueño de los objetos.

  Grupo de trabajo:
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
INSERT INTO HOTELES (DIRECCION, CIUDAD) VALUES('Carrera 1A', 'Popayán');
INSERT INTO HOTELES (DIRECCION, CIUDAD) VALUES('Calle 1B', 'Cali');
INSERT INTO HOTELES (DIRECCION, CIUDAD) VALUES('Carrera 2A', 'Medellin');
INSERT INTO HOTELES (DIRECCION, CIUDAD) VALUES('Caller 7A', 'Bogota');

COMMIT;

-- Creamos la Tabla de servicios
CREATE TABLE SERVICIOS(
  ID         NUMBER          NOT NULL,
  NOMBRE     VARCHAR2(50)    NOT NULL,
);

-- Creamos la Tabla de servicios de los hoteles
CREATE TABLE SERVICIOS_HOTEL(
  ID         NUMBER          NOT NULL,
  SERVICIO   NUMBER          NOT NULL,
  HOTEL      NUMBER          NOT NULL,
  CONSTRAINT PK_SERVICIOS_HOTEL PRIMARY KEY(ID),
  CONSTRAINT FK_SERVICIO_SH FOREIGN KEY (SERVICIO) REFERENCES SERVICIOS,
  CONSTRAINT FK_HOTEL_SH FOREIGN KEY (HOTEL) REFERENCES HOTELES,
)

-- Creamos la Tabla de habitaciones
CREATE TABLE HABITACIONES(
  ID         NUMBER          NOT NULL,
  NOMBRE     VARCHAR2(50)    NOT NULL,
  HOTEL      NUMBER          NOT NULL,
  CONSTRAINT PK_HABITACIONES PRIMARY KEY(ID),
  CONSTRAINT FK_HOTEL_HABITACIONES FOREIGN KEY (HOTEL) REFERENCES HOTELES,
);

-- Creamos la Tabla de amenidades
CREATE TABLE AMENIDADES(
  ID         NUMBER          NOT NULL,
  NOMBRE     VARCHAR2(50)    NOT NULL,
  CONSTRAINT PK_AMENIDADES   PRIMARY KEY(ID),
);

INSERT INTO AMENIDADES(NOMBRE) VALUES('Wi-Fi');
INSERT INTO AMENIDADES(NOMBRE) VALUES('TV');
INSERT INTO AMENIDADES(NOMBRE) VALUES('Aire Acondicionado');
INSERT INTO AMENIDADES(NOMBRE) VALUES('Nevera');
INSERT INTO AMENIDADES(NOMBRE) VALUES('Tina');
INSERT INTO AMENIDADES(NOMBRE) VALUES('Jacuzzi');

COMMIT;

-- Creamos la Tabla de amenidades de las habitaciones
CREATE TABLE AMENIDADES_HABITACION(
  ID         NUMBER          NOT NULL,
  AMENIDAD   NUMBER          NOT NULL,
  HABITACION NUMBER          NOT NULL,
  CONSTRAINT PK_AMENIDADES_HABITACIONL PRIMARY KEY(ID),
  CONSTRAINT FK_AMENIDAD_AH FOREIGN KEY (AMENIDAD) REFERENCES AMENIDADES,
  CONSTRAINT FK_HABITACION_AH FOREIGN KEY (HABITACION) REFERENCES HABITACIONES,
)

-- Insertamos amenidades para la habitacion 1 del hotel 1
INSERT INTO AMENIDADES_HABITACION(AMENIDAD, HABITACION) VALUES(1, 1)
INSERT INTO AMENIDADES_HABITACION(AMENIDAD, HABITACION) VALUES(3, 1)
INSERT INTO AMENIDADES_HABITACION(AMENIDAD, HABITACION) VALUES(4, 1)

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
INSERT INTO CLIENTES (NOMBRES, CEDULA) VALUES('CAMILO MARTINEZ', '1061765345');
INSERT INTO CLIENTES (NOMBRES, CEDULA) VALUES('NATALIA NARVAEZ', '6543546587');
INSERT INTO CLIENTES (NOMBRES, CEDULA) VALUES('JHON LEYTON', '4352657654');
INSERT INTO CLIENTES (NOMBRES, CEDULA) VALUES('SANDRA BELTRAN', '1067233654');
INSERT INTO CLIENTES (NOMBRES, CEDULA) VALUES('ESTEBAN VALENCIA', '8907234567');

COMMIT;

-- 2.7 Creamos la Tabla de temporadas para los hoteles
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

-- 2.8 Creamos la secuencia para la PK de Tabla Clientes
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
CREATE OR REPLACE VIEW GET_RESERVAS_POR_HOTEL
AS
SELECT C.NOMBRES AS CLIENTE, C.CEDULA AS CEDULA_CLIENTE, R.FECHA, T.TEMPORADA,H.DIRECCION AS DIRECCION_HOTEL, H.CIUDAD 
FROM RESERVAS R 
JOIN CLIENTES C ON R.CLIENTE=C.ID 
JOIN HOTELES H ON R.HOTEL=H.ID 
JOIN TEMPORADAS T ON R.TEMPORADA=T.ID;

-- 3.2 Crear vista para consultar las TEMPORADAS por hotel
CREATE OR REPLACE VIEW GET_TEMPORADAS_POR_HOTEL
AS
SELECT H.ID AS ID_HOTEL, H.DIRECCION AS DIRECCION_HOTEL, H.CIUDAD, T.TEMPORADA, T.FECHA_INICIO, T.FECHA_FINAL FROM HOTELES H JOIN TEMPORADAS T ON T.HOTEL=H.ID;

-- 3.3 Asignamos permisos al usuario de Auditorias
GRANT SELECT ON HOTELES TO AUDITORIAS;
GRANT SELECT ON CLIENTES TO AUDITORIAS;
GRANT SELECT ON TEMPORADAS TO AUDITORIAS;
GRANT SELECT ON RESERVAS TO AUDITORIAS;

-- 4.2 Creamos vistas para cada tabla de Owner
CREATE OR REPLACE VIEW VHOTELES
(ID,DIRECCION,CIUDAD,PISCINA,JACUZZI,SAUNA,MASAJES,TURCO,JUEGOS,PLAYA,BAR,DISCOTECA)
AS
SELECT H.ID,H.DIRECCION,H.CIUDAD,H.PISCINA,H.JACUZZI,H.SAUNA,H.MASAJES,H.TURCO,H.JUEGOS,H.PLAYA,H.BAR,H.DISCOTECA FROM HOTELES H;

CREATE OR REPLACE VIEW VCLIENTES
(ID, NOMBRES, CEDULA)
AS
SELECT C.ID, C.NOMBRES, C.CEDULA FROM CLIENTES C;

CREATE OR REPLACE VIEW VTEMPORADAS
(ID, HOTEL, TEMPORADA, FECHA_INICIO, FECHA_FINAL)
AS
SELECT T.ID, T.HOTEL, T.TEMPORADA, T.FECHA_INICIO, T.FECHA_FINAL FROM TEMPORADAS T;

CREATE OR REPLACE VIEW VRESERVAS
(ID, CLIENTE, HOTEL, FECHA, VALOR, TEMPORADA)
AS
SELECT R.ID, R.CLIENTE, R.HOTEL, R.FECHA, R.VALOR, R.TEMPORADA FROM RESERVAS R;

-- 4.3 Asignamos permisos para acceder a las vistas del Schema Owner
GRANT SELECT ON GET_RESERVAS_POR_HOTEL TO GERENCIA;
GRANT SELECT ON GET_TEMPORADAS_POR_HOTEL TO GERENCIA;
GRANT SELECT, UPDATE, DELETE, INSERT ON VHOTELES TO GERENCIA;
GRANT SELECT, UPDATE, DELETE, INSERT ON VCLIENTES TO GERENCIA;
GRANT SELECT, UPDATE, DELETE, INSERT ON VTEMPORADAS TO GERENCIA;
GRANT SELECT, UPDATE, DELETE, INSERT ON VRESERVAS TO GERENCIA;

GRANT SELECT ON GET_RESERVAS_POR_HOTEL TO RECEPCION;
GRANT SELECT ON VHOTELES TO RECEPCION;
GRANT SELECT, INSERT ON VRESERVAS TO RECEPCION;
GRANT SELECT, INSERT, UPDATE ON VCLIENTES TO RECEPCION;

-- 5.1 Consulta para saber los hoteles ubicados en la ciudad de Popayán
SELECT H.ID AS ID_HOTEL, H.DIRECCION, H.CIUDAD FROM HOTELES H WHERE H.CIUDAD='Popayán';

-- 5.2 Consulta para listar las reservas del hotel con el ID=4
SELECT C.NOMBRES AS CLIENTE, C.CEDULA AS CEDULA_CLIENTE, R.FECHA, H.DIRECCION AS DIRECCION_HOTEL, H.CIUDAD 
FROM RESERVAS R 
JOIN CLIENTES C ON R.CLIENTE=C.ID 
JOIN HOTELES H ON R.HOTEL=H.ID
WHERE H.ID=4;

-- 5.3 Consulta para listart las reservas que tenga una temporada ALTA
SELECT C.NOMBRES AS CLIENTE, C.CEDULA AS CEDULA_CLIENTE, R.FECHA, T.TEMPORADA,H.DIRECCION AS DIRECCION_HOTEL, H.CIUDAD 
FROM RESERVAS R 
JOIN CLIENTES C ON R.CLIENTE=C.ID 
JOIN HOTELES H ON R.HOTEL=H.ID 
JOIN TEMPORADAS T ON R.TEMPORADA=T.ID
WHERE T.TEMPORADA='ALTA';

-- 5.4 Consulta para listar las reservas con fecha de '10/10/2021' en los hoteles de la ciudad de Popayán
SELECT C.NOMBRES AS CLIENTE, C.CEDULA AS CEDULA_CLIENTE, R.FECHA, T.TEMPORADA,H.DIRECCION AS DIRECCION_HOTEL, H.CIUDAD 
FROM RESERVAS R 
JOIN CLIENTES C ON R.CLIENTE=C.ID 
JOIN HOTELES H ON R.HOTEL=H.ID 
JOIN TEMPORADAS T ON R.TEMPORADA=T.ID
WHERE R.FECHA='10/10/2021' AND H.CIUDAD='Popayán';

-- 5.5 Consulta para listar los hoteles que cuenta con servicios de: SAUNA y TURCO
SELECT C.NOMBRES AS CLIENTE, C.CEDULA AS CEDULA_CLIENTE, R.FECHA, T.TEMPORADA,H.DIRECCION AS DIRECCION_HOTEL, H.CIUDAD 
FROM RESERVAS R 
JOIN CLIENTES C ON R.CLIENTE=C.ID 
JOIN HOTELES H ON R.HOTEL=H.ID 
JOIN TEMPORADAS T ON R.TEMPORADA=T.ID
WHERE H.SAUNA=1 AND H.TURCO=1;