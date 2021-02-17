-- Aula #15 - Chaves Estrangeiras e JOIN
USE cadastro;
DESCRIBE gafanhotos;

-- Adicionando o atributo 'curso_preferido' a entidade gafanhotos, e transformando esse atributo em uma chave estrangeira
ALTER TABLE gafanhotos
ADD COLUMN curso_preferido int;

ALTER TABLE gafanhotos
ADD FOREIGN KEY (curso_preferido)
REFERENCES cursos(idcurso);

-- Adicionando o curso preferido de cada gafanhoto
SELECT * FROM gafanhotos;
SELECT * FROM cursos;

UPDATE gafanhotos
SET curso_preferido = '6'
WHERE id = '1';
/*
	OBS: Nessa parte o Guanabara ensinou a utilizar o MySQL Workbench para facilitar a troca dos dados de todos os gafanhotos.
*/

-- Tentando deletar um curso para verificar se a chave estrangeira está funcionando
-- Curso que tem relação com a tabela gafanhotos (A transação resulta em Foreign Key Error)
DELETE FROM cursos WHERE idcurso = '6';

-- Curso sem relação com a tabela gafanhotos (A transação é executada normalmente, pois não causa nenhuma violação ao ACID)
DELETE FROM cursos WHERE idcurso = '28';
SELECT * FROM cursos;

-- Como fazer para quando eu fizer um SELECT na tabela gafanhotos eu ter como retorno o nome do curso preferido e não o seu id?
-- Sem a solução aplicada
SELECT nome, curso_preferido
FROM gafanhotos;

-- Comando JOIN - Junção de tabelas
-- JOIN sem nenhuma cláusula adicional apenas faz a junção das duas tabelas.
SELECT gafanhotos.nome, gafanhotos.curso_preferido, cursos.nome, cursos.ano
FROM gafanhotos JOIN cursos;

-- JOIN com a cláusula ON junta as duas tabelas com uma condição (funciona como se fosse o WHERE)
-- Esse JOIN é chamado de INNER JOIN por retornar apenas as relações entre as duas tabelas
-- OBS: é possível executar o INNER JOIN ocultando a palavra chave INNER
SELECT gafanhotos.nome, gafanhotos.curso_preferido, cursos.nome, cursos.ano
FROM gafanhotos INNER JOIN cursos
ON cursos.idcurso = gafanhotos.curso_preferido
ORDER BY gafanhotos.nome;

-- Utilizando ALIASES para diminuir a verbosidade das consultas
SELECT g.nome, g.curso_preferido, c.nome, c.ano
FROM gafanhotos as g INNER JOIN cursos as c
ON c.idcurso = g.curso_preferido
ORDER BY g.nome;

-- CURIOSIDADE: Método antigo de se fazer um INNER JOIN
SELECT gafanhotos.nome, gafanhotos.curso_preferido, cursos.nome, cursos.ano
FROM cursos, gafanhotos
WHERE cursos.idcurso = gafanhotos.curso_preferido;

-- LEFT/RIGHT OUTER JOIN
SELECT g.nome as 'Nome', c.nome as 'Curso preferido', c.ano 
FROM gafanhotos as g LEFT OUTER JOIN cursos as c
ON c.idcurso = g.curso_preferido
ORDER BY c.nome DESC;



