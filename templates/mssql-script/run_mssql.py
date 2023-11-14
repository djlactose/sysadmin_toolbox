import pyodbc
import yaml

with open("./vars.conf","r") as file:
    vars=yaml.safe_load(file)


server = vars['server']
database=vars['database']
user = vars['user']
password = vars['password']

#Local Constants
driver= "{ODBC Driver 18 for SQL Server}"

try:
    connectionString = f'DRIVER={driver};SERVER={server};DATABASE={database};UID={user};PWD={password};Encrypt=no;Trusted_connection=no;TrustServerCertificate=Yes;'
    con=pyodbc.connect(connectionString)
except Exception as e:
    print("Unable to connect to the database. ",e)
    exit
curs = con.cursor()
sql = open('./run.sql','r')
curs.execute(sql.read())
result=curs.fetchall()
for row in result:
    print (row)
curs.commit()
con.close()