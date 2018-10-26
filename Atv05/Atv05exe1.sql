//exe 1

CREATE OR  REPLACE  FUNCTION  ver_hora (p_data IN DATA)
RETURN VARCHAR2(25)
AS
	v_data VARCHAR2(25);
BEGIN
	v_data := TO_CHAR(p_data, 'dd-mm-yyyy:HH24:mi:ss');	
	
	RETURN v_data;

END ver_hora;

//exe 2

CREATE OR  REPLACE  FUNCTION  ver_paciente (p_codpac IN NUMBER)
RETURN VARCHAR2(10)
AS
    v_idade DATA
	v_anos NUMBER;
    tipo VARCHAR2(10);
BEGIN

	select (v_idade) into v_idade 
	from paciente where p_codpac = 1;
    
    v_anos = (sysdate - v_idade)/365;
	
	IF v_anos > 65 THEN
		tipo = 'IDOSO';
		
	ELSE
		tipo = 'NÃO IDOSO';
	end IF;
	
	RETURN tipo;

END ver_paciente;

//exe 3

ALTER TABLE produto
ADD (qtde_estoque NUMBER);

CREATE OR REPLACE FUNCTION  consulta_estoque(p_cod IN produto.cod_produto%TYPE)
RETURN produto.qtde_estoque%TYPE
AS
	v_qtde produto.qtde_estoque%TYPE;
	
BEGIN

    SELECT qtde_estoque INTO v_qtde
	FROM produto WHERE p_cod = cod_produto;

	RETURN v_qtde;

END consulta_estoque;