-- Aula 11 - O comando SELECT

-- Verificando o dump dos Curso em Vídeo ./material_curso/Dump-CeV01.sql
USE cadastro;

-- Comando 'SELECT & FROM'
/*
	Comumente utilizado como: 'SELECT * FROM <algumaTabela>'
	O caractere '*' aqui significa "todas as colunas" da tabela.
*/
SELECT * FROM gafanhotos;
SELECT * FROM cursos;

-- Comando 'ORDER BY' - ordena os registros buscados
-- Ordenação crescente usando por parâmetro a PK (comportamento padrão)
SELECT * FROM cursos;

-- Ordenação CRESCENTE, dependendo do tipo do campo.
/* ALFABÉTICA */
SELECT * FROM cursos
ORDER BY nome; 

/* CRESCENTE */
SELECT * FROM cursos
ORDER BY carga; 

-- Ordenação DECRESCENTE, dependendo do tipo do campo.
/* ALFABÉTICA INVERSA */
SELECT * FROM cursos
ORDER BY nome DESC; 

/* DECRESCENTE */
SELECT * FROM cursos
ORDER BY carga DESC; 

/*
	'DESC' como parâmetro significa DESCendent (descendente, decrescente) e
    'DESC' como comando é um shorthand para DESCRIBE
*/

/* 
	'ASC' como parâmetro significa ASCendant (ascendente, crescente)
    OBS: Não utilizar nenhum parâmetro vai acabar resultando em ASC de qualquer jeito
*/

-- As duas consultas a seguir produzem o mesmo resultado:
SELECT * FROM cursos
ORDER BY nome ASC;

SELECT * FROM cursos
ORDER BY nome;

-- Filtragem e exibição de colunas específicas (e não '*') com SELECT.
SELECT nome, carga, ano FROM cursos ORDER BY ano;

-- Retorna os mesmos dados, mas as colunas estão em outra ordem.
SELECT ano, nome, carga FROM cursos ORDER BY ano;

-- Filtragem com ordenação dupla.
-- Nesse exemplo ele busca os campos ano, nome, carga e ordena o resultado pelo ano e depois pelo nome "dentro" de cada ano.
SELECT ano, nome, carga FROM cursos ORDER BY ano, nome;


-- Filtragem com a constraint 'WHERE'
SELECT * FROM cursos
WHERE ano = '2016' 
ORDER BY nome;

-- OU selecionando só as colunas nome, descricao e carga:
SELECT nome, descricao, carga FROM cursos
WHERE ano = '2016'
ORDER BY nome;


-- Operadores relacionais com o SELECT
/*
	Operadores válidos em SQL:
    Igual: =
    Diferente: != ou <>
    Maior: >
    Menor: <
    Maior ou igual: >=
    Menor ou igual: <=
*/
SELECT nome, descricao, ano FROM cursos
WHERE ano <= '2015'
ORDER BY ano, nome;

-- Outros operadores relacionais (BETWEEN, IN...)
-- BETWEEN e AND, busca os registros que estão entre os valores delimitados para uma coluna específica
SELECT nome, ano FROM cursos
WHERE ano BETWEEN 2014 AND 2016
ORDER BY ano DESC, nome;
-- Quando os dados não têm espaço é possível referenciá-los sem a obrigatoriedade das aspas simples

-- IN, busca os registros que tem o valor exato para a coluna especificada após o 'WHERE'
SELECT ano, nome, descricao FROM cursos
WHERE ano IN ('2010', '2016', '2020')
ORDER BY ano, nome;

-- AND e OR, operadores lógicos misturados com operadores relacionais 
-- Nessa consulta a carga tem que ter o valor maior que 35 E o totaulas deve ser menor que 30
SELECT nome, carga, ano FROM cursos
WHERE carga > 35 AND totaulas <	30
ORDER BY carga, totaulas;

-- Nessa outra consulta o mesmo padrão permanece, mas ao atender UMA das condições ele já retorna o registro
SELECT nome, carga, ano FROM cursos
WHERE carga > 35 OR totaulas <	30
ORDER BY carga, totaulas;




