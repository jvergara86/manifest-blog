require 'page-object'

class LoginPage
	include PageObject
	
	page_url "http://localhost:8080/blog/login/auth"
	
	text_field(:username, :id => 'username')
	text_field(:password, :id => 'password')
	button(:submit, :id => 'submit')
	
	def login
		self.username = "JBloom"
		self.password = "rarrar33"
		self.submit
	end
	
end