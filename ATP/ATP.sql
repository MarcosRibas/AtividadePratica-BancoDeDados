
CREATE TABLE pessoa (
id INT PRIMARY KEY NOT NULL,
nome VARCHAR (255) NOT NULL,
dt_nascimento DATE NOT NULL,
cpf VARCHAR (11) NOT NULL UNIQUE,
salario DECIMAL (10,2) NOT NULL,
id_tipo_pessoa INT NOT NULL);

CREATE TABLE tipo_pessoa (
id INT PRIMARY KEY NOT NULL,
descricao VARCHAR (255) NOT NULL);

CREATE TABLE departamento (
id INT PRIMARY KEY NOT NULL,
descricao VARCHAR (255) NOT NULL);

CREATE TABLE departamento_pessoa (
id INT PRIMARY KEY NOT NULL,
id_departamento INT NOT NULL,
id_pessoa INT NOT NULL);

CREATE TABLE supervisor (
id INT PRIMARY KEY NOT NULL,
id_empregado INT NOT NULL,
id_supervisor INT NOT NULL);

CREATE TABLE dependentes (
id INT PRIMARY KEY NOT NULL,
id_funcionario INT NOT NULL,
id_dependente INT NOT NULL);

CREATE TABLE projeto (
id INT PRIMARY KEY NOT NULL,
dt_inicio DATE NOT NULL,
descricao VARCHAR (255) NOT NULL);

CREATE TABLE etapa (
id INT PRIMARY KEY NOT NULL,
descricao VARCHAR (255) NOT NULL,
id_projeto INT NOT NULL);

CREATE TABLE reuniao (
id INT PRIMARY KEY NOT NULL,
id_etapa INT NOT NULL,
dt_reuniao DATE NOT NULL,
ata_reunial BLOB NOT NULL);

CREATE TABLE projeto_pessoa (
id INT PRIMARY KEY NOT NULL,
id_projeto INT NOT NULL,
id_pessoa INT NOT NULL);

ALTER TABLE pessoa ADD CONSTRAINT pessoa_id_tipo_pessoa_tipo_pessoa_id FOREIGN KEY (id_tipo_pessoa) REFERENCES tipo_pessoa(id);
ALTER TABLE departamento_pessoa ADD CONSTRAINT departamento_pessoa_id_departamento_departamento_id FOREIGN KEY (id_departamento) REFERENCES departamento(id);
ALTER TABLE departamento_pessoa ADD CONSTRAINT departamento_pessoa_id_pessoa_pessoa_id FOREIGN KEY (id_pessoa) REFERENCES pessoa(id);
ALTER TABLE supervisor ADD CONSTRAINT supervisor_id_empregado_pessoa_id FOREIGN KEY (id_empregado) REFERENCES pessoa(id);
ALTER TABLE supervisor ADD CONSTRAINT supervisor_id_supervisor_pessoa_id FOREIGN KEY (id_supervisor) REFERENCES pessoa(id);
ALTER TABLE dependentes ADD CONSTRAINT dependentes_id_funcionario_pessoa_id FOREIGN KEY (id_funcionario) REFERENCES pessoa(id);
ALTER TABLE dependentes ADD CONSTRAINT dependentes_id_dependente_pessoa_id FOREIGN KEY (id_dependente) REFERENCES pessoa(id);
ALTER TABLE etapa ADD CONSTRAINT etapa_id_projeto_projeto_id FOREIGN KEY (id_projeto) REFERENCES projeto(id);
ALTER TABLE reuniao ADD CONSTRAINT reuniao_id_etapa_etapa_id FOREIGN KEY (id_etapa) REFERENCES etapa(id);
ALTER TABLE projeto_pessoa ADD CONSTRAINT projeto_pessoa_id_projeto_projeto_id FOREIGN KEY (id_projeto) REFERENCES projeto(id);
ALTER TABLE projeto_pessoa ADD CONSTRAINT projeto_pessoa_id_pessoa_pessoa_id FOREIGN KEY (id_pessoa) REFERENCES pessoa(id);



INSERT INTO atp.tipo_pessoa (id, descricao) 
VALUES 
('1', 'Gerente'),
('2', 'Supervisor'),
('3', 'Dependente'),
('4', 'Funcionário'),
('5', 'Estagiário');

INSERT INTO atp.departamento (id, descricao) 
VALUES 
('1d', 'Comercial'),
('2d', 'Financeiro'),
('3d', 'Administrartivo'),
('4d', 'Técnologia');
INSERT INTO atp.pessoa (
id, nome, dt_nascimento, cpf, salario, id_tipo_pessoa) 
VALUES 
('1', 'Godofredo Ribeiro', '1987-04-22', '07710544462', '6000.00', '1'),
('2', 'Valentina Morais', '1988-05-13', '04466487941', '2500.00', '4'),
('3', 'Enzo Patricio', '1998-06-21', '0773334821', '3500.00', '2'),
('4', 'Roger Elias', '1978-06-11', '0773335871', '2500.00', '4'),
('5', 'Nelson Batista', '1985-08-21', '09924522215', '2500.00', '4'),
('6', 'Luana Camila', '1991-10-01', '04449866607', '2500.00', '4'),
('7', 'Ribamar Hojitem', '1978-01-04', '07728594627', '2500.00', '4'),
('8', 'Sabrina Maria', '1994-04-12', '01255577468', '2500.00', '4'),
('9', 'Marilha Silva', '1987-08-06', '04422278924', '2500.00', '4'),
('10', 'Alessandro Marrom', '1987-07-21', '04155547362', '2500.00', '4'),
('11', 'Laura Santos', '1985-02-16', '03324839857', '2500.00', '4'),
('12', 'Itair Machado', '1968-04-06', '54646823387', '2500.00', '4'),
('13', 'Lierson Luiz', '1988-04-06', '22758469213', '2500.00', '4'),
('14', 'Otavio Ribeiro', '1988-12-25', '37858469213', '2500.00', '4'),
('15', 'Luciano Martins', '1989-04-25', '58754954245', '2500.00', '4'),
('16', 'Dionatan laval', '1992-12-24', '09754522204', '3500.00', '2');

UPDATE atp.departamento SET descricao = 'dministrativo' WHERE (id = '3');

INSERT INTO atp.projeto (id, dt_inicio, descricao) VALUES ('1P', '2016-12-24', 'Aplicativo Redux');
INSERT INTO atp.projeto (id, dt_inicio, descricao) VALUES ('2P', '2016-01-03', 'Site CONECT');
INSERT INTO atp.projeto (id, dt_inicio, descricao) VALUES ('3P', '2016-11-06', 'Sistema Nextrim');
INSERT INTO atp.projeto (id, dt_inicio, descricao) VALUES ('4P', '2017-02-21', 'Site MultiCasa');
INSERT INTO atp.projeto (id, dt_inicio, descricao) VALUES ('5P', '2017-04-11', 'Aplicativo GasBin');
INSERT INTO atp.projeto (id, dt_inicio, descricao) VALUES ('6P', '2017-06-22', 'Sistema Monte Rei');
INSERT INTO atp.projeto (id, dt_inicio, descricao) VALUES ('7P', '2018-06-22', 'Site Emporio dos Cavaquinhos');
INSERT INTO atp.projeto (id, dt_inicio, descricao) VALUES ('8P', '2018-12-11', 'Aplicativo Baralho do Barulho');
INSERT INTO atp.projeto (id, dt_inicio, descricao) VALUES ('9P', '2018-12-23', 'Sitema InfoAr');
INSERT INTO atp.projeto (id, dt_inicio, descricao) VALUES ('10P', '2019-02-15', 'Sistema Lorinet');
INSERT INTO atp.projeto (id, dt_inicio, descricao) VALUES ('11P', '2019-04-21', 'Aplicativo Cyberflux');
INSERT INTO atp.projeto (id, dt_inicio, descricao) VALUES ('12', '2019-06-11', 'Site GarageAf');
INSERT INTO atp.projeto (id, dt_inicio, descricao) VALUES ('13', '2019-06-23', 'Sie Farmácia Leal');
INSERT INTO atp.projeto (id, dt_inicio, descricao) VALUES ('14', '2019-06-24', 'Sistema Farmácia Leal');
INSERT INTO atp.projeto (id, dt_inicio, descricao) VALUES ('15', '2020-01-22', 'Site Terar Serralheria');

INSERT INTO atp.etapa (id, descricao, id_projeto) VALUES ('1', 'Concluido', '1');
INSERT INTO atp.etapa (id, descricao, id_projeto) VALUES ('2', 'Concluido', '2');
INSERT INTO atp.etapa (id, descricao, id_projeto) VALUES ('3', 'Concluido', '3');
INSERT INTO atp.etapa (id, descricao, id_projeto) VALUES ('4', 'Concluido', '4');
INSERT INTO atp.etapa (id, descricao, id_projeto) VALUES ('5', 'Concluido', '5');
INSERT INTO atp.etapa (id, descricao, id_projeto) VALUES ('6', 'Concluido', '6');
INSERT INTO atp.etapa (id, descricao, id_projeto) VALUES ('7', 'Concluido', '7');
INSERT INTO atp.etapa (id, descricao, id_projeto) VALUES ('8', 'Concluido', '8');
INSERT INTO atp.etapa (id, descricao, id_projeto) VALUES ('9', 'Concluido', '9');
INSERT INTO atp.etapa (id, descricao, id_projeto) VALUES ('10', 'Em desenvolvimento', '10');
INSERT INTO atp.etapa (id, descricao, id_projeto) VALUES ('11', 'Em desenvolvimento', '11');
INSERT INTO atp.etapa (id, descricao, id_projeto) VALUES ('12', 'Em desenvolvimento', '12');
INSERT INTO atp.etapa (id, descricao, id_projeto) VALUES ('13', 'Em desenvolvimento', '13');
INSERT INTO atp.etapa (id, descricao, id_projeto) VALUES ('14', 'Coleta de dados', '14');
INSERT INTO atp.etapa (id, descricao, id_projeto) VALUES ('15', 'Coleta de dados', '15');

INSERT INTO atp.pessoa (id, nome, dt_nascimento, cpf, salario, id_tipo_pessoa) 
VALUES 
('17', 'Luan Silva', '1987-08-30', '09422585647', '6000.00', '1'),
('18', 'Roberta Salto', '1985-02-15', '46687696568', '6000.00', '1'),
('19', 'Silvio Gabriel', '1994-12-25', '44785496216', '6000.00', '1'),
('20', 'Carlos Miranda', '1978-10-01', '47822542245', '3500.00', '2'),
('21', 'Marcia Fonseca', '1989-04-26', '07895432665', '3500.00', '2');

INSERT INTO atp.departamento_pessoa (id, id_departamento, id_pessoa) 
VALUES 
('1', '1', '1'),
('2', '2', '17'),
('3', '3', '18'),
('4', '4', '19'),
('5', '1', '3'),
('6', '2', '16'),
('7', '3', '20'),
('8', '4', '21'),
('9', '1', '2'),
('10', '1', '4'),
('11', '1', '5'),
('12', '1', '6'),
('13', '2', '7'),
('14', '2', '8'),
('15', '2', '9'),
('16', '3', '10'),
('17', '3', '11'),
('18', '3', '12'),
('19', '4', '13'),
('20', '4', '14'),
('21', '4', '15');

ALTER TABLE pessoa
ADD COLUMN sexo enum ( 'M' , 'F' );

UPDATE atp.pessoa SET sexo = 'M' WHERE (`id` = '1');
UPDATE atp.pessoa SET sexo = 'F' WHERE (`id` = '2');
UPDATE atp.pessoa SET sexo = 'M' WHERE (`id` = '3');
UPDATE atp.pessoa SET sexo = 'M' WHERE (`id` = '4');
UPDATE atp.pessoa SET sexo = 'M' WHERE (`id` = '5');
UPDATE atp.pessoa SET sexo = 'F' WHERE (`id` = '6');
UPDATE atp.pessoa SET sexo = 'M' WHERE (`id` = '7');
UPDATE atp.pessoa SET sexo = 'F' WHERE (`id` = '8');
UPDATE atp.pessoa SET sexo = 'F' WHERE (`id` = '9');
UPDATE atp.pessoa SET sexo = 'M' WHERE (`id` = '10');
UPDATE atp.pessoa SET sexo = 'F' WHERE (`id` = '11');
UPDATE atp.pessoa SET sexo = 'M' WHERE (`id` = '12');
UPDATE atp.pessoa SET sexo = 'M' WHERE (`id` = '13');
UPDATE atp.pessoa SET sexo = 'M' WHERE (`id` = '14');
UPDATE atp.pessoa SET sexo = 'M' WHERE (`id` = '15');
UPDATE atp.pessoa SET sexo = 'M' WHERE (`id` = '16');
UPDATE atp.pessoa SET sexo = 'M' WHERE (`id` = '17');
UPDATE atp.pessoa SET sexo = 'F' WHERE (`id` = '18');
UPDATE atp.pessoa SET sexo = 'M' WHERE (`id` = '19');
UPDATE atp.pessoa SET sexo = 'M' WHERE (`id` = '20');
UPDATE atp.pessoa SET sexo = 'F' WHERE (`id` = '21');

UPDATE atp.pessoa SET salario = '7000.00' WHERE (`id` = '1');

UPDATE atp.pessoa SET id_tipo_pessoa = '3' WHERE (`id` = '2');
UPDATE atp.pessoa SET id_tipo_pessoa = '3' WHERE (`id` = '7');
UPDATE atp.pessoa SET id_tipo_pessoa = '3' WHERE (`id` = '9');
UPDATE atp.pessoa SET id_tipo_pessoa = '3' WHERE (`id` = '14');

INSERT INTO atp.dependentes (`id`, `id_funcionario`, `id_dependente`) 
VALUES 
('1', '3', '2'),
('2', '16', '7'),
('3', '20', '9'),
('4', '21', '14');

INSERT INTO atp.projeto_pessoa (id, id_projeto, id_pessoa) VALUES 
('1', '10', '10'),
('2', '9', '11'),
('3', '8', '12'),
('4', '7', '13'),
('5', '6', '14'),
('6', '5', '15'),
('7', '4', '10'),
('8', '3', '11'),
('9', '2', '12'),
('10', '1', '13'),
('11', '11', '9'),
('12', '12', '8'),
('13', '13', '7'),
('14', '14', '6'),
('15', '15', '5'),
('4');

