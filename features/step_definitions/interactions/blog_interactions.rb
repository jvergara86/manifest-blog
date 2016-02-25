require 'page-object'

include PageObject::PageFactory

def goto_created_blog_entries
  visit_page CreatedBlogEntriesPage 
end

def goto_create_blog_entry
  visit_page CreateNewBlogEntryPage
end

def fill_in_blog
	on_page(CreateNewBlogEntryPage).create_new_blog_entry
	sleep 1
end

def read_blog_submission_response
  on_page(ShowEntryPage).response
end

def read_first_title
  on_page(CreatedBlogEntriesPage).first_title
end

def delete_test_post
  @browser.back
  @browser.button(:class => 'delete').click
  sleep 1
  @browser.alert.ok
end