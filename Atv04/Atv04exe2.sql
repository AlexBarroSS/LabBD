//exe01

//exe02

//exe03

//exe04

CREATE OR REPLACE procedure verifica_pedidos(p_codpro NUMBER)
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
        VALUES(
            SYSDATE,
            p_codpro || ' ',
            v_descricao
        );

        DELETE produto
        WHERE cod_produto = p_codpro;

    END IF;

EXCEPTION
    WHEN no_data_found THEN
      INSERT INTO tberro VALUES (SYSDATE, ' Produto nao encontrado ' || p_codpro );

END;

create or replace procedure veri_prod(p_cod_prod number)
AS  
    v_total number(10);
    v_desc Produto.descricao%type;
Begin
    select descricao into v_desc from Produto where cod_produto = p_cod_prod;
    select count(*) into v_total from Item_Pedido where cod_produto = p_cod_prod;
    if v_total = 0 then
        insert into values (sysdate, P_cod_prod || ' ' || v_desc, user );
        delete Produto where cod_produto = P_cod_prod;
    end if;

EXCEPTION
    when no_data_found then
        insert into tberro values( sysdate, 'Produto nao existe' || P_cod_prod);

end;
