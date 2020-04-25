import psycopg2
import numpy as np
try:
    conn = psycopg2.connect(user = "postgres",
                            password = "123",
                            host = "127.0.0.1",
                            port = "5432",
                            database = "test")
    for i in np.arange(1000):
        myint = i.item()
        query =  "INSERT INTO my_tree (id, child_id) VALUES (%s, %s);"
        cursor = conn.cursor()
        cursor.execute(query, (myint, myint+1))
        conn.commit()
except (Exception, psycopg2.Error) as error :
    print ("Error while connecting to PostgreSQL", error)
finally:
    #closing database connection.
        if conn:
            cursor.close()
            conn.close()

