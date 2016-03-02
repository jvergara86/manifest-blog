require 'page-object'

include PageObject::PageFactory

def goto_blog_home
  visit_page BlogHomePage
  sleep 1
end

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
  goto_created_blog_entries
  @browser.table(:class => 'blog-posts')[1][0].a.click
  sleep 1
  @browser.button(:class => 'delete').click
  sleep 1
  @browser.alert.ok
end

def get_blog_entry_count
  counter = 0
  @browser.divs(:class => 'blog-entry').each do |div|
    counter = counter + 1
  end
  return counter
end

def is_search_results_found
	is_found = false
	@browser.divs(:class => 'search-results').each do |div|
    is_found = true
	end
  return is_found
end

def search_for_blog
	search_term = 'My Test Blog Title'
	@browser.h1(:class => 'search').click
	sleep 1
	@browser.text_field(:id => 'search-input').set search_term
	@browser.button(:class => 'search').click
end

def navigate_to_blog_post
	@browser.h2(:id => 'blog-link0').click
	@browser.a(:id => 'blog-link0').click
end

def are_comments_found
	is_found = false
	@browser.divs(:class => 'comment-post').each do |div|
    is_found = true
	end
  return is_found
end

def create_test_post
	goto_create_blog_entry
	fill_in_blog
end

def create_test_comment
	goto_blog_home
	navigate_to_blog_post
	@browser.text_field(:id => 'commenter').set 'Test Commenter'
	@browser.text_field(:id => 'comment').set 'Test Comment Post'
	sleep 2
	@browser.button(:id => 'submit-comment').click
	sleep 2
end

def delete_test_comment
	goto_blog_home
	navigate_to_blog_post
	@browser.a(:id => 'comment-link-index0').click
	sleep 1
	@browser.button(:class => 'delete').click
	sleep 1
	@browser.alert.ok
end
