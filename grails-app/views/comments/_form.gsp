<%@ page import="blog.Comments" %>

<g:formRemote name="commentForm" url="[controller:'comments', action:'save']" update="comments-container" >

	<div class="fieldcontain ${hasErrors(bean: commentsInstance, field: 'nameOfCommenter', 'error')} required">
		<label for="nameOfCommenter">
			<g:message code="comments.nameOfCommenter.label" default="Name Of Commenter" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="nameOfCommenter" maxlength="75" required="" value="${commentsInstance?.nameOfCommenter}"/>
	
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: commentsInstance, field: 'comment', 'error')} required">
		<label for="comment">
			<g:message code="comments.comment.label" default="Comment" />
			<span class="required-indicator">*</span>
		</label>
		<g:textArea name="comment" cols="40" rows="5" maxlength="1500" required="" value="${commentsInstance?.comment}"/>
	
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: commentsInstance, field: 'blogEntry', 'error')} required">
		<g:select id="comment-entry-blog-selector" name="blogEntry.id" from="${blog.NewBlogEntry.list()}" optionKey="id" required="" value="${newBlogEntryInstance.id}" class="many-to-one"/>
	
	</div>
	<fieldset class="buttons">
		<span class="glyphicon glyphicon-send"></span>
		<g:submitButton id="submit-comment" name="Submit Comment" onclick="submitForm()"/>
	</fieldset>

</g:formRemote>