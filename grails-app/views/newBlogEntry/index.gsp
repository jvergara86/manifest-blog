
<%@ page import="blog.NewBlogEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Your Blog Posts</title>
		<link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
	</head>
	<body>
		<a href="#list-newBlogEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home</a></li>
				<li><g:link class="create" action="create">Create New Blog Post</g:link></li>
			</ul>
		</div>
		<div id="list-newBlogEntry" class="content scaffold-list" role="main">
			<h1>Your Blog Posts</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="blog-posts">
			<thead>
					<tr>
					
						<g:sortableColumn property="blogTitle" title="${message(code: 'newBlogEntry.blogTitle.label', default: 'Blog Title')}" />
					
						<g:sortableColumn property="blogEntry" title="${message(code: 'newBlogEntry.blogEntry.label', default: 'Blog Entry')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'newBlogEntry.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${newBlogEntryInstanceList}" status="i" var="newBlogEntryInstance">
					<tr class="${(i % 2) == 0 ? 'even ' : 'odd '}">
					
						<td class="${i}"><g:link action="show" id="${newBlogEntryInstance.id}">${fieldValue(bean: newBlogEntryInstance, field: "blogTitle")}</g:link></td>
					
						<td>${fieldValue(bean: newBlogEntryInstance, field: "blogEntry")}</td>
					
						<td><g:formatDate date="${newBlogEntryInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${newBlogEntryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
