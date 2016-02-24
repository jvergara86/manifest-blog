
<%@ page import="blog.CreateNewBlogEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Your Blog Posts</title>
	</head>
	<body>
		<a href="#list-createNewBlogEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Back to Blog Zone's Home Page</a></li>
				<li><g:link class="create" action="create">Create New Blog Post</g:link></li>
			</ul>
		</div>
		<div id="list-createNewBlogEntry" class="content scaffold-list" role="main">
			<h1>Your Blog Posts</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="blogTitle" title="${message(code: 'createNewBlogEntry.blogTitle.label', default: 'Blog Title')}" />
					
						<g:sortableColumn property="blogEntry" title="${message(code: 'createNewBlogEntry.blogEntry.label', default: 'Blog Entry')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'createNewBlogEntry.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${createNewBlogEntryInstanceList}" status="i" var="createNewBlogEntryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${createNewBlogEntryInstance.id}">${fieldValue(bean: createNewBlogEntryInstance, field: "blogTitle")}</g:link></td>
					
						<td>${fieldValue(bean: createNewBlogEntryInstance, field: "blogEntry")}</td>
					
						<td><g:formatDate date="${createNewBlogEntryInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${createNewBlogEntryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
