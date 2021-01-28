-- Aula 6 - Alterando a Estrutura da Tabela (ALTER TABLE e DROP TABLE)

/* 
	PARTE 1
*/

-- Shorthand para o comando describe
DESC pessoas;

-- Alterar a tabela pessoas adicionando a coluna profissão
/* 
	Por padrão esse comando adiciona uma coluna na última posição da
	nossa tabela. 
*/
ALTER TABLE pessoas
ADD COLUMN profissao varchar(10);

-- Alterar a tabela pessoas removendo a coluna profissão
ALTER TABLE pessoas
DROP COLUMN profissao;

-- Alterar a tabela pessoas inserindo a coluna profissão depois da coluna nome
ALTER TABLE pessoas
ADD COLUMN profissao varchar(10) AFTER nome;

-- Alterar a tabela pessoas inserindo a coluna código como primeira coluna
ALTER TABLE pessoas
ADD COLUMN codigo int FIRST;

-- OU utilizando um shorthand, ocultando a palavra de definição COLUMN

ALTER TABLE pessoas
ADD codigo int FIRST;

-- Excluir a coluna codigo da tabela pessoas
ALTER TABLE pessoas
DROP COLUMN codigo;


-- Alterar a tabela pessoa modificando uma coluna já existente
-- Com o MODIFY você não consegue renomear uma tabela preexistente, mas consegue alterar
-- o tipo primitivo e todas* as constraints de uma coluna. */
-- *Você não consegue modificar uma coluna que foi criada com o valor NULL, para isso na criação
-- da coluna você deve colocar a constraint DEFAULT '' 

-- Excluir a coluna profissão
ALTER TABLE pessoas
DROP profissao;

-- Adiciona a coluna profissao com a constraint DEFAULT ''
ALTER TABLE pessoas
ADD COLUMN profissao varchar(10) DEFAULT '' AFTER nome;
 
 -- Com o select e o describe você observa que os registros estão preenchidos com '' e não NULL
DESC pessoas;
SELECT profissao FROM pessoas;

-- Faz a alteração somando a constraint NOT NULL, mas em contrapartida remove o a constraint DEFAULT ''
-- Caso você deseje manter as constraints você deve reescrevê-las novamente, tanto no MODIFY quanto no CHANGE
ALTER TABLE pessoas
MODIFY COLUMN profissao varchar(20) NOT NULL;

-- Com o describe você verifica que agora o campo profissão não aceita a inserção de NULL
DESC pessoas;

-- Alterar a tabela pessoas renomeando a coluna profissão
/* 
	MODIFY: você sobrescreve o tipo primitivo e as constraints de uma coluna
	CHANGE: você renomeia e sobrescreve o tipo primitivo e as constraints de uma coluna
*/

-- Perde as constraints, mas renomeia a coluna
ALTER TABLE pessoas
CHANGE COLUMN profissao prof varchar(20);

-- Mantém as constraints e renomeia a coluna
ALTER TABLE pessoas
CHANGE COLUMN prof prof varchar(20) NOT NULL DEFAULT '';

-- Note as diferenças
DESC pessoas;

-- Renomear uma tabela
ALTER TABLE pessoas
RENAME TO gafanhotos;

-- Descrever a tabela renomeada de pessoas para gafanhotos
DESC gafanhotos;

/* 
	PARTE 2
*/

-- Criando uma tabela com a condição IF
CREATE TABLE IF NOT EXISTS cursos (
	nome varchar(30) NOT NULL UNIQUE,
    descricao text,
    carga int UNSIGNED,
    totaulas int,
    ano year DEFAULT '2021'
);

-- Descrever a tabela cursos
DESC cursos;

-- Adicionar uma chave primária a uma tabela após a sua criação
ALTER TABLE cursos
ADD COLUMN idcurso int FIRST;

ALTER TABLE cursos 
ADD PRIMARY KEY(idcurso);

-- Apagar uma tabela
/*
	DROP como parâmetro de ALTER TABLE: apagar uma coluna.
    DROP TABLE: apagar uma tabela.
*/

CREATE TABLE IF NOT EXISTS teste (
	id int,
	nome varchar(10),
	idade int
);

INSERT INTO teste VALUES
('1', 'Pedro', '23');

SELECT * FROM teste;

DROP TABLE teste;

SHOW TABLES;



