<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
            <h1 class="header center blue-grey-text text-darken-3">Ponto</h1>
            <div class="row center">
                <p class="flow-text blue-grey-text text-darken-3 col s12">
                    Editar ponto
                </p>
                <br>
            </div>
            <br>
            <br>
        </div>
    </div>

    <div class="container">

        <form:form action="saveCoordinate" modelAttribute="coordinate" method="POST">
            <form:hidden path="id"/>

            <div class="input-field">
                <label class="active" for="selectParent" >Elemento</label>
                <br>
                <form:select path="element" cssClass="browser-default" id="selectParent">
                    <form:options items="${elements}" itemLabel="name" itemValue="id"/>
                </form:select> <br/>
                <form:errors path="element" cssClass="helper-text red-text"/>
            </div>

            <div class="row">
                <div class="col s10 m5 input-field">
                    <label class="active" for="latitude" >Latitude</label>
                    <form:input id="latitude" path="lat"/> <br/>
                    <form:errors path="lat" cssClass="helper-text red-text"/>
                </div>

                <div class="col s10 m5 input-field">
                    <label class="active" for="longitude">Longitude</label>
                    <form:input id="longitude" path="lng"/> <br/>
                    <form:errors path="lng" cssClass="helper-text red-text"/>
                </div>

                <div class="col s2 m2">
                    <a class="btn-floating btn-small modal-trigger waves-effect waves-light deep-purple darken-3"
                     href="#geocoding_modal">
                        <i class="material-icons">image_search</i>
                    </a>

                    <!-- Modal -->
                    <div id="geocoding_modal" class="modal bottom-sheet">
                        <div class="modal-content">
                            <h4>Procurar Coordenadas</h4>
                            <div class="col s10 m5 input-field">
                                <label class="active" for="address">Endereço</label>
                                <input type="text" id="address">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a id="geocoding_lookup" class="modal-close waves-effect waves-light btn-flat">Procurar</a>
                        </div>
                    </div>
                </div>
            </div>

            <p>
                <label>
                    <input type="checkbox" id="renderedBox" ${coordinate.marker ? "checked=\"checked\"":""} />
                    <span>Marker</span>
                </label>
            </p>
            <form:checkbox path="marker" id="hiddenBox"/>
            <br>
            <br>
            <div class="row center">
                <button class="btn waves-effect deep-purple darken-3" type="submit" name="action">Salvar
                    <i class="material-icons right">send</i>
                </button>
            </div>
            <br>
        </form:form>
    </div>

    <jsp:include page="/includes/footer.jsp"/>
</main>


<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
<script src="<c:url value="/assets/js/geocoding.js" />"></script>

<script>
    //Configurar form de acordo com dados do ponto
    document.getElementById("selectParent").value = ${parentId};
    //Sincronizar as duas checkboxes
    document.getElementById("renderedBox").addEventListener("click", function() {
       document.getElementById("hiddenBox").checked = document.getElementById("renderedBox").checked;
    });
    //inicializar modal do geocoding
    document.addEventListener('DOMContentLoaded', function() {
        var elems = document.querySelectorAll('.modal');
        var instances = M.Modal.init(elems, {});
    });
    document.getElementById('geocoding_lookup').addEventListener('click', function() {
        getCoordinates(document.getElementById('address').value, updateCoordinates);
    });
    //Passar como callback para a funcao getCoordinates
    function updateCoordinates(coordinates) {
        document.getElementById('latitude').value = coordinates.lat;
        document.getElementById('longitude').value = coordinates.lng;
        M.updateTextFields();
    }
</script>

</body>
</html>