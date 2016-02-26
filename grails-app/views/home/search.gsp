<%--
  Created by IntelliJ IDEA.
  User: Manifest
  Date: 2/25/2016
  Time: 11:50 PM
--%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Blog Entry Search</title>
</head>
<body>
<br/><br/>
<h2>Post Search</h2>
<g:form controller="home" method="post" >
    <input type='text' name='value' value="${value}" />
    <g:actionSubmit value="Search" />
</g:form>
Posts:
<ol>
    <g:each var="blog" in="${blogs}">
        <li>${blog?.blogTitle}
        <g:if test="${blog.BlogEntry}">- </g:if>
        ${blog?.blogEntry}
        </li>
    </g:each>
</ol>
</body>
</html>