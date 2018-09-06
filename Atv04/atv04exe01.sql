--patterns view_name_view

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

-- exe 05

SELECT MAX(quantidade) AS Maior
FROM item_pedido



--exe 06

SELECT c.nome_cliente, c.endereco
FROM cliente c
INNER JOIN pedido pe
ON c.cod_cliente = pe.cod_cliente
WHERE c.cidade = 'Itu'OR c.cidade = 'Sorocaba' AND pe.cod_vendedor = '10'
