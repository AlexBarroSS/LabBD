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
WHERE cidade = (SELECT cidade FROM cliente WHERE nome_cliente = 'Joao da Silva');

-- exe 02 

SELECT * 
FROM produto
WHERE valor_unitario > ( SELECT  AVG(valor_unitario) FROM produto);

-- exe 03

SELECT c.cod_cliente, c.nome_cliente
FROM cliente c, vendedor v, pedido p
WHERE p.cod_cliente = c.cod_cliente
    AND v.cod_vendedor = p.cod_vendedor
    AND p.cod_vendedor = 10001
    AND p.cod_cliente
NOT IN (
    SELECT c.cod_cliente 
    FROM cliente c, vendedor v, pedido p
    WHERE p.cod_cliente = c.cod_cliente
    AND v.cod_vendedor = p.cod_vendedor
    AND p.cod_vendedor <> 10001
);

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
WHERE to_char(prazo_entrega,'mm/yyyy') = '05/2017');

