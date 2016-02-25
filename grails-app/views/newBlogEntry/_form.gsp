<%@ page import="blog.NewBlogEntry" %>



<div class="fieldcontain ${hasErrors(bean: newBlogEntryInstance, field: 'blogTitle', 'error')} required">
	<label for="blogTitle">
		<g:message code="newBlogEntry.blogTitle.label" default="Blog Title:" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="blogTitle" required="" value="${newBlogEntryInstance?.blogTitle}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newBlogEntryInstance, field: 'blogEntry', 'error')} required">
	<label for="blogEntry">
		<g:message code="newBlogEntry.blogEntry.label" default="Blog Body:" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="blogEntry" cols="40" rows="5" maxlength="7000" style="width:400px;" required="" value="${newBlogEntryInstance?.blogEntry}"/>

</div>

