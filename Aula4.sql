-- Aula 4 - Aprimorando a estrutura do seu primeiro banco de dados

-- Apagar o banco de dados criado na aula anterior
DROP DATABASE cadastro;

/* 
	Criar um banco de dados aprimorado, definindo o seu `charset` 
    para aceitar as acentuações do português brasileiro 
*/
CREATE DATABASE cadastro
DEFAULT CHARSET utf8mb4;

-- Recriar a tabela com os tipos mais bem dimensionados e com `constraints`
/* 
	Todo dado em SQL fica entre aspas simples '' e toda palavra de definição fica entre ``
*/
USE cadastro;
CREATE TABLE pessoas (
	`id` int NOT NULL AUTO_INCREMENT,
	`nome` varchar(30) NOT NULL,
    `nascimento` date,
    `sexo` enum('M', 'F'),
    `peso` decimal(5, 2),
    `altura` decimal(3, 2),
    `nacionalidade` varchar(20) DEFAULT 'Brasil',
    PRIMARY KEY (`id`)
) DEFAULT CHARSET = utf8mb4;