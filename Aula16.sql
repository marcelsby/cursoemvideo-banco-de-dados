-- Aula #16 - INNER JOIN com várias tabelas
USE cadastro;

/*
	Criando um novo relacionamento: GAFANHOTO - ASSISTE - CURSO.
    Como é um relacionamento de cardinalidade muitos para muitos, 'ASSISTE' que era um relacionamento agora é uma entidade.
    E ela receberá as chaves primárias das entidades GAFANHOTO e CURSO como chaves estrangeiras.
*/

CREATE TABLE gafanhoto_assiste_curso (
	id int NOT NULL AUTO_INCREMENT,
    data_inicio date,
    id_gafanhoto int,
    id_curso int,
    PRIMARY KEY (id),
    FOREIGN KEY (id_gafanhoto) REFERENCES gafanhotos(id),
    FOREIGN KEY (id_curso) REFERENCES cursos(idcurso)
);

DESC gafanhoto_assiste_curso;

-- Criando relacionamentos na nossa nova entidade ASSISTE (que é identificada no nosso banco como 'gafanhoto_assiste_curso')
SELECT * FROM gafanhotos;
SELECT * FROM cursos;

INSERT INTO gafanhoto_assiste_curso VALUES
(DEFAULT, '2014-08-07', '4', '1'),
(DEFAULT, '2015-02-15', '4', '21'),
(DEFAULT, '2015-06-21', '4', '15'),
(DEFAULT, '2018-01-05', '2', '3'),
(DEFAULT, '2019-03-17', '2', '7'),
(DEFAULT, '2019-02-10', '2', '26');

SELECT * FROM gafanhoto_assiste_curso;

-- Consultando os relacionamentos criados de forma com que os dados façam sentido (precisaremos utilizar o JOIN)
SELECT g.id, g.nome, c.nome
FROM gafanhotos as g
INNER JOIN gafanhoto_assiste_curso as a
ON g.id = a.id_gafanhoto
INNER JOIN cursos as c
ON c.idcurso = a.id_curso;

/* O curso acabou :'( aqui */





