from urllib.request import urlopen
import sys

response = urlopen('http://127.0.0.1:8000')

sys.exit( response.status != 200 )
