SELECT ID_cliente, COUNT(*) AS 'N° Ordini'
FROM db_progetto_madeo_mercurio.cliente
GROUP BY ID_cliente;