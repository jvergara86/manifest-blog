package blog

class CreateNewBlogEntry {

	String blogTitle
	String blogEntry
	Date dateCreated
	
    static constraints = {
		blogTitle(blank:false)
		blogEntry(maxSize:2000, blank:false)
    }
}
