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
				<sec:ifLoggedIn>
			    	<g:link controller="logout">Logout</g:link>
			    </sec:ifLoggedIn>
			    <sec:ifNotLoggedIn>
					<g:link controller='login' action='auth'>Login</g:link>
				</sec:ifNotLoggedIn>
			</ul>
		</div>
		<div id="show-newBlogEntry" class="content scaffold-show" role="main">
			<h1 id="blog-title">Blog Post: ${newBlogEntryInstance?.blogTitle}</h1>
			
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
					<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_USER'>
						<g:render template="/comments/form"/>
					</sec:ifAnyGranted>
				
				</li>
				<li>
					<h3>Comments</h3><br><hr>
					<div id="comments-container">
						<div id="reload">
							<g:render template="/comments/commentPosts"/>
						</div>
					</div>
				</li>

			</ol>

		</div>
		
		 <script>
		 var textClearDelay = 500;

			$(document).ready(function() {
				$('#submit-comment').on('click', function() {
					var url = window.location.href; 
	                setTimeout(function(){
		                if(document.getElementById("commenter").value != '' && document.getElementById("comment").value != '') {
		                	$('#commenter').val('');
		    				$('#comment').val('');
		                }
					}, textClearDelay);
              	});
         	 });
         </script> 

	</body>
	<script><%--
		$(document).ready(function() {
		
		$(".delete").removeAttr("style");
		
			$('.delete-comment-button').click(function(){
				var url = window.location.href;
				$("#comments-container").load("url #reload");
			})
		})
			
	--%></script>
</html>
