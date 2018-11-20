-- 7 - Objetivo: Selecionar a quantidade de turmas cadastradas em cada um dos cursos, exibindo o nome do curso, sua sigla e a quantidade de turmas
select C.nome, T.siglaCurso, count(t.siglaCurso) as quantidade from tb_Turma T
    inner join tb_Curso C on C.siglaCurso = T.siglaCurso
    group by C.nome, T.siglaCurso;

-- 10 Objetivo: Selecionar os cursos que possuem mais de uma turma cadastrada

/*
O having é um filtro aplicado sobre um agrupamento, 
assim, ele exibe apenas os dados que são verdadeiros de accordo com sua condição,
sendo executado após o group by
*/

select C.nome, T.siglaCurso, count(t.siglaCurso) as quantidade from tb_Turma T
    inner join tb_Curso C on C.siglaCurso = T.siglaCurso
    group by C.nome, T.siglaCurso
    having count(t.siglaCurso) > 1;

-- 13 Objetivo: Esse comando vai criar uma visão do nome dos alunos e o periodo que eles pertencem
 create or replace view AlunoPeriodo as 
    select P.nome, T.periodo from tb_Pessoa P
    inner join tb_Aluno A on A.cpf = P.cpf
    inner join tb_Matricula M on A.cpf = M.cpf
    inner join tb_Turma T on T.siglaTurma = M.siglaTurma
    group by T.periodo, P.nome
    order by T.periodo;

-- 15 -- dissertativa 

/*
As visões são alterável quando não utilizam utilizam junções ou quando um campo é definido por uma expressão , assim: 

-- É alteravel, pois não utiliza junções nem possui um campo definido por uma expressão

create or replace view PessoaAluno as
select * from tb_Pessoa where tipoPessoa = 'Aluno';

-- É alteravel, pois não utiliza junções nem possui um campo definido por uma expressão

create or replace view PessoaInstrutor as
select * from tb_Pessoa where tipoPessoa = 'Instrutor';

-- Não é alteravel, pois a visão é resultado de uma junção

create or replace view AlunoPeriodo as 
select P.nome, T.periodo from tb_Pessoa P
    inner join tb_Aluno A on A.cpf = P.cpf
    inner join tb_Matricula M on A.cpf = M.cpf
    inner join tb_Turma T on T.siglaTurma = M.siglaTurma
    group by T.periodo, P.nome
    order by T.periodo;

-- Não é alteravel, pois possui um campo definido por uma expressão

create or replace view Pessoa_EnderecoCompleto as
select cpf, endereco || ' - ' || numero || ' - ' || bairro || ' - ' || Cidade || ' - ' || Estado || ' - ' || CEP as Endereco_Completo from tb_pessoa;

*/

-- 17 Objetivo: selecionar alunos que se matricularam em turmas noturnas e exibir seus nomes e sigla da turma

select P.nome, M.siglaTurma from tb_Pessoa P
    inner join tb_Aluno A on A.cpf = P.cpf
    inner join tb_Matricula M on A.cpf = M.cpf
    inner join tb_Turma T on T.siglaTurma = M.siglaTurma
minus
Select P.nome, M.siglaTurma from tb_Pessoa P
    inner join tb_Aluno A on A.cpf = P.cpf
    inner join tb_Matricula M on A.cpf = M.cpf
    inner join tb_Turma T on T.siglaTurma = M.siglaTurma and (T.periodo = 'Integral' or T.periodo = 'Diurno');

-- 20 - Objetivo: Exibir o nome e a turma dos alunos que tem aula com um instrutor na area de história

select P.nome as Aluno, T.siglaTurma as Turma from tb_Pessoa P
    inner join tb_Matricula M on P.cpf = M.cpf
    inner join tb_Turma T on M.siglaTurma = T.siglaTurma
    where T.cpfInstrutor in (select cpf from tb_Instrutor where areaAtuacao = 'História'); 

-- 22 - Objetivo: Listar nome dos alunos pagaram a matricula a vista

select P.nome as Aluno, T.siglaTurma as Turma from tb_Pessoa P
    inner join tb_Matricula M on M.cpf = P.cpf
    inner join tb_Turma T on M.siglaTurma = T.siglaTurma
    where exists (select codAvista from tb_Avista V where V.codAvista = M.codAvista);

-- 28 - Objetivo: Gatilho para registrar alterações no registro valor da tabela tb_Avista

create table tb_log(
    idLog number(10) primary key,
    horario date,
    chave varchar2(20),
    tabela varchar2(20),
    usuario varchar2(20));

create sequence seqtblog;

create or replace trigger TR_VeriValPagAvista
before update of valor or insert or delete on tb_Avista
for each row
declare
    v_chaveMatricula tb_Matricula.cpf%type;
begin

    if updating then
        insert into tb_log values (seqtblog.nextval, sysdate,'update ',  :new.codAvista, 'tb_Avista', user);
    elsif deleting then
        insert into tb_log values (seqtblog.nextval,  sysdate, 'delete ', :old.codAvista, 'tb_Avista', user);
    else 
        insert into tb_log values (seqtblog.nextval,  sysdate, 'insert ', :new.codAvista, 'tb_Avista', user);
    end if;

end TR_VeriValPagAvista;

