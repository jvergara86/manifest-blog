<%@ page import="blog.Comments" %>
<%@ page import="blog.NewBlogEntry" %>



	<div class="fieldcontain ${hasErrors(bean: commentsInstance, field: 'nameOfCommenter', 'error')} required">
		<label for="nameOfCommenter">
			<g:message code="comments.nameOfCommenter.label" default="Name Of Commenter:" />
		</label>
		<g:textField id="commenter" name="nameOfCommenter" maxlength="75" required="" value="${commentsInstance?.nameOfCommenter}"/>
	
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: commentsInstance, field: 'comment', 'error')} required">
		<label for="comment">
			<g:message code="comments.comment.label" default="Comment:" />
		</label>
		<g:textArea id="comment" name="comment" cols="40" rows="5" maxlength="1500" required="" value="${commentsInstance?.comment}"/>
	
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: commentsInstance, field: 'blogEntry', 'error')} required">
		<g:select id="comment-entry-blog-selector" name="blogEntryId" from="${commentsInstance}" optionKey="id" required="" value="${commentsInstance.blogEntryId}" class="many-to-one"/>
	</div>

