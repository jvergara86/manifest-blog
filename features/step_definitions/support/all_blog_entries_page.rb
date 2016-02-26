require 'page-object'

class AllBlogEntriesPage
	include PageObject
	
	page_url "http://localhost:8080/blog/blogEntries"
	
	div(:first_blog, :id => 'blog-entry0')

	def get_first_blog
		self.first_blog?
	end

	
end