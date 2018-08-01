<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


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
                <br>
                <form:select path="element" cssClass="browser-default" id="selectParent">
                    <form:options items="${elements}" itemLabel="name" itemValue="id"/>
                </form:select> <br/>
            </div>


            <div class="input-field">
                <label class="active" for="latitude" >Latitude</label>
                <form:input id="latitude" path="lat"/> <br/>
            </div>

            <div class="input-field">
                <label class="active" for="longitude">Longitude</label>
                <form:input id="longitude" path="lng"/> <br/>
            </div>

            <p>
                <label>
                    <input type="checkbox" id="renderedBox" checked="checked" />
                    <span>Marker</span>
                </label>
            </p>
            <form:checkbox path="marker" id="hiddenBox" checked="checked"/>
            <br>
            <br>
            <%--<input type="submit" value="Save" class="Save">--%>
            <div class="row center">
                <button class="btn waves-effect deep-purple darken-3" type="submit" name="action">Salvar
                    <i class="material-icons right">send</i>
                </button>
            </div>
        </form:form>
    </div>

    <jsp:include page="/includes/footer.jsp"/>
</main>

<script>
    document.getElementById("selectParent").value = ${parentId};
    document.getElementById("renderedBox").addEventListener("click", function() {
       document.getElementById("hiddenBox").checked = document.getElementById("renderedBox").checked;
    });
</script>

</body>
</html>