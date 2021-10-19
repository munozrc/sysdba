# SYSDBA

📚 Repo recopilatorio de recursos y información para la gestión de bases de datos con Oracle.

## **Tabla de contenido** ##
1. [Servicios en Windows](#Servicios-en-Windows)
2. [SQLPlus](#SQLPlus)
3. [LSNRCTL](#LSNRCTL)

## Servicios en Windows ##

Para abrir el gestor de ***servicios en Windows*** debemos ejercutar `services.msc`, mediante la herramienta de ***Ejecutar*** o por medio de ***Command Prompt de windows***, para así acceder a los servicios que son vitales para el funcionamiento de una DB con Oracle, los servicios son: `OracleServiceXE` y `OracleXETNSListener`.

## SQLPlus

Herramienta de linea de comandos para la gestion del motor de base de datos de Oracle. Este es el listado de comandos:

Para iniciar la herramienta desde un ***Command Prompt*** se utiliza el comando:

```
sqlplus / as sysdba
```

Si deseamos listar el usuario usaremos el comando:

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

```
startup nomount
```

```
alter database mount
```

```
alter database open
```

### Gestion de usuarios

```
crear user NOMBRE_USUARIO identified by PASSWORD_USER
```

Otorgar permisos para establecer una conexion a la base de datos

```
grant create session to NOMBRE_USUARIO
```

Asignar `tablespace` a un usuario

```
alter user NOMBRE_USUARIO default tablespace users
```

Determinar el espacio sobre un `tablepace`

```
alter user NOMBRE_USUARIO quota unlimited on users
```

Otorgar permisos para crear procedimientos

```
grant create procedure to NOMBRE_USUARIO
```

### Gestion de tablas

Otorgar permisos para crear tablas

```
grant create table to NOMBRE_USUARIO
```

Otorgar permisos para seleccionar datos de una tabla

```
grant select on NONBRE_TABLA to NOMBRE_USUARIO
```

Si deseamos seleccionar datos de una tabla de nuestro **schema**

```
select * from NOMBRE_TABLA
```

Si deseamos seleccionar datos de una tabla con otro **schema** al cual tenemos permisos

```
select * from SCHEMA.NOMBRE_TABLA
```

Insertar datos en una tabla de nuestro **schema**

```
insert into NOMBRE_TABLA(PARAMETRO1, PARAMETRO2) values(VALOR1, VALOR2)
```

> Es importante siempre confirmar la transacion despues de efectuarla, ya que Oracle no permite **lectura sucias**. Esto se realizar con el comando:

```
commit
```

### Gestion de Sinonimos

Para clear un **sinonimo publico**

```
create public synonym NOMBRE_SINONIMO for NOMBRE_TABLA
```

## LSNRCTL

Herramienta de linea de comandos para la gestion las conexiones remotas

Para iniciar la herramienta desde un ***Command Prompt*** se utiliza el comando:

```
lsnrctl
```

Si deseamos listar el ***estado*** del LISTERNER ejecutamos el comando:

```
status
```

Para detener el ***servicio*** del LISTERNER tenemos que ejecutar el comando:

```
stop
```

Para iniciar el ***servicio*** del LISTERNER tenemos que ejecutar el comando:

```
start
```

Más informacion sobre syntaxis en *[Markdown Guide](https://www.markdownguide.org/basic-syntax/)*.
