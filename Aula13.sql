-- Aula #13 - SELECT (A diferença entre o uso do DISTINCT e do GROUP BY com HAVING)

-- GROUP BY vs DISTINCT
/*
	GROUP BY: significa "agrupado por", esse comando SQL forma grupos com valores iguais retornados por uma consulta.
    DISTINCT: significa "distintamente", esse comando elimina duplicidades dos dados retornados por uma consulta.
*/

-- Exemplo DISTINCT (distinção):
-- Quero saber quais cargas horárias meus cursos têm, sem me importar com a carga individual deles:
SELECT DISTINCT carga, totaulas
FROM cursos
ORDER BY carga;

-- Exemplo GROUP BY (agrupamento):
-- Quero saber quantos cursos tenho para cada carga horária, me importando e agrupando a carga individual deles em um count():
SELECT carga, count(idcurso)
FROM cursos
GROUP BY carga, totaulas
ORDER BY carga;

-- Agrupamento com o WHERE, utilizando operadores relacionais:
SELECT *
FROM cursos
WHERE ano > 2015
ORDER BY ano;

-- Condicionamento com o WHERE e agrupamento com GROUP BY
SELECT carga, count(nome) 
FROM cursos 
WHERE totaulas = 30
GROUP BY carga;

-- GROUP BY com HAVING, o HAVING determina que você só irá agrupar quando a condição for satisfeita
/*
	OBS: Neste caso ele só mostrará os grupos que possuem mais de 3 registros com a mesma carga
*/
SELECT carga, COUNT(idcurso)
FROM cursos
GROUP BY carga
HAVING COUNT(idcurso) > 3
ORDER BY COUNT(idcurso);

/*
	OBS: De forma semelhante o HAVING é para o GROUP BY o mesmo que o WHERE é para o SELECT
*/

-- AULA 13 // https://www.youtube.com/watch?v=ocyVJ9gRUaE&list=PLHz_AreHm4dkBs-795Dsgvau_ekxg8g1r&index=15&ab_channel=CursoemV%C3%ADdeo
