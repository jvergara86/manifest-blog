<g:each in="${newBlogEntryInstance?.comments?.sort{a,b -> (a.dateCreated > b.dateCreated) ? -1 : 1}}" var="comment" status="i">
	<div class="comment-post">
		<b>${comment.nameOfCommenter}</b><br>
		<pre>${comment.comment}</pre><br>
		${comment.dateCreated}<br>
		<g:link class="comment-link" id="${newBlogEntryInstance.id}" url="/./blog/comments/show/${comment.id}">edit/delete</g:link>
	</div> 
</g:each>