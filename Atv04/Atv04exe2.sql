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

