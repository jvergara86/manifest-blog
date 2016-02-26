package blog
import blog.NewBlogEntry

class BlogEntriesController {

   def index(){
	   List<NewBlogEntry> allBlogEntries = NewBlogEntry.findAll()
	   [blogEntries:allBlogEntries]

   }
   
   def show(NewBlogEntry newBlogEntryInstance) {
	   respond newBlogEntryInstance
   }
   
   def search = {
	   def blogs = NewBlogEntry.findAllByBlogTitleLike("${params.value}%")
	   render(view:'search', model: [value: params.value, blogs: blogs])
   }
  
}

