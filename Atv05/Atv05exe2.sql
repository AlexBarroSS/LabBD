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

/*
              ATIVIDADE
*/

//exe1

Create or replace  trigger tr_desconto
before insert on item_pedido
For each row
declare
Vtotal number(5);
Vcodcli  pedido.cod_cliente%type;
begin

select count(*) into Vtotal from pedido
where codcli = Vcodcli;

select 
from 
where 

If Vtotal > 2 Then
:new.valor_unitario := :new.valor_unitario * 0.85;
end if;
end;

select * from tb_pedido
select * from tb_item_pedido

insert into tb_item_pedido values (101,02,6,20.00);


show errors

ALTER TABLE item_pedido MODIFY (preco_unit NUMBER(7,2));