Feature: View Blog Entries
  In order to stay up todate
  As a Reader
  I want to be able to view blog posts of my favorite blogger
  
  @login_to_blog
  @create_10_test_blog_entries
  @delete_10_test_blog_entries
  Scenario: View Recent Blog Posts
    """Given my favorite blogger has been very active
    When I visit the blog for my favorite blogger
    Then I should see a summary of the 10 most recent posts, of my favorite blogger, in reverse order

  @login_to_blog
  @create_test_blog_entry
  @delete_test_blog_entry
  Scenario: View a Blog Post
    Given I visit the blog for my favorite blogger
    When I choose a blog post
    Then I should see the blog post
	
  @login_to_blog
  @create_test_blog_entry
  @delete_test_blog_entry
  Scenario: Search for Blog Post
    Given I visit the blog for my favorite blogger
    When I search for a blog post
    Then I should see posts with that value in the title