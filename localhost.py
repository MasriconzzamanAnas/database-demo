import os
print('hello world')
with open('table.sql','w') as file:
    print("Done")

os.rename('table.sql', 'damo.sql')
