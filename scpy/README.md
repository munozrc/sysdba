# SCPY CLI para Windows

Comando para convertir de `.py` a `.exe`:

```
pyinstaller --onefile -w main.py --name "scpy" -c --exclude-module _bootlocale 
```

Dependencias:
- python 3.x.x
- pyintaller