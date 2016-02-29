require 'watir-webdriver'
#Scenario: View Blog Comments

=begin
Given /^I visit the blog for my favorite blogger$/ do
	This code is execuded in a different step file. (view_blogs_step.rb)
end


When /^I choose a blog post$/ do
	This code is execuded in a different step file. (view_blogs_step.rb)
end
=end


Then /^the url should contain information about the post$/ do
  result = are_comments_found
  expect(result).to be_truthy
end
