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

## Servicios en Windows ##

Para abrir el gestor de ***servicios en Windows*** debemos ejercutar `services.msc`, mediante la herramienta de ***Ejecutar*** o por medio de ***Command Prompt de windows***, para así acceder a los servicios que son vitales para el funcionamiento de una DB con Oracle, los servicios son: `OracleServiceXE` y `OracleXETNSListener`.

## SQLPlus

Herramienta de linea de comandos para la gestión del motor de base de datos de Oracle. Este es el listado de comandos:

Para iniciar la herramienta desde un ***Command Prompt*** se utiliza el comando:

```
sqlplus / as sysdba
```

Listar el usuario usaremos el comando:

```
show user
```

Para salir de la herramienta usaremos la combinacion de teclas `ctrl` + `c`, o el comando:

```
exit
```

Comando para ***apagar*** la base de datos:

```
shutdown
```

```
shutdown immediate
```

Comando para ***iniciar*** la base de datos:

```
startup
```

```sql
startup nomount
```

```sql
alter database mount
```

```sql
alter database open
```

[⬆](#)

## Gestion de usuarios

> Es recomendable aplicar los permisos a los roles, para despues asignar los roles a los usuario y no asignar permisos directamente a los usuarios.

Crear un usuario:

```sql
create user NOMBRE_USUARIO identified by PASSWORD_USER
```

Eliminar un usuario:

```sql
drop user NOMBRE_USUARIO
```

Bloquear un usuario:

```sql
alter user NOMBRE_USUARIO account lock
```

Desbloquear un usuario:

```sql
alter user NOMBRE_USUARIO account unlock
```

Otorgar permisos para establecer una conexion a la base de datos:

```sql
grant create session to NOMBRE_USUARIO
```

Asignar `tablespace` a un usuario:

```sql
alter user NOMBRE_USUARIO default tablespace users
```

Determinar el espacio sobre un `tablespace`:

```sql
alter user NOMBRE_USUARIO quota unlimited on users
```

Otorgar permisos para crear procedimientos:

```sql
grant create procedure to NOMBRE_USUARIO
```

Crear un rol:

```sql
create role NOMBRE_ROL
```

Asignar un rol a un usuario:

```sql
grant NOMBRE_ROL to NOMBRE_USUARIO
```

Revocar un rol a un usuario:

```sql
revoke NOMBRE_ROL to NOMBRE_USUARIO
```

[⬆](#)

## Tablas

Otorgar permisos para crear tablas:

```sql
grant create table to NOMBRE_USUARIO
```

Otorgar permisos para seleccionar datos de una tabla:

```sql
grant select on NONBRE_TABLA to NOMBRE_USUARIO
```

Seleccionar datos de una tabla de nuestro **schema**:

```sql
select * from NOMBRE_TABLA
```

Seleccionar datos de una tabla con otro **schema** al cual tenemos permisos:

```sql
select * from SCHEMA.NOMBRE_TABLA
```

Insertar datos en una tabla de nuestro **schema**:

```sql
insert into NOMBRE_TABLA(PARAMETRO1, PARAMETRO2) values(VALOR1, VALOR2)
```

> Es importante siempre confirmar la transacion despues de efectuarla, ya que Oracle no permite **lectura sucias**. Esto se realizar con el comando:

```sql
commit
```

Crear tabla apartir de otra:

```sql
create table NOMBRE_TABLA as select * from NOMBRE_TABLA where 1=0
```

[⬆](#)

## Sinonimos

Crear un **sinonimo publico**:

```sql
create public synonym NOMBRE_SINONIMO for NOMBRE_TABLA
```

[⬆](#)

## Vistas

Las vistas generalmente son usadas para agregar una capa de abstracción sobre las diferentes operaciones que pueden realizarse a las tablas. Al igual se usa para en globar una operacion que se usa frecuentemente pero es muy extensa o compleja de leer.

Crear vista actualizable:

```sql
create or replace view NOMBRE_VISTA(PARAMETRO1, PARAMETRO2)
as
select PARAMETRO1, PARAMETRO2 from NOMBRE_TABLA
```

Usar una vista actualizable:

```sql
select * from NOMBRE_VISTA
```

```sql
insert into NOMBRE_VISTA(PARAMETRO1, PARAMETRO2) values(1,2)
```

```sql
update NOMBRE_VISTA set PARAMETRO2=5 where PARAMETRO1=1
```

Ejemplo: Un usuario desea consultar todos los posts que el creo, los cuales estan almacenados en la tabla con nombre POSTS

```sql
create or replace view VPOSTS(TITULO, CONTENIDO, FECHA)
as
select P.TITULO, P.CONTENIDO, P.FECHA from POSTS P join USUARIOS U on P.AUTOR=U.ID
```

Eliminar una vista:

```sql
drop view NOMBRE_VISTA
```

[⬆](#)

## Triggers

Crear trigger:

```sql
create or replace trigger NOMBRE_TRIGGER
after OPERACION on NOMBRE_TABLA
for each row
begin
    NULL;
end
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
drop trigger NOMBRE_TRIGGER
```

[⬆](#)

## LSNRCTL

Herramienta de linea de comandos para la gestion las conexiones remotas

Para iniciar la herramienta desde un ***Command Prompt*** se utiliza el comando:

```
lsnrctl
```

Listar el ***estado*** del LISTERNER ejecutamos el comando:

```
status
```

Detener el ***servicio*** del LISTERNER tenemos que ejecutar el comando:

```
stop
```

Iniciar el ***servicio*** del LISTERNER tenemos que ejecutar el comando:

```
start
```

[⬆](#)

Más informacion sobre syntaxis en *[Markdown Guide](https://www.markdownguide.org/basic-syntax/)*.
