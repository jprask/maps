<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Test</title>
</head>
<body>

<form:form action="saveCoord" modelAttribute="coord" method="POST">
    <form:hidden path="id"/>
    <label>Element</label>
    <form:select path="element">
        <form:options items="${elements}" itemLabel="name" itemValue="id"/>
    </form:select> <br/>
    <label>Latitude</label>
    <form:input path="lat"/> <br/>
    <label>Longitude</label>
    <form:input path="lng"/> <br/>
    <input type="submit" value="Save" class="Save">
</form:form>

</body>
</html>
