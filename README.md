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
