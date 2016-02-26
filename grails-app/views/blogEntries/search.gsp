
<%@ page import="blog.NewBlogEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newBlogEntry.label', default: 'newBlogEntry')}" />
		<title>Search Blogs</title>
		<g:javascript library="jquery" />
	</head>
	<body>
		<a href="#show-newBlogEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Home</a></li>
			</ul>
		</div>
		<div id="search-newBlogEntry" class="content scaffold-show" role="main">
			<br/><br/>
			<h2>Search for Blogs by Title</h2>
			
			
			<g:form controller="blogEntries" method="post">
			  <input type='text' name='value' value="${value}" />
			  <g:actionSubmit value="Search" />
			</g:form>
			
			<ul>
				<g:each var="blog" in="${blogs}">
					<li>
						<a href="${createLink(mapping: "blog", controller:'blogEntries', action: 'show', params: [id: blog.id,year: blog.dateCreated.format("yyy"),month: blog.dateCreated.format("MM"),day: blog.dateCreated.format("dd"),title: blog.blogTitle.replaceAll("\\s","-")])}">
						${blog?.blogTitle}
						</a>
					</li>
				</g:each>
				
			</ul>
			
		</div>
	</body>
</html>
