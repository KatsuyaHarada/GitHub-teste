create database ControleVeiculosWEB;
use ControleVeiculosWEB;


create table Usuários(
ID_Usuários int auto_increment primary key not null,
Usuário_Usuários varchar(100) not null,
Login_Usuários varchar(20) not null,
Direito_Usuários varchar(50),
Senha_Usuários varchar(1000) not null,
Del varchar(1));

INSERT INTO Usuários VALUES(1, 'admin', 'admin', 'Administração', 'admin', 'N');
select * from usuários;


create table Usuários_Auditoria(
ID_Auditoria int auto_increment primary key not null,
ID_Usuários int not null,
Usuário_Usuários varchar(100) not null,
Login_Usuários varchar(20) not null,
Direito_Usuários varchar(50),
Data_Usuários  date DEFAULT NULL,
Hora_Usuários time DEFAULT NULL,
Del varchar(1),
Ação_Usuários varchar(20) DEFAULT NULL);

DELIMITER $$
CREATE TRIGGER AntesDeUpdate_Usuários 
BEFORE UPDATE ON Usuários
FOR EACH ROW BEGIN
IF NEW.Del = 'S' then
INSERT INTO Usuários_Auditoria
SET ID_Usuários = OLD.ID_Usuários,
Usuário_Usuários = OLD.Usuário_Usuários,
Login_Usuários = OLD.Login_Usuários,
Direito_Usuários = OLD.Direito_Usuários,
Del = OLD.Del,
Ação_Usuários = 'DELETE',
Data_Usuários = NOW(),
Hora_Usuários = NOW();
ELSE
INSERT INTO Usuários_Auditoria
SET ID_Usuários = OLD.ID_Usuários,
Usuário_Usuários = OLD.Usuário_Usuários,
Login_Usuários = OLD.Login_Usuários,
Direito_Usuários = OLD.Direito_Usuários,
Del = OLD.Del,
Ação_Usuários = 'DELETE',
Data_Usuários = NOW(),
Hora_Usuários = NOW();
END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER AntesDeInsert_Usuários 
AFTER INSERT ON Usuários
FOR EACH ROW BEGIN
INSERT INTO Usuários_Auditoria
SET ID_Usuários = NEW.ID_Usuários,
Usuário_Usuários = NEW.Usuário_Usuários,
Login_Usuários = NEW.Login_Usuários,
Direito_Usuários = NEW.Direito_Usuários,
Del = NEW.Del,
Data_Usuários = NOW(),
Hora_Usuários = NOW(),
Ação_Usuários = 'INSERT';
END$$
DELIMITER ;



create table CadastrodeEmpresas(
ID_CadastrodeEmpresas int auto_increment primary key not null,
CNPJ_CadastrodeEmpresas varchar(100) not null,
RazãoSocial_CadastrodeEmpresas varchar(100) not null,
Endereço_CadastrodeEmpresas varchar(100),
Cidade_CadastrodeEmpresas varchar(100),
Estado_CadastrodeEmpresas varchar(2),
Del varchar(1));

SELECT * from CadastrodeEmpresas WHERE CNPJ_CadastrodeEmpresas like '%%' and RazãoSocial_CadastrodeEmpresas like '%a%' and Cidade_CadastrodeEmpresas like '%%' and Estado_CadastrodeEmpresas like '%%'  and Del = 'N' LIMIT 30;

create table CadastrodeEmpresas_Auditoria(
ID_Auditoria int not null primary key auto_increment,
ID_CadastrodeEmpresas int not null,
CNPJ_CadastrodeEmpresas varchar(100) not null,
RazãoSocial_CadastrodeEmpresas varchar(100) not null,
Endereço_CadastrodeEmpresas varchar(100),
Cidade_CadastrodeEmpresas varchar(100),
Estado_CadastrodeEmpresas varchar(2),
Data_Empresas date DEFAULT NULL,
Hora_Empresas time DEFAULT NULL,
Ação_Empresas varchar(30) DEFAULT NULL,
Del varchar(1));

DELIMITER $$
CREATE TRIGGER AntesDeUpdate_Empresas 
BEFORE UPDATE ON CadastrodeEmpresas
FOR EACH ROW BEGIN
IF NEW.Del = 'S' then
INSERT INTO CadastrodeEmpresas_Auditoria
SET ID_CadastrodeEmpresas = OLD.ID_CadastrodeEmpresas,
CNPJ_CadastrodeEmpresas = OLD.CNPJ_CadastrodeEmpresas,
RazãoSocial_CadastrodeEmpresas = OLD.RazãoSocial_CadastrodeEmpresas,
Endereço_CadastrodeEmpresas = OLD.Endereço_CadastrodeEmpresas,
Cidade_CadastrodeEmpresas = OLD.Cidade_CadastrodeEmpresas,
Estado_CadastrodeEmpresas = OLD.Estado_CadastrodeEmpresas,
Del = OLD.Del,
Ação_Empresas = 'DELETE',
Data_Empresas = NOW(),
Hora_Empresas = NOW();
else
INSERT INTO CadastrodeEmpresas_Auditoria
SET ID_CadastrodeEmpresas = OLD.ID_CadastrodeEmpresas,
CNPJ_CadastrodeEmpresas = OLD.CNPJ_CadastrodeEmpresas,
RazãoSocial_CadastrodeEmpresas = OLD.RazãoSocial_CadastrodeEmpresas,
Endereço_CadastrodeEmpresas = OLD.Endereço_CadastrodeEmpresas,
Cidade_CadastrodeEmpresas = OLD.Cidade_CadastrodeEmpresas,
Estado_CadastrodeEmpresas = OLD.Estado_CadastrodeEmpresas,
Del = OLD.Del,
Ação_Empresas = 'UPDATE',
Data_Empresas = NOW(),
Hora_Empresas = NOW();
END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER AntesDeInsert_Empresas 
AFTER INSERT ON CadastrodeEmpresas
FOR EACH ROW BEGIN
INSERT INTO CadastrodeEmpresas_Auditoria
SET ID_CadastrodeEmpresas = NEW.ID_CadastrodeEmpresas,
CNPJ_CadastrodeEmpresas = NEW.CNPJ_CadastrodeEmpresas,
RazãoSocial_CadastrodeEmpresas = NEW.RazãoSocial_CadastrodeEmpresas,
Endereço_CadastrodeEmpresas = NEW.Endereço_CadastrodeEmpresas,
Cidade_CadastrodeEmpresas = NEW.Cidade_CadastrodeEmpresas,
Estado_CadastrodeEmpresas = NEW.Estado_CadastrodeEmpresas,
Del = NEW.Del,
Ação_Empresas = 'INSERT',
Data_Empresas = NOW(),
Hora_Empresas = NOW();
END$$
DELIMITER ;






create table Departamentos(
ID_Departamentos int auto_increment primary key not null,
Descrição_Departamentos varchar(100),
Del varchar(1));

create table Departamentos_Auditoria(
ID_Auditoria int not null auto_increment primary key,
ID_Departamentos int not null,
Descrição_Departamentos varchar(100),
Data_Departamentos date DEFAULT NULL,
Hora_Departamentos time DEFAULT NULL,
Ação_Departamentos varchar(30) DEFAULT NULL,
Del varchar(1));

DELIMITER $$
CREATE TRIGGER AntesDeUpdate_Departamentos
BEFORE UPDATE ON Departamentos
FOR EACH ROW BEGIN
IF NEW.Del = 'S' then
INSERT INTO Departamentos_Auditoria
SET ID_Departamentos = OLD.ID_Departamentos,
Descrição_Departamentos = OLD.Descrição_Departamentos,
Del = OLD.Del,
Ação_Departamentos = 'DELETE',
Data_Departamentos = NOW(),
Hora_Departamentos = NOW();
ELSE
INSERT INTO Departamentos_Auditoria
SET ID_Departamentos = OLD.ID_Departamentos,
Descrição_Departamentos = OLD.Descrição_Departamentos,
Del = OLD.Del,
Ação_Departamentos = 'UPDATE',
Data_Departamentos = NOW(),
Hora_Departamentos = NOW();
END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER AntesDeInsert_Departamentos
AFTER INSERT ON Departamentos
FOR EACH ROW BEGIN
INSERT INTO Departamentos_Auditoria
SET ID_Departamentos = NEW.ID_Departamentos,
Descrição_Departamentos = NEW.Descrição_Departamentos,
Del = NEW.Del,
Ação_Departamentos = 'INSERT',
Data_Departamentos = NOW(),
Hora_Departamentos = NOW();
END$$
DELIMITER ;




create table CargodosColaboradores(
ID_CargodosColaboradores int auto_increment primary key not null,
Descrição_CargodosColaboradores varchar(100),
ID_Departamentos int,
Del varchar(1));

create table CargodosColaboradores_Auditoria(
ID_Auditoria int not null auto_increment primary key,
ID_CargodosColaboradores int not null,
Descrição_CargodosColaboradores varchar(100),
ID_Departamentos int,
Del varchar(1),
Data_Cargo date DEFAULT NULL,
Hora_Cargo time DEFAULT NULL,
Ação_Cargo varchar(20) DEFAULT NULL);

DELIMITER $$
CREATE TRIGGER AntesDeUpdate_Cargos
BEFORE UPDATE ON  CargodosColaboradores
FOR EACH ROW BEGIN
IF NEW.Del = 'S' then
INSERT INTO CargodosColaboradores_Auditoria
SET ID_CargodosColaboradores = OLD.ID_CargodosColaboradores,
Descrição_CargodosColaboradores = OLD.Descrição_CargodosColaboradores,
ID_Departamentos = OLD.ID_Departamentos,
Del = OLD.Del,
Ação_Cargo = 'DELETE',
Data_Cargo = NOW(),
Hora_Cargo = NOW();
ELSE
INSERT INTO CargodosColaboradores_Auditoria
SET ID_CargodosColaboradores = OLD.ID_CargodosColaboradores,
Descrição_CargodosColaboradores = OLD.Descrição_CargodosColaboradores,
ID_Departamentos = OLD.ID_Departamentos,
Del = OLD.Del,
Ação_Cargo = 'UPDATE',
Data_Cargo = NOW(),
Hora_Cargo = NOW();
END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER AntesDeInsert_Cargos
AFTER INSERT ON  CargodosColaboradores
FOR EACH ROW BEGIN
INSERT INTO CargodosColaboradores_Auditoria
SET ID_CargodosColaboradores = NEW.ID_CargodosColaboradores,
Descrição_CargodosColaboradores = NEW.Descrição_CargodosColaboradores,
ID_Departamentos = NEW.ID_Departamentos,
Del = NEW.Del,
Ação_Cargo = 'INSERT',
Data_Cargo = NOW(),
Hora_Cargo = NOW();
END $$
DELIMITER ;




create table Colaboradores(
ID_Colaboradores int auto_increment primary key not null,
CodCrachá_Colaboradoes int not null,
Nome_Colaboradores varchar(100) not null,
CPF_Colaboradores varchar(30) not null,
Sexo_Colaboradores varchar(10) not null,
DataNascimento_Colaboradores date not null,
ID_CadastrodeEmpresas int,
foreign key (ID_CadastrodeEmpresas) references CadastrodeEmpresas (ID_CadastrodeEmpresas),
ID_Departamentos int,
foreign key (ID_Departamentos) references Departamentos (ID_Departamentos),
ID_CargodosColaboradores int,
foreign key (ID_CargodosColaboradores) references CargodosColaboradores (ID_CargodosColaboradores),
Ativo_Colaboradores varchar(3),
DataAdmição_Colaboradores date,
DataDemissão_Colaboradores date,
Del varchar(1));

SELECT * from Colaboradores where ID_CargodosColaboradores = 2 and Del = 'N';

SELECT * from Colaboradores WHERE CodCrachá_Colaboradoes like '%%'
                      and CPF_Colaboradores like '%%' 
                      and  Nome_Colaboradores like '%%'
                     and ID_CadastrodeEmpresas like '%%'
                     and ID_Departamentos like '%%'
                     and ID_CargodosColaboradores like '%%'
                     and Sexo_Colaboradores like '%%'
                     and Ativo_Colaboradores like '%%'
                     and Del = 'N'  LIMIT 30;

create table Colaboradores_Auditoria(
ID_Auditoria int not null auto_increment primary key,
ID_Colaboradores int not null,
CodCrachá_Colaboradoes int not null,
Nome_Colaboradores varchar(100) not null,
CPF_Colaboradores varchar(30) not null,
Sexo_Colaboradores varchar(10) not null,
DataNascimento_Colaboradores date not null,
ID_CadastrodeEmpresas int,
ID_Departamentos int,
ID_CargodosColaboradores int,
Ativo_Colaboradores varchar(3),
DataAdmição_Colaboradores date,
DataDemissão_Colaboradores date,
Del varchar(1),
Data_Colaboradores date,
Hora_Colaboradores time,
Ação_Colaboradores varchar(30));

DELIMITER $$
CREATE TRIGGER AntesDeUpdate_Colaboradores
BEFORE UPDATE ON  Colaboradores
FOR EACH ROW BEGIN
IF NEW.Del = 'S' then
INSERT INTO Colaboradores_Auditoria
SET ID_Colaboradores = OLD.ID_Colaboradores,
CodCrachá_Colaboradoes = OLD.CodCrachá_Colaboradoes,
Nome_Colaboradores = OLD.Nome_Colaboradores,
CPF_Colaboradores = OLD.CPF_Colaboradores,
Sexo_Colaboradores = OLD.Sexo_Colaboradores,
DataNascimento_Colaboradores = OLD.DataNascimento_Colaboradores,
ID_CadastrodeEmpresas = OLD.ID_CadastrodeEmpresas,
ID_Departamentos = OLD.ID_Departamentos,
ID_CargodosColaboradores = OLD.ID_CargodosColaboradores,
Ativo_Colaboradores = OLD.Ativo_Colaboradores,
DataAdmição_Colaboradores = OLD.DataAdmição_Colaboradores,
DataDemissão_Colaboradores = OLD.DataDemissão_Colaboradores,
Del = OLD.Del,
Ação_Colaboradores  = 'DELETE',
Data_Colaboradores = NOW(),
Hora_Colaboradores = NOW();
ELSE
INSERT INTO Colaboradores_Auditoria
SET ID_Colaboradores = OLD.ID_Colaboradores,
CodCrachá_Colaboradoes = OLD.CodCrachá_Colaboradoes,
Nome_Colaboradores = OLD.Nome_Colaboradores,
CPF_Colaboradores = OLD.CPF_Colaboradores,
Sexo_Colaboradores = OLD.Sexo_Colaboradores,
DataNascimento_Colaboradores = OLD.DataNascimento_Colaboradores,
ID_CadastrodeEmpresas = OLD.ID_CadastrodeEmpresas,
ID_Departamentos = OLD.ID_Departamentos,
ID_CargodosColaboradores = OLD.ID_CargodosColaboradores,
Ativo_Colaboradores = OLD.Ativo_Colaboradores,
DataAdmição_Colaboradores = OLD.DataAdmição_Colaboradores,
DataDemissão_Colaboradores = OLD.DataDemissão_Colaboradores,
Del = OLD.Del,
Ação_Colaboradores  = 'UPDATE',
Data_Colaboradores = NOW(),
Hora_Colaboradores = NOW();
END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER AntesDeInsert_Colaboradores
AFTER INSERT ON Colaboradores
FOR EACH ROW BEGIN
INSERT INTO Colaboradores_Auditoria
SET ID_Colaboradores = NEW.ID_Colaboradores,
CodCrachá_Colaboradoes = NEW.CodCrachá_Colaboradoes,
Nome_Colaboradores = NEW.Nome_Colaboradores,
CPF_Colaboradores = NEW.CPF_Colaboradores,
Sexo_Colaboradores = NEW.Sexo_Colaboradores,
DataNascimento_Colaboradores = NEW.DataNascimento_Colaboradores,
ID_CadastrodeEmpresas = NEW.ID_CadastrodeEmpresas,
ID_Departamentos = NEW.ID_Departamentos,
ID_CargodosColaboradores = NEW.ID_CargodosColaboradores,
Ativo_Colaboradores = NEW.Ativo_Colaboradores,
DataAdmição_Colaboradores = NEW.DataAdmição_Colaboradores,
DataDemissão_Colaboradores = NEW.DataDemissão_Colaboradores,
Del = NEW.Del,
Ação_Colaboradores  = 'INSERT',
Data_Colaboradores = NOW(),
Hora_Colaboradores = NOW();
END $$
DELIMITER ;



create table CadastrodeVeículos(
ID_CadastrodeVeículos int auto_increment primary key not null,
Placa_CadastrodeVeículos varchar(9) not null,
Modelo_CadastrodeVeículos varchar(30) not null,
Cor_CadastrodeVeículos varchar(20),
Observação_CadastrodeVeículos varchar(1000),
Del varchar(1));


create table CadastrodeVeículos_Auditoria(
ID_Auditoria int not null primary key auto_increment,
ID_CadastrodeVeículos int not null,
Placa_CadastrodeVeículos varchar(9) not null,
Modelo_CadastrodeVeículos varchar(30) not null,
Cor_CadastrodeVeículos varchar(20),
Observação_CadastrodeVeículos varchar(1000),
Del varchar(1),
Data_Veiculos date,
Hora_Veiculos time,
Ação_Veiculos varchar(30)
);

DELIMITER $$
CREATE TRIGGER AntesDeUpdate_Veiculos
BEFORE UPDATE ON  CadastrodeVeículos
FOR EACH ROW BEGIN
IF NEW.Del = 'S' then
INSERT INTO CadastrodeVeículos_Auditoria
SET ID_CadastrodeVeículos = OLD.ID_CadastrodeVeículos,
Placa_CadastrodeVeículos = OLD.Placa_CadastrodeVeículos,
Modelo_CadastrodeVeículos = OLD.Modelo_CadastrodeVeículos,
Cor_CadastrodeVeículos = OLD.Cor_CadastrodeVeículos,
Observação_CadastrodeVeículos = OLD.Observação_CadastrodeVeículos,
Del = OLD.Del,
Ação_Veiculos  = 'DELETE',
Data_Veiculos = NOW(),
Hora_Veiculos = NOW();
ELSE
INSERT INTO CadastrodeVeículos_Auditoria
SET ID_CadastrodeVeículos = OLD.ID_CadastrodeVeículos,
Placa_CadastrodeVeículos = OLD.Placa_CadastrodeVeículos,
Modelo_CadastrodeVeículos = OLD.Modelo_CadastrodeVeículos,
Cor_CadastrodeVeículos = OLD.Cor_CadastrodeVeículos,
Observação_CadastrodeVeículos = OLD.Observação_CadastrodeVeículos,
Del = OLD.Del,
Ação_Veiculos  = 'UPDATE',
Data_Veiculos = NOW(),
Hora_Veiculos = NOW();
END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER AntesDeInsert_Veiculos
AFTER INSERT ON  CadastrodeVeículos
FOR EACH ROW BEGIN
INSERT INTO CadastrodeVeículos_Auditoria
SET ID_CadastrodeVeículos = NEW.ID_CadastrodeVeículos,
Placa_CadastrodeVeículos = NEW.Placa_CadastrodeVeículos,
Modelo_CadastrodeVeículos = NEW.Modelo_CadastrodeVeículos,
Cor_CadastrodeVeículos = NEW.Cor_CadastrodeVeículos,
Observação_CadastrodeVeículos = NEW.Observação_CadastrodeVeículos,
Del = NEW.Del,
Ação_Veiculos  = 'INSERT',
Data_Veiculos = NOW(),
Hora_Veiculos = NOW();
END $$
DELIMITER ;




create table CadastrodeVeículos_has_Colaboradores(
ID_CadastrodeVeículos int not null,
foreign key (ID_CadastrodeVeículos) references CadastrodeVeículos (ID_CadastrodeVeículos),
ID_Colaboradores int not null,
foreign key (ID_Colaboradores) references Colaboradores (ID_Colaboradores),
Del varchar(1));
 
 create table CadastrodeVeículos_has_Colaboradores_Auditoria(
 ID_Auditoria int not null primary key auto_increment,
 ID_CadastrodeVeículos int not null,
 ID_Colaboradores int not null,
 Del varchar(1),
 Data_CHCA date default null,
 Hora_CHCA time default null,
 Ação_CHCA varchar(20) default null); 
 
 DELIMITER $$
CREATE TRIGGER AntesDeUpdate_CHCA
BEFORE UPDATE ON CadastrodeVeículos_has_Colaboradores
FOR EACH ROW BEGIN
IF NEW.Del = 'S' then
INSERT INTO CadastrodeVeículos_has_Colaboradores_Auditoria
SET ID_CadastrodeVeículos  = OLD.ID_CadastrodeVeículos,
ID_Colaboradores = OLD.ID_Colaboradores,
Del = OLD.Del,
Ação_CHCA = 'DELETE',
Data_CHCA = NOW(),
Hora_CHCA = NOW();
ELSE
INSERT INTO CadastrodeVeículos_has_Colaboradores_Auditoria
SET ID_CadastrodeVeículos  = OLD.ID_CadastrodeVeículos,
ID_Colaboradores = OLD.ID_Colaboradores,
Del = OLD.Del,
Ação_CHCA = 'UPDATE',
Data_CHCA = NOW(),
Hora_CHCA = NOW();
END IF;
END $$
DELIMITER ;
 
  DELIMITER $$
CREATE TRIGGER AntesDeInsert_CHCA
AFTER INSERT ON CadastrodeVeículos_has_Colaboradores
FOR EACH ROW BEGIN
INSERT INTO CadastrodeVeículos_has_Colaboradores_Auditoria
SET ID_CadastrodeVeículos  = NEW.ID_CadastrodeVeículos,
ID_Colaboradores = NEW.ID_Colaboradores,
Del = NEW.Del,
Ação_CHCA = 'INSERT',
Data_CHCA = NOW(),
Hora_CHCA = NOW();
END $$
DELIMITER ;




 create table RegistroAcesso(
 ID_Acesso int not null primary key auto_increment,
 User varchar(100),
 Direito varchar(50),
 Ação varchar(20),
 Data date,
 Hora time);
