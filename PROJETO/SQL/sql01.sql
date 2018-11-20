-- Projeto Final - DDL

-- Tabelas

create table tb_Pessoa(
	nome varchar2(30) not null,
	dataNasc date,
	endereco varchar2(50),
	numero number(5),
	bairro varchar2(20),
	cidade varchar2(20),
	estado varchar2(20),
	cep varchar2(8),
	telefone varchar2(10),
	celular varchar2(11),
	sexo varchar2(1) not null, -- CHK
	estadoCivil varchar2(15),
	rg varchar2(9) not null, -- UQ
	cpf varchar2(11) not null, -- PK
	email varchar2(30),
	tipoPessoa varchar2(10) not null);

create table tb_Instrutor(
	cpf varchar2(11) not null, -- PK FK
	formacao varchar2(20) not null,
	areaAtuacao varchar2(20));
	
create table tb_Aluno(
	cpf varchar2(11) not null, -- PK FK
	escolaridade varchar2(20)); 

create table tb_Curso(
	siglaCurso varchar2(5) not null, -- PK
	nome varchar2(20) not null,
	cargaHoraria number(4),
	valor number(7, 2) not null,
	dtVigencia date,
	valorHoraInstrutor number(7, 2) not null,
	programa varchar2(50));
	
create table tb_Turma(
	siglaTurma varchar2(5) not null, -- PK
	descricao varchar2(30) not null,
	dtInicio date,
	dtTermino date,
	periodo varchar2(8) not null,
	qtdeVagas number(3) not null,
	observacoes varchar2(50),
	cpfInstrutor varchar2(11) not null, -- FK
	siglaCurso varchar2(5) not null); -- FK
	
create table tb_AVista(
	codAvista number(10) not null, -- PK 
	valor number(7, 2) not null,
	agencia number(5) not null,
	nCheque number(8) not null,
	preDt date not null);

create table tb_APrazo(
	codAprazo number(10) not null, -- PK
	valor number(7, 2) not null,
	dtVencimento date not null,
	taxaJuros number(5, 2) not null,
	qtdeMensalidade number(3) not null);

create table tb_Matricula(
	cpf varchar2(11) not null, -- PK FK
	dtMatricula date,
	nota number(4, 2) not null,
	siglaTurma varchar2(5) not null, -- FK
	codAvista number(10), -- FK
	codAprazo number(10)); -- FK

	
-- Constraints

-- Pessoa
alter table tb_Pessoa add constraint PK_Pessoa_cpf primary key (cpf);
alter table tb_Pessoa add constraint CHK_Pessoa_sexo check (sexo in ('M', 'F'));
alter table tb_Pessoa add constraint CHKU_Pessoa_rg unique (rg);

-- Instrutor
alter table tb_Instrutor add constraint FK_Instrutor_cpf foreign key (cpf) references tb_Pessoa;
alter table tb_Instrutor add constraint PK_Instrutor_cpf primary key (cpf);

-- Aluno
alter table tb_Aluno add constraint FK_Aluno_cpf foreign key (cpf) references tb_Pessoa;
alter table tb_Aluno add constraint PK_Aluno_cpf primary key (cpf);

-- Curso
alter table tb_Curso add constraint PK_Curso_siglaCurso primary key (siglaCurso);

-- Turma
alter table tb_Turma add constraint PK_Turma_siglaTurma primary key (siglaTurma);
alter table tb_Turma add constraint FK_Turma_cpfInstrutor foreign key (cpfInstrutor) references tb_Instrutor;
alter table tb_Turma add constraint FK_Turma_siglaCurso foreign key (siglaCurso) references tb_Curso;

-- AVista
alter table tb_AVista add constraint PK_AVista primary key (codAvista);

-- APrazo
alter table tb_APrazo add constraint PK_APrazo primary key (codAprazo);

-- Matricula
alter table tb_Matricula add constraint FK_Matricula_cpf foreign key (cpf) references tb_Aluno;
alter table tb_Matricula add constraint PK_Matricula_cpf primary key (cpf);
alter table tb_Matricula add constraint FK_Matricula_siglaTurma foreign key (siglaTurma) references tb_Turma;
alter table tb_Matricula add constraint FK_Matricula_codAvista foreign key (codAvista) references tb_AVista;
alter table tb_Matricula add constraint FK_Matricula_codAprazo foreign key (codAprazo) references tb_APrazo;