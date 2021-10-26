# SYSDBA

📚 Repo recopilatorio de recursos y información para la gestión de bases de datos con Oracle.

## **Tabla de contenido** ##
1. [Servicios en Windows](#servicios-en-windows)
2. [SQLPlus](#sqlplus)
3. [Gestión de usuarios](#gestion-de-usuarios)
4. [Tablas](#tablas)
5. [Sinonimos](#sinonimos)
6. [Vistas](#vistas)
7. [Triggers](#triggers)
8. [LSNRCTL](#lsnrctl)
9. [Herramienta SCPY](scpy)
10. [Proyecto](proyecto)

## Servicios en Windows ##

Para abrir el gestor de ***servicios en Windows*** debemos ejercutar `services.msc`, mediante la herramienta de ***Ejecutar*** o por medio de ***Command Prompt de windows***, para así acceder a los servicios que son vitales para el funcionamiento de una DB con Oracle, los servicios son: `OracleServiceXE` y `OracleXETNSListener`.

## SQLPlus

Herramienta de linea de comandos para la gestión del motor de base de datos de Oracle. Este es el listado de comandos:

Para iniciar la herramienta desde un ***Command Prompt*** se utiliza el comando:

```bash
sqlplus / as sysdba
```

Listar el usuario usaremos el comando:

```bash
show user
```

Para salir de la herramienta usaremos la combinacion de teclas `ctrl` + `c`, o el comando:

```bash
exit
```

Comando para ***apagar*** la base de datos:

```bash
shutdown
```

```bash
shutdown immediate
```

Comando para ***iniciar*** la base de datos:

```bash
startup
```

```bash
startup nomount
```

```bash
alter database mount
```

```bash
alter database open
```

Consultar todos los `tablespace` desde SQL*Plus:

```bash
SELECT * FROM dba_tablespaces
SELECT TABLESPACE_NAME FROM dba_tablespaces
```

[⬆](#tabla-de-contenido)

## Gestion de usuarios

> Es recomendable aplicar los permisos a los roles, para despues asignar los roles a los usuario y no asignar permisos directamente a los usuarios.

Crear un usuario:

```sql
CREATE USER NOMBRE_USUARIO IDENTIFIED BY PASSWORD_USER
```

Eliminar un usuario:

```sql
DROP USER NOMBRE_USUARIO
```

Bloquear un usuario:

```sql
ALTER USER NOMBRE_USUARIO ACCOUNT LOCK
```

Desbloquear un usuario:

```sql
ALTER USER NOMBRE_USUARIO ACCOUNT UNLOCK
```

Otorgar permisos para establecer una conexion a la base de datos:

```sql
GRANT CREATE SESSION TO NOMBRE_USUARIO
```

Asignar `tablespace` a un usuario:

```sql
ALTER USER NOMBRE_USUARIO DEFAULT TABLESPACE NOMBRE_TABLESPACE
```

Determinar el espacio sobre un `tablespace`:

```sql
ALTER USER NOMBRE_USUARIO QUOTA UNLIMITED ON NOMBRE_TABLESPACE
```

Otorgar permisos para crear procedimientos:

```sql
GRANT CREATE PROCEDURE TO NOMBRE_USUARIO
```

Crear un rol:

```sql
CREATE ROLE NOMBRE_ROL
```

Asignar un rol a un usuario:

```sql
GRANT NOMBRE_ROL to NOMBRE_USUARIO
```

Revocar un rol a un usuario:

```sql
REVOKE NOMBRE_ROL to NOMBRE_USUARIO
```

[⬆](#tabla-de-contenido)

## Tablas

Otorgar permisos para crear tablas:

```sql
GRANT CREATE TABLE TO NOMBRE_USUARIO
```

Otorgar permisos para seleccionar datos de una tabla:

```sql
GRANT SELECT ON NOMBRE_TABLA TO NOMBRE_USUARIO
```

Seleccionar datos de una tabla de nuestro **schema**:

```sql
SELECT * FROM NOMBRE_TABLA
```

Seleccionar datos de una tabla con otro **schema** al cual tenemos permisos:

```sql
SELECT * FROM SCHEMA.NOMBRE_TABLA
```

Insertar datos en una tabla de nuestro **schema**:

```sql
INSERT INTO NOMBRE_TABLA(PARAMETRO1, PARAMETRO2) VALUES(VALOR1, VALOR2)
```

> Es importante siempre confirmar la transacion despues de efectuarla, ya que Oracle no permite **lectura sucias**. Esto se realizar con el comando:

```sql
COMMIT
```

Crear tabla apartir de otra:

```sql
create table NOMBRE_TABLA as select * from NOMBRE_TABLA where 1=0
CREATE TABLE NOMBRE_TABLA AS SELECT * from NOMBRE_TABLA WHERE 1=0
```

[⬆](#tabla-de-contenido)

## Sinonimos

Crear un **sinonimo publico**:

```sql
CREATE PUBLIC SYNONYM NOMBRE_SINONIMO FOR NOMBRE_TABLA
```

[⬆](#tabla-de-contenido)

## Vistas

Las vistas generalmente son usadas para agregar una capa de abstracción sobre las diferentes operaciones que pueden realizarse a las tablas. Al igual se usa para en globar una operacion que se usa frecuentemente pero es muy extensa o compleja de leer.

Crear vista actualizable:

```sql
CREATE OR REPLACE VIEW NOMBRE_VISTA(PARAMETRO1, PARAMETRO2)
AS
SELECT PARAMETRO1, PARAMETRO2 FROM NOMBRE_TABLA
```

Usar una vista actualizable:

```sql
SELECT * FROM NOMBRE_VISTA
```

```sql
INSERT INTO NOMBRE_VISTA(PARAMETRO1, PARAMETRO2) VALUES(VALOR1, VALOR2)
```

```sql
UPDATE NOMBRE_VISTA SET PARAMETRO2=5 WHERE PARAMETRO1=1
```

Ejemplo: Un usuario desea consultar todos los posts que el creo, los cuales estan almacenados en la tabla con nombre POSTS

```sql
CREATE OR REPLACE VIEW VPOSTS(TITULO, CONTENIDO, FECHA)
AS
SELECT P.TITULO, P.CONTENIDO, P.FECHA FROM POSTS P JOIN USUARIOS U ON P.AUTOR=U.ID
```

Eliminar una vista:

```sql
DROP VIEW NOMBRE_VISTA
```

[⬆](#tabla-de-contenido)

## Triggers

Crear trigger:

```sql
CREATE OR REPLACE TRIGGER NOMBRE_TRIGGER
AFTER OPERACION ON NOMBRE_TABLA
FOR EACH ROW
BEGIN
    NULL;
END
```

En la operacion de `insert` se puede acceder unicamente a los valores ***nuevos***, por el contrario en la operacion `delete` unicamente se puede acceder a los valores ***antiguos***, en el caso de la oparación `update` se puede acceder a ambos valores ***nuevos*** y ***antiguos***

Acceder a los valores mediante palabras reservadas en Oracle:

```sql
:OlD.NOMBRE_PARAMETRO --> valor antiguo
```

```sql
:NEW.NOMBRE_PARAMETRO --> valor nuevo
```

Eliminar un trigger:

```sql
DROP TRIGGER NOMBRE_TRIGGER
```

[⬆](#tabla-de-contenido)

## LSNRCTL

Herramienta de linea de comandos para la gestion las conexiones remotas

Para iniciar la herramienta desde un ***Command Prompt*** se utiliza el comando:

```bash
lsnrctl
```

Listar el ***estado*** del LISTERNER ejecutamos el comando:

```bash
status
```

Detener el ***servicio*** del LISTERNER tenemos que ejecutar el comando:

```bash
stop
```

Iniciar el ***servicio*** del LISTERNER tenemos que ejecutar el comando:

```bash
start
```

[⬆](#tabla-de-contenido)

Más informacion sobre syntaxis en *[Markdown Guide](https://www.markdownguide.org/basic-syntax/)*.
