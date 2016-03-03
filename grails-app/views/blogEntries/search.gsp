
<%@ page import="blog.NewBlogEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newBlogEntry.label', default: 'newBlogEntry')}" />
		<title>Search Blogs</title>
		
		<link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
	</head>
	<body>
		<a href="#show-newBlogEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" >
			<ul>
				<li><g:link class="btn btn-nav" url="/./blog"><span class="glyphicon glyphicon-home"></span> Home</g:link></li>
				<li><g:link class="btn btn-nav" url="/./blog/newBlogEntry/create"><span class="glyphicon glyphicon-pencil"></span> Create Blog</g:link></li>
				<li><g:link class="btn btn-nav" url="/./blog/blogEntries"><span class="glyphicon glyphicon-eye-open"></span> View All Blogs</g:link></li>
				<li><g:link class="btn btn-nav" url="/./blog/blogEntries/search"><span class="glyphicon glyphicon-search"></span> Search Blogs</g:link></li>
			</ul>
		</div>
		
		<div id="search-newBlogEntry" class="content scaffold-show" role="main">
			<br/><br/>
			<div class="container">
				<%--<div class="row">
					<div class="col-sm-5 search-bar-container">
						<h2>Search for Blogs by Title</h2>
						<g:form controller="blogEntries" method="post">
						  <input id="search-input" type='text' name='value' value="${value}" />
						  <g:actionSubmit class="search" value="Search" />
						</g:form>
					</div>
				</div>
				<br>		
				<g:each var="blog" in="${blogs}" status="i">
					<div class="row">
					<g:link url="${createLink(mapping: "blog", controller:'blogEntries', action: 'show', params: [id: blog.id,year: blog.dateCreated.format("yyy"),month: blog.dateCreated.format("MM"),day: blog.dateCreated.format("dd"),title: blog.blogTitle.replaceAll("\\s","-")])}">
						<div class="col-xs-9 btn btn-default search-results">
								${blog?.blogTitle}
						</div>
					</g:link>
					</div>
				</g:each>
			--%>
				<g:formRemote name="remoteSearch" url="[controller:'blogEntries',action:'remoteSearch']" update="[success:'results', failure:'error']">
					<input type='text' id="search-input" name='value' value="${value}"/>
					<g:submitButton class="search-button"name="search" value="Search"/>
				</g:formRemote>
				
				<div id="error"></div>    
				Results:
				<div id="results"></div>
			</div>
		</div>
		
	</body>
</html>
