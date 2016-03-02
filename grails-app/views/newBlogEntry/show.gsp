
<%@ page import="blog.NewBlogEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newBlogEntry.label', default: 'newBlogEntry')}" />
		<link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
		<title>Blog Post: ${newBlogEntryInstance?.blogTitle}</title>
	</head>
	<body>
		<a href="#show-newBlogEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home</a></li>
				<li><g:link class="list" action="index">Back to Blog Posts</g:link></li>
				<li><g:link class="create" action="create">Create New Blog Post</g:link></li>
			</ul>
		</div>
		<div id="show-newBlogEntry" class="content scaffold-show" role="main">
			<h1>Blog Post: ${newBlogEntryInstance?.blogTitle}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list newBlogEntry">
			
				<g:if test="${newBlogEntryInstance?.blogTitle}">
				<li class="fieldcontain">
					<span id="blogTitle-label" class="property-label"><g:message code="newBlogEntry.blogTitle.label" default="Blog Title:" /></span>
					
						<span class="property-value" aria-labelledby="blogTitle-label"><g:fieldValue bean="${newBlogEntryInstance}" field="blogTitle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newBlogEntryInstance?.blogEntry}">
				<li class="fieldcontain">
				
					<span id="blogEntry-label" class="property-label"><g:message code="newBlogEntry.blogEntry.label" default="Blog Entry:" /></span>
					
						<span class="property-value" aria-labelledby="blogEntry-label"><pre><g:fieldValue bean="${newBlogEntryInstance}" field="blogEntry"/></pre></span>
					
				</li>
				</g:if>
			
				<g:if test="${newBlogEntryInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="newBlogEntry.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${newBlogEntryInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:newBlogEntryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${newBlogEntryInstance}">Edit Post</g:link>
					<g:actionSubmit class="delete" action="delete" value="Delete Post" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
