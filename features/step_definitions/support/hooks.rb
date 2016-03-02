Before do
  @browser = Watir::Browser.new 'firefox'
end


After do
  @browser.close
end


Before ('@create_test_blog_entry') do
  create_test_post
end

After('@delete_test_blog_entry') do
  delete_test_post
end

Before ('@create_test_comment_entry') do
  create_test_comment
end


After ('@delete_test_comment_entry') do
  delete_test_comment
end
