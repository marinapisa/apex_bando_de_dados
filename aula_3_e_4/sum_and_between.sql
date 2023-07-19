-- database: c:\Users\Marina-PC\Desktop\apex_bando_de_dados\aula_3_e_4\mydatabase.db
-- Somando todas as idades:
SELECT SUM (idade) AS SOMA_DAS_IDADES FROM programadores
WHERE IDADE > 26;

-- Somando todos os ids:
SELECT SUM (id) AS SOMA_DOS_IDS FROM programadores;

-- BETWEEN = ENTRE
SELECT * FROM programadores
WHERE IDADE BETWEEN 25 AND 35;

-- SELECIONANDO IDS ENTRE 25 E 35:
SELECT * FROM programadores
WHERE id BETWEEN 1 AND 6;

-- # Exercícios:

-- OBS: Se o exercício pedir por dados que ainda não existem, inserir os mesmos.
    -- Cada nota, corresponderá a uma matéria do aluno, portanto o alunos pode
    -- aparecer mais de um vez na tabela com notas distintas para cada matéria,
    -- no entando deve ter o id único com uma chave primária
    -- Se o exercício estiver muito difícil, pule e volte depois

-- Crie uma tabela chamada "Alunos" com as colunas id como inteiro e chave primária,

CREATE TABLE IF NOT EXISTS Alunos (
    id INTEGER PRIMARY KEY
);

-- nome como texto, idade como inteiro, notas como double, matéria como texto.

ALTER TABLE Alunos 
ADD COLUMN idade INTEGER;

-- Insira 20 linhas distintas na tabela alunos para cada linha, tente incluir diversidade nas notas e matérias.

INSERT INTO Alunos(nome, notas, materia, idade)
VALUES('Clarice', 7, 'Espanhol', 9);

-- Selecione todos os registros da tabela "Alunos".

SELECT * from Alunos;

-- Selecione apenas o nome e a idade dos alunos da tabela "Alunos".

SELECT nome, idade from Alunos;

-- Insira um novo aluno na tabela "Alunos" com nome "João" e idade 25, sem matéria e sem notas.

INSERT INTO Alunos (nome, notas, materia, idade)
VALUES('João', null, null, 25);

-- Selecione todas as colunas onde a matéria está com valor null.

SELECT * from Alunos
where materia is null;

-- Atualize a idade do aluno com id 10 para 22 anos na tabela "Alunos".

update Alunos
set idade = 22
where id = 10;

-- Selecione a maior idade presente na tabela "Alunos".

SELECT MAX (idade) from Alunos;

-- Selecione o menor valor da coluna "notas".

SELECT MIN (notas) from Alunos;

-- Ordene os alunos da tabela "Alunos" por nota em ordem decrescente.

SELECT * from Alunos
ORDER BY notas DESC;

-- Calcule a média das notas dos alunos.

SELECT round(AVG(notas), 2) as media_das_notas
from Alunos;

-- Inserir mais 15 linhas com dados distintos, e modirifcar três linhas existentes em pelo menos duas colunas cada.

INSERT INTO Alunos (nome, notas, materia, idade)
VALUES('William', 2,'História', 14);

-- Crie uma coluna escola e insira as escolas para os alunos usando update 

ALTER TABLE Alunos
ADD COLUMN escola TEXT(70);

-- ALTER TABLE Alunos
-- DROP COLUMN escola;

UPDATE Alunos
SET escola = 'EEB Heriberto Joseph Muller';

-- Selecione os alunos cujo nome começa com a letra "A" na tabela "Alunos".

SELECT * FROM Alunos
WHERE NOME LIKE 'A%';

-- Ordene os alunos da tabela "Alunos" por idade em ordem crescente.

SELECT * FROM Alunos
ORDER BY IDADE ASC;


-- Selecione os alunos que têm idade entre 20 e 25 anos na tabela "Alunos".
SELECT * FROM Alunos
WHERE IDADE BETWEEN 20 AND 25;

-- Selecione os alunos que têm idade maior que 18 e que estudam na escola "Bom Jesus" na tabela "Alunos".

SELECT * FROM Alunos
WHERE idade > 18
AND escola = 'Bom Jesus';

-- Escreva uma consulta SQL que calcule a média de idade dos alunos para cada escola

SELECT AVG(idade) as media_das_idades
from Alunos;

-- Selecione os alunos que obtiveram uma nota maior ou igual a 7 na disciplina de "Matemática".

SELECT * from Alunos
WHERE notas >= 7
and materia = 'Matemática';

-- Selecione os alunos que obtiveram uma nota menor que 5 na disciplina de "História".

SELECT * from Alunos
WHERE notas < 5
AND materia = 'História';

-- Selecione os alunos que têm o nome terminado com a letra "o" na tabela "Alunos".

SELECT * from Alunos
where nome like '%o';

-- Selecione os alunos que estudam na escola "Escola Y" e têm idade menor que 30 anos na tabela "Alunos".

SELECT * from Alunos
where escola = 'Escola Y'
and idade < 30;

-- Selecione os alunos que estudam na escola "Escola Z" ou têm mais de 35 anos na tabela "Alunos".

SELECT * from Alunos
where escola = 'Escola Z'
or idade > 35;

-- Ordene os alunos da tabela "Alunos" por nome em ordem alfabética.

SELECT * from Alunos
order by nome asc;

-- Conte quantos alunos obtiveram a nota máxima na disciplina de "Química".

Select count(*) as obtveram_nota_maxima from Alunos
where notas = max(nota)
and materia = 'Química'

SELECT COUNT(*) AS obtveram_nota_maxima
FROM Alunos
WHERE nota = (SELECT MAX(nota) FROM Alunos WHERE materia = 'Química')
    AND materia = 'Química';

-- Selecione os alunos cujo nome contém a letra "e" e a idade é maior que 25 na tabela "Alunos".

-- Escreva uma consulta SQL que liste o nome do aluno mais velho de cada escola.