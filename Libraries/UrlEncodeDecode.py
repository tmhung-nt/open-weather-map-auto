import urllib.parse


class UrlEncodeDecode:
	def __init__(self):
		pass

	def encode_url(self, url):
		return urllib.parse.quote_plus(url)
		
	def decode_url(self, url):
		return urllib.parse.unquote_plus(url)