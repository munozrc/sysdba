# SCPY CLI para Windows

## Como instalar

Primero debemos descargar el ejecutable `scpy.exe` desde aqui. Despues crear el directorio `C:\SCPY` y mover el ejecutable al directorio creado.

Finalmente ejecutar en ***Commnad Prompt (CMD)*** con permisos de Administrador el siguiente comando:

```
setx /M path "%path%;C:\SCPY"
```

## Como usar

Para usar necesitamos ***Commnad Prompt (CMD)*** con permisos de Administrador.

### Comandos disponibles

```
scpy config
```

```
scpy start
```

```
scpy stop
```

## Preparar modo Development

Comando para convertir de `.py` a `.exe`:

```
pyinstaller --onefile -w main.py --name "scpy" -c --exclude-module _bootlocale 
```

Dependencias:
- python 3.x.x
- pyintaller