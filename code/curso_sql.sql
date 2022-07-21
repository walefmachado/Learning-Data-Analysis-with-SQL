CREATE DATABASE curso_sql; 

USE curso_sql;

CREATE TABLE funcionarios 
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    salario double not null default '0',
    departamento varchar(45) not null,
    PRIMARY KEY (id)
);

CREATE TABLE veiculos 
(
	id int unsigned not null auto_increment,
    funcionario_id int unsigned default null,
    veiculo varchar(45) not null default '',
    placa varchar(10) not null default '',
    PRIMARY KEY (id),
    constraint fk_veiculos_funcionarios foreign key (funcionario_id) references funcionarios (id)
);

create table salarios
(
	faixa varchar(45) not null,
    inicio double not null,
    fim double not null,
    primary key (faixa)
);

ALTER TABLE funcionarios CHANGE COLUMN nome nome_func varchar(50) not null;
ALTER TABLE funcionarios CHANGE COLUMN nome_func nome varchar(45) not null;

DROP TABLE salarios; 

CREATE INDEX departamentos ON funcionarios (departamento);
CREATE INDEX nomes ON funcionarios (nome(6));


INSERT INTO funcionarios (id, nome, salario, departamento) VALUES (1, 'Fernando', 1400, 'TI');
INSERT INTO funcionarios (id, nome, salario, departamento) VALUES (2, 'Guilherme', 2500, 'Jurídico');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Fabio', 1700, 'Jurídico');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Isabela', 2200, 'Jurídico');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('José', 1800, 'Marketing');


select * from funcionarios;
select * from funcionarios where salario > 2000;
select * from funcionarios where nome = 'José';
select * from funcionarios where id = '3';

update funcionarios set salario = salario * 1.1 where id = 1;

SET SQL_SAFE_UPDATES = 0;
/* 
SET SQL_SAFE_UPDATES = 1;
*/

update funcionarios set salario = salario * 1.1;
update funcionarios set salario = round(salario * 1.1, 2);

delete from funcionarios where id = 4;

insert into veiculos (funcionario_id, veiculo, placa) values (1, 'Carro', 'SB-0001');
insert into veiculos (funcionario_id, veiculo, placa) values (1, 'Carro', 'SB-0002');

update veiculos set funcionario_id = 5 where id = 2; 
select * from veiculos; 

insert into salarios (faixa, inicio, fim) values ('Analista Jr', 1000, 2000);
insert into salarios (faixa, inicio, fim) values ('Analista pleno', 2000, 4000); 

select * from salarios;
select * from funcionarios f where salario > 2000; 

select nome, salario from funcionarios f where f.salario > 2000;

select * from funcionarios where nome = 'Guilherme'
union 
select * from funcionarios where id = '5';


select * from funcionarios where nome = 'Guilherme'
union all
select * from funcionarios where nome = 'Guilherme';


/*
	Relacionamentos e Visões 
*/ 

USE curso_sql; /* sempre utilizar */ 

/*
	Relacionamentos
*/

select * from funcionarios; 
select * from veiculos; 

select * from funcionarios inner join veiculos on veiculos.funcionario_id = funcionarios.id;
select * from funcionarios f inner join veiculos v on v.funcionario_id = f.id;

select * from funcionarios f left join veiculos v on v.funcionario_id = f.id;
select * from funcionarios f right join veiculos v on v.funcionario_id = f.id;


insert into veiculos (funcionario_id, veiculo, placa) values (null, 'moto', 'SB-0003');


select * from funcionarios f inner join veiculos v on v.funcionario_id = f.id;
select * from funcionarios f left join veiculos v on v.funcionario_id = f.id;
select * from funcionarios f right join veiculos v on v.funcionario_id = f.id;

select * from funcionarios f left join veiculos v on v.funcionario_id = f.id
union
select * from funcionarios f right join veiculos v on v.funcionario_id = f.id;

create table cpfs
(
	id int unsigned not null,
    cpf varchar(14) not null,
    primary key (id),
    constraint fk_cpf foreign key (id) references funcionarios (id)
);

insert into cpfs (id, cpf) values(1	,'111.111.111-11');
insert into cpfs (id, cpf) values(2,'222.222.222-22');
insert into cpfs (id, cpf) values(3,'333.333.333-33');
insert into cpfs (id, cpf) values(5,'555.555.555-55');


select * from cpfs;

select * from funcionarios inner join cpfs on funcionarios.id = cpfs.id;
select * from funcionarios inner join cpfs using(id);


create table clientes
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null, 
    quem_indicou int unsigned,
    primary key (id),
    constraint fk_quem_indicou foreign key (quem_indicou) references clientes (id)
);

insert into clientes (id, nome, quem_indicou) values (1, 'André', NULL);
insert into clientes (id, nome, quem_indicou) values (2, 'Samuel', 1);
insert into clientes (id, nome, quem_indicou) values (3, 'Carlos', 2);
insert into clientes (id, nome, quem_indicou) values (4, 'Rafael', 1);

select * from clientes;

select A.nome as 'cliente', B.nome as 'quem indicou' 
	from clientes A join clientes B on A.quem_indicou = B.id; 

select * from funcionarios 
	inner join veiculos on veiculos.funcionario_id = funcionarios.id 
    inner join cpfs on cpfs.id = funcionarios.id;
    
/*
	Visões
*/

create view funcionarios_a as select * from funcionarios where salario >= 1700;

select * from funcionarios_a;
update funcionarios set salario = 1500 where id = 3;

drop view funcionarios_a;

create view funcionarios_a as select * from funcionarios where salario >= 2000;

/*
	Avaliação 
*/

create table instrutores
(
	id int unsigned not null auto_increment,
    inst varchar(45) not null, 
    primary key (id)
);

insert into instrutores (id, inst) values (1, 'André');
insert into instrutores (id, inst) values (2, 'Carlos');
insert into instrutores (id, inst) values (3, 'Samuel');
insert into instrutores (id, inst) values (4, 'Fábio');

create table cursos
(
	id int unsigned not null auto_increment,
    ins varchar(45), 
    titulo varchar(45),
    primary key (id)
);

insert into cursos (id, ins, titulo) values (1, 1, 'java');
insert into cursos (id, ins, titulo) values (2, NULL, 'php');
insert into cursos (id, ins, titulo) values (3, 1, 'mysql');
insert into cursos (id, ins, titulo) values (4, 3, 'sql');
insert into cursos (id, ins, titulo) values (5, 2, 'c++');

select * from instrutores;
select * from cursos;

select * from instrutores inner join cursos using (id);
select * from instrutores left join on instrutores.id = cursos.ins;

select * from instrutores right join cursos on instrutores.inst = cursos.titulo;
select * from instrutores inner join cursos on instrutores.id = cursos.ins;
select * from instrutores full join cursos on instrutores.id = cursos.ins;

drop table cursos;
drop table instrutores;

/* Fim avaliação */ 


/*
	Subqueries
*/

USE curso_sql; /* sempre utilizar */ 

SELECT COUNT(*) FROM funcionarios;
SELECT COUNT(*) FROM funcionarios WHERE salario > 2000;
SELECT COUNT(*) FROM funcionarios WHERE salario > 1600 AND departamento = 'Jurídico';

SELECT SUM(salario) FROM funcionarios;
SELECT SUM(salario) FROM funcionarios WHERE departamento = 'TI';

SELECT AVG(salario) FROM funcionarios;
SELECT AVG(salario) FROM funcionarios WHERE departamento = 'TI';

SELECT MAX(salario) FROM funcionarios;
SELECT MAX(salario) FROM funcionarios WHERE departamento = 'TI';

SELECT MIN(salario) FROM funcionarios;
SELECT MIN(salario) FROM funcionarios WHERE departamento = 'TI';

SELECT departamento FROM funcionarios;
SELECT distinct(departamento) FROM funcionarios;

SELECT * FROM funcionarios ORDER BY nome;
SELECT * FROM funcionarios ORDER BY nome DESC;

SELECT * FROM funcionarios ORDER BY salario;
SELECT * FROM funcionarios ORDER BY departamento;
SELECT * FROM funcionarios ORDER BY departamento, salario;
SELECT * FROM funcionarios ORDER BY departamento DESC, salario DESC;

SELECT * FROM funcionarios LIMIT 2;
SELECT * FROM funcionarios LIMIT 2 OFFSET 1;
SELECT * FROM funcionarios LIMIT 1, 2;

/* Agrupamento */ 

SELECT AVG(salario) FROM funcionarios WHERE departamento = 'TI';
SELECT AVG(salario) FROM fu ncionarios WHERE departamento = 'Jurídico';

SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento;
SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000;

SELECT departamento, COUNT(*) FROM funcionarios GROUP BY departamento;


/* Subqueries */  

SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento;
SELECT nome FROM funcionarios WHERE departamento = 'TI' OR departamento = 'Jurídico';

SELECT nome FROM funcionarios WHERE departamento IN('TI', 'Jurídico');

SELECT nome FROM funcionarios 
	WHERE departamento IN
    (
		SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000
    );

select * from funcionarios;
select count(salario) from funcionarios where departamento = 'Jurídico';

/* 
	Avaliação  
*/ 

create table pilotos
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null, 
    equipe varchar(2) not null,
    pontos int unsigned not null,
    primary key (id)
);

insert into pilotos (id, nome, equipe, pontos) values (1, 'fernando', 'A', 2);
insert into pilotos (id, nome, equipe, pontos) values (2, 'paulo', 'B', 5);
insert into pilotos (id, nome, equipe, pontos) values (3, 'richa', 'A', 3);
insert into pilotos (id, nome, equipe, pontos) values (4, 'gomes', 'C', 6);
insert into pilotos (id, nome, equipe, pontos) values (5, 'fred', 'B', 7);

select * from pilotos;

SELECT * FROM pilotos WHERE equipe IN(SELECT equipe FROM pilotos GROUP BY equipe HAVING SUM(pontos) > 5);
SELECT COUNT(*) FROM pilotos WHERE equipe != 'C';
SELECT MAX(pontos) FROM pilotos WHERE equipe != 'B';
SELECT * FROM pilotos ORDER BY pontos DESC LIMIT 1;

DROP TABLE pilotos;

/* Fim avaliação */


/* 
	Controle de acesso 
*/ 

/* CREATE USER 'walef'@'200.200.190.190' IDENTIFIED BY 'machado123456'; */ 
/* CREATE USER 'walef'@'%' IDENTIFIED BY 'machado123456';*/ 

CREATE USER 'walef'@'localhost' IDENTIFIED BY 'machado123456'; 
GRANT ALL ON curso_sql.* TO 'walef'@localhost;

CREATE USER 'walef'@'%' IDENTIFIED BY 'walefviagem'; 
GRANT SELECT ON curso_sql.* TO 'walef'@'%'; 
GRANT INSERT ON curso_sql.funcionarios TO 'walef'@'%';

/* GRANT SELECT ON curso_sql.* TO 'walef'@'%'; */ 


SELECT User FROM mysql.user;
SHOW GRANTS FOR 'walef'@'%';

REVOKE INSERT ON curso_sql.funcionarios FROM 'walef'@'%'; 
REVOKE SELECT ON curso_sql.* FROM 'walef'@'%'; 

REVOKE ALL ON curso_sql.* FROM 'walef'@'localhost'; 

DROP USER 'walef'@'localhost';
DROP USER 'walef'@'%';

grant * on veiculos to 'walef'@localhost; 

/* 
	Transações
*/ 


USE curso_sql;

SHOW  ENGINES;

CREATE TABLE contas_bancarias
(
	id int unsigned not null auto_increment,
    titular varchar(45) not null, 
    saldo double not null,
    PRIMARY KEY (id)
) engine = InnoDB;  


INSERT INTO contas_bancarias (titular, saldo) VALUES ('André', 1000);
INSERT INTO contas_bancarias (titular, saldo) VALUES ('Carla', 2000);

SELECT * FROM contas_bancarias;

START TRANSACTION;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
ROLLBACK;

START TRANSACTION;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
COMMIT;

/*
	Stored Procedures and Triggers
*/

USE curso_sql;

CREATE TABLE pedidos 
(
	id int unsigned not null auto_increment,
    descrição varchar(100) not null, 
    valor double not null default '0',
    pago varchar(3) not null default 'Não',
    primary key(id)
);

INSERT INTO pedidos (descrição, valor) values ('TV', 3000);
INSERT INTO pedidos (descrição, valor) values ('Geladeira', 1400);
INSERT INTO pedidos (descrição, valor) values ('DVD', 300); 

select * from pedidos;	

UPDATE pedidos SET pago = 'sim' WHERE id = 8;

CALL limpa_pedidos();


CREATE TABLE estoque 
(
	id int unsigned not null auto_increment,
    descrição varchar(100) not null, 
    quantidade int not null,
    primary key(id)
);

CREATE TRIGGER gatilho_limpa_pedidos
	BEFORE INSERT ON estoque 
    FOR EACH ROW 
		CALL limpa_pedidos();

select * from pedidos;

insert into estoque (descrição, quantidade) values ('forno', 3);

select * from estoque;

