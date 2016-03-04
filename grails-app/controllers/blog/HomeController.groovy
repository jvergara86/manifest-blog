package blog

import grails.plugin.springsecurity.annotation.Secured


class HomeController {
	
    def index() { 
		List<NewBlogEntry> allBlogEntries = NewBlogEntry.findAll()


        [blogEntries:allBlogEntries]
	}
	
}
