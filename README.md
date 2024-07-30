# BD_panela2
BD sobre maquinas en la elaboración de panela

<hr>
    <img src="https://www.civitatis.com/f/colombia/pereira/tour-panela-589x392.jpg">
<hr>

## Descripción

Este repositorio contiene una base de datos de los diferentes equipos usados en el una pequeña empresa que procesa caña de azucar para elaborar panela.

## Contenido

- **Maquinas**: contiene las maquina usada en la elaboracion de panela.
| key    | Maquinas      | Tipo de dato  | Descripcion               |
| ------ | ------------- | ------------- | ------------------------- |
| PK     | id_maquinas   | int           | Identificador de Maquinas |
|        | Nombre        | Varchar       | Nombre de la maquina      |
|  PU    | Codigo        | Varchar       | Codigo interno            |
|        | Capacidad     | Varchar       | Especificacion del tamaño |


- **Equipos secundarios**: contiene los equipo que componen las maquinas.
- **partes de equipos**: contiene las parte que componen dichos equipos.
- **ubicacion**: muestra las area donde estan ubicadas las maquinas en la empresa.


