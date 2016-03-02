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
  blog_title = "My-Test-Blog-Title"
  expect(@browser.url).to match(/http:\/\/localhost:8080\/blog\/blogEntry\/[0-9]+\/[0-9]+\/[0-9]+\/[0-9]+\/#{blog_title}$/)
end
