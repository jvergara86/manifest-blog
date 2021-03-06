package blog



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class CommentsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Comments.list(params), model:[commentsInstanceCount: Comments.count()]
    }

    def show(Comments commentsInstance) {
        respond commentsInstance
    }
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def create() {
        respond new Comments(params)
    }
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    @Transactional
    def save(Comments commentsInstance) {
        if (commentsInstance == null) {
            notFound()
            return
        }

        if (commentsInstance.hasErrors()) {
            respond commentsInstance.errors, view:'create'
            return
        }

        commentsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'comments.label', default: 'Comments'), commentsInstance.id])
                render (template: "commentPosts", model: [newBlogEntryInstance:commentsInstance.blogEntry])
            }
            '*' { respond commentsInstance, [status: CREATED] }
        }
    }

	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def edit(Comments commentsInstance) {
        respond commentsInstance
		
    }
	
	
    @Transactional
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def update(Comments commentsInstance) {
        if (commentsInstance == null) {
            notFound()
            return
        }

        if (commentsInstance.hasErrors()) {
            respond commentsInstance.errors, view:'edit'
            return
        }

        commentsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Comments.label', default: 'Comments'), commentsInstance.id])
				redirect (controller: "blogEntries", action: "show", id:"${commentsInstance.blogEntryId}")
            }
            '*'{ respond commentsInstance, [status: OK] }
        }
    }

	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    @Transactional
    def delete(Comments commentsInstance) {

        if (commentsInstance == null) {
            notFound()
            return
        }

        commentsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                render (template: "commentPosts", model: [newBlogEntryInstance:commentsInstance.blogEntry])
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'comments.label', default: 'Comments'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def _commentPosts(Comments commentsInstance) {
		respond Comments.list(params)
	}
}
