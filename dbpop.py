import sqlite3
import json
conn = sqlite3.connect('var/wordle.db')
c = conn.cursor()


f = open('share/valid.json')
data = json.load(f)

for count, val in enumerate(data):
    c.execute("INSERT INTO valid_word (valid_id, valword) VALUES(? , ?)" , (count, val))
    print(count)
    print(val)  
f.close()   


s = open('share/correct.json')
data = json.load(s)

for count, val in enumerate(data):
    c.execute("INSERT INTO answer (answerid, answord) VALUES(? , ?)" , (count, val))

s.close()   

conn.commit()