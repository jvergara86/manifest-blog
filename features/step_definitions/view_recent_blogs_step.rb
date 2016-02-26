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
