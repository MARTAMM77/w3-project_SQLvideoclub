# README w3-project_SQLvideoclub
![videoclub-3-340](https://github.com/MARTAMM77/w3-project_SQLvideoclub/assets/137658149/2a1687da-0b8c-4cfa-99ca-f30fdd3e8412)


PROYECTO SQL videoclub, creamos una base de datos relacional para un videoclub para poder hacer consultas, antes haremos limpia.
PASOS DADOS:

•	Abro en Excel mis tablas de datos para ver de qué datos dispongo, separados por columnas para visualizarlos mejor.

•	Hago el diseño en una hoja de papel de mis relaciones entre columnas.

•	Creamos una base de datos en MYSQL nueva llamada ‘videoclub’.

•	Desde MYSQL importo las tablas csv.

•Limpieza de tabla en MYSQL:

1- La tabla old-hdd relaciona las tablas: actor, category y film.

Hay columnas repetidas ‘first_date’ y ‘last_name de la tabla ‘actor’ y ‘title’ y ‘release_year’ de la tabla ‘film’.

Compruebo que las columnas ‘first_date’ y ‘last_name’ de la tabla ‘old-hdd’ sean iguales que en la tabla principal: ‘actor’:

‘SELECT actor.actor_id,old_hdd.first_name,old_hdd.last_name
FROM actor
INNER JOIN old_hdd ON actor.first_name = old_hdd.first_name AND actor.last_name = old_hdd.last_name;’

2- En la tabla ‘actor’ hay duplicado ‘SUSAN DAVIS’ con dos keys diferentes.

Borro un registro:

'select first_name,last_name,count(*) from actor group by first_name,last_name having count(*)>1;
delete  from actor where actor_id=110;'

3- Creo una nueva columna actor_id (int) en la tabla ‘old_hdd’ para relacionar ambas tablas, relleno los datos de la nueva columna y elimino las columnas duplicadas:

ALTER TABLE old_hdd ADD COLUMN actor_id int;
update old_hdd 
INNER JOIN actor ON actor.first_name = old_hdd.first_name AND actor.last_name = old_hdd.last_name
set old_hdd.actor_id=actor.actor_id;

4- Creo otra columna ‘film_id’ en la tabla old_hdd (int) para relacionar ambas tablas y elimino las columnas repetidas. Las columnas que me quedan en la tabla old_hdd son foreign Key.

5- Elimino la columna ‘original_language_id’ por tener todos los valores nulos.

6- Elimino la columna ’rating’ por tener datos que no se entienden.

7- Reemplazo las columnas ‘last_update’ que están en formato ‘VACHAR’ y las dejo con formato fecha, creando columnas nuevas con el formato válido

Mi base de datos está limpia.

•	Creamos la primary key y foreing keys de cada tabla desde esquema para que me haga las relaciones/diagrama.
