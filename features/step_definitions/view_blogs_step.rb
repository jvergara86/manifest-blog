require 'watir-webdriver'
#Scenario: View Recent Blog Posts

Before ('@create_test_blog_entry') do
	create_test_post
end

After ('@delete_test_blog_entry') do

end

#Given /^my favorite blogger has been very active$/ do
#end

When /^I visit the blog for my favorite blogger$/ do
  goto_blog_home
end

Then /^I should see a summary of the 10 most recent posts, of my favorite blogger, in reverse order$/ do
  result = get_blog_entry_count
  expect(result).to eq(10)
end


#Scenario: View a Blog Posts


When /^I choose a blog post$/ do
  navigate_to_blog_post
end

Then /^I should see the blog post$/ do
  
  expect(@browser.html).to include '<h1 id="blog-title">Blog Post: My Test Blog Title'

end

When /^I search for a blog post$/ do
	search_for_blog
end

Then /^I should see posts with that value in the title$/ do
	result = is_search_results_found
	expect(result).to be_truthy 
end
