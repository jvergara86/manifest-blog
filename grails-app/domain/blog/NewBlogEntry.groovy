package blog

import grails.converters.JSON

//@Resource(uri = "/blogs", formats = ["json"])
class NewBlogEntry {

	String blogTitle
	String blogEntry
	Date dateCreated
	
    static constraints = {
    }
	
	static mapping = {
		sort dateCreated: "desc"
	}
}
