CREATE TABLE Cliente (
  cod_cliente NUMBER(5) PRIMARY KEY,
  nome_cliente VARCHAR2(30),
  endereco VARCHAR2(25),
  cidade VARCHAR2(20),
  cep VARCHAR2(10),
  estado VARCHAR2(2)
);

CREATE TABLE Vendedor(
    cod_vendedor NUMBER(5, 0) CONSTRAINT PK_vend PRIMARY KEY,
    nome_vendedor VARCHAR2(30),
    faixa_comissao NUMBER(4, 2),
    salario_fixo NUMBER(7, 2)
);

CREATE TABLE Produto(
    cod_produto NUMBER(3, 0) CONSTRAINT PK_prod PRIMARY KEY,
    descricao VARCHAR2(20),
    unidade VARCHAR2(2),
    valor_unitario NUMBER(8, 2)
);

CREATE TABLE Pedido(
    num_pedido NUMBER(5, 0) CONSTRAINT PK_ped PRIMARY KEY,
    prazo_entrega DATE,
    cod_cliente NOT NULL REFERENCES Cliente,
    cod_vendedor NOT NULL REFERENCES Vendedor
);