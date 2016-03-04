
<%@ page import="blog.Comments" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comments.label', default: 'Comments')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-comments" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-comments" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nameOfCommenter" title="${message(code: 'comments.nameOfCommenter.label', default: 'Name Of Commenter')}" />
					
						<g:sortableColumn property="comment" title="${message(code: 'comments.comment.label', default: 'Comment')}" />
					
						<th><g:message code="comments.blogEntry.label" default="Blog Entry" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'comments.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${commentsInstanceList}" status="i" var="commentsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${commentsInstance.id}">${fieldValue(bean: commentsInstance, field: "nameOfCommenter")}</g:link></td>
					
						<td>${fieldValue(bean: commentsInstance, field: "comment")}</td>
					
						<td>${fieldValue(bean: commentsInstance, field: "blogEntry")}</td>
					
						<td><g:formatDate date="${commentsInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${commentsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
