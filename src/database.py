import pymysql

def conectar():
    return pymysql.connect(
        host="localhost",
        port=3306,
        user="root",
        password="fatec",
        database="gear_rate"
    )