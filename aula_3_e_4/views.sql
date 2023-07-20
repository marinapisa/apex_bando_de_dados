-- database: c:\Users\Marina-PC\Desktop\apex_bando_de_dados\aula_3_e_4\mydatabase.db

--  view : visão 
-- uma view é dar um nome a um select , como se fosse uma function


-- Criando uma view
CREATE VIEW SelectProgramadores AS 
select id, nome, idade, email, linguagem_de_programacao
from programadores;

-- Chamando uma View:
select * from SelectProgramadores;

-- Deletando uma View:
DROP VIEW SelectProgramadores;

-- Criando uma nova View:
CREATE VIEW ProgramadoresUsuariosEmailMatch as
select  programadores.nome as Programador,
        programadores.email as Email,
        usuarios.nome_usu as Usuario
from programadores inner join usuarios
on programadores.email = usuarios.email_usu
where nome is NOT NULL
order by nome asc

-- Chamando a nova View: