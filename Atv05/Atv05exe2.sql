//trigger

CREATE TABLE tab_logteste
(
    nrlog NUMBER PRIMARY KEY, 
    Dttrans DATE NOT NULL, 
    Usuario VARCHAR2(15) NOT NULL, 
    Tabela VARCHAR2(30),
    Opera CHAR(1) CHECK (opera IN('I','A','E')),
    Linhas Number(5) NOT NULL CHECK(linhas >=0)
);

CREATE OR Replace trigger EliminaProduto
BEFORE DELETE ON produto
FOR EACH ROW
BEGIN

  INSERT INTO tab_logteste
  VALUES(seqlog.nextval,SYSDATE,user,'produto ','E',1);

END Eliminaproduto;

CREATE SEQUENCE seqlog;

SELECT seqlog.currval FROM dual;

INSERT INTO produto VALUES (seqlog.NEXTVAL,'Caneta','UN', 5.00,30);

ALTER TABLE tab_logteste MODIFY(nrlog NUMBER(5));

SELECT * FROM produto;

SELECT * FROM tab_logteste;

DELETE produto
WHERE cod_produto = 9;