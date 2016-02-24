<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Create a New Blog Post</title>
	</head>
	<body>
		<a href="#create-createNewBlogEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Back to Blog Zone's Home Page</a></li>
				<li><g:link class="list" action="index">Back to My Blog Posts</g:link></li>
			</ul>
		</div>
		<div id="create-createNewBlogEntry" class="content scaffold-create" role="main">
			<h1>Create a New Blog</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${createNewBlogEntryInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${createNewBlogEntryInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:createNewBlogEntryInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Submit Blog Post" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
