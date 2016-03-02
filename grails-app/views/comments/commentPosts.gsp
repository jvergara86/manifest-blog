
<%@ page import="blog.Comments" %>
<%@ page import="blog.NewBlogEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
		<g:set var="entityName" value="${message(code: 'newBlogEntry.label', default: 'newBlogEntry')}" />
		<title>Update Post: ${newBlogEntryInstance?.blogTitle}</title>
	</head>
	<body>
		Refreshing
		<g:each in="${newBlogEntryInstance?.comments?.sort{a,b -> (a.dateCreated > b.dateCreated) ? -1 : 1}}" var="comment" status="i">
			<div class="comment-post">
				${comment.nameOfCommenter}<br>
				<pre>${comment.comment}</pre><br>
				${comment.dateCreated}<br>
				<g:link class="comment-link" id="${newBlogEntryInstance.id}" url="/./blog/comments/show/${comment.id}">edit/delete</g:link>
			</div> 
		</g:each>

	</body>
	
</html>