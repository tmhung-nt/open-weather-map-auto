# import requests
import paramiko

client = paramiko.SSHClient()

class LinuxConnection:

	# client = paramiko.SSHClient()

	def __init__(self):
		client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
		

	def connect_ssh(self, vServer, vUser, vPassword, vfileKey):
		client.connect(vServer, port=22, username=vUser, key_filename=vfileKey, password=vPassword)
		# stdin, stdout, stderr = client.exec_command(vCommand)
		return (0)
		
		
	def run_ssh(self, vCommand):
		stdin, stdout, stderr = client.exec_command(vCommand)
		# print stdout.read()
		return stdout.read()	
		
		
	def close_ssh(self):
	 	client.close()