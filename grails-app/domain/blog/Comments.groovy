package blog

class Comments {

	String nameOfCommenter
	String comment
	Date dateCreated
	
	static belongsTo = [blogEntry: NewBlogEntry]
	
	static mapping = {
		table 'comments'
		sort dateCreated: "desc"
	}
	
    static constraints = {
		nameOfCommenter(blank:false, maxSize:75)
		comment(blank:false, maxSize:1500)
    }
}
