import urllib.parse


class UrlEncodeDecode:
	def __init__(self):
		pass

	def encode_url(self, url):
		_encode = urllib.parse.quote(url)
		print(f"encode_url(): {url} to {_encode}")
		return _encode
		
	def decode_url(self, url):
		_decode = urllib.parse.unquote(url)
		print(f"encode_url(): {url} to {_decode}")
		return _decode