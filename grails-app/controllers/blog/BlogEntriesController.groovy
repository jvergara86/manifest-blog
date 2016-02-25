package blog
import blog.NewBlogEntry

class BlogEntriesController {

   def index(){
	   List<NewBlogEntry> allBlogEntries = NewBlogEntry.findAll()
	   [blogEntries:allBlogEntries]

   }
}

