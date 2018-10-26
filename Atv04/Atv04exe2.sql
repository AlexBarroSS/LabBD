//exe01

//exe02

//exe03

//exe04

CREATE OR REPLACE procedure verifica_pedidos(p_codpro produto.cod_produto%TYPE)
AS 
    v_tot_ped NUMBER;
    v_descricao produto.descricao%TYPE;
    
BEGIN

    SELECT descricao INTO v_descricao
    FROM produto WHERE cod_produto = p_codpro;

    SELECT count(*) INTO v_tot_ped 
    FROM item_pedido WHERE cod_produto = p_codpro;
    
    IF v_tot_ped = 0 THEN
    
        INSERT INTO tablog
        VALUES( SYSDATE, p_codpro || 'excluido ', v_descricao);
        
        DELETE produto
        WHERE cod_produto = p_codpro;
    
    ELSIF v_tot_ped > 0 THEN
    
        INSERT INTO tablog
        VALUES( SYSDATE, p_codpro || 'tem ' || v_tot_ped, v_descricao);

    END IF;

EXCEPTION
    WHEN no_data_found THEN
      INSERT INTO tberro VALUES (SYSDATE, ' Produto nao encontrado ' || p_codpro );

END;

EXEC verifica_pedidos(101);

SELECT * FROM tablog;