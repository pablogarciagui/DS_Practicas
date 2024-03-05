from bs4 import BeautifulSoup
import requests


class ScrapeStrategy():
    def scrape(self, url):
        pass


class BeautifulSoupStrategy(ScrapeStrategy):
    def scrape(self, url):
        response = requests.get(url)
        if response.status_code == 200:
            soup = BeautifulSoup(response.content, 'html.parser')
            open_value_td = soup.find('td', {'data-test': 'OPEN-value'})
            if open_value_td:
                return open_value_td.text.strip()
            else:
                return 'Open Value not found'
        else:
            return f'Failed to retrieve the webpage, status code: {response.status_code}'



class SeleniumStrategy(ScrapeStrategy):
    def scrape(self, url):
        pass




class Context:
    def __init__(self, strategy):
        self._strategy = strategy

    def set_strategy(self, strategy):
        self._strategy = strategy

    def scrape(self, url):
        return self._strategy.scrape(url)



url = 'https://finance.yahoo.com/quote/TSLA'
context = Context(BeautifulSoupStrategy())
open_value = context.scrape(url)
print('Open Value:', open_value)
