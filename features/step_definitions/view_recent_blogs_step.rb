require 'watir-webdriver'
#Scenario: View Recent Blog Posts


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
  @browser.h2(:id => 'blog-link0').click
end

Then /^I should see the blog post$/ do
  
  expect(on_page(AllBlogEntriesPage).get_first_blog).to be_truthy

end