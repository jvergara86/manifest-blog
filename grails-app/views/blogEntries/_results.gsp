<g:each var="blog" in="${blogs}" status="i">
	<div class="row">
	<g:link url="${createLink(mapping: "blog", controller:'blogEntries', action: 'show', params: [id: blog.id,year: blog.dateCreated.format("yyy"),month: blog.dateCreated.format("MM"),day: blog.dateCreated.format("dd"),title: blog.blogTitle.replaceAll("\\s","-")])}">
		<div class="col-xs-9 btn btn-default search-results">
				${blog?.blogTitle}
		</div>
	</g:link>
	</div>
</g:each>
