require 'page-object'

class CreatedBlogEntriesPage
	include PageObject
	
	page_url "http://localhost:8080/blog/new-blog-entry/index"
	
	cell(:first_title, :class => '0')
	
end