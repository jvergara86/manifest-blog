require 'page-object'

class SearchPage
	include PageObject
	
	page_url "http://localhost:8080/blog/blog-entries/search"
	
	divs(:blog, :class_name => 'search-results')

	
end