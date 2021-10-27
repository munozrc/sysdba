/*
    Archivo para el usuario DBA o SYSTEM.

    Nombre estudiantes:
    - 
    - 

    Tabla de contenido del Archivo: 
    - Crear usuario Owner: 1.2-1.6
    - Crear usuario Audit: 1.7-1.11
*/

-- 1.1 consultamos los tablespace disponibles en la DB mediante el comando
SELECT TABLESPACE_NAME FROM dba_tablespaces;

-- 1.2 creamos el usuario OWNER
CREATE USER OWNER IDENTIFIED BY 123456;

-- 1.3 asignamos los permisos para crear una sesion
GRANT CREATE SESSION TO OWNER;

-- 1.4 asignamos el usuario a tablespace USERS
ALTER USER OWNER DEFAULT TABLESPACE USERS;

-- 1.5 determinamos el espacio sobre el tablespace USERS
ALTER USER OWNER QUOTA UNLIMITED ON USERS;

-- 1.6 asignamos el permiso para crear tablas, secuencias, vistas y triggers
GRANT CREATE TABLE TO OWNER;
GRANT CREATE SEQUENCE TO OWNER;
GRANT CREATE TRIGGER TO OWNER;
GRANT CREATE VIEW TO OWNER;

-- 1.7 creamos el usuario para las auditorias
CREATE USER AUDITORIAS IDENTIFIED BY 123456;

-- 1.8 asignamos los permisos para crear una sesion
GRANT CREATE SESSION TO AUDITORIAS;

-- 1.9 asignamos el usuario a tablespace USERS
ALTER USER AUDITORIAS DEFAULT TABLESPACE USERS;

-- 1.10 determinamos el espacio sobre el tablespace USERS
ALTER USER AUDITORIAS QUOTA UNLIMITED ON USERS;

-- 1.6 asignamos el permiso para crear tablas, secuencias, vistas  y triggers
GRANT CREATE TABLE TO AUDITORIAS;
GRANT CREATE SEQUENCE TO AUDITORIAS;
GRANT CREATE TRIGGER TO AUDITORIAS;
GRANT CREATE VIEW TO AUDITORIAS;
GRANT CREATE ANY TRIGGER TO AUDITORIAS;