-- Aula 3 - Criando seu primeiro banco de dados e aprendendo alguns comandos básicos

-- Criar um banco de dados
CREATE DATABASE cadastro;

-- Listar todos os banco de dados da instância que eu estou conectado
SHOW DATABASES;

-- Selecionar um banco de dados para aplicar as queries
USE cadastro;

-- Mostra qual BD está atualmente selecionado e outros detalhes
-- Esse comando funciona apenas no console
-- STATUS;

-- Mostrar quais tabelas existem no BD selecionado atualmente
SHOW TABLES;

-- Criar uma tabela
CREATE TABLE pessoas (
	nome varchar(30),
    idade tinyint(3),
    sexo char(1),
    peso float,
    altura float,
    nacionalidade varchar(20)
);

-- Descrever a estrutura da tabela `pessoas`
DESCRIBE pessoas;