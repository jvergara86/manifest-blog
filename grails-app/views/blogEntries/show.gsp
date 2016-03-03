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
					<span id="blogTitle-label" class="property-label"><b><g:message code="newBlogEntry.blogTitle.label" default="Title:" /></b></span>
					
						<span class="property-value" aria-labelledby="blogTitle-label"><g:fieldValue bean="${newBlogEntryInstance}" field="blogTitle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newBlogEntryInstance?.blogEntry}">
				<li class="fieldcontain">
					<span id="blogEntry-label" class="property-label"><b><g:message code="newBlogEntry.blogEntry.label" default="Body:" /></b></span>
					
						<span class="property-value" aria-labelledby="blogEntry-label"><pre><g:fieldValue bean="${newBlogEntryInstance}" field="blogEntry"/></pre></span>
					
				</li>
				</g:if>
			
				<g:if test="${newBlogEntryInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><b><g:message code="newBlogEntry.dateCreated.label" default="Date Created:" /></b></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${newBlogEntryInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
				<li>
				
						<g:render template="/comments/form"/>
				
				</li>
				<li>
					<h3>Comments</h3><br><hr>
					<div id="comments-container">
						<div id="reload">
							<g:each in="${newBlogEntryInstance?.comments?.sort{a,b -> (a.dateCreated > b.dateCreated) ? -1 : 1}}" var="comment" status="i">
								<div class="comment-post" id="comment-post-index${i}">
									<div id="comment-commenter${i}"><b>${comment.nameOfCommenter}</b></div><br>
									<div id="comment-comment${i}"><pre>${comment.comment}</pre></div>
									<div id="comment-date${i}">${comment.dateCreated}</div>
									<a href="/./blog/comments/show/${comment.id}" class="comment-link" id="comment-link-index${i}">edit/delete</a>
									<hr>
								</div>
						</g:each>
						</div>
					</div>
				</li>

			</ol>

		</div>
		
		 <script>
		 var textClearDelay = 500;
		 var refreshDelay = 200;

			$(document).ready(function() {
				$('#submit-comment').on('click', function() {
					var url = window.location.href; 
	                setTimeout(function(){
		                if(document.getElementById("commenter").value != '' && document.getElementById("comment").value != '') {
		                	$('#commenter').val('');
		    				$('#comment').val('');
		                }
					}, textClearDelay);
	                setTimeout(function(){
	                	$('#comments-container').load(url + ' #reload'); 
	                }, refreshDelay);
              	});
         	 });
         </script> 

	</body>
	
</html>
