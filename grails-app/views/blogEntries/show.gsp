<%@ page import="blog.Comments" %>
<%@ page import="blog.NewBlogEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
		<g:set var="entityName" value="${message(code: 'newBlogEntry.label', default: 'newBlogEntry')}" />
		<title>Update Post: ${newBlogEntryInstance?.blogTitle}</title>
	</head>
	<body>
		<a href="#show-newBlogEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav">
			<ul>
				<li><g:link class="btn btn-nav" url="/./blog"><span class="glyphicon glyphicon-home"></span> Home</g:link></li>
				<li><g:link class="btn btn-nav" url="/./blog/newBlogEntry/create"><span class="glyphicon glyphicon-pencil"></span> Create Blog</g:link></li>
				<li><g:link class="btn btn-nav" url="/./blog/blogEntries"><span class="glyphicon glyphicon-eye-open"></span> View All Blogs</g:link></li>
				<li><g:link class="btn btn-nav" url="/./blog/blogEntries/search"><span class="glyphicon glyphicon-search"></span> Search Blogs</g:link></li>
			</ul>
		</div>
		<div id="show-newBlogEntry" class="content scaffold-show" role="main">
			<h1 id="blog-title">Blog Post: ${newBlogEntryInstance?.blogTitle}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list newBlogEntry no-bullets">
			
				<g:if test="${newBlogEntryInstance?.blogTitle}">
				<li class="fieldcontain">
					<span id="blogTitle-label" class="property-label"><g:message code="newBlogEntry.blogTitle.label" default="Title:" /></span>
					
						<span class="property-value" aria-labelledby="blogTitle-label"><g:fieldValue bean="${newBlogEntryInstance}" field="blogTitle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newBlogEntryInstance?.blogEntry}">
				<li class="fieldcontain">
					<span id="blogEntry-label" class="property-label"><g:message code="newBlogEntry.blogEntry.label" default="Body:" /></span>
					
						<span class="property-value" aria-labelledby="blogEntry-label"><g:fieldValue bean="${newBlogEntryInstance}" field="blogEntry"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newBlogEntryInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="newBlogEntry.dateCreated.label" default="Date Created:" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${newBlogEntryInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
				<li>
				<g:form url="[resource:commentsInstance, controller:'comments', action:'save']" >
				<fieldset class="form">
					<g:render template="/comments/form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
				</g:form>
				</li>

				<fieldset class="form">
				<div id="scomments">
					<h3>Comments:</h3><hr>
				<li>
				<g:each in="${newBlogEntryInstance?.comments?.sort{a,b -> (a.dateCreated > b.dateCreated) ? -1 : 1}}" var="comment" status="i">
					<div id="${i}"><b>${comment.nameOfCommenter}</b><br>
					${comment.comment}<br><br>
					<b>${comment.dateCreated}</b><br>
					<g:link class="comment-link" id="${newBlogEntryInstance.id}" url="/./blog/comments/show/${comment.id}">edit/delete</g:link><br><hr>
					</div> 
				</g:each>

				</li>
				</div>
				</fieldset>

			</ol>

		</div>
		
	</body>
</html>
