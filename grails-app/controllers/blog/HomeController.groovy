package blog

class HomeController {

    def index() { 
		List<NewBlogEntry> allBlogEntries = NewBlogEntry.findAll()


        [blogEntries:allBlogEntries]
	}

    def search = {
        def blogs = NewBlogEntry.findAllByTitle("${params.value}%")
        render(view:'search', model: [value: params.value, blogs: blogs])
        }
    }
