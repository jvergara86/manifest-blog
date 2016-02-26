require 'page-object'

class BlogHomePage
	include PageObject
	
	page_url "http://localhost:8080/blog/"
	
	divs(:count_blog_entries, :class_name => 'blog-entry')

	
end