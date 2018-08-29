/*
Tabela Cliente
*/

INSERT INTO Cliente (cod_cliente, nome_cliente, endereco, cidade, cep, estado)
VALUES ('00001', 'Alex Afonso', 'Campestre', 'Pilar do Sul', '18185-000', 'sp');

INSERT INTO Cliente (cod_cliente, nome_cliente, endereco, cidade, cep, estado)
VALUES ('00002', 'Guxtavo', 'Centro', 'Sorocaba', '18181-000', 'sp' );

INSERT INTO Cliente (cod_cliente, nome_cliente, endereco, cidade, cep, estado)
VALUES ('00003', 'Andure', 'Vargem grande', 'Paulista', '18183-000', 'sp');

INSERT INTO Cliente (cod_cliente, nome_cliente, endereco, cidade, cep, estado)
VALUES ('00005', 'Guilhereme', 'Olimpo', 'Grecia', '18123-000', 'sp' );

INSERT INTO Cliente (cod_cliente, nome_cliente, endereco, cidade, cep, estado)
VALUES ('00004', 'Barbw', 'Campolinho', 'Votorantim', '18184-000', 'sp' );

/*
Tabela Vendedor
*/
INSERT INTO Vendedor (cod_vendedor, nome_vendedor, faixa_comissao, salario_fixo)
VALUES ('10001', 'Uno', '15,20', '11231,21');

INSERT INTO Vendedor (cod_vendedor, nome_vendedor, faixa_comissao, salario_fixo)
VALUES ('10002', 'Vender Dor', '25,5', '7500,50');

INSERT INTO Vendedor (cod_vendedor, nome_vendedor, faixa_comissao, salario_fixo)
VALUES ('10003', 'Comen ciante', '13,17', '12345,12');

INSERT INTO Vendedor (cod_vendedor, nome_vendedor, faixa_comissao, salario_fixo)
VALUES ('10004', 'Jose Amendoin', '30,30', '3030,30');

INSERT INTO Vendedor (cod_vendedor, nome_vendedor, faixa_comissao, salario_fixo)
VALUES ('10005', 'Alex Afonso de B Silva', '10,23', '12500,43');

/*
Tabela Produto
*/

INSERT INTO Produto (cod_produto, descricao, unidade, valor_unitario)
VALUES ('101', 'caixa de sapato', 'kg', '100,50' ); 

INSERT INTO Produto (cod_produto, descricao, unidade, valor_unitario)
VALUES ('102', 'caixa de doce', 'kg', '101,50' );

INSERT INTO Produto (cod_produto, descricao, unidade, valor_unitario)
VALUES ('103', 'caixa de algodao', 'kg', '210,54' );

INSERT INTO Produto (cod_produto, descricao, unidade, valor_unitario)
VALUES ('104', 'café', 'kg', '191210,50' );

INSERT INTO Produto (cod_produto, descricao, unidade, valor_unitario)
VALUES ('105', 'caixa de laranja', 'kg', '3,05' );

/*
Tabela Pedido
*/

INSERT INTO Pedido (num_pedido, prazo_entrega, cod_cliente, cod_vendedor)
VALUES('301', '11-JAN-1997', '00001', '10001');

INSERT INTO Pedido (num_pedido, prazo_entrega, cod_cliente, cod_vendedor)
VALUES('302', '11-JAN-2007', '00001', '10001');

INSERT INTO Pedido (num_pedido, prazo_entrega, cod_cliente, cod_vendedor)
VALUES('303', '11-JAN-2008', '00002', '10001');

INSERT INTO Pedido (num_pedido, prazo_entrega, cod_cliente, cod_vendedor)
VALUES('304', '11-JAN-2009', '00003', '10002');

INSERT INTO Pedido (num_pedido, prazo_entrega, cod_cliente, cod_vendedor)
VALUES ('305', '11-JAN-2009', '00001', '10005');

/*
Tabela Item Pedido
*/

INSERT INTO Item_Pedido(cod_produto, num_pedido, quantidade)
VALUES ('105','305','12345');

INSERT INTO Item_Pedido(cod_produto, num_pedido, quantidade)
VALUES('104','304','2');

INSERT INTO Item_Pedido(cod_produto, num_pedido, quantidade)
VALUES('102','303','4');

INSERT INTO Item_Pedido(cod_produto, num_pedido, quantidade)
VALUES('102','302','8');

INSERT INTO Item_Pedido(cod_produto, num_pedido, quantidade)
VALUES('101','301','7');





