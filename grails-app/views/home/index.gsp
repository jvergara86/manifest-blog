<!DOCTYPE html>
<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Blog Zone Rarararar</title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
		<style type="text/css" media="screen">
			#status {
				background-color: #F0F8FF;
				border: .2em solid #F0F8FF;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				position: fixed;
				float: left;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-family: 'Josefin Sans', sans-serif;
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				font-family: 'Josefin Sans', sans-serif;
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				font-family: 'Josefin Sans', sans-serif;
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
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
		<div id="status" role="complementary">
			<g:link url="../blog/newBlogEntry/create"><h1>Create Blog</h1></g:link>
			<g:link url="../blog/blogEntries"><h1>View All Blogs</h1></g:link>
			<h1>Search: </h1>
			<g:field type="text" name = "Search" size = "10px"></g:field>
			<ul>
			</ul>
			<h1>Links</h1>
			<ul>
			</ul>
		</div>
		<div id="page-body" role="main">
			<h1>Jeff Goldblum's Blog</h1>

			<div id="controller-list" role="navigation">
				<hr>
					<g:each in="${blogEntries}" var="blogInstance" status="i">
					<g:if test="${i < 10}">
 						<ul><h2><a href="blogEntries#${blogInstance.id}">${blogInstance.blogTitle}</a></h2></ul>
 						<ul><p>${blogInstance.blogEntry}</p></ul>
					</g:if>
					</g:each>
			</div>
		</div>
	</body>
</html>
