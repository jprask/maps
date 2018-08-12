<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
</head>

<body>
    <nav class="deep-purple darken-4" role="navigation">
        <div class="nav-wrapper container">
            <a id="logo-container white-text" href="<c:url value="/" />" class="right brand-logo">Maps App</a>
            <ul class="left hide-on-med-and-down">
                <li>
                    <a href="<c:url value="/maps/map" />">Mapa</a>
                </li>
                <li>
                    <a href="<c:url value="/maps/list" />">Elementos</a>
                </li>
            </ul>
            <ul id="nav-mobile" class="sidenav">
                <li>
                    <a href="<c:url value="/maps/map" />">Mapa</a>
                </li>
                <li>
                    <a href="<c:url value="/maps/list" />">Elementos</a>
                </li>
            </ul>
            <a href="#" data-target="nav-mobile" class="sidenav-trigger">
                <i class="material-icons">menu</i>
            </a>
        </div>
    </nav>
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var elems = document.querySelectorAll('.sidenav');
        var instances = M.Sidenav.init(elems);
    });
</script>

</html>
