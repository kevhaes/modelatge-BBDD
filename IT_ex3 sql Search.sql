
	Lista el nombre de todos los productos que hay en la tabla producto.

SELECT nombre FROM producto

	Lista los nombres y los precios de todos los productos de la tabla producto.

SELECT nombre,PRECIO FROM producto

	Lista todas las columnas de la tabla producto.

SHOW COLUMNS FROM producto

	Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).

SELECT nombre, concat(precio, "€"), concat((precio*1.092), "$") FROM producto;

	Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.

SELECT nombre as "nombre de producto", concat(precio, "€") as "euros", concat((precio*1.092), "$") as dolares FROM producto

	Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.

SELECT upper(nombre), precio from producto

	Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.

SELECT lower(nombre), precio from producto

	Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.

SELECT nombre, upper(left(nombre,2)) from fabricante

	Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, round(precio) from producto

	Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.

SELECT nombre, round(precio,0) from producto

	Lista el código de los fabricantes que tienen productos en la tabla producto.

SELECT nombre, round(precio,0) from producto

	Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.

SELECT DISTINCT codigo_fabricante FROM producto

	Lista los nombres de los fabricantes ordenados de forma ascendente.

SELECT nombre FROM fabricante order BY nombre

	Lista los nombres de los fabricantes ordenados de forma descendente.

SELECT nombre FROM fabricante order BY nombre desc

	Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.

SELECT nombre, precio FROM producto order BY nombre asc, precio desc

	Devuelve una lista con las 5 primeras filas de la tabla fabricante.

SELECT nombre from fabricante LIMIT 5

	Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT nombre from fabricante LIMIT 2 offset 3

	Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT precio, nombre from producto order by precio LIMIT 1

	Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT precio, nombre from producto order by precio desc LIMIT 1

	Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.

SELECT nombre FROM producto WHERE codigo_fabricante = 2;

	Lista el nombre de los productos que tienen un precio menor o igual a 120€.

SELECT nombre FROM producto WHERE precio <=120

	Lista el nombre de los productos que tienen un precio mayor o igual a 400€.

SELECT nombre FROM producto WHERE precio >=400

	Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.

SELECT nombre FROM producto WHERE precio <400

	Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.

SELECT nombre FROM producto WHERE precio >80 and precio <300

	Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.

SELECT nombre FROM producto WHERE precio between 60 and 200

	Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.

SELECT nombre from producto where precio>200 and codigo_fabricante=6

	Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.

SELECT nombre, codigo_fabricante from producto where codigo_fabricante= 1 OR codigo_fabricante= 3 OR codigo_fabricante= 5

	Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.

SELECT nombre, codigo_fabricante from producto where codigo_fabricante in(1,3,5) 

	Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.

SELECT nombre, (precio*100) as centimos from producto

	Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.

SELECT nombre from fabricante where nombre like "s%"

	Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.

SELECT nombre from fabricante where nombre like "%e"

	Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.

SELECT nombre from fabricante where nombre like "%w%"

	Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.

SELECT nombre from fabricante where length(nombre)=4 

	Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.

SELECT nombre from producto where nombre like "%Portatil%"

	Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.

SELECT nombre from producto where nombre like "%Monitor%" and precio <215

	Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).

SELECT nombre, precio from producto where precio >=180  order by precio desc, nombre asc

	Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
	
select producto.nombre, precio, fabricante.nombre from producto
inner join fabricante 
on producto.codigo_fabricante=fabricante.codigo

	Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.

select fabricante.nombre, producto.nombre from fabricante 
LEFT join producto 
on fabricante.codigo=producto.codigo_fabricante

	Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
	
SELECT fabricante.nombre, producto.nombre from fabricante left join producto on producto.codigo_fabricante= fabricante.codigo where producto.nombre is null

	¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.

no porque producto.codigo_fabricante no puede quedar en NULL

	Calcula el número total de productos que hay en la tabla productos.

SELECT count(nombre) from producto

	Calcula el número total de fabricantes que hay en la tabla fabricante

SELECT count(nombre) from fabricante

	Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos

select count(distinct codigo_fabricante) from producto

	Calcula la media del precio de todos los productos.

select avg(precio) from producto

	Calcula el precio más barato de todos los productos.
	
select min(precio) from producto

	Calcula el precio más caro de todos los productos.

select max(precio) from producto

	Lista el nombre y el precio del producto más barato.
	
select nombre, min(precio) from producto

	Lista el nombre y el precio del producto más caro.

select nombre, max(precio) from producto

	Calcula la suma de los precios de todos los productos.

select sum(precio) from producto

	Calcula el número de productos que tiene el fabricante Asus

SELECT count(producto.nombre) from producto
inner JOIN fabricante on producto.codigo_fabricante= fabricante.codigo
where fabricante.nombre= "asus"

	Calcula la media del precio de todos los productos del fabricante Asus.

SELECT avg(producto.precio) from producto
inner JOIN fabricante on producto.codigo_fabricante= fabricante.codigo
where fabricante.nombre= "asus"

	Calcula el precio más barato de todos los productos del fabricante Asus.

SELECT min(producto.precio) from producto
inner JOIN fabricante on producto.codigo_fabricante= fabricante.codigo
where fabricante.nombre= "asus"

	Calcula el precio más caro de todos los productos del fabricante Asus

SELECT max(producto.precio) from producto
inner JOIN fabricante on producto.codigo_fabricante= fabricante.codigo
where fabricante.nombre= "asus"

	Calcula la suma de todos los productos del fabricante Asus.

SELECT sum(producto.precio) from producto
inner JOIN fabricante on producto.codigo_fabricante= fabricante.codigo
where fabricante.nombre= "asus"

	Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.

SELECT max(producto.precio),min(producto.precio),avg(producto.precio), count(producto.precio) from producto
inner JOIN fabricante on producto.codigo_fabricante= fabricante.codigo
where fabricante.nombre= "crucial"

	Muestra el número total de productos que tiene cada uno de los fabricantes. 
	El listado también debe incluir los fabricantes que no tienen ningún producto. 
	El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. 
	Ordene el resultado descendentemente por el número de productos.

SELECT fabricante.nombre, COUNT(producto.codigo) from fabricante
left JOIN producto on fabricante.codigo = producto.codigo_fabricante
group by fabricante.codigo DESC

	Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. 
	El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.

SELECT fabricante.nombre, MAX(producto.precio),min(producto.precio),avg(producto.precio) from fabricante
inner JOIN producto on fabricante.codigo = producto.codigo_fabricante
group by fabricante.codigo

	Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
	No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.

SELECT codigo_fabricante, MAX(producto.precio),min(producto.precio),avg(producto.precio) from producto
Group by codigo_fabricante

	Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
	Es necesario mostrar el nombre del fabricante.

select codigo_fabricante, max(precio), min(precio), avg(precio), count(nombre) 
from producto
group by codigo_fabricante
having avg(precio)>200

	Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
	Es necesario mostrar el nombre del fabricante.

select fabricante.nombre, fabricante.codigo, max(precio), min(precio), avg(precio), count(*) 
from fabricante 
left join producto on fabricante.codigo=producto.codigo_fabricante 
group by fabricante.codigo
having avg(precio)>200

	Calcula el número de productos que tienen un precio mayor o igual a 180€.
	
SELECT sum(precio>=180) FROM `producto`

	Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
	
SELECT fabricante.nombre, sum(precio>=180) FROM `producto`
left join fabricante on fabricante.codigo=producto.codigo_fabricante
GROUP by codigo_fabricante

	Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante

SELECT codigo_fabricante, avg(precio) FROM `producto`
group by codigo_fabricante

	Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.

SELECT fabricante.nombre, avg(precio) FROM `producto`
left join fabricante on fabricante.codigo=producto.codigo_fabricante 
group by fabricante.nombre

	Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
	
SELECT fabricante.nombre, producto.precio FROM producto
left join fabricante on fabricante.codigo=producto.codigo_fabricante
having avg(producto.precio)>200
group by fabricante.nombre

	Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.

SELECT fabricante.nombre, count(producto.precio)
FROM fabricante
inner join producto on fabricante.codigo=producto.codigo_fabricante
GROUP by fabricante.codigo
having count(producto.precio)>=2

	Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
	No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.

SELECT fabricante.nombre,fabricante.nombre, count(producto.nombre)
FROM fabricante
left join producto on fabricante.codigo=producto.codigo_fabricante
where producto.precio>=220
GROUP by producto.codigo_fabricante

	Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €.
	El listado debe mostrar el nombre de todos los fabricantes, es decir, 
	si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.

SELECT fabricante.nombre, count(producto.nombre)
FROM fabricante
left join producto on fabricante.codigo=producto.codigo_fabricante
where producto.precio>=220 or producto.nombre is null
GROUP by fabricante.codigo

	Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
	
SELECT fabricante.nombre, sum(producto.precio)
FROM fabricante
inner join producto on fabricante.codigo=producto.codigo_fabricante
GROUP by fabricante.nombre
HAVING sum(producto.precio)>1000

	Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT producto.nombre, fabricante.nombre from producto, fabricante
where producto.codigo_fabricante=fabricante.codigo and fabricante.nombre like "lenovo"
	
	Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
	
	Lista el nombre del producto más caro del fabricante Lenovo.
	
SELECT producto.nombre, max(precio) FROM producto, fabricante where fabricante.nombre="lenovo" and producto.codigo_fabricante=fabricante.codigo
	
	Lista el nombre del producto más barato del fabricante Hewlett-Packard.

SELECT nombre FROM producto WHERE precio = (SELECT min(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Hewlett-Packard'))

	Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
	
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'))
	
	Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus') 
AND precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'))

	Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
	
SELECT * from producto WHERE precio >= all (SELECT precio FROM producto)
	
	Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
	
SELECT * from producto WHERE precio <= all (SELECT precio FROM producto)

	Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
	
SELECT nombre from fabricante WHERE codigo = any (SELECT codigo_fabricante FROM producto)

	Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
	
SELECT nombre from fabricante WHERE codigo != all (SELECT codigo_fabricante FROM producto)

	Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
	
SELECT nombre from fabricante WHERE codigo in (SELECT codigo_fabricante FROM producto)

	Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
	
SELECT nombre from fabricante WHERE codigo not in (SELECT codigo_fabricante FROM producto)

	Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
	
SELECT nombre FROM fabricante where EXISTS (SELECT codigo FROM producto where producto.codigo_fabricante = fabricante.codigo )
	
	Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
	
SELECT nombre FROM fabricante where NOT EXISTS (SELECT codigo FROM producto where producto.codigo_fabricante = fabricante.codigo )

	Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

select fabricante.nombre, max(precio) from producto
inner join fabricante on producto.codigo_fabricante= fabricante.codigo group by fabricante.codigo

	Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.

SELECT * FROM producto WHERE precio >= (SELECT AVG(precio)) FROM producto

	Lista el nombre del producto más caro del fabricante Lenovo.

SELECT nombre FROM producto p WHERE precio = (SELECT MAX(precio) FROM productoWHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'))

	Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.	

SELECT fabricante.nombre, COUNT(producto.codigo)
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.codigo
HAVING COUNT(producto.codigo) >= 
SELECT COUNT(producto.codigo)
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.nombre = 'Lenovo'

