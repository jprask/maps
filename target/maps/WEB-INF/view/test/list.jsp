<%@ page contentType="text/html;charset=UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Test</title>
</head>
<body>

<table>

    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Coord(s)</th>
    </tr>

    <%--<jsp:useBean id="elements" scope="request" type="java.util.List<MapElement>"/>--%>
    <c:forEach var="element" items="${elements}">
        <tr>
            <td>${element.name}</td>
            <td>${element.desc}</td>
            <td>
                <c:forEach var="coord" items="${element.coords}">
                    ${coord.lat};${coord.lng} - <a href="${pageContext.request.contextPath}/test/viewCoord?coordId=${coord.id}">Update</a> <br/>
                    | <a href="${pageContext.request.contextPath}/test/deleteCoord?coordId=${coord.id}" onclick="if(!confirm('Are you sure?')) return false;">Delete</a>
                </c:forEach>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/test/viewElmt?elmtId=${element.id}">Update</a>
                | <a href="${pageContext.request.contextPath}/test/deleteElmt?elmtId=${element.id}" onclick="if(!confirm('Are you sure?')) return false;">Delete</a>
            </td>
        </tr>
    </c:forEach>

</table>


</body>
</html>
