from bs4 import BeautifulSoup
from bs4.element import Comment
import urllib.request
import re

import mysql.connector

mydb = mysql.connector.connect(
  host="192.168.1.166",
  user="kadir",
  password="kadir_erturk",
  database="neural"
)
mycursor = mydb.cursor()


def check_language():

    return 1

def tag_visible(element):
    if element.parent.name in ['style', 'script', 'head', 'title', 'meta', '[document]']:
        return False
    if isinstance(element, Comment):
        return False
    return True


def text_from_html(body):
    soup = BeautifulSoup(body, 'html.parser')
    texts = soup.findAll(text=True)
    visible_texts = filter(tag_visible, texts)
    return u" ".join(t.strip() for t in visible_texts)


def getAllLinks(soup):
    links = []
    for link in soup.findAll('a'):
        links.append(link.get('href'))
    return links


def saveWord(word):
    sql = "SELECT coalesce(num, 0) FROM words_tr WHERE word= '" + word + "' "
    mycursor.execute(sql)
    records = mycursor.fetchone()
    if records:
        num = records[0]+1
    else:
        num = 1
    sql = "REPLACE INTO words_tr(word, num) VALUES ('" + word + "', " + str(num) + ") "
    mycursor.execute(sql)
    mydb.commit()


html = urllib.request.urlopen('https://www.antoloji.com/').read()

soup = BeautifulSoup(html, features='html.parser')
links = getAllLinks(soup)

if soup.html['lang'] == "tr":
    for link in links:
        soup = BeautifulSoup(html, features='html.parser')
        visible_text = soup.getText()
        text = re.sub(r'\W+', ' ', text_from_html(html))
        aData = text.split(' ')
        for word in aData:
            if(word!=''):
                saveWord(word)

print("done")
