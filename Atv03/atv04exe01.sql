--exe 01

SELECT v.cod_vendedor, v.nome_vendedor
FROM vendedor v INNER JOIN pedido p
ON v.cod_vendedor = p.cod_vendedor
WHERE cod_cliente = '10'

--exe 02

SELECT p.num_pedido, p.prazo_entrega, it.quantidade, pr.descricao
FROM pedido p 
INNER JOIN item_pedido it 
ON p.num_pedido = it.num_pedido
INNER JOIN produto pr
ON it.cod_produto = pr.cod_produto
WHERE pr.cod_produto = 100

--exe 03

SELECT v.cod_vendedor, v.nome_vendedor
FROM vendedor v 
INNER JOIN pedido p
ON v.cod_vendedor = p.cod_vendedor
INNER JOIN cliente c
ON c.cod_cliente = p.cod_cliente
WHERE c.nome_cliente = 'Jose da Silva'

--exe 04 

SELECT pe.num_pedido, pr.descricao, v.cod_vendedor, v.nome_vendedor, c.nome_cliente
FROM vendedor v 
INNER JOIN pedido pe
ON v.cod_vendedor = pe.cod_vendedor
INNER JOIN cliente c
ON c.cod_cliente = pe.cod_cliente
INNER JOIN item_pedido it
ON pe.num_pedido = it.num_pedido
INNER JOIN produto pr
ON it.cod_produto = pr.cod_produto
WHERE c.cidade = 'Sorocaba'

--exe 05

SELECT pr.cod_produto, pr.descricao, it.quantidade, pe.prazo_entrega
FROM pedido pe
INNER JOIN item_pedido it
ON pe.num_pedido = it.num_pedido
INNER JOIN produto pr
ON pr.cod_produto = it.cod_produto
WHERE pe.num_pedido = '123'

--exe 06

SELECT c.nome_cliente, c.endereco
FROM cliente c
INNER JOIN pedido pe
ON c.cod_cliente = pe.cod_cliente
WHERE c.cidade = 'Itu'OR c.cidade = 'Sorocaba' AND pe.cod_vendedor = '10'