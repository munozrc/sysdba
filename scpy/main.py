from sys import stderr
import argparse
import subprocess

def startServices():
    serviceOracle = subprocess.run('net start OracleServiceXE', shell=True)
    serviceListener = subprocess.run('net start OracleXETNSListener', shell=True)
    if serviceOracle.returncode == 0 and serviceListener.returncode == 0:
        print('Servicios iniciados correctamente.')
    else:
        print('Error: Al iniciar los servicios.')

def stoptServices():
    serviceOracle = subprocess.run('net stop OracleServiceXE', shell=True)
    serviceListener = subprocess.run('net stop OracleXETNSListener', shell=True)
    if serviceOracle.returncode == 0 and serviceListener.returncode == 0:
        print('Servicios detenidos correctamente.')
    else:
        print('Error: Al detener los servicios.')

def configDemandStart():
    serviceOracle = subprocess.run('sc config OracleServiceXE start=demand', shell=True)
    serviceListener = subprocess.run('sc config OracleXETNSListener start=demand', shell=True)
    if serviceOracle.returncode == 0 and serviceListener.returncode == 0:
        print('Servicios configurados en inicio Manual')
    else:
        print('Error: Al congifuracion inicio de los servicios.')

def cli() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        prog='scpy',
        description='scpy es un cli para gestionar los servicios de OracleServiceXE y OracleXETNSListener.',
    )
    parser.add_argument(
        'action',
        type=str
    )
    return parser.parse_args()

def main():
    args = cli()
    action = args.action.lower()
    try:
        if action == 'start':
            startServices()
        elif action == 'stop':
            stoptServices()
        elif action == 'config':
            configDemandStart()
        else:
            print('Opcion no valida.')
    except Exception as e:
        print(e, file=stderr)
        exit(1)
        
if __name__ == "__main__":
    main()