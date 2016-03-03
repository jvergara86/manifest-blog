<!DOCTYPE html>

<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Blog Zone</title>
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
		<div class="nav">
			<ul>
				<li><g:link class="btn btn-nav" url="/./blog"><span class="glyphicon glyphicon-home"></span> Home</g:link></li>
				<li><g:link class="btn btn-nav" url="/./blog/newBlogEntry/create"><span class="glyphicon glyphicon-pencil"></span> Create Blog</g:link></li>
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
			<div class="blog-header" >
				<h1>Jeff Goldblum's Blog</h1>
			</div>
			<div id="controller-list" role="navigation">
				<hr>
					<g:each in="${blogEntries}" var="blogInstance" status="i">
					<g:if test="${i < 10}">
 						<div class="container">
	 						<div class="row">
	 							<div class="col-sm-5">
	 								<a class="blog-link" id="${blogInstance.id}" href="blogEntries#${blogInstance.id}"><h2 id="blog-link${i}">${blogInstance.blogTitle}</h2></a>
	 							</div>
	 							<div class="col-sm-7"></div>
							</div>
							<div class="row">
	 							<div class="col-sm-5 blog-entry">
	 								<pre class="summary">${blogInstance.blogEntry}</pre>
	 							</div>
	 							<div class="col-sm-2">
		 							${blogInstance.dateCreated}
		 						</div>
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

		$(".summary").dotdotdot({
			/*	The text to add as ellipsis. */
			ellipsis	: '... ',
	 
			/*	How to cut off the text/html: 'word'/'letter'/'children' */
			wrap		: 'word',
	 
			/*	Wrap-option fallback to 'letter' for long words */
			fallbackToLetter: true,
	 
			/*	jQuery-selector for the element to keep and put after the ellipsis. */
			after		: null,
	 
			/*	Whether to update the ellipsis: true/'window' */
			watch		: false,
		
			/*	Optionally set a max-height, can be a number or function.
				If null, the height will be measured. */
			height		: 80,
	 
			/*	Deviation for the height-option. */
			tolerance	: 0,
	 
			/*	Callback function that is fired after the ellipsis is added,
				receives two parameters: isTruncated(boolean), orgContent(string). */
			callback	: function( isTruncated, orgContent ) {},
	 
			lastCharacter	: {
	 
				/*	Remove these characters from the end of the truncated text. */
				remove		: [ ' ', ',', ';', '.', '!', '?' ],
	 
				/*	Don't add an ellipsis if this array contains 
					the last character of the truncated text. */
				noEllipsis	: []
			}
		});
	});
	</script>
​
	</body>
</html>


