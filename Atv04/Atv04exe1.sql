exec cont_pedidos(34567);
select * from tberro;
select * from tab_mensagem;
select * from pedido;
select * from cliente;

CREATE OR REPLACE procedure cont_pedidos(p_codcli NUMBER)
AS 
    v_tot_ped NUMBER;
    v_nome_cli cliente.nome_cliente%TYPE;
BEGIN
   
    SELECT count(cod_cliente) INTO v_tot_ped 
    FROM pedido WHERE cod_cliente = p_codcli;

    SELECT nome_cliente INTO v_nome_cli 
    FROM cliente WHERE cod_cliente = p_codcli;
    
    INSERT INTO tab_mensagem
    VALUES (SYSDATE, 'Cliente ' || p_codcli, v_nome_cli ||' tem ' || v_tot_ped); 
    
COMMIT;

EXCEPTION
    WHEN no_data_found THEN
      INSERT INTO tberro VALUES (SYSDATE,' Cliente nao existente ' || p_codcli);

END;