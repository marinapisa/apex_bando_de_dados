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
        # ler o id da coluna a ser deletada
        id_linha = input('Digite o ID do registro que deseja deletar: ')
        id_linha = int(id_linha)
        os.system('cls')

        # executar o código sql
        cursor.execute(f'''
            DELETE FROM usuarios
            WHERE id = {id_linha}; 
         ''')

        # printar mensagem de sucesso para quando deletar
        print(f'Registro com id {id_linha} deletado com sucesso!')




        ...
    elif operacao == '3':
                # ler  id da coluna a modificar
        id_linha= input('Informe o ID do registro que deseja alterar: ')
        # PEDIR QUAL INFORMAÇÃO DO REGISTRO DESEJA ALTERAR E FAZER UM EXECUTE PARA CADA ATRIBUTO?
        # executar o sódigo sql
        os.system('cls') 
        id_linha = int(id_linha) 

        # ler os dados novos:
        nome_novo = input('Informe o novo nome: ')  
        email_novo = input('Informe o novo e-mail: ')  
        idade_nova = input('Informe o nova idade: ')  
        idade_nova = int(idade_nova)

        # Validar os dados e inserir os mesmos caso sejam válidos
        if len(nome_novo) > 3 and idade_nova > 0 and '@' in email_novo:
            cursor.execute(f""" 
            UPDATE usuarios
            SET nome = '{nome_novo}', idade = {idade_nova}, email = '{email_novo}'
            WHERE id = {id_linha};
            """)
            print(f'Dados atualizados com sucesso em id = {id_linha}!')
        else:
            print('Informe dados válidos para serem atualizados!')




        ...
    elif operacao == '4':        
        # ler os dados novos
        nome_novo = input('Informe o nome do usuário: ')
        email_novo = input('Informe o e-mail do usuário: ')
        idade_nova = int(input('Informe a idade do usuário: '))

        os.system('cls')

        # Validar os dados e inserir os mesmos caso sejam válidos 
        if len(nome_novo) > 3 and idade_nova > 0 and '@' in email_novo:
            cursor.execute(f"""
                INSERT INTO usuarios (nome, idade, email)
                VALUES ('{nome_novo}', {idade_nova} , '{email_novo}');
            """)
            
            print(f'Dados {nome_novo}, {idade_nova}, {email_novo} inseridos com sucesso!')
        else:
            print('Informe dados válidos!')



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