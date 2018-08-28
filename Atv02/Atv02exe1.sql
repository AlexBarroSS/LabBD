CREATE TABLE Cliente (
  cod_cliente NUMBER(5) PRIMARY KEY,
  nome_cliente VARCHAR2(30),
  endereco VARCHAR2(25),
  cidade VARCHAR2(20),
  cep VARCHAR2(10),
  estado VARCHAR2(2)
);