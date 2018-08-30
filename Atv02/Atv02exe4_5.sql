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