//exe 04

CREATE OR REPLACE procedure verifica_pedidos(p_codpro produto.cod_produto%TYPE)
AS 
    v_tot_ped NUMBER;
    v_descricao produto.descricao%TYPE;
    v_user parm_user_ID NUMBER;
    
BEGIN

    SELECT count(p_codpro) INTO v_tot_ped 
    FROM item_pedido WHERE cod_produto = p_codpro;
    
    IF v_tot_ped = 0 THEN
    
        SELECT descricao 
        INTO v_descricao
        FROM produto 
        WHERE cod_produto = p_codpro;

        INSERT INTO tablog
        VALUES(
            SYSDATE,
            p_codpro || v_descricao,
            select USER into parm_user_ID from dual;
        );

        DELETE produto
        WHERE cod_produto = p_codpro;

    END IF;

COMMIT;

EXCEPTION
    WHEN no_data_found THEN
      INSERT INTO tberro VALUES (SYSDATE, p_codpro || ' Produto nao encontrado ' );

END;