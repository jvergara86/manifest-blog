package blog

import grails.converters.JSON

//@Resource(uri = "/blogs", formats = ["json"])
class NewBlogEntry {

	String blogTitle
	String blogEntry
	Date dateCreated
	
	
	static hasMany = [comments: Comments]
	
    static constraints = {
		blogTitle(blank:false, maxSize:255)
		blogEntry(blank:false, maxSize:5000)
    }
	
	static mapping = {
		sort dateCreated: "desc"
	}
}
