
<%@ page import="blog.CreateNewBlogEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'createNewBlogEntry.label', default: 'CreateNewBlogEntry')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-createNewBlogEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-createNewBlogEntry" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list createNewBlogEntry">
			
				<g:if test="${createNewBlogEntryInstance?.blogTitle}">
				<li class="fieldcontain">
					<span id="blogTitle-label" class="property-label"><g:message code="createNewBlogEntry.blogTitle.label" default="Blog Title" /></span>
					
						<span class="property-value" aria-labelledby="blogTitle-label"><g:fieldValue bean="${createNewBlogEntryInstance}" field="blogTitle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${createNewBlogEntryInstance?.blogEntry}">
				<li class="fieldcontain">
					<span id="blogEntry-label" class="property-label"><g:message code="createNewBlogEntry.blogEntry.label" default="Blog Entry" /></span>
					
						<span class="property-value" aria-labelledby="blogEntry-label"><g:fieldValue bean="${createNewBlogEntryInstance}" field="blogEntry"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${createNewBlogEntryInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="createNewBlogEntry.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${createNewBlogEntryInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:createNewBlogEntryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${createNewBlogEntryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
