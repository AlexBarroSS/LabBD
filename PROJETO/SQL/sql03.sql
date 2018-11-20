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
