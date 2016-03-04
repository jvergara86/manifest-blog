Before do
  @browser = Watir::Browser.new 'firefox'
end


After do
  @browser.close
end

Before ('@login_to_blog') do
  login_to_blog
end

After ('@logout_of_blog') do
  logout_of_blog
end

Before ('@create_10_test_blog_entries') do
  create_test_post
  create_test_post
  create_test_post
  create_test_post
  create_test_post
  create_test_post
  create_test_post
  create_test_post
  create_test_post
  create_test_post
  
end

After ('@delete_10_test_blog_entries') do
  delete_test_post
  delete_test_post
  delete_test_post
  delete_test_post
  delete_test_post
  delete_test_post
  delete_test_post
  delete_test_post
  delete_test_post
  delete_test_post
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

