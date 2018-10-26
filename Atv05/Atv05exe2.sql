//trigger

CREATE TABLE tab_logteste
(nrlog NUMBER PRIMARY KEY, 
 Dttrans DATE NOT NULL, 
 Usuario VARCHAR2(15) NOT NULL, 
 Tabela VARCHAR2(30),
 Opera CHAR(1) CHECK (opera IN('I','A','E')),
 Linhas Number(5) NOT NULL CHECK(linhas >=0));