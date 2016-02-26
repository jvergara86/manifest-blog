require 'page-object'

class BlogHomePage
	include PageObject
	
	page_url "http://localhost:8080/blog/"
	
	divs(:count_blog_entries, :class_name => 'blog-entry')

	
	def count_blog_entries
		@counter = 0
		self.count_blog_entries_elements.each do |div|
			@counter = @counter + 1
		end
		return @counter
	end
end