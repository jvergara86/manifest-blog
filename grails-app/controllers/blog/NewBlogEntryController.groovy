package blog



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class NewBlogEntryController {
	
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
    	respond NewBlogEntry.list(params), model:[newBlogEntryInstanceCount: NewBlogEntry.count()]

	}

    def search() {
        def blogs = NewBlogEntry.findAllByNameLike("${params.value}%")
        render (template:'results', model: [value: params.value, blogs: blogs])
    }

    def show(NewBlogEntry newBlogEntryInstance) {
        respond newBlogEntryInstance
    }

    def create() {
        respond new NewBlogEntry(params)
    }

    @Transactional
    def save(NewBlogEntry newBlogEntryInstance) {
        if (newBlogEntryInstance == null) {
            notFound()
            return
        }

        if (newBlogEntryInstance.hasErrors()) {
            respond newBlogEntryInstance.errors, view:'create'
            return
        }

        newBlogEntryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'createEntry.created.message', args: ['Blog Post:', newBlogEntryInstance.blogTitle])
                redirect newBlogEntryInstance
            }
            '*' { respond newBlogEntryInstance, [status: CREATED] }
        }
    }

    def edit(NewBlogEntry newBlogEntryInstance) {
        respond newBlogEntryInstance
    }

    @Transactional
    def update(NewBlogEntry newBlogEntryInstance) {
        if (newBlogEntryInstance == null) {
            notFound()
            return
        }

        if (newBlogEntryInstance.hasErrors()) {
            respond newBlogEntryInstance.errors, view:'edit'
            return
        }

        newBlogEntryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: ['Blog Post:', newBlogEntryInstance.blogTitle])
                redirect newBlogEntryInstance
            }
            '*'{ respond newBlogEntryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(NewBlogEntry newBlogEntryInstance) {

        if (newBlogEntryInstance == null) {
            notFound()
            return
        }

        newBlogEntryInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: ['Blog Post:', newBlogEntryInstance.blogTitle])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: ['Blog Post:', newBlogEntryInstance.blogTitle])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
