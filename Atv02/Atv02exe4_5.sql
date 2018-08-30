ALTER TABLE Item_produto ADD (pco_unit NUMBER(6, 2));

/*
Exercicio 5
*/

UPDATE Cliente 
SET cep = '18035-400'
WHERE cidade = ( SELECT cidade FROM Cliente WHERE cidade = 'Sorocaba' );

/*
Exercicio 6
*/

UPDATE Pedido 
SET prazo_entrega = prazo_entrega + 10
WHERE cod_cliente in ( SELECT cod_cliente FROM Cliente WHERE cod_cliente = 1 );

/*
Exercicio 7
*/

UPDATE Produto 
SET valor_unitario = valor_unitario * 1.1
WHERE unidade in ( SELECT unidade FROM Produto WHERE unidade = 'kg' );

/*
Exercicio 8
*/

DELETE Produto 
WHERE unidade = 'cx' AND valor_unitario < 50;

/*
Desafio 1
*/

SELECT cod_produto, descricao, 'Antes do aumento' quando, valor_unitario from produto
UNION
SELECT cod_produto, descricao, 'Depois do aumento' quando, valor_unitario *1.1 from produto;

/*
Desafio 2
*/

SELECT cod_produto, descricao, valor_unitario from produto
UNION
SELECT 0, 'Soma dos valores = ', SUM(valor_unitario) valor_unitario 
FROM produto
ORDER BY valor_unitario;