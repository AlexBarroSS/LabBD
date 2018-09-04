//exe 01

SELECT num_pedido, prazo_entrega   
FROM pedidos

//exe 02

SELECT descricao, valor_unitario   
FROM produtos

//exe 03 

SELECT nome_cliente, endereco   
FROM cliente

//exe 04

SELECT nome_vendedor   
FROM vendedor

//exe 05

SELECT * FROM cliente

//exe 06

SELECT * FROM produtos

//exe 07

SELECT nome_vendedor AS Nome   
FROM vendedor

//exe 08

SELECT valor_unitario * 1.1   
FROM produto

//exe 09

SELECT salario_fixo * 1.05 
FROM vendedor

//exe 10

SELECT nome_cliente
FROM cliente
WHERE cidade = 'Sorocaba'

//exe 11

SELECT *  
FROM vendedor
WHERE salario_fixo < 400.00

//exe 12

SELECT cod_produto, descricao
FROM produto
WHERE unidade = 'kg'

//exe 13

SELECT num_pedido
FROM pedido
WHERE prazo_entrega
BETWEEN '01/05/2012' AND '01/06/2012' 

//exe 14

SELECT num_pedido, prazo_entrega
FROM pedido
WHERE prazo_entrega 
BETWEEN '01/01/2004' AND '31/12/2004' 

//exe 15

SELECT *
FROM produto
WHERE valor_unitario > 100 AND valor_unitario < 200 

//exe 16

SELECT num_pedido, cod_produto
FROM item_pedido
WHERE quantidade
BETWEEN '1000' AND '1500'

//exe 17

SELECT nome_vendedor
FROM vendedor
WHERE nome_vendedor LIKE 'Jose%'

//exe 18

SELECT nome_cliente
FROM cliente
WHERE nome_cliente LIKE '%Silva'

//exe 19

SELECT descricao, cod_produto
FROM produto
WHERE descricao LIKE '%AC%'

//exe 20

SELECT nome_cliente
FROM cliente
WHERE endereco IS NULL

//exe 21

SELECT cidade
FROM cliente
GROUP BY cidade

//exe 22

SELECT *
FROM cliente
ORDER BY nome_cliente

//exe 23

SELECT *
FROM cliente
ORDER BY cidade DESC 

//exe 24

SELECT *
FROM cliente
ORDER BY cidade, nome_cliente 

//exe 25

SELECT cod_produto, descricao
FROM produto
WHERE unidade = 'kg'
ORDER BY descricao