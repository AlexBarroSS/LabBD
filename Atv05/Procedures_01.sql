create or replace procedure cont_pedidos(pcodcli number)
as
    tot_ped number;
Begin
    select cod_cliente into tot_ped
    from pedido where cod_cliente = pcodcli;

    if tot_ped is not null then
        select count(cod_cliente) into tot_ped from pedido where cod_cliente = pcodcli; 
        insert into tab_mensagem
    values (sysdate, 'Cliente ' || pcodcli, ' tem ' || tot_ped);
   end if;

commit;

exception
    when no_data_found then
      insert into tberro values (sysdate,' Cliente nao existente' || pcodcli);

end;