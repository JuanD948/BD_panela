# BD_panela
BD sobre maquinas en la elaboración de panela

<hr>
    <img src="https://www.civitatis.com/f/colombia/pereira/tour-panela-589x392.jpg">
<hr>

## Descripción

Este repositorio contiene una base de datos de los diferentes equipos usados en el una pequeña empresa que procesa caña de azucar para elaborar panela.

## Contenido

- **Maquinas**: contiene las maquina usada en la elaboracion de panela
  
| key    | Maquinas      | Tipo de dato  | Descripcion               |
| ------ | ------------- | ------------- | ------------------------- |
| PK     | id_maquinas   | int           | Identificador de Maquinas |
|        | Nombre        | Varchar       | Nombre de la maquina      |
| KU     | Codigo        | Varchar       | Codigo interno            |
|        | Capacidad     | Varchar       | Especificacion del tamaño |


- **Equipos secundarios**: contiene los equipo que componen las maquinas

| key    | Equipos      | Tipo de dato  | Descripcion               |
| ------ | ------------- | ------------- | ------------------------ |
| PK     | id_equipo     | int           | Identificador de equipos |
|        | Nombre        | Varchar       | Nombre del equipo        |
|        | Marca         | Varchar       | marca del equipo         |
|        | modelo        | Varchar       | modelo del equipo        |
| KU     | codigo_equipo | Varchar       | Codigo interno           |
|        | caracteristica| Varchar       | caracteristica           |
| FK     | equipos_id_maquina | Varchar  | relacion uno a uno       |


- **partes de equipos**: contiene las parte que componen dichos equipos.

| key    | Partes        | Tipo de dato  | Descripcion              |
| ------ | ------------- | ------------- | ------------------------ |
| PK     | id_partes     | int           | Identificador de partes |
|        | Nombre        | Varchar       | Nombre de la partes        |
|        | cantidad      | Varchar       | cantidad de partes en el equipo equipo         |
|        | referencia    | Varchar       | referencia de la parte        |
| KU     | codigo_parte  | Varchar       | Codigo interno           |
| FK     | parted_id_maq | Varchar       | relacion uno a uno          |
| FK     | partes_id_equ | Varchar       | relacion uno a uno       |

- **ubicacion**: muestra las area donde estan ubicadas las maquinas en la empresa.

| key    | Ubicacion        | Tipo de dato  | Descripcion              |
| ------ | ------------- | ------------- | ------------------------ |
| PK     | id_ubicacion    | int           | Identificador de la ubicacion |
|        | Nombre        | Varchar       | Nombre de la partes        |
| KU     | codigo_ubicacion  | Varchar       | Codigo interno           |
|        | capacidad | Varchar       | capacidad del area de la ubicacion          |
