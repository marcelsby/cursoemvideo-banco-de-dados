-- Aula 11 - O comando SELECT (Parte 2)

-- Operador LIKE (procura por semelhanças nos dados)
/*
	OBS: O operador LIKE é case-insensitive.
*/

-- Busca e retorna todos os cursos que tem o nome inciado pela letra 'P'
SELECT * FROM cursos
WHERE nome LIKE 'p%'
ORDER BY nome;
/*
	OBS: O carctere '%' significa "nenhum ou vários caracteres"
		 e o caractere '_' significa "um caractere".
*/

-- Busca e retorna todos os cursos que tem o nome finalizado pela letra 'A'
SELECT * FROM cursos
WHERE nome LIKE '%a'
ORDER BY nome;

-- Busca e retorna todos os cursos que tem o nome iniciado/finalizado/permeado pela letra 'A'
SELECT idcurso, nome, ano FROM cursos
WHERE nome LIKE '%a%'
ORDER BY idcurso;

-- O comando LIKE também encontra letras com acentuação
UPDATE cursos SET nome = 'PáOO' WHERE idcurso = '9';

SELECT idcurso, nome, ano
FROM cursos
WHERE nome LIKE '%a%'
ORDER BY idcurso;

UPDATE cursos SET nome = 'POO' WHERE idcurso = '9';

-- Seleciona todos os cursos com o atributo nome contendo:
	-- 'ph' no início
	-- '%' qualquer coisa no meio
	-- o penúltimo caractere 'p'
	-- e no final UM caractere qualquer '_'
SELECT idcurso, nome, carga
FROM cursos
WHERE nome LIKE 'ph%p_';

-- Outro exemplo:
SELECT * FROM cursos
WHERE nome LIKE 'p__t%';

-- Procurando um gafanhoto que tenha 'silva' no nome
SELECT nome 
FROM gafanhotos
WHERE nome LIKE '%silva%'
ORDER BY nome;

-- Procurando por um gafanhoto específico
SELECT nome
FROM gafanhotos
WHERE nome LIKE 'Allan Silva';

-- Operador DISTINCT (procura e exibe as possibilidades do seu result set, sem duplicidades)
-- Referência: https://www.geeksforgeeks.org/sql-distinct-clause/#:~:text=The%20distinct%20keyword%20is%20used,the%20unique%20values%20are%20fetched.
-- Por exemplo:
SELECT DISTINCT profissao
FROM gafanhotos
ORDER BY profissao ASC;


-- Funções de Agregação

-- Função COUNT(atributo) (Calcula a quantidade de registros retornados)
-- Quero saber quantos cursos com a carga horária maior que 50 horas existem na minha tabela 'cursos'
SELECT COUNT(carga) FROM cursos WHERE carga > 50;

-- Quero saber quantos gafanhotos eu tenho nascidos no século XX
SELECT COUNT(id) FROM gafanhotos WHERE nascimento BETWEEN '1901-01-01' and '2001-01-01';

-- Quero saber quantos gafanhotos eu tenho na minha tabela gafanhotos
SELECT COUNT(id) FROM gafanhotos;

-- Função MAX(atributo) (Retorna o maior valor dentre os valores do atributo buscado)
SELECT MAX(ano) FROM cursos;

-- Função MIN(atributo) (Retorna o menor valor dentre os valores do atributo buscado)
SELECT nome, MIN(altura) FROM gafanhotos;

-- Função SUM(atributo) (Retorna a soma dos valores do atributo buscado)
SELECT SUM(carga) FROM cursos;

-- Função AVG(atributo) (Calcula a média dos valores do atributo buscado)
SELECT AVG(totaulas) FROM cursos WHERE ano = '2017';
