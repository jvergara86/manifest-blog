<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Jeff Goldblum's Blogs</title>
		<link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
		<style type="text/css" media="screen">
		

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			ul {
				list-style-type: none;
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
		<div class="nav">
			<ul>
				<li><g:link class="btn btn-nav" url="/./blog"><span class="glyphicon glyphicon-home"></span> Home</g:link></li>
				<li><g:link class="btn btn-nav" url="../blog/newBlogEntry/create"><span class="glyphicon glyphicon-pencil"></span> Create Blog</g:link></li>
				<li><g:link class="btn btn-nav" url="/./blog/blogEntries"><span class="glyphicon glyphicon-eye-open"></span> View All Blogs</g:link></li>
				<li><g:link class="btn btn-nav" url="/./blog/blogEntries/search"><span class="glyphicon glyphicon-search"></span> Search Blogs</g:link></li>
			</ul>
		</div>
		<div id="status" role="complementary">
			<g:link url="/./blog"><h1 class="home">Home</h1></g:link>
			<g:link url="/./blog/newBlogEntry/create"><h1 class="create-blog">Create Blog</h1></g:link>
			<g:link url="/./blog/blogEntries"><h1 class="veiw-all-blogs">View All Blogs</h1></g:link>
			<g:link url="/./blog/blogEntries/search"><h1 class="search">Search</h1></g:link>
		</div>
		<div id="page-body" role="main">
			
			<div class="blog-header">
				<h1>Jeff Goldblum's Blog Posts</h1>
				<h5>(Click title to expand)</h5>
				<hr>
			</div>
			<div class="container">
				<g:each in="${blogEntries}" var="blogInstance" status="i">
					<div class="row blog-title" data-toggle="collapse" data-target="#${i}">
						<div id="${blogInstance.id}" class="col-sm-12">
	 						<h2>${blogInstance.blogTitle}</h2>
						</div>	
					</div>
					<div id="${i}" class="collapse" class="row blog-post">
						<div id="blog-entry${i}" class="col-sm-5 blog-entry">
	 						<a id="blog-link${i}" href="${createLink(mapping: "blog", controller:'blogEntries', action: 'show', params: [id: blogInstance.id,year: blogInstance.dateCreated.format("yyy"),month: blogInstance.dateCreated.format("MM"),day: blogInstance.dateCreated.format("dd"),title: blogInstance.blogTitle.replaceAll("\\s","-")])}">
	 							${blogInstance.blogEntry}
 							</a>
	 					</div>
	 					<div class="col-sm-2">
	 						${blogInstance.dateCreated}
	 					</div>
					</div>
				</g:each>
			</div>
		</div>
	<script>
	$(document).ready(function(){
		if(localStorage.getItem('blog-link') != 'N/A'){
			$("#" + localStorage.getItem('blog-link')).trigger('click');
			localStorage.setItem('blog-link', 'N/A');
		}
	});
	</script>
	</body>
</html>