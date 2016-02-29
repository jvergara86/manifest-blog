require 'watir-webdriver'
#Scenario: Search Engine Friendly URLs

=begin
Given /^I visit the blog for my favorite blogger$/ do
	This code is execuded in a different step file. (view_blogs_step.rb)
end


When /^I choose a blog post$/ do
	This code is execuded in a different step file. (view_blogs_step.rb)
end
=end


Then /^the url should contain information about the post$/ do
  result = get_blog_entry_count
  expect(result).to eq(10)
end
