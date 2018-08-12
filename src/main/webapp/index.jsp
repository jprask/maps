<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <jsp:include page="/includes/header.jsp"/>
    <main>
        <div class="section no-pad-bot">
            <div class="container">
                <br>
                <br>
                <h1 class="header center blue-grey-text text-darken-3">Bem-Vindo</h1>
                <div class="row center">
                    <p class="flow-text blue-grey-text text-darken-3 col s12">
                        Nesta aplicação, você pode definir Entidades, que são então mostradas no mapa. Entidades representam um ponto ou grupo
                        de pontos, no caso de um múltiplos pontos, eles são ligados por um traço formando uma rede. Pontos podem ser
                        representados no mapa atraves de um marker, que pode ser escolhido pelo usuário.
                    </p>
                </div>
                <br>
                <br>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col s12 m4">
                    <div class="hoverable card large deep-purple darken-3">
                        <div class="card-image">
                            <img src="<c:url value="/assets/img/element.png" />" height="256" width="256">
                        </div>
                        <div class="card-content white-text">
                            <span class="card-title white-text">
                                <strong>Elementos</strong>
                            </span>
                            <a href="<c:url value="/maps/newElement" />" class="btn-floating halfway-fab waves-effect waves-light red">
                                <i class="material-icons">add</i>
                            </a>
                            <p class="grey-text text-lighten-3">
                                Defina um elemento para representar um local, um conjunto de locais interligados ou um caminho.
                                Elementos podem ser editados, ampliados ou excluidos.
                            </p>
                        </div>
                        <div class="card-action">
                            <a class="grey-text text-lighten-3" href="<c:url value="/maps/list" />">Ver Todos</a>
                        </div>
                    </div>
                </div>
                <div class="col s12 m4">
                    <div class="hoverable card large deep-purple darken-3">
                        <div class="card-image">
                            <img src="<c:url value="/assets/img/coordinate.png" />" height="256" width="256">
                        </div>
                        <div class="card-content white-text">
                            <span class="card-title white-text">
                                <strong>Pontos</strong>
                            </span>
                            <a href="<c:url value="/maps/newCoordinate?parentId=0" />" class="btn-floating halfway-fab waves-effect waves-light red">
                                <i class="material-icons">add</i>
                            </a>
                            <p class="grey-text text-lighten-3">
                                Defina um par de coordenadas e associe a um elemento. Voce pode ainda adicionar um marker no local.
                                Pontos que fazem parte do mesmo Elemento sao ligados por uma linha.
                            </p>
                        </div>
                        <div class="card-action">
                            <a class="grey-text text-lighten-3" href="<c:url value="/maps/list" />">Ver Todos</a>
                        </div>
                    </div>
                </div>
                <div class="col s12 m4">
                    <div class="hoverable card large deep-purple darken-3">
                        <div class="card-image">
                            <img src="<c:url value="/assets/img/map.png" />" height="256" width="256">
                        </div>
                        <div class="card-content white-text">
                            <span class="card-title white-text">
                                <strong>Mapa</strong>
                            </span>
                            <a href="<c:url value="/maps/map" />" class="btn-floating halfway-fab waves-effect waves-light red">
                                <i class="material-icons">map</i>
                            </a>
                            <p class="grey-text text-lighten-3">
                                No mapa, todos os elementos visiveis (com pelo menos um ponto com marker ou mais de um ponto) sao
                                exibidos. Voce pode acessar o mapa agora mesmo!
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="/includes/footer.jsp"/>
</body>
</html>
