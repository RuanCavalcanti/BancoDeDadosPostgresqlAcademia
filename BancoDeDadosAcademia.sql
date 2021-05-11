/* Criando o banco de dados */

CREATE DATABASE academia;

/*Usando o banco de dados*/

USE academia;


/*Criando a tabela funcionário*/

CREATE TABLE funcionario (
	matricula_func INT NOT NULL,
	cpf_func VARCHAR (11) NOT NULL,
	nome_func VARCHAR(40) NOT NULL,
	cod_cargo INT NOT NULL,

	PRIMARY KEY (matricula_func)
);


/*Criando a tabela professor*/

CREATE TABLE professor (
	matricula_func INT NOT NULL,
	cref VARCHAR (15) NOT NULL,

	PRIMARY KEY (matricula_func),
	FOREIGN KEY (matricula_func)
	REFERENCES funcionario(matricula_func)
);



/* Criando a tabela para o Administrador */

CREATE TABLE administrador (
	matricula_func INT NOT NULL,
	nivel_funcao VARCHAR (30) NOT NULL,

	PRIMARY KEY (matricula_func),
	FOREIGN KEY (matricula_func)
	REFERENCES funcionario(matricula_func)
);


/* Criando a tabela contendo o cargo dos funcionários */

CREATE TABLE cargo (
	cod_cargo INT NOT NULL,
	nome_cargo VARCHAR (30) NOT NULL,

	PRIMARY KEY (cod_cargo)
);


/*Criando a tabela aluno*/

CREATE TABLE aluno (
	cpf_aluno VARCHAR (11) NOT NULL,
	nome_aluno VARCHAR (40) NOT NULL,
	data_nasc_aluno DATE,
	restricao_medica VARCHAR (150) NOT NULL,

	PRIMARY KEY (cpf_aluno)
);


/* Criando a tabela contrato */

CREATE TABLE contrato (
	cod_contrato INT NOT NULL,
	cpf_aluno VARCHAR (11) NOT NULL,
	matricula_func INT NOT NULL,
	Data_inicio_contr DATE NOT NULL,
	data_fim_contr DATE,

	PRIMARY KEY (cod_contrato),
	FOREIGN KEY (cpf_aluno)
	REFERENCES aluno(cpf_aluno),

	FOREIGN KEY (matricula_func)
	REFERENCES funcionario(matricula_func)
);


/* Criando a tabela para cadastrar os aparelhos */

CREATE TABLE aparelho (
	cod_aparelho INT NOT NULL,
	nome_aparelho VARCHAR (30) NOT NULL,

	PRIMARY KEY (cod_aparelho)
);


/* Criando a tabela dos exercicios */

CREATE TABLE exercicio (
	cod_exercicio INT NOT NULL,
	nome_exercicio VARCHAR (40) NOT NULL,
	cod_aparelho INT,

	PRIMARY KEY (cod_exercicio),
	FOREIGN KEY (cod_aparelho)
	REFERENCES aparelho(cod_aparelho)
);


/* Criando a tabela de treino */

CREATE TABLE treino (
	cod_treino INT NOT NULL,
	data_inicio_treino DATE NOT NULL,
	data_fim_treino DATE,
	cod_exercicio INT NOT NULL,
	cpf_aluno VARCHAR (11) NOT NULL,
	matricula_prof INT NOT NULL,

	PRIMARY KEY (cod_treino),
	FOREIGN KEY (cod_exercicio)
	REFERENCES exercicio(cod_exercicio),

	FOREIGN KEY (matricula_aluno)
	REFERENCES aluno(matricula_aluno),

	FOREIGN KEY (matricula_prof)
	REFERENCES funcionario(matricula_func)
);


/* Criando a tabela do Endereço dos Funcionarios */

CREATE TABLE endereco_funcionario (
	matricula_func INT NOT NULL,
	cep VARCHAR (8) NOT NULL,
	logradouro VARCHAR (50) NOT NULL,
	numero VARCHAR (7),
	complemento VARCHAR (10),
	bairro VARCHAR (50) NOT NULL,
	cidade VARCHAR (50) NOT NULL,
	estado VARCHAR (50) NOT NULL,

	PRIMARY KEY ( matricula_func),

	FOREIGN KEY (matricula_func)
    REFERENCES funcionario(matricula_func)
);


/* Criando a tabela dos telefones dos funcionarios */

CREATE TABLE telefone_funcionario(
	matricula_func INT NOT NULL,
	fone_celular VARCHAR (15) NOT NULL,
	fone_fixo VARCHAR (14),

    PRIMARY KEY (matricula_func),
    FOREIGN KEY (matricula_func)
    REFERENCES funcionario(matricula_func)
);


/* Criando a tabela dos telefones dos alunos */

CREATE TABLE telefone_aluno (
	cpf_aluno VARCHAR (11) NOT NULL,
	fone_celular_aluno VARCHAR (15) NOT NULL,
	fone_fixo_aluno VARCHAR (15),

	PRIMARY KEY (cpf_aluno),
	FOREIGN KEY (cpf_aluno)
	REFERENCES aluno(cpf_aluno)
);


/* Criando a tabela dos emails dos alunos */

CREATE TABLE email_aluno (
	cpf_aluno VARCHAR (11) NOT NULL,
	email_principal VARCHAR (30) NOT NULL,
	email_alternativo VARCHAR (30),

	PRIMARY KEY (cpf_aluno),
	FOREIGN KEY (cpf_aluno)
	REFERENCES aluno(cpf_aluno)
);


/* INSERINDO DADOS NA TABELA FUNCIONARIO */

INSERT INTO "funcionario" ("matricula_func", "cpf_func", "nome_func", "telefone_func", "cod_cargo") VALUES ('000001', '14712547808', 'Francisco Silva', '11954142563', '201');
INSERT INTO "funcionario" ("matricula_func", "cpf_func", "nome_func", "telefone_func", "cod_cargo") VALUES ('000002', '84312547471', 'Joao Amaral', '11957142695', '201');
INSERT INTO "funcionario" ("matricula_func", "cpf_func", "nome_func", "telefone_func", "cod_cargo") VALUES ('000003', '44712345714', 'Joana Leite', '11985473692', '201');
INSERT INTO "funcionario" ("matricula_func", "cpf_func", "nome_func", "telefone_func", "cod_cargo") VALUES ('000004', '52358698874', 'Juliana Macedo', '11982543695', '200');
INSERT INTO "funcionario" ("matricula_func", "cpf_func", "nome_func", "telefone_func", "cod_cargo") VALUES ('000005', '32563514756', 'Beatriz Moralis', '11968593486', '200');
INSERT INTO "funcionario" ("matricula_func", "cpf_func", "nome_func", "telefone_func", "cod_cargo") VALUES ('000006', '25869315705', 'Marcos Santos', '11958474369', '200');
INSERT INTO "funcionario" ("matricula_func", "cpf_func", "nome_func", "telefone_func", "cod_cargo") VALUES ('000007', '14725835698', 'Marilia Mendonça', '11954378659', '200');
INSERT INTO "funcionario" ("matricula_func", "cpf_func", "nome_func", "telefone_func", "cod_cargo") VALUES ('000008', '61325649782', 'Joao Silva', '11946897928', '201');
INSERT INTO "funcionario" ("matricula_func", "cpf_func", "nome_func", "telefone_func", "cod_cargo") VALUES ('000009', '14356298576', 'Nathan Cardoso', '11943261578', '201');
INSERT INTO "funcionario" ("matricula_func", "cpf_func", "nome_func", "telefone_func", "cod_cargo") VALUES ('000010', '24316597346', 'Wesley Safadao', '11958474364', '200');


/* INSERINDO DADOS NA TABELA ENDERECO_FUNCIONARIO */

INSERT INTO "endereco_funcionario" ("matricula_func", "cep", "logradouro", "numero", "complemento", "bairro", "cidade", "estado") VALUES ('000001','08035987','Rua Macedo', '457', 'B', 'Guaianazes', 'São Paulo', 'São Paulo');
INSERT INTO "endereco_funcionario" ("matricula_func", "cep", "logradouro", "numero", "complemento", "bairro", "cidade", "estado") VALUES ('000002','08035789','Rua Campones', '911', 'A', 'Tumtum', 'Guarulhos', 'São Paulo');
INSERT INTO "endereco_funcionario" ("matricula_func", "cep", "logradouro", "numero", "complemento", "bairro", "cidade", "estado") VALUES ('000003','08035458','Rua Campo Limpo', '710', 'C', 'Cambaleia', 'São Paulo', 'São Paulo');
INSERT INTO "endereco_funcionario" ("matricula_func", "cep", "logradouro", "numero", "complemento", "bairro", "cidade", "estado") VALUES ('000004','08035475','Rua Cartiti', '53', 'D', 'Morumbi', 'São Paulo', 'São Paulo');
INSERT INTO "endereco_funcionario" ("matricula_func", "cep", "logradouro", "numero", "complemento", "bairro", "cidade", "estado") VALUES ('000005','09685390','Rua Gambal', '349', 'E', 'Arthur Alvim', 'São Paulo', 'São Paulo');
INSERT INTO "endereco_funcionario" ("matricula_func", "cep", "logradouro", "numero", "complemento", "bairro", "cidade", "estado") VALUES ('000006','09685357','Rua Colimba', '02', 'A', 'Itaquera', 'São Paulo', 'São Paulo');
INSERT INTO "endereco_funcionario" ("matricula_func", "cep", "logradouro", "numero", "complemento", "bairro", "cidade", "estado") VALUES ('000007','08115695','Rua Einstein', '3695', 'K', 'Osasco', 'São Paulo', 'São Paulo');
INSERT INTO "endereco_funcionario" ("matricula_func", "cep", "logradouro", "numero", "complemento", "bairro", "cidade", "estado") VALUES ('000008','08015134','Rua Calimbu', '1235', 'F', 'Morumbi', 'São Paulo', 'São Paulo');
INSERT INTO "endereco_funcionario" ("matricula_func", "cep", "logradouro", "numero", "complemento", "bairro", "cidade", "estado") VALUES ('000009','08075335','Rua Botina', '1478', 'A', 'Cotia', 'Itaquacetuba', 'São Paulo');
INSERT INTO "endereco_funcionario" ("matricula_func", "cep", "logradouro", "numero", "complemento", "bairro", "cidade", "estado") VALUES ('000010','08065135','Rua Lilipa', '1245', 'E', 'São Miguel', 'São Paulo', 'São Paulo');


/*INSERINDO DADOS NA TABELA TREINO */

INSERT INTO "treino" ("cod_treino", "data_inicio_treino", "data_fim_treino","cod_exercicio","cpf_aluno","matricula_prof") VALUES ('10001', '2020-05-11','2020-07-03','03030','50874112306','000001');
INSERT INTO "treino" ("cod_treino", "data_inicio_treino", "data_fim_treino","cod_exercicio","cpf_aluno","matricula_prof") VALUES ('11002', '2020-05-13','2020-06-15','03031','35958647512','000002');
INSERT INTO "treino" ("cod_treino", "data_inicio_treino", "data_fim_treino","cod_exercicio","cpf_aluno","matricula_prof") VALUES ('12003', '2020-06-17','2020-07-10','03032','14735965236','000003');
INSERT INTO "treino" ("cod_treino", "data_inicio_treino", "data_fim_treino","cod_exercicio","cpf_aluno","matricula_prof") VALUES ('13004', '2020-09-17','2020-10-20','03033','12348543925','000002');
INSERT INTO "treino" ("cod_treino", "data_inicio_treino", "data_fim_treino","cod_exercicio","cpf_aluno","matricula_prof") VALUES ('14005', '2021-12-15','2021-12-17','03030','14257893691','000004');
INSERT INTO "treino" ("cod_treino", "data_inicio_treino", "data_fim_treino","cod_exercicio","cpf_aluno","matricula_prof") VALUES ('15006', '2021-01-10','2021-02-15','03031','34569578914','000003');
INSERT INTO "treino" ("cod_treino", "data_inicio_treino", "data_fim_treino","cod_exercicio","cpf_aluno","matricula_prof") VALUES ('16007', '2020-03-03','2020-03-03','03032','34625985311','000001');
INSERT INTO "treino" ("cod_treino", "data_inicio_treino", "data_fim_treino","cod_exercicio","cpf_aluno","matricula_prof") VALUES ('17008', '2020-03-29','2020-04-30','03033','14214535985','000001');
INSERT INTO "treino" ("cod_treino", "data_inicio_treino", "data_fim_treino","cod_exercicio","cpf_aluno","matricula_prof") VALUES ('18009', '2020-01-21','2020-02-23','03030','74857485163','000002');
INSERT INTO "treino" ("cod_treino", "data_inicio_treino", "data_fim_treino","cod_exercicio","cpf_aluno","matricula_prof") VALUES ('19010', '2020-05-07','2020-06-10','03031','36598658214','000003');
INSERT INTO "treino" ("cod_treino", "data_inicio_treino", "data_fim_treino","cod_exercicio","cpf_aluno","matricula_prof") VALUES ('20011', '2020-04-02','2020-07-03','03031','74356826743','000002');


/* INSERINDO DADOS NA TABELA EXERCICIO */

INSERT INTO "exercicio" ("cod_exercicio", "nome_exercicio", "cod_aparelho") VALUES ('03030', 'Leg Press', '01');
INSERT INTO "exercicio" ("cod_exercicio", "nome_exercicio", "cod_aparelho") VALUES ('03031', 'Cadeira Flexora', '02');
INSERT INTO "exercicio" ("cod_exercicio", "nome_exercicio", "cod_aparelho") VALUES ('03032', 'Cadeira Extensora', '03');
INSERT INTO "exercicio" ("cod_exercicio", "nome_exercicio", "cod_aparelho") VALUES ('03033', 'Cadeira Adutora', '04');


/* INSERINDO DADOS NA TABELA APARELHOS */

INSERT INTO "aparelho" ("cod_aparelho","nome_aparelho") VALUES ('01','Leg Pres');
INSERT INTO "aparelho" ("cod_aparelho","nome_aparelho") VALUES ('02','Cadeira Flexora');
INSERT INTO "aparelho" ("cod_aparelho","nome_aparelho") VALUES ('03','Cadeira Extensora');
INSERT INTO "aparelho" ("cod_aparelho","nome_aparelho") VALUES ('04','Cadeira Adutora');


/* INSERINDO DADOS NA TABELA ALUNO */

INSERT INTO "aluno" ("cpf_aluno","nome_aluno","telefone_aluno","data_nasc_aluno","email_aluno") VALUES ('50874112306','Valeria Santos','11994913946','2001-04-11','ValeriaSantos@gmail.com');
INSERT INTO "aluno" ("cpf_aluno","nome_aluno","telefone_aluno","data_nasc_aluno","email_aluno") VALUES ('35958647512','Combolinho Louco','11997944612','2001-05-03','CombolinhoLo@gmail.com');
INSERT INTO "aluno" ("cpf_aluno","nome_aluno","telefone_aluno","data_nasc_aluno","email_aluno") VALUES ('14735965236','Mario Vergara','11994687555','1998-08-04','MariaVergara@outlook.com');
INSERT INTO "aluno" ("cpf_aluno","nome_aluno","telefone_aluno","data_nasc_aluno","email_aluno") VALUES ('12348543925','Joao Victor','11994261684','1998-10-12','JoaoVi@outlook.com');
INSERT INTO "aluno" ("cpf_aluno","nome_aluno","telefone_aluno","data_nasc_aluno","email_aluno") VALUES ('14257893691','Ideia Fraca','11994017873','1997-12-05','IdeiaFraca@hotmail.com');
INSERT INTO "aluno" ("cpf_aluno","nome_aluno","telefone_aluno","data_nasc_aluno","email_aluno") VALUES ('34569578914','Gabriel Gomes','11994784227','1999-11-24','GabrielGomes@gmail.com');
INSERT INTO "aluno" ("cpf_aluno","nome_aluno","telefone_aluno","data_nasc_aluno","email_aluno") VALUES ('34625985311','Matheus Toku','11985724971','2002-09-25','MatheusToku@outlook.com');
INSERT INTO "aluno" ("cpf_aluno","nome_aluno","telefone_aluno","data_nasc_aluno","email_aluno") VALUES ('14214535985','Nathan Fellipe','11989235818','2000-10-25','NathanFellipe@gmail.com');
INSERT INTO "aluno" ("cpf_aluno","nome_aluno","telefone_aluno","data_nasc_aluno","email_aluno") VALUES ('74857485163','Ruan Claudino','11991253959','1997-08-23','RuanClaudinO@hotmail.com');
INSERT INTO "aluno" ("cpf_aluno","nome_aluno","telefone_aluno","data_nasc_aluno","email_aluno","restricao_medica") VALUES ('36598658214','Rivaldo Ximenes','11987107782','1996-12-05','Rivas@outlook.com',' Diarreia');
INSERT INTO "aluno" ("cpf_aluno","nome_aluno","telefone_aluno","data_nasc_aluno","email_aluno","restricao_medica") VALUES ('74356826743','Sai Correndo','11968474512','1995-12-27','Saicorrendo@outlook.com','Asma');


/* INSERINDO DADOS NA TABELA TELEFONE_FUNCIONARIO */

INSERT INTO "telefone_funcionario" ("matricula_func", "fone_celular", "fone_fixo") VALUES ('000001', '11954142563', '1639010196');
INSERT INTO "telefone_funcionario" ("matricula_func", "fone_celular", "fone_fixo") VALUES ('000002', '11957142695', '1327555698');
INSERT INTO "telefone_funcionario" ("matricula_func", "fone_celular", "fone_fixo") VALUES ('000003', '11985473692', '1135185623');
INSERT INTO "telefone_funcionario" ("matricula_func", "fone_celular", "fone_fixo") VALUES ('000004', '11982543695', '1127916582');
INSERT INTO "telefone_funcionario" ("matricula_func", "fone_celular", "fone_fixo") VALUES ('000005', '11968593486', '1136569184');
INSERT INTO "telefone_funcionario" ("matricula_func", "fone_celular", "fone_fixo") VALUES ('000006', '11958474369', '1129506243');
INSERT INTO "telefone_funcionario" ("matricula_func", "fone_celular", "fone_fixo") VALUES ('000007', '11954378659', '1138225043');
INSERT INTO "telefone_funcionario" ("matricula_func", "fone_celular", "fone_fixo") VALUES ('000008', '11946897928', '1135058817');
INSERT INTO "telefone_funcionario" ("matricula_func", "fone_celular", "fone_fixo") VALUES ('000009', '11943261578', '1136673639');
INSERT INTO "telefone_funcionario" ("matricula_func", "fone_celular", "fone_fixo") VALUES ('000010', '11958474364', '1128545243');


/* INSERINDO DADOS NA TABELA TELEFONE_ALUNO */

INSERT INTO "telefone_aluno" ("cpf_aluno","fone_celular_aluno") VALUES ('50874112306','11994913946');
INSERT INTO "telefone_aluno" ("cpf_aluno","fone_celular_aluno") VALUES ('35958647512','11997944612');
INSERT INTO "telefone_aluno" ("cpf_aluno","fone_celular_aluno") VALUES ('14735965236','11994687555');
INSERT INTO "telefone_aluno" ("cpf_aluno","fone_celular_aluno") VALUES ('12348543925','11994261684');
INSERT INTO "telefone_aluno" ("cpf_aluno","fone_celular_aluno") VALUES ('14257893691','11994017873');
INSERT INTO "telefone_aluno" ("cpf_aluno","fone_celular_aluno") VALUES ('34569578914','11994784227');
INSERT INTO "telefone_aluno" ("cpf_aluno","fone_celular_aluno") VALUES ('34625985311','11985724971');
INSERT INTO "telefone_aluno" ("cpf_aluno","fone_celular_aluno") VALUES ('14214535985','11989235818');
INSERT INTO "telefone_aluno" ("cpf_aluno","fone_celular_aluno","fone_fixo_aluno") VALUES ('74857485163','11991253959','1125447548');
INSERT INTO "telefone_aluno" ("cpf_aluno","fone_celular_aluno","fone_fixo_aluno") VALUES ('36598658214','11987107782','1125775968');
INSERT INTO "telefone_aluno" ("cpf_aluno","fone_celular_aluno","fone_fixo_aluno") VALUES ('74356826743','11968474512','1125447836');


/* INSERINDO DADOS NA TABELA CARGOS */

INSERT INTO "cargo" ("cod_cargo", "nome_cargo") VALUES ('200', 'Auxiliar de Recepção');
INSERT INTO "cargo" ("cod_cargo", "nome_cargo") VALUES ('201', 'Professor');


/* INSERINDO DADOS NA TABELA CONTRATO */

INSERT INTO "contrato" ("cod_contrato", "cpf_aluno", "matricula_func","data_inicio_contr","data_fim_contr") VALUES ('01010','50874112306','000005','2019-03-15','2020-03-15');
INSERT INTO "contrato" ("cod_contrato", "cpf_aluno", "matricula_func","data_inicio_contr","data_fim_contr") VALUES ('01011','35958647512','000006','2019-04-18','2020-04-18');
INSERT INTO "contrato" ("cod_contrato", "cpf_aluno", "matricula_func","data_inicio_contr","data_fim_contr") VALUES ('01012','14735965236','000007','2018-07-25','2020-07-25');
INSERT INTO "contrato" ("cod_contrato", "cpf_aluno", "matricula_func","data_inicio_contr","data_fim_contr") VALUES ('01013','12348543925','000008','2020-05-30','2021-05-30');


/* INSERINDO DADOS NA TABELA ADMINISTRADOR */

INSERT INTO "administrador" ("matricula_func", "nivel_funcao") VALUES ('000005', 'Operacional');
INSERT INTO "administrador" ("matricula_func", "nivel_funcao") VALUES ('000006', 'Operacional');
INSERT INTO "administrador" ("matricula_func", "nivel_funcao") VALUES ('000007', 'Operacional');
INSERT INTO "administrador" ("matricula_func", "nivel_funcao") VALUES ('000008', 'Operacional');
INSERT INTO "administrador" ("matricula_func", "nivel_funcao") VALUES ('000009', 'Supervisor');
INSERT INTO "administrador" ("matricula_func", "nivel_funcao") VALUES ('000010', 'Gerente');


/* INSERINDO DADOS NA TABELA Email_aluno */

INSERT INTO "email_aluno" ("cpf_aluno", "email_principal") VALUES ('50874112306', 'ValeriaSantos@gmail.com');
INSERT INTO "email_aluno" ("cpf_aluno", "email_principal") VALUES ('35958647512', 'CombolinhoLo@gmail.com');
INSERT INTO "email_aluno" ("cpf_aluno", "email_principal") VALUES ('14735965236', 'MariaVergara@outlook.com');
INSERT INTO "email_aluno" ("cpf_aluno", "email_principal") VALUES ('12348543925', 'JoaoVi@outlook.com');
INSERT INTO "email_aluno" ("cpf_aluno", "email_principal") VALUES ('14257893691', 'IdeiaFraca@hotmail.com');
INSERT INTO "email_aluno" ("cpf_aluno", "email_principal") VALUES ('34569578914', 'Gabriemes@gmail.com');
INSERT INTO "email_aluno" ("cpf_aluno", "email_principal") VALUES ('34625985311', 'Matheuoku@outlook.com');
INSERT INTO "email_aluno" ("cpf_aluno", "email_principal") VALUES ('14214535985', 'NatnFellipe@gmail.com');
INSERT INTO "email_aluno" ("cpf_aluno", "email_principal") VALUES ('74857485163', 'RuanClaudinO@hotmail.com');
INSERT INTO "email_aluno" ("cpf_aluno", "email_principal") VALUES ('36598658214', 'Rivas@outlook.com');
INSERT INTO "email_aluno" ("cpf_aluno", "email_principal") VALUES ('74356826743', 'Saicorrendo@outlook.com');


/* Inserindo dados na tabela professor */

INSERT INTO "professor" ("matricula_func", "cref") VALUES ('000001', '748946-SP');
INSERT INTO "professor" ("matricula_func", "cref") VALUES ('000002', '741859-SP');
INSERT INTO "professor" ("matricula_func", "cref") VALUES ('000003', '751236-SP');
INSERT INTO "professor" ("matricula_func", "cref") VALUES ('000004', '743589-SP');
