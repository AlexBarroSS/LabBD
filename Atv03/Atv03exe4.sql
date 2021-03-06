/*
ATIVIDADE 2.5 E 2.6

*/

--VIEW

--exe 01

CREATE OR REPLACE VIEW view_pedido
AS SELECT num_pedido, cod_cliente, prazo_entrega
FROM pedido   

--exe 02

CREATE OR REPLACE VIEW view_produto
AS SELECT *
FROM produto
WHERE unidade = 'kg'  

--exe 03

CREATE OR REPLACE VIEW view_valor
AS SELECT * 
FROM produto
WHERE valor_unitario < ( SELECT  AVG(valor_unitario) FROM produto)

--exe 04

CREATE OR REPLACE VIEW view_valor
AS SELECT v.cod_vendedor, v.nome_vendedor, COUNT(p.cod_vendedor) as Qtde_Vendas
FROM vendedor v
INNER JOIN pedido p
ON p.cod_vendedor = v.cod_vendedor
GROUP BY  v.cod_vendedor, v.nome_vendedor;

--SUBCONSULTAS

-- exe 01

SELECT cidade
FROM cliente
WHERE nome_cliente <> 'Joao da Silva'
AND cidade = (
    SELECT cidade 
    FROM cliente 
    WHERE nome_cliente = 'Joao da Silva'
);

-- exe 02 

SELECT * 
FROM produto
WHERE valor_unitario > (
    SELECT  AVG(valor_unitario) 
    FROM produto
);

-- exe 03

SELECT c.cod_cliente, c.nome_cliente
FROM cliente c
INNER JOIN pedido p
ON p.cod_cliente = c.cod_cliente
WHERE c.cod_cliente  
NOT IN (
    SELECT cod_cliente 
    FROM pedido p
    WHERE p.cod_vendedor <> 2
);

---->

--exe 04

SELECT cod_vendedor, nome_vendedor
FROM vendedor
WHERE cod_vendedor
NOT IN(
    SELECT p.cod_vendedor
    FROM vendedor v, pedido p
    WHERE p.cod_vendedor = v.cod_vendedor
    GROUP BY p.cod_vendedor
    HAVING count(*) > 5
);

--exe 05

SELECT nome_vendedor 
FROM vendedor
WHERE cod_vendedor 
NOT IN (
SELECT cod_vendedor 
FROM pedido
WHERE to_char(prazo_entrega,'mm/yyyy') = '05/2017'
);

--exe 06

SELECT v.nome_vendedor, v.cod_vendedor
FROM vendedor v
INNER JOIN pedido p
ON p.cod_vendedor = v.cod_vendedor
GROUP BY v.nome_vendedor, v.cod_vendedor
HAVING COUNT(*) = (
    SELECT MAX(COUNT(*))
    FROM pedido
    GROUP BY cod_vendedor
);

-- exe 07

SELECT c.nome_cliente, COUNT(num_pedido) AS total_pedidos
FROM cliente c
INNER JOIN pedido p
ON p.cod_cliente = c.cod_cliente
GROUP BY cod_cliente

-- exe 08

DELETE FROM item_pedido
WHERE num_pedido 
IN (
    SELECT num_pedido
    FROM pedido
    WHERE cod_cliente = 2
);

-- exe 09

UPDATE produto
SET valor_unitario = valor_unitario * 0.8
WHERE cod_produto
NOT IN (
    SELECT it.cod_produto
    FROM pedido p
    INNER  JOIN item_pedido it
    ON it.num_pedido = p.num_pedido
    WHERE to_char(prazo_entrega, 'yyyy') = '2017'
);
