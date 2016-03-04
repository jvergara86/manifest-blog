require 'page-object'

class LogoutPage
	include PageObject
	
	page_url "http://localhost:8080/blog/logout"
	
end