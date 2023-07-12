import sqlite3
import os

os.system('cls')
conexao = sqlite3.connect('mydatabase.db')
print ('Conexão criada com sucesso!')
cursor = conexao.cursor()

# mensagem para o CRUD:
menu_crud = '\nEscolha uma operação abaixo: '
menu_crud += '\n1 - Selecionar'
menu_crud += '\n2 - Deletar'
menu_crud += '\n3 - Atualizar'
menu_crud += '\n4 - Inserir'
menu_crud += '\n5 - Sair'
menu_crud += '\n - Informe a opcao: '

# While que rodará o programa:
while True:
    # ler a opção do usuário
    operacao = input(menu_crud)
    # print(operacao)
    # break
    # verificar a operação informada:
    if operacao == '1':
        os.system('cls')
        # executar o código SQL
        cursor.execute(f''' 
           SELECT * FROM usuarios
        ''')
        # extrair o resultado que voltou do bando de dados
        # atraves do select que selecionou os dados para o porgrama
        resultado = cursor.fetchall()
        # print(resultado)
        # print(type(resultado))

        for item in resultado:
            print(item)

    elif operacao == '2':
        os.system('cls')
        # ler o id da coluna a ser deletada
        id = input('Digite o ID do registro que deseja deletar: ')

        # executar o código sql
        cursor.execute(f'''
            DELETE FROM usuarios
            WHERE id = id 
         ''')

        # printar mensagem de sucesso para quando deletar
        print('Registro com id {id} deletado com sucesso!')

        ...
    elif operacao == '3':
        os.system('cls')
        # ler  id da coluna a modificar
        id = input('Informe o ID do registro que deseja alterar: ')
        # PEDIR QUAL INFORMAÇÃO DO REGISTRO DESEJA ALTERAR E FAZER UM EXECUTE PARA CADA ATRIBUTO?
        # executar o sódigo sql
        cursor.execute(f''' 
            UPDATE usuarios
            SET nome = 'TESTE'
            WHERE NOME = 'Marina';
        ''')

        #  printar a mesagem de sucesso quando atualizar
        print('Registro com id {id} alterado com sucesso!')

        ...
    elif operacao == '4':
        os.system('cls')
        # ler os dados novos
        cursor.execute(f'''
            INSERT INTO {contatos}(nome, idade, email)
            VALUES ('{usuario_nome}', {usuario_idade} , '{usuario_email}')
        ''')


        # validar os dados

        # se validos vamos inserir dna base de dados

        # senao, mostrar mensagem de erro ao usuário
        ...
    elif operacao == '5':
        print('Laço de repetição parado com sucesso!!')
        break

#     # # compactar nossas mudanças para entao enviar ela ao banco de dados
# conexao.commit()
# print('Comitou dados com sucesso!!')
# # fechar a conexão com a base de dados
# conexao.close()
# print('conexão fechada com sucesso!!')