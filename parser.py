import psycopg2, random

conn = psycopg2.connect("host=localhost dbname=docker user=postgres password=password")


records = []



with open('question_data/t20.txt') as fp:
   line = 'start'
   cnt = 1
   while line:
        question = fp.readline()
        if not question:
            break
        question = question.strip()[3:]
        
        a = fp.readline()
        a = a.strip()[3:]

        b = fp.readline()
        b = b.strip()[3:]
        
        c = fp.readline()
        c = c.strip()[3:]
        
        d = fp.readline()
        d = d.strip()[3:]
        
        team = fp.readline()
        team = team.strip()[6:]

        eoq = fp.readline()
        
        q_order = [a, b, c, d]
        i_order = ['a', 'b', 'c', 'd']
        random.shuffle(q_order)
        print(q_order)
        correct_index = q_order.index(a)
        print(correct_index)
        records.append((team, question, q_order[0], q_order[1], q_order[2], q_order[3], i_order[correct_index]))

fp.close()




cur = conn.cursor()
cur.execute('SELECT * FROM COURT_TEAM')

# all = cur.fetchall()

# # INSERT INTO court_question VALUES()

# #INSERT INTO COURT_QUESTION(team, question_statement, choice_a, choice_b, choice_c, choice_d, answer) 
# #    VALUES (_t, _q, _ca, _cb, _cc, _cd, _a)

# records = [
#     ('TOR', 'THIS IS AN INSERT 7?', 'a', 'b', 'c', 'd', 'd'),
#     ('TOR', 'THIS IS AN INSERT 7?', 'a', 'b', 'c', 'd', 'd'),
#     ('TOR', 'THIS IS AN INSERT 7?', 'a', 'b', 'c', 'd', 'd'),
#     ('TOR', 'THIS IS AN INSERT 7?', 'a', 'b', 'c', 'd', 'd'),
#     ('TOR', 'THIS IS AN INSERT 7?', 'a', 'b', 'c', 'd', 'd')
# ]

cur.executemany("""INSERT INTO court_question (team, question_statement, choice_a , choice_b, choice_c, choice_d, answer)
    VALUES (%s, %s, %s, %s, %s, %s, %s) """, records)

conn.commit()