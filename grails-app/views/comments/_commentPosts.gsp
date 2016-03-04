<g:each in="${newBlogEntryInstance?.comments?.sort{a,b -> (a.dateCreated > b.dateCreated) ? -1 : 1}}" var="comment" status="i">
	
	
		<div class="comment-post">
			<div id="comment-commenter${i}"><b>${comment.nameOfCommenter}</b></div>
			<div id="comment-comment${i}"><pre>${comment.comment}</pre></div>
			${comment.dateCreated.format("EEE-dd-MMM-yyy hh:mm aa")}.<br>
			<g:form url="[controller: 'comments', action: 'delete', id:'comment.id']" method="DELETE">
				<a href="/./blog/comments/edit/${comment.id}" class="comment-link btn" id="comment-link-index${i}" >Edit</a>
			
				<g:submitToRemote class="delete-comment" id="delete-comment-button${i}" url="[controller:'comments', action:'delete', id:comment.id]" method="DELETE" update="[success: 'comments-container']" value="Delete" onclick="return confirm('Are you sure?')" />
			</g:form>
			
			
			
			<hr>
		</div> 
	
</g:each>