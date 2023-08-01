

-- '1871'

SELECT actor.actor_id,old_hdd.first_name,old_hdd.last_name
FROM actor
INNER JOIN old_hdd ON actor.first_name = old_hdd.first_name AND actor.last_name = old_hdd.last_name;

select first_name,last_name,count(*) from actor group by first_name,last_name having count(*)>1;
SELECT * FROM old_hdd WHERE first_name = 'SUSAN' and last_name='DAVIS';

select * from actor where first_name='SUSAN' and last_name='DAVIS';
-- Borrar el registro duplicado de SUSAN DAVIS en la tabla actor

delete  from actor where actor_id=110; -- borramos uno de ellos, en este caso el que tiene id 110

select first_name,last_name,count(*) from old_hdd group by first_name,last_name;


-- con este código añado el campo actor_id a mi table Old_HDD
ALTER TABLE old_hdd ADD COLUMN actor_id int;

--  relleno la columna creada actor_id de mi tabla old_hdd con los valores de actor_id de actor
update old_hdd 
INNER JOIN actor ON actor.first_name = old_hdd.first_name AND actor.last_name = old_hdd.last_name
set old_hdd.actor_id=actor.actor_id;

-- con este código añado el campo film_id a mi table Old_HDD
ALTER TABLE old_hdd ADD COLUMN film_id int;
--  relleno la columna creada actor_id de mi tabla old_hdd con los valores de actor_id de actor
update old_hdd 
INNER JOIN film ON film.title = old_hdd.title
set old_hdd.film_id = film.film_id;
-- por tener valores nulos eliminamos la columna original lenguajes
ALTER TABLE film drop column original_language_id;
-- por tener valores sin sentido eliminamos la columna rating
ALTER TABLE film drop column rating;
-- cambiamos el formato Vachar de las columnas last_update por formato fecha, para eso me creo una nueva columna
ALTER TABLE actor ADD COLUMN last_update_hora DATE;
-- actualizo la columna nueva con los datos de mi columna antigua y en formato nuevo de fecha
UPDATE actor SET last_update_hora = STR_TO_DATE(last_update, '%d/%m/%Y %H:%i');
-- Eliminamos mi columna antigua
ALTER TABLE actor DROP COLUMN last_update;

-- hacemos lo mismo con el resto de columnas last_update en diferentes tablas:
-- cambiamos el formato Vachar de las columnas last_update por formato fecha, para eso me creo una nueva columna
ALTER TABLE category ADD COLUMN last_update_hora DATE;
-- actualizo la columna nueva con los datos de mi columna antigua y en formato nuevo de fecha
UPDATE category SET last_update_hora = STR_TO_DATE(last_update, '%d/%m/%Y %H:%i');
-- Eliminamos mi columna antigua
ALTER TABLE category DROP COLUMN last_update;

-- cambiamos el formato Vachar de las columnas last_update por formato fecha, para eso me creo una nueva columna
ALTER TABLE film ADD COLUMN last_update_hora DATE;
-- actualizo la columna nueva con los datos de mi columna antigua y en formato nuevo de fecha
UPDATE film SET last_update_hora = STR_TO_DATE(last_update, '%d/%m/%Y %H:%i');
-- Eliminamos mi columna antigua
ALTER TABLE film DROP COLUMN last_update;

-- cambiamos el formato Vachar de las columnas last_update por formato fecha, para eso me creo una nueva columna
ALTER TABLE inventory ADD COLUMN last_update_hora DATE;
-- actualizo la columna nueva con los datos de mi columna antigua y en formato nuevo de fecha
UPDATE inventory SET last_update_hora = STR_TO_DATE(last_update, '%d/%m/%Y %H:%i');
-- Eliminamos mi columna antigua
ALTER TABLE inventory DROP COLUMN last_update;

-- cambiamos el formato Vachar de las columnas last_update por formato fecha, para eso me creo una nueva columna
ALTER TABLE rental ADD COLUMN last_update_hora DATE;
-- actualizo la columna nueva con los datos de mi columna antigua y en formato nuevo de fecha
UPDATE rental SET last_update_hora = STR_TO_DATE(last_update, '%d/%m/%Y %H:%i');
-- Eliminamos mi columna antigua
ALTER TABLE rental DROP COLUMN last_update;

-- cambiamos el formato Vachar de las columnas last_update por formato fecha, para eso me creo una nueva columna
ALTER TABLE language ADD COLUMN last_update_hora DATE;
-- actualizo la columna nueva con los datos de mi columna antigua y en formato nuevo de fecha
UPDATE language SET last_update_hora = STR_TO_DATE(last_update, '%d/%m/%Y %H:%i');
-- Eliminamos mi columna antigua
ALTER TABLE language DROP COLUMN last_update;