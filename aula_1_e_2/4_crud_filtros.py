import sqlite3
import os
import pandas as pd

#  instalar o pandas na maquina local com o cmd 'pip install pandas' enter

# def para criar função DEF = FUNCTION

def executar_comandos_sql():
    """ Primeira docstring: Função para executar comandos sql na base de dados usando pandas """ #é pra ser um comentário acho
    # Criar a conexão com o banco de dados


    # Usar função do pandas chamada: read_sql_query, ele executa sql e espera como parametros uma string
    # com o sql a ser executado, e tbm espera a conexão com  a base de dados


    #  fechar a conexão


    # retornar os dados do query (ou seja, da busca sql)

def mostrar_opcoes():
    """ Função para mostrar as opções disponpiveis do programa para o usuário """
    # Printar os dados usando um for na lista com as colunas disponíveis

def retorna_media_coluna():
    """ Função para retornar média de uma coluna informada pelo usuário """
    #  Comando SQL

    # Executar o SQL

    # Mostrar o resultado

def contar_linhas_coluna():
    """ Função para contar a coluna informada pelo usuário """     
    # Comando SQL

    # Executar o SQL

    # Mostrar o resultado

def buscar_palavra_em_colunas():
    """ Função para buscar paravras chaves usando o LIKE """
    #  Criar a string com o padrão da palavra que que será buscada

    #  Comando SQL

    #  executar o SQL

    # Mostrar o resultado

def retorna_min_max_coluna():
    """ Função para retornar valor mínimo e máximo das colunas """
    #  Comando SQL

    #  executar o SQL

    # Mostrar o resultado

# START

os.system('cls')
conexao = sqlite3.connect('mydatabase.db')

