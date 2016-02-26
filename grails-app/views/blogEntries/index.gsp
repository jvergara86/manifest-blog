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
		<div id="status" role="complementary">
			<g:link url="../blog"><h1>Home</h1></g:link>
			<h1><a href="../blog/blogEntries/search">Search</a></h1>
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
	 						<a href="${createLink(mapping: "blog", controller:'blogEntries', action: 'show', params: [id: blogInstance.id,year: blogInstance.dateCreated.format("yyy"),month: blogInstance.dateCreated.format("MM"),day: blogInstance.dateCreated.format("dd"),title: blogInstance.blogTitle.replaceAll("\\s","-")])}">
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