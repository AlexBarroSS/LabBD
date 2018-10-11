CREATE OR REPLACE procedure verifica_pedidos(p_codpro produto.cod_produto%TYPE)
AS 
    v_tot_ped NUMBER;
    
BEGIN
   
    SELECT p_codpro INTO v_tot_ped 
    FROM produto WHERE cod_produto = p_codpro;

    SELECT count(p_codpro) INTO v_tot_ped 
    FROM item_pedido WHERE cod_produto = p_codpro;
    
    IF v_tot_ped = 0 THEN
    
        INSERT INTO tablog
        VALUES(
            SYSDATE,
            p_codpro,
            (SELECT descricao 
            FROM produto 
            WHERE cod_produto = p_codpro)
        );

        DELETE produto
        WHERE cod_produto = p_codpro;

    END IF;

COMMIT;

EXCEPTION
    WHEN no_data_found THEN
      INSERT INTO tberro VALUES (SYSDATE, p_codpro || ' Cliente nao existente ' );

END;