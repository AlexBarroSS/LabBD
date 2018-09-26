create or replace procedure cont_pedidos(pcodcli number)
as
    v_tot_ped number;
    v_nome_cli cliente.nome_cliente%type;
Begin
    select cod_cliente into v_tot_ped
    from cliente where cod_cliente = pcodcli;
    
    select coalesce (count(cod_cliente), 0) into v_tot_ped from pedido where cod_cliente = pcodcli;
    select nome_cliente into v_nome_cli from cliente where cod_cliente = pcodcli;
    insert into tab_mensagem
    values (sysdate, 'Cliente ' || pcodcli, v_nome_cli ||' tem ' || v_tot_ped); 
    
commit;

exception
    when no_data_found then
      insert into tberro values (sysdate,' Cliente nao existente ' || pcodcli);

end;

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
    SELECT cod_cliente INTO v_tot_ped
    FROM cliente WHERE cod_cliente = p_codcli;
    
    SELECT coalesce (count(cod_cliente), 0) INTO v_tot_ped 
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