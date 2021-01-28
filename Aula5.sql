-- Aula 5 - Inserindo dados na tabela (INSERT INTO)

-- Seleciona o banco de dados 
USE cadastro;

-- Inserir registros na tabela:

-- Godofredo - Inserção padrão
INSERT INTO pessoas 
(`nome`, `nascimento`, `sexo`, `peso`, `altura`, `nacionalidade`)
VALUES
('Godofredo', '1985-01-02', 'M', '78.5', '1.83', 'Brasil');

-- Maria - Demonstrando a ocultação do ID durante a inserção
INSERT INTO pessoas
(`nome`, `nascimento`, `sexo`, `peso`, `altura`, `nacionalidade`)
VALUES
('Maria', '1999-12-30', 'F', '55.2', '1.65', 'Portugal');

-- Creuza - Demonstrando o uso da constraint DEFAULT
INSERT INTO pessoas
(`id`, `nome`, `nascimento`, `sexo`, `peso`, `altura`, `nacionalidade`)
VALUES
(DEFAULT, 'Creuza', '1920-12-30', 'F', '50.2', '1.65', DEFAULT);

/* 
	Adalgiza - Se a ordem dos valores for a mesma dos campos definidos na estrutura
	da tabela não é necessário especificar os campos antes dos valores no INSERT INTO
*/
INSERT INTO pessoas VALUES
(DEFAULT, 'Adalgiza', '1930-11-02', 'F', '63.2', '1.75', 'Irlanda');

-- Um INSERT INTO para adicionar vários registros de uma vez só
INSERT INTO pessoas
(`id`, `nome`, `nascimento`, `sexo`, `peso`, `altura`, `nacionalidade`)
VALUES
(DEFAULT, 'Cláudio', '1975-04-22', 'M', '99.0', '2.15', 'Brasil'),
(DEFAULT, 'Pedro', '1999-12-03', 'M', '87', '2', DEFAULT),
(DEFAULT, 'Janaína', '1987-11-12', 'F', '75.4', '1.66', 'EUA');

-- OU

INSERT INTO pessoas VALUES
(DEFAULT, 'Cláudio', '1975-04-22', 'M', '99.0', '2.15', 'Brasil'),
(DEFAULT, 'Pedro', '1999-12-03', 'M', '87', '2', DEFAULT),
(DEFAULT, 'Janaína', '1987-11-12', 'F', '75.4', '1.66', 'EUA');


-- Listar todos os usuários da tabela
SELECT * FROM pessoas;