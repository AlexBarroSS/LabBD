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
FROM cliente c
INNER JOIN pedido p
ON c.cod_cliente = p.cod_cliente
WHERE p.cod_vendedor NOT IN (SELECT cod_vendedor FROM Pedido WHERE cod_vendedor <> 10)

--exe 04

 SELECT pedido.cod_vendedor, nome_vendedor
 FROM pedido,vendedor
 WHERE pedido.cod_vendedor = vendedor.cod_vendedor
 GROUP BY pedido.cod_vendedor, nome_vendedor
 HAVING count(*) <= 3;

 -- 05

 


