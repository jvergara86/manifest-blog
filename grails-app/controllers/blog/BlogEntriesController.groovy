package blog
import grails.plugin.springsecurity.annotation.Secured

class BlogEntriesController {

   def index(Integer max){
	   params.max = Math.min(max ?: 10, 100)
	   [total:NewBlogEntry.count(), blogEntries:NewBlogEntry.list(params)]

   }
   
   def show(NewBlogEntry newBlogEntryInstance) {
	   respond newBlogEntryInstance
   }
   
   def search = {
	   def blogs = NewBlogEntry.findAllByBlogTitleIlike("%${params.value}%")
	   def total = NewBlogEntry.countByBlogTitleIlike("%${params.value}%")
	   render(view:'search', model: [value: params.value, blogs: blogs, total: total])
   }
   
   def remoteSearch ={
	   def blogs = NewBlogEntry.findAllByBlogTitleIlike("%${params.value}%")  
	   def total = NewBlogEntry.countByBlogTitleIlike("%${params.value}%")
	   render(template:'results',model:[value: params.value, blogs: blogs, total: total])
   }
}
