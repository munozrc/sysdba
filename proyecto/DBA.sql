/*
    Archivo para el usuario DBA o SYSTEM.

    Nombre estudiantes:
    - 
    - 

    Tabla de contenido del Archivo: 
    - Crear usuario Owner: 1.2-1.6
    - Crear usuario Audit: 1.7-1.11
*/

/* 1.1 consultamos los tablespace disponibles en la DB mediante el comando */
SELECT TABLESPACE_NAME FROM dba_tablespaces;

/* 1.2 creamos el usuario OWNER */
CREATE USER Owner IDENTIFIED BY 123456;

/* 1.3 asignamos los permisos para crear una sesion */
GRANT CREATE SESSION TO Owner;

/* 1.4 asignamos el usuario a tablespace USERS */
ALTER USER Owner DEFAULT TABLESPACE USERS;

/* 1.5 determinamos el espacio sobre el tablespace USERS */
ALTER USER Owner QUOTA UNLIMITED ON USERS;

/* 1.6 asignamos el permiso para crear tablas */
GRANT CREATE TABLE TO Owner;

/* 1.7 creamos el usuario para las auditorias */
CREATE USER Audit IDENTIFIED BY 123456;

/* 1.8 asignamos los permisos para crear una sesion */
GRANT CREATE SESSION TO Audit;

/* 1.9 asignamos el usuario a tablespace USERS */
ALTER USER Audit DEFAULT TABLESPACE USERS;

/* 1.10 determinamos el espacio sobre el tablespace USERS */
ALTER USER Audit QUOTA UNLIMITED ON USERS;

/* 1.11 asignamos el permiso para crear tablas */
GRANT CREATE TABLE TO Audit;