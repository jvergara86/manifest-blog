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


Then /^I should see comments left by other readers$/ do
  expect(are_comments_found).to be_truthy
end
