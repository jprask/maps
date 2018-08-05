<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Test</title>
</head>
<body>

<form:form action="saveElmt" modelAttribute="element" method="POST">
    <form:hidden path="id"/>
    <label>Icon</label>
    <form:input path="icon"/>
    <label>Name</label>
    <form:input path="name"/>
    <form:errors path="name" cssClass="helper-text"/>
    <label>Description</label>
    <form:input path="desc"/>
    <input type="submit" value="Save" class="Save">
</form:form>

</body>
</html>
