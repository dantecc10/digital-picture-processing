#!/bin/bash

# Script mejorado para compilar y ejecutar proyectos de Lazarus/Free Pascal
# Asume que el archivo .lpr tiene el mismo nombre que el directorio del proyecto.

# 1. Verificar si se proporcionó un nombre de proyecto
if [ -z "$1" ]; then
    echo "Uso: $0 <nombre_del_proyecto_sin_ruta>"
    echo "Ejemplo: $0 1-PDI-primero"
    exit 1
fi

PROYECTO="$1"
# NOTA: Cambia la ruta base si no es correcta en tu entorno.
RUTA_BASE="/media/darkseid/DATA/Repos/digital-picture-processing/lazarus-coding/teams-samples"
DIRECTORIO_PROYECTO="${RUTA_BASE}/${PROYECTO}"

# 2. Verificar si el directorio del proyecto existe
if [ ! -d "$DIRECTORIO_PROYECTO" ]; then
    echo "El directorio del proyecto '$DIRECTORIO_PROYECTO' no existe."
    exit 1
fi

# 3. Navegar al directorio del proyecto
echo "Navegando a $DIRECTORIO_PROYECTO..."
cd "$DIRECTORIO_PROYECTO" || exit 1

# 4. Determinar el nombre del archivo .lpr
# En tus ejemplos, el nombre del .lpr coincide con el nombre del directorio (Ej. 1-PDI-primero/primero.lpr).
# Sin embargo, en otros como 10-guardar, el .lpr es 'project1.lpr'.
# Usaremos 'project1.lpr' si existe, si no, intentamos con el nombre del directorio.

if [ -f "project1.lpr" ]; then
    ARCHIVO_PRINCIPAL="project1.lpr"
elif [ -f "$(basename "$PROYECTO" | cut -d'-' -f2).lpr" ]; then
    # Intenta con el nombre después del guion (ej. '1-PDI-primero' -> 'primero.lpr')
    ARCHIVO_PRINCIPAL="$(basename "$PROYECTO" | cut -d'-' -f2).lpr"
else
    echo "Error: No se encontró un archivo .lpr principal (como 'project1.lpr' o 'primero.lpr') en '$DIRECTORIO_PROYECTO'."
    exit 1
fi

# 5. Compilar el proyecto de Free Pascal usando el archivo .lpr
echo "Compilando $ARCHIVO_PRINCIPAL con fpc..."
# El compilador de Free Pascal (fpc) necesita el archivo del programa (.lpr) para compilar.
# La opción '-FE.' asegura que el ejecutable se cree en el directorio actual.
fpc -FE. "$ARCHIVO_PRINCIPAL"

if [ $? -ne 0 ]; then
    echo "ERROR: Falló la compilación del proyecto '$PROYECTO'."
    exit 1
fi

# 6. Determinar el nombre del ejecutable y ejecutar
# Free Pascal nombra al ejecutable igual que el archivo principal, pero sin extensión.
NOMBRE_EJECUTABLE=$(basename "$ARCHIVO_PRINCIPAL" .lpr)

echo "Compilación exitosa. Ejecutando ./$NOMBRE_EJECUTABLE..."

# Ejecutar el programa. Es posible que para aplicaciones GUI necesites X11 o un entorno gráfico.
./"$NOMBRE_EJECUTABLE" &

echo "Programa '$NOMBRE_EJECUTABLE' iniciado en segundo plano (PID: $!)"