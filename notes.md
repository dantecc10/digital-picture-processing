# Procesamiento Digital de Imágenes

Lunes: 10:00 - 11:00 (CCO4/403)
Martes: 9:00 - 11:00 (CCO4/304)
Jueves: 9:00 - 11:00 (CCO4/403)

Tolerancia de inicio de clase: 15 minutos
Tolerancia del docente: 30 minutos


## Objetivo general

El estudiante estará capacitado para usar, modificar e implementar operadores matemáticos para el desarrollo de aplicaciones y herramientas de manipulación de imágenes.


## Contenido general
- Introducción y fundamentos
- Operaciones básicas en imágenes
- Compresión
- Dominio de la frecuencia

### Bibliografía
- Digital Image Processing. R. C. González, R. E. Woods. Pearson, 2008
- Principles of digital image processing: fundamental techniques. Burger


## Evaluación
- Proyecto individual 70%
- Exámenes, tareas, actividades de investigación 30%

Notas:
> Exámenes: no se especifica día exacto, únicamente la semana correspondiente

> Cualquier actividad no ética (plagio, falsedad, etc.) será penalizada con la invalidación de la respectiva evaluación.

> Los proyectos se evaluarán en la última semana de noviembre.

### Consejos para hacer el proyecto
IDE: Lazarus -> Free Pascal


### Contacto
Cubículo 207, CCO3
e-mail: jose.olvera@correo.buap.mx
Lunes a viernes en horario de oficina (fin de semana no se responden correos).
Web: [José Arturo Olvera](hhtps://www.cs.buap.mx/~aolvera)

### Plataforma
Se usará Teams para compartir información y avisos del curso.
El profesor **no** responde mensajes en esta plataforma.

# Introducción
Una imagen es una representación

Imagen: función bidimensional f(x, y) donde x, y son coordenadas espaciales (planos) y la amplitud de f para cada par (x, y) se llama intensidad o nivel de gris.

x, y, f son discretos -> imagen digital

## Espectro electromagnético
La luz cromática (color) abarca las ondas con longitud 0.43-0.79 um  (nanómetros)

Calidad de una fuente cromática de luz:
- Radiancia: Cantidad total de energía que fluye desde la fuente de luz (medidad en Watts).
- Luminancia: Cantidad de energía que un observador percibe de la fuente de luz (medida en lúmenes)
-- Luminancia ~ 0 en emisiones no visibles
- Brillo: Descriptor subjetivo de la percepción de la luz

## Captura de una ID
Para digitalizar una imagen se requiere de un dispositivo:
- Intensidad de luz (grises)
- Reflexión (color)

En particular:
- Scanner
- Cámaras digitales
- CCD (Coupled Charge Device)

### CCD
- Registra la cantidad de luz que se refleja en la escena.
- Con un arreglo de CCD, se pueden digitalizar renglones de la escena.
- Digitalización:
-- Tono de gris: registra intensidad de luz
-- Color: captura intensidad y cantidad de luz

## Modelo simple
- Una ID, es una función f(x, y) -> proporcional a la cantidad de luz que refleja
- Cuando una imagen es generadoa por un proceso físico: 0 < f(x, y) < infinito
En particular

## Sampling and Quantization
Dependencia de las características de los sensores utilizados en la captura.

### Representación de una ID
La calidad de la imagen de pende de la capacidad y características del sensor en términos de la resolución -por ejemplo-.
Existen dos tipos de resolución: la espacial y la de intensidad.

La resolución de intensidad se cuantifica en términos de k-bits.

Si se tiene un sensor de 3 bits, se tienen L = 2^k niveles de grises (8).


## Resolución espacial
DPI: Dots Per Inch

La resolución espacial es clave porque refiere un mayor y mejor muestreo de la imagen digitalizada/capturada.

## Formatos de imagen
Existen por la necesidad de representación digital y compatibilidad entre formatos.

Básicamente se dividen en dos categorías:

### Formatos raster
Aporta información de colores, intensidad y de coordenadas.
- BMP (BitMap)
- TIFF (Tagged Image File Format)
- GIF (Graphics Interchange Format): Este formato se popularizó con el auge de la web, para reducir la calidad de la imagen (sus dimensiones y colores) y mejorar la velocidad de carga.
- PNG (Portable Network Graphics)

### Formatos vectoriales
Aporta información espacial, de coordenadas y funciones.
- SVG (Scalable Vector Graphics)
- EPS (Encapsulated PostScript)
- AI (Adobe Illustrator)

## ¿Qué es la compresión?
### Métodos de codificación
- Codificación Hoffman: JPG se basa en esta codificación, almacenando la información de la imagen de forma comprimida
- LVQ
- Métodos aritméticos
- LZV

## Firmas de los formatos de archivos

- PNG | 0x89504e47 | SQPNG
- JPEG / JFIF |	0xffd8ffe0 | SQSQSQSQ
- TIFF(little) | 0x4949a00 | II+SQ
- TIFF(big) | 0x4d4d002a | MMSQ+
- BMP | 0x424d
- GIF | 0x4749463839
- Photoshop | 0x38425053
- PS/EPS | 0x25215053

## Lazarus
Es una RAD (Rapid Application Development).

Estructura general de un programa en Lazarus
Unit:
- Uses
- Tipo
- Declaraciones privadas
- Declaraciones públicas
- Implementación

Estructura general
- Zona específica de declaración de variables
- Cada instrucción finaliza con ";"
- Cualquier variable debe ser declarada
- Instrucciones de decisión (if...)
- Instrucciones de control (for, while, repeat)
- Delimitadores de código:
	BEGIN
	END

Declaraciones
Variables:
```Var V1: integer;```
```Var V2: char;```
```Var C: real;```

Tipos


### Operaciones orientadas al punto
- Operaciones en el dominio espacial
- Operaciones (filtros) que se aplican de manera independiente a cada compoennte de la imagen I(i, j, k) para cada canal k
- I'(i, j, k) = f(I(i, j, k))

Ejemplos:
- Intensidad / color
- Brillo
- Contraste
- Umbralización
- Histogramas
- Aritméticas / lógicas
