#!/usr/bin/env python

""" english learning tool """

# pip install requests
# pip install beautifulsoup4
# (c) Xuan Li <xuali2@cisco.com>

import os
os.environ["LC_CTYPE"] = "UTF-8"
import sys
import requests
from bs4 import BeautifulSoup

def main():
    url = "http://www.bing.com/dict/search?mkt=zh-cn&q=" + sys.argv[1]
    response = requests.get(url)
    if response.status_code != 200:
        print('failed to connect bing server')
        return
    soup = BeautifulSoup(response.text, "lxml")
    div = soup.find(id="homoid")
    if None == div:
        print('no results found for ' + sys.argv[1])
        return
    table = div.table
    trs = table.find_all('tr')
    hd_prus = soup.find_all('div', 'hd_prUS')
    hd_pruk = soup.find_all('div', 'hd_pr')
    if 0 < len(hd_prus) and 0 < len(hd_pruk):
        str_hd_prus = hd_prus[0].get_text()
        str_hd_prus_index = str_hd_prus.find('[')
        if -1 != str_hd_prus_index:
            str_hd_prus = ' US: ' + str_hd_prus[str_hd_prus_index:].strip()
        else:
            str_hd_prus = ''
        str_hd_pruk = hd_pruk[0].get_text()
        str_hd_pruk_index = str_hd_pruk.find('[')
        if -1 != str_hd_pruk_index:
            str_hd_pruk = ' UK: ' + str_hd_pruk[str_hd_pruk_index:].strip()
        else:
            str_hd_pruk = ''
        print(sys.argv[1] + str_hd_prus + str_hd_pruk)
    else:
        print(sys.argv[1])
    for tr in trs:
        poss = tr.find_all('div', 'pos pos1')
        print(poss[0].get_text())
        de_lis = tr.find_all('div', 'de_li1 de_li3')
        for de_li in de_lis:
            if -1 == de_li.parent['class'][0].find('gl_none'):
                print(de_li.get_text().strip())

if __name__ == "__main__":
    if len(sys.argv) == 2:
        main()
