<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
</head>

<body>
    <nav class="deep-purple darken-4" role="navigation">
        <div class="nav-wrapper container">
            <a id="logo-container white-text" href="${pageContext.request.contextPath}/index.jsp" class="right brand-logo">Maps App</a>
            <ul class="left hide-on-med-and-down">
                <li>
                    <a href="${pageContext.request.contextPath}/maps/map">Mapa</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/maps/list">Elementos</a>
                </li>
            </ul>
            <ul id="nav-mobile" class="sidenav">
                <li>
                    <a href="${pageContext.request.contextPath}/static/map">Mapa</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/static/list">Elementos</a>
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
