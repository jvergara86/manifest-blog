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


#Scenario: Leave a comment
=begin
	Given /^I am reading a blog post from my favorite blogger$/ do
		goto_blog_home
		navigate_to_blog_post
	end
	
	-Redundant Code-
=end
	
	When /^I add my genius comment to the blog post$/ do
		create_test_comment
	end
	
	Then /^my genius comment is at the top of the blog post comments$/ do
		expect(@browser.div(:id => 'comment-commenter0').text).to include("Test Commenter")
		expect(@browser.div(:id => 'comment-comment0').text).to include("Test Comment Post")
		
	end