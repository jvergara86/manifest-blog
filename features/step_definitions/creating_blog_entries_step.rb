#Scenario: New Blog Post

Given /^I am logged in as a blogger$/ do
  @page = CreateNewBlogEntryPage.new @browser
  @page.goto
end

When /^I publish a new blog post$/ do
  @page.create_new_blog_entry
  sleep 1
end

Then /^I am notified that the blog post was successfully added$/ do
  expect(@page.html).to include("was successfully added")
end

#And /^the newly added blog post is at the top of the recent posts list$/ do
  
#end