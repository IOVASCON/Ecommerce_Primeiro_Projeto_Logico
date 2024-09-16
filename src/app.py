# Este script Python conecta-se ao banco de dados MySQL e executa consultas
import mysql.connector
from config import DB_HOST, DB_USER, DB_PASSWORD, DB_NAME

# Função para conectar ao banco de dados
def connect_to_db():
    conn = mysql.connector.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=DB_NAME
    )
    return conn

# Função para recuperar e exibir todos os clientes
def get_all_clients():
    conn = connect_to_db()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Cliente")
    for row in cursor.fetchall():
        print(row)
    conn.close()

# Função principal
if __name__ == "__main__":
    get_all_clients()
