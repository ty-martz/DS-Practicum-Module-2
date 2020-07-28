import requests
from bs4 import BeautifulSoup
import pandas as pd

URL = 'https://code.s3.yandex.net/data-analyst-eng/chicago_weather_2017.html'

req = requests.get(URL)

soup = BeautifulSoup(req.text, 'lxml')
table = soup.find('table',attrs={"id": "weather_records"})

head = []
for row in table.find_all('th'):
    head.append(row.text)

data = []
for row in table.find_all('tr'):
    if not row.find_all('th'):
        data.append([element.text for element in row.find_all('td')])

weather_records = pd.DataFrame(data, columns=head)
print(weather_records)
