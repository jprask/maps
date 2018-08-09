<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Maps App</title>
</head>
<body>
<main>
    <jsp:include page="/includes/header.jsp"/>

    <div class="section no-pad-bot">
        <div class="container">
            <br>
            <br>
            <h1 class="header center blue-grey-text text-darken-3">Elementos</h1>
            <div class="row center">
                <p class="flow-text blue-grey-text text-darken-3 col s12">
                    Lista de elementos cadastrados
                </p>
                <br>
                <a href="${pageContext.request.contextPath}/maps/newElement" class="waves-effect btn-large deep-purple darken-3">Novo Elemento</a>
            </div>
            <br>
            <br>
        </div>
    </div>
    <div class="container">
        <ul class="collection">
            <c:forEach items="${elements}" var="element">
                <li class="collection-item avatar">
                    <i class="material-icons circle">${element.icon == null ? "place":element.icon}</i>
                    <span class="tittle">${element.name}</span>
                    <p>
                        ${element.desc} <br>
                    </p>

                    <div class="row">
                        <c:forEach items="${element.coords}" var="coord">
                            <div class="col s12 m4">
                                <div class="card deep-purple darken-4">
                                    <div class="card-content grey-text text-lighten-3">
                                        <span class="card-tittle">Ponto</span>
                                        <p>
                                            Latitude: ${coord.lat} <br>
                                            Longitude: ${coord.lng} <br>
                                            ${coord.marker ? "Marker<br>":"<br>"}
                                        </p>
                                    </div>
                                    <div class="card-action">
                                        <a href="${pageContext.request.contextPath}/maps/viewCoordinate?id=${coord.id}">
                                            <i class="material-icons white-text">edit</i>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/maps/deleteCoordinate?id=${coord.id}">
                                            <i class="material-icons white-text">delete</i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <ul class="secondary-content">
                        <a href="${pageContext.request.contextPath}/maps/viewElement?id=${element.id}">
                            <i class="material-icons">edit</i>
                        </a>
                        <a href="${pageContext.request.contextPath}/maps/deleteElement?id=${element.id}">
                            <i class="material-icons">delete</i>
                        </a>
                        <a href="${pageContext.request.contextPath}/maps/newCoordinate?parentId=${element.id}">
                            <i class="material-icons">add_circle</i>
                        </a>
                    </ul>
                </li>
            </c:forEach>
        </ul>

    </div>
    <jsp:include page="/includes/footer.jsp"/>
</main>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>--%>
</body>
</html>

