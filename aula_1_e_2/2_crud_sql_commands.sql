-- database: c:\Users\Marina-PC\Desktop\apex_bando_de_dados\aula_1_e_2\mydatabase.db

-- SELECT selecionar dados específicos ou todos de uma tabela de banco de dados
SELECT DISTINCT nome FROM usuarios;
-- WHERE nome = 'Clarice';

--Where passar condições para o SQ, como por exemplo, selecione
-- todos os nomes onde o nome é igual a 'Clarice'.

-- selecionar todas as colunas de uma vez:
SELECT * from usuarios;
-- WHERE nome = 'Marina'
-- and idade > 15
-- and id > 10;

-- deletar dados das tabelas

DELETE FROM usuarios
where id = 17;

-- Modificar dados na tabela
UPDATE usuarios
SET nome = 'TESTE'
WHERE NOME = 'Marina';

-- modificar mais de uma coluna de uma vez
UPDATE usuarios
SET nome = 'None', idade = 0, email = 'pisamarinaa@gmail.com'
WHERE id > 19;