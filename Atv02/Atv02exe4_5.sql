ALTER TABLE Item_produto ADD (pco_unit NUMBER(6, 2));

/*
Exercicio 5
*/

UPDATE Cliente 
SET cep = '18035-400'
WHERE cidade = ( SELECT cidade FROM Cliente WHERE cidade = 'Sorocaba' );