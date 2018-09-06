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

-- exe 2.3

-- exe 01

SELECT MAX(valor_unitario) AS Maior_valor
FROM produto

-- exe 02

SELECT MAX(valor_unitario) AS Maior_valor
FROM produto

-- exe 03

SELECT SUM(salario_fixo) AS Soma_salario
FROM vendedor

-- exe 04

SELECT COUNT(unidade) AS Unit
FROM produto
WHERE unidade = 'Lt'

-- exe 05

SELECT COUNT(*) AS Cont_cod
FROM cliente
GROUP BY cidade;

-- exe 06

SELECT COUNT(*) AS Pedido_vendas
FROM vendedor v, pedido p
WHERE v.cod_vendedor = p.cod_vendedor

-- exe 07

SELECT MAX(valor_unitario) AS maior_unit, MIN(valor_unitario) AS menor_unit
FROM produto
GROUP BY unidade;

-- exe 08

SELECT COUNT(*) AS numero_clientes
FROM cliente
GROUP BY cidade
HAVING COUNT(*) > 4;