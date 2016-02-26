<!DOCTYPE html>

<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Blog Zone Rarararar</title>
		<link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
		<style type="text/css" media="screen">


			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

		

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<g:link url="../blog/newBlogEntry/create"><h1>Create Blog</h1></g:link>
			<g:link url="../blog/blogEntries"><h1>View All Blogs</h1></g:link>
			<h1>Search: </h1>
			<g:field type="text" name = "Search" size = "10px"></g:field>
			
			<h1>Links</h1>
			
		</div>
		<div id="page-body" role="main">
			<div class="blog-header">
				<h1>Jeff Goldblum's Blog</h1>
			</div>
			<div id="controller-list" role="navigation">
				<hr>
					<g:each in="${blogEntries}" var="blogInstance" status="i">
					<g:if test="${i < 10}">
 						<div class="container">
 							<div class="col-sm-12">
 								<h2><a class="blog-link" id="${blogInstance.id}" href="blogEntries#${blogInstance.id}">${blogInstance.blogTitle}</a></h2>
 							</div>
 							
 							<div class="col-sm-5 blog-entry">
 							${blogInstance.blogEntry}
 							</div>
 							<div class="col-sm-2">
	 						${blogInstance.dateCreated}
	 						
	 						</div>
 						</div>
					</g:if>
					</g:each>
			</div>
		</div>
		
	<script>
	$(document).ready(function(){
		$('.blog-link').click(function(){
			var clickedID = $(this).attr('id');
			localStorage.setItem('blog-link', clickedID);
		});
	});
	</script>
​
	</body>
</html>


