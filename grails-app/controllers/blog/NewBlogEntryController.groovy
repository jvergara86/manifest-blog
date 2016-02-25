package blog



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NewBlogEntryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
    	respond NewBlogEntry.list(params), model:[newBlogEntryInstanceCount: NewBlogEntry.count()]
	}

    def show(NewBlogEntry createNewBlogEntryInstance) {
        respond createNewBlogEntryInstance
    }

    def create() {
        respond new NewBlogEntry(params)
    }

    @Transactional
    def save(NewBlogEntry createNewBlogEntryInstance) {
        if (createNewBlogEntryInstance == null) {
            notFound()
            return
        }

        if (createNewBlogEntryInstance.hasErrors()) {
            respond createNewBlogEntryInstance.errors, view:'create'
            return
        }

        createNewBlogEntryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'createEntry.created.message', args: ['Blog Post:', createNewBlogEntryInstance.blogTitle])
                redirect createNewBlogEntryInstance
            }
            '*' { respond createNewBlogEntryInstance, [status: CREATED] }
        }
    }

    def edit(NewBlogEntry createNewBlogEntryInstance) {
        respond createNewBlogEntryInstance
    }

    @Transactional
    def update(NewBlogEntry createNewBlogEntryInstance) {
        if (createNewBlogEntryInstance == null) {
            notFound()
            return
        }

        if (createNewBlogEntryInstance.hasErrors()) {
            respond createNewBlogEntryInstance.errors, view:'edit'
            return
        }

        createNewBlogEntryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: ['Blog Post:', createNewBlogEntryInstance.blogTitle])
                redirect createNewBlogEntryInstance
            }
            '*'{ respond createNewBlogEntryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(NewBlogEntry createNewBlogEntryInstance) {

        if (createNewBlogEntryInstance == null) {
            notFound()
            return
        }

        createNewBlogEntryInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: ['Blog Post:', createNewBlogEntryInstance.blogTitle])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: ['Blog Post:', createNewBlogEntryInstance.blogTitle])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
