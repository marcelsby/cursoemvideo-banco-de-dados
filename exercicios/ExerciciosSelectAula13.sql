/* Exercícios Aula 13 */
USE cadastro;

-- 1. Uma lista com as profissões dos gafanhotos e seus respectivos quantitativos.
SELECT profissao as 'Profissão', COUNT(id) as 'Gafanhotos Atuando'
FROM gafanhotos
GROUP BY profissao
ORDER BY COUNT(id);

-- 2. Quantos gafanhotos homens e quantas mulheres nasceram após 01/JAN/2005?
SELECT sexo, COUNT(id) 
FROM gafanhotos
WHERE nascimento > '2005-01-01'
GROUP BY sexo;

-- 3. Uma lista com os gafanhotos que nasceram fora do Brasil, mostrando o país de origem e o total de pessoas nascidas lá.
--    Só nos interessam os países que tiverem mais de 3 gafanhotos com essa nacionalidade.
SELECT nacionalidade, COUNT(id)
FROM gafanhotos
WHERE nacionalidade != 'Brasil'
GROUP BY nacionalidade
HAVING COUNT(nacionalidade) > 3;

-- 4. Uma lista agrupada pela altura dos gafanhotos, mostrando quantas pessoas pesam mais de 100Kg e que estão acima da média de altura
--    de todos os cadastrados.
SELECT AVG(peso) AS 'Média de peso', altura, COUNT(*) AS 'Gafanhotos'
FROM gafanhotos
WHERE peso > 100
GROUP BY altura
HAVING altura > (SELECT AVG(altura) FROM gafanhotos)
ORDER BY altura;