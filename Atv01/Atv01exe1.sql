CREATE TABLE Cliente (
  cod_cliente NUMBER(5) PRIMARY KEY,
  nome_cliente VARCHAR2(30),
  endereco VARCHAR2(25),
  cidade VARCHAR2(20),
  cep VARCHAR2(10),
  UF VARCHAR2(2)
);

CREATE TABLE Vendedor(
    cod_vendedor NUMBER(5) PRIMARY KEY,
    nome_vendedor VARCHAR2(30),
    faixa_comissao NUMBER(4, 2),
    salario_fixo NUMBER(7, 2)
);

CREATE TABLE Produto(
    cod_produto NUMBER(3)  PRIMARY KEY,
    descricao VARCHAR2(20),
    unidade VARCHAR2(2),
    valor_unitario NUMBER(8, 2)
);

CREATE TABLE Pedido(
    num_pedido NUMBER(5) PRIMARY KEY,
    prazo_entrega DATE,
    cod_cliente NUMBER(5) NOT NULL,
    cod_vendedor NUMBER(5) NOT NULL 
);

CREATE TABLE Item_Pedido(
    cod_produto NUMBER(3) NOT NULL,
    num_pedido NUMBER(5) NOT NULL,
    quantidade NUMBER(5),
);

ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_cod_vendedor FOREIGN KEY (cod_vendedor) REFERENCES Vendedor;
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_cod_cliente FOREIGN KEY (cod_cliente) REFERENCES Cliente;

ALTER TABLE Item_Pedido ADD CONSTRAINT FK_Item_Pedido_cod_produto FOREIGN KEY (cod_produto) REFERENCES Produto;
ALTER TABLE Item_Pedido ADD CONSTRAINT FK_Item_Pedido_cod_pedido FOREIGN KEY (num_pedido) REFERENCES Pedido;
ALTER TABLE Item_Pedido ADD CONSTRAINT PKC_Item_Pedido_cod_pedido PRIMARY KEY (num_pedido, cod_produto);
