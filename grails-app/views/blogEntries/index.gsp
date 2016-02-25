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
			<h1>Search: </h1>
			<g:field type="text" name = "Search" size = "10px"></g:field>
			<ul>
			</ul>
			<h1>Links</h1>
			<ul>
			</ul>
		</div>
		<div id="page-body" role="main">
			<h1>Jeff Goldblum's Blog Posts</h1>
			<hr>
			<div class="container">
				<g:each in="${blogEntries}" var="blogInstance">
 					<h2  id="${blogInstance.id}">${blogInstance.blogTitle}</h2>
 					${blogInstance.blogEntry}
				</g:each>
			</div>
		</div>
	</body>
</html>