<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Jeff Goldblum's Blogs</title>
		<link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
		<style type="text/css" media="screen">
		

			#page-body {
				font-family: 'Josefin Sans', sans-serif;
				margin: 2em 1em 1.25em 2em;
			}

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

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
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
		<div class="navigation-bar">
		<g:link url="../blog"><h2>Home Page</h2>
		<h2>Search:</h2>
		<g:field type="text" name = "Search" size = "10px"></g:field>
		</g:link></div>
		<div id="page-body" role="main">
			<h1>Jeff Goldblum's Blog Posts</h1>
			<p>insert line here</p>
			<ul>
				<g:each in="${blogEntries}" var="blogInstance">
 					<li><h2  id="${blogInstance.id}">${blogInstance.blogTitle}</h2></li>
 					<li>${blogInstance.blogEntry}</li>
				</g:each>
			</ul>
		</div>
	</body>
</html>