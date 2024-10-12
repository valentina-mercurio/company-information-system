SELECT COUNT(*) AS 'N° ORDINI NON EVASI'
FROM db_progetto_madeo_mercurio.ordine_cliente
WHERE Stato != "Evaso";