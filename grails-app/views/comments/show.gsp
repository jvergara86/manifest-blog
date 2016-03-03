<%@ page import="blog.Comments" %>
<%@ page import="blog.NewBlogEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comments.label', default: 'Comments')}" />
		<title>${commentsInstance?.nameOfCommenter}: Comment</title>
	</head>
	<body>
		<a href="#show-comments" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav">
			<ul>
				<li><g:link class="btn btn-nav" url="/./blog"><span class="glyphicon glyphicon-home"></span> Home</g:link></li>
			</ul>
		</div>
		
		<div id="show-comments" class="content scaffold-show" role="main">
			<h1>Comment for Blog: ${commentsInstance.blogEntry.blogTitle}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list comments">
			
				<g:if test="${commentsInstance?.nameOfCommenter}">
				<li class="fieldcontain">
					<span id="nameOfCommenter-label" class="property-label"><g:message code="comments.nameOfCommenter.label" default="Name Of Commenter" /></span>
					
						<span class="property-value" aria-labelledby="nameOfCommenter-label"><g:fieldValue bean="${commentsInstance}" field="nameOfCommenter"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${commentsInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="comments.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${commentsInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${commentsInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="comments.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${commentsInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:commentsInstance, controller:'comments', action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${commentsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
