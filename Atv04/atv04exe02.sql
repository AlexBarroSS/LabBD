-- exe 01

SELECT cidade
FROM cliente
WHERE cidade = (SELECT cidade FROM cliente WHERE nome_cliente = 'Joao da Silva');

-- exe 02 

SELECT * 
FROM produto
WHERE valor_unitario > ( SELECT  AVG(valor_unitario) FROM produto);

-- exe 03

