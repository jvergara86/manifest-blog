package blog

class CreateNewBlogEntry {

	String blogTitle
	String blogEntry
	Date dateCreated
	
    static constraints = {
    }
	
	static mapping = {
		sort dateCreated: "desc"
	}
}
