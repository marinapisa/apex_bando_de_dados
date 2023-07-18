-- database: c:\Users\Marina-PC\Desktop\apex_bando_de_dados\aula_3\mydatabase.db

create table if not exists programadores (
    id INTEGER PRIMARY KEY ,
    nome TEXT(40),
    idade INTEGER,
    email TEXT(40)
);

SELECT * FROM programadores;

INSERT INTO programadores
(nome, idade, email)
VALUES
('teste', 50, 'email@gmail.com');

-- Revisão:
-- CREATE, DROP, DELETE, INSERT, WHERE, LIKE, SELECT,
--  AND, COUNT, UPDATE, MAX MIN, AVG.

-- Deletar uma tabela:
DROP TABLE programadores;

-- Inserir valores e filtrar:
INSERT INTO programadores(nome, idade, email)
VALUES ('Eliot', 25, 'mr_robot@gmail.com');

INSERT INTO programadores(nome, idade, email)
VALUES ('Gustavo', 38, 'stav@gmail.com');

INSERT INTO programadores(nome, idade, email)
VALUES ('Clarice', 6, 'claricepisa@gmail.com');

INSERT INTO programadores(nome, idade, email)
VALUES ('Isaias', 52, 'pisasistemas@gmail.com');

INSERT INTO programadores(nome, idade, email)
VALUES ('Elaine', 25, 'elainecora@gmail.com');

INSERT INTO programadores(nome, idade, email)
VALUES ('Jennifer', 24, 'jennigata@gmail.com');

-- Atualizar dados:
update programadores
set nome = 'Bruno',
idade = 60,
email = 'bruno@gmail.com'
where nome = 'Eliot'
and id = 2;

SELECT id, nome, idade, email from programadores
where nome = 'Bruno';

-- Adicionar nova coluna:
ALTER TABLE programadores
ADD COLUMN linguagem_de_programacao TEXT(40);

-- Inserir as linguagens de programação manualmente para cada linha da tabela:
UPDATE programadores
SET linguagem_de_programacao = 'Cobol'
WHERE id > 5 and id < 9;

-- Buscar os valores minimos e máximos de colunas

SELECT MAX (id) AS id_maior,
MIN(idade) AS menor_idade
from programadores;

-- CRIANDO COLUNA DE MEDIA DE IDADE QUE FAZ UMA MEDIA
--  DE TODAS AS IDADES
SELECT ROUND (AVG(idade),2) as media_idade 
from programadores;

-- Buscar palavras nos baseando em um texto aleatório
SELECT * from programadores
WHERE nome like 'B%';
SELECT * from programadores
WHERE nome like '%a';
SELECT * from programadores
WHERE nome like '%isa%';


-- Order By = Ordene por

SELECT * FROM programadores
order by idade desc;

SELECT * FROM programadores
ORDER by nome asc;

-- Exercicio
-- Ordene a table programadores
-- por todas as colunas
-- usando tando o desc como o ASC

SELECT * FROM programadores
ORDER BY nome DESC;
SELECT * FROM programadores
ORDER BY nome ASC;
SELECT * FROM programadores
ORDER BY ID DESC;
SELECT * FROM programadores
ORDER BY ID ASC;
SELECT * FROM programadores
ORDER BY idade DESC;
SELECT * FROM programadores
ORDER BY idade ASC;
SELECT * FROM programadores
ORDER BY email DESC;
SELECT * FROM programadores
ORDER BY email ASC;
SELECT * FROM programadores
ORDER BY linguagem_de_programacao DESC;
SELECT * FROM programadores
ORDER BY linguagem_de_programacao ASC;

-- GROUP BY = Agrupe por

SELECT *,count(idade) as quantidade_idade from programadores
WHERE idade > 18
GROUP BY idade;

SELECT *,count(linguagem_de_programacao) as total_python 
from programadores
where linguagem_de_programacao = 'C#'
GROUP BY linguagem_de_programacao;









--  |--##-- EX: --##--|


-- Criar a coluna salario_dev na tabela Programadores
ALTER TABLE programadores
ADD COLUMN salario DOUBLE;

-- ALTER TABLE programadores
-- DROP COLUMN bebida_pref;

-- e inserir salários diferentes
-- para todos as linhas
UPDATE programadores
set salario = 12.499
where id > 8;

-- selecionar os dados ordenando por id
select * from programadores
ORDER BY id desc;

-- Mostrando a média da coluna salario_dev
SELECT ROUND (AVG(salario),2) as media_salario 
from programadores;

-- Criar mais 5 colunas em uma das tabelas 

ALTER TABLE programadores
ADD COLUMN pais TEXT(15);

ALTER TABLE programadores
ADD COLUMN hobby TEXT(40);

ALTER TABLE programadores
ADD COLUMN navegador TEXT(15);

ALTER TABLE programadores
ADD COLUMN setor TEXT(10);

ALTER TABLE programadores
ADD COLUMN bebida_pref TEXT(15);

-- e inserir os dados manualmente com update set

UPDATE programadores
set pais = 'Canada'
WHERE idade > 23 ;
UPDATE programadores
set hobby = 'Jogar CS'
WHERE idade < 22;
UPDATE programadores
set navegador = 'FireFox'
WHERE id > 8 ;
UPDATE programadores
set setor = 'Almox'
WHERE id < 5 ;
UPDATE programadores
set bebida_pref = 'Chopp'
WHERE id > 5 ;


-- Selecionar a maior idade, e o menor id da tabela Programadores

SELECT MAX (idade) AS maior_idade,
MIN(id) AS menor_id
from programadores;


-- Selecionar todas as colunas da tabela Programadores e ordenar pelo nome em ordem aufabética

select * FROM programadores
order by nome;


-- Selecionar o nome e a idade da tabela Programadores, agrupando pela idade 

SELECT nome, idade, count(idade) as total_idades from programadores
GROUP BY idade;

-- mostrando a mesma como total_idade_grup apenas onde a idade é maior ou igual a 18

SELECT nome, idade, count(idade) as total_idade_grup from programadores
WHERE idade > 17
GROUP BY idade;

-- Selecionar todas as colunas da tabela Programadores e ordenando por id em ordem decrescente

select * from programadores
order by id desc;








--  HOMEWORK
-- Criar uma tabela nova, inserir 20 linhas e 8 colunas na tabela

create table if not exists newtable (
    nr_sequencia INTEGER PRIMARY KEY ,
    nome TEXT(40),
    idade INTEGER,
    email TEXT(40),
    nacionalidade TEXT(40),
    endereco TEXT(60),
    num_casa INTEGER,
    religiao TEXT(15),
    cpf INTEGER
);

INSERT INTO newtable(nome, idade, email, nacionalidade, endereco, num_casa, religiao, cpf)
VALUES ('Gustavo', 38, 'stav@gmail.com', 'Brasileiro', 'Rua Bahia', 300, 'Católica', 08876543299);
INSERT INTO newtable(nome, idade, email, nacionalidade, endereco, num_casa, religiao, cpf)
VALUES ('Clarice', 6, 'clarice@gmail.com', 'Alemã', 'Rua Rio Branco', 7889, 'Sem Religião', 12552903889);


-- Refazer todos os exercícios desse arquivo com a tabela criada




