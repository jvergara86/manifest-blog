require 'page-object'

class CreateNewBlogEntryPage
	include PageObject
	
	page_url "http://localhost:8080/blog/new-blog-entry/create"
	
	text_field(:title, :id => "blogTitle")
	text_area(:content, :id => "blogEntry")
	button(:submit, :name => "create")
	
	def create_new_blog_entry
		self.title = "My Test Blog Title"
		self.content = "This is my post content."
		self.submit
	end
end