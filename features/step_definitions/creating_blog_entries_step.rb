require 'watir-webdriver'
#Scenario: New Blog Post

After do
  @browser.back
  @browser.button(:text => 'Delete Post').click
  sleep 1
  @browser.alert.ok
end

Given /^I am logged in as a blogger$/ do
  goto_create_blog_entry
end

When /^I publish a new blog post$/ do
  fill_in_blog
end

Then /^I am notified that the blog post was successfully added$/ do
  response = read_blog_submission_response
  expect(response).to include 'was successfully added'
end

And /^the newly added blog post is at the top of the recent posts list$/ do
	goto_created_blog_entries
	first_title = read_created_blog_entries_response
	expect(first_title).to include 'My Test Blog Title'
end 