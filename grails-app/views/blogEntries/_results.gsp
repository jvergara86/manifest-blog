<%@ page import="blog.NewBlogEntry" %>

<ol>
	<g:each var="blog" in="${blogEntries}">
		<li>
			${blog?.blogTitle}
		</li>
	</g:each>		

</ol>