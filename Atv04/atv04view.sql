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