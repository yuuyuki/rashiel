#pip install python-docx

import os
from docx import Document

files = os.listdir('.')

for file in files:

    if file.endswith('.utf'):
        print(file)

        with open(file, encoding='utf-8', mode='r') as f:
            text = f.read().splitlines()

        document = Document()

        for line in text:
            document.add_paragraph(line)

        document.save(file+'.docx')
