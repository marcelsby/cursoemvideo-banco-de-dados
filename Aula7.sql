-- Aula 7 - Manipulando Registros (UPDATE, DELETE e TRUNCATE)

-- Incluir novos registros na tabela cursos
INSERT INTO cursos VALUES
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
('2', 'Algoritmos', 'Lógica de Programação', '20', '15', '2014'),
('3', 'Photoshop', 'Dicas de Photoshop CC', '10', '8', '2014'),
('4', 'PGP', 'Curso de PHP para iniciantes', '40', '20', '2010'),
('5', 'Jarva', 'Introdução à Lingugagem Java', '10', '29', '2000'),
('6', 'MySQL', 'Banco de Dados MySQL', '30', '15', '2016'),
('7', 'Word', 'Curso completo de Word', '40', '30', '2016'),
('8', 'Sapateado', 'Danças Rítmicas', '40', '30', '2018'),
('9', 'Cozinha Árabe', 'Aprenda a fazer Kibe', '40', '30', '2018'),
('10', 'YouTuber', 'Gerar polêmica e ganhar inscritos', '5', '2', '2018');

SELECT * FROM cursos;

-- Alterar na tabela cursos, o atributo nome para 'HTML5' onde o atributo idcurso for igual a '1'
UPDATE cursos
SET nome = 'HTML5'
WHERE idcurso = '1';

SELECT * FROM cursos;

-- Alterar na tabela cursos, os atributos nome e ano para respectivamente 'PHP' e '2015'
-- onde o idcurso for igual a '4'
UPDATE cursos
SET nome = 'PHP', ano = '2015'
WHERE idcurso = '4';

SELECT * FROM cursos;

-- Alterar na tabela cursos, os atributos nome, carga e ano para respectivamente 'Java', '40' e '2015'
-- onde o idcurso for igual a '5'
/*
	LIMIT N: limita a execução a N linhas, neste caso "LIMIT 1" trava a execução da query a 1 linha
*/
UPDATE cursos
SET nome = 'Java', carga = '40', ano = '2015'
WHERE idcurso = '5'
LIMIT 1;

SELECT * FROM cursos;

-- Riscos de não utilizar a constraint LIMIT;
-- O comando só funcionará se o safe update mode do MySQL Workbench estiver desativado
UPDATE cursos
SET ano = '2050', carga = '800'
WHERE ano = '2018';

UPDATE cursos
SET ano = '2018', carga = '0'
WHERE ano = '2050'
LIMIT 1;

SELECT * FROM cursos;

-- Voltando as alterações feitas na última seção 
UPDATE cursos
SET carga = '40', ano = '2018'
WHERE idcurso = '8'
LIMIT 1;

UPDATE cursos
SET carga = '40', ano = '2018'
WHERE idcurso = '9'
LIMIT 1;

UPDATE cursos
SET carga = '5', ano = '2018'
WHERE idcurso = '10'
LIMIT 1;

SELECT * FROM cursos;

-- Deletar da tabela cursos os cursos com o idcurso '8', '9', '10'
DELETE FROM cursos 
WHERE idcurso = '8'
LIMIT 3;

DELETE FROM cursos 
WHERE idcurso >= '9'
LIMIT 3;

/*
	Operadores relacionais funcionam em SQL (=, >=, <=, !=, etc...)
*/

SELECT * FROM cursos;

-- Deletar todas as linhas de uma tabela
TRUNCATE TABLE cursos;

-- OU 

TRUNCATE cursos;

SELECT * FROM cursos;
