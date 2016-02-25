package blog

class HomeController {

    def index() { 
		List<NewBlogEntry> allBlogEntries = NewBlogEntry.findAll()
		[blogEntries:allBlogEntries]
	}
}
