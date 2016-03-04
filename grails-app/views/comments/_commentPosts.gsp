<g:each in="${newBlogEntryInstance?.comments?.sort{a,b -> (a.dateCreated > b.dateCreated) ? -1 : 1}}" var="comment" status="i">
	<div class="comment-post">
		<div id="comment-commenter${i}"><b>${comment.nameOfCommenter}</b></div>
		<div id="comment-comment${i}"><pre>${comment.comment}</pre></div>
		${comment.dateCreated}<br>
		<a href="/./blog/comments/show/${comment.id}" class="comment-link" id="comment-link-index${i}" >edit/delete</a>
		<hr>
	</div> 
</g:each>