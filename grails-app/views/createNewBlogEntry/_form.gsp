<%@ page import="blog.CreateNewBlogEntry" %>



<div class="fieldcontain ${hasErrors(bean: createNewBlogEntryInstance, field: 'blogTitle', 'error')} required">
	<label for="blogTitle">
		<g:message code="createNewBlogEntry.blogTitle.label" default="Blog Title:" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="blogTitle" required="" value="${createNewBlogEntryInstance?.blogTitle}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: createNewBlogEntryInstance, field: 'blogEntry', 'error')} required">
	<label for="blogEntry">
		<g:message code="createNewBlogEntry.blogEntry.label" default="Enter Blog Body Here:" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="blogEntry" cols="40" rows="5" maxlength="7000" style="width:400px;" required="" value="${createNewBlogEntryInstance?.blogEntry}"/>

</div>

