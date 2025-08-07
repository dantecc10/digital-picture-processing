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

