><%@ page import="blog.Comments" %>
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
					
						<span class="property-value" aria-labelledby="blogEntry-label"><g:fieldValue bean="${newBlogEntryInstance}" field="blogEntry"/></span>
					
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
					<div id="comments-container">
						<h3>Comments</h3><br><hr>
						<div id="reload">
							<g:each in="${newBlogEntryInstance?.comments?.sort{a,b -> (a.dateCreated > b.dateCreated) ? -1 : 1}}" var="comment" status="i">
								<div class="comment-post">
									<b>${comment.nameOfCommenter}</b><br><br>
									${comment.comment}<br>
									${comment.dateCreated}<br>
									<g:link class="comment-link" id="${newBlogEntryInstance.id}" url="/./blog/comments/show/${comment.id}">edit/delete</g:link>
									<hr>
								</div>
						</g:each>
						</div>
					</div>
				</li>

			</ol>

		</div>
		
		 <script>
		 var delay=500;

               $(document).ready(function() {
               $('#submit-comment').on('click', function() {
               var url = window.location.href; 
               setTimeout(function(){
        		 }, delay);
               $('#comments-container').load(url + ' #reload'); 
               });
          });
         </script> 

	</body>
	
</html>
