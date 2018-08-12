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
            <h1 class="header center blue-grey-text text-darken-3">${element.name == null ? "Elemento":element.name}</h1>
            <div class="row center">
                <p class="flow-text blue-grey-text text-darken-3 col s12">
                    Editar Elemento
                </p>
                <br>
            </div>
            <br>
            <br>
        </div>
    </div>

    <div class="container">
        <form:form action="saveElement" modelAttribute="element" method="POST">
            <form:hidden id="hiddenId" path="id"/>

            <div class="input-field">
                <label class="active" for="icon">Icone</label>
                <form:input id="icon" path="icon"/>
            </div>

            <div class="input-field">
                <label class="active" for="name">Nome</label>
                <form:input id="name" path="name"/>
                <form:errors path="name" cssClass="helper-text red-text"/>
            </div>

            <div class="input-field">
                <label class="active" for="desc">Descriçao</label>
                <form:textarea id="desc" path="desc"/>
            </div>
            <br>
            <br>
            <div class="row center">
                <button class="btn waves-effect deep-purple darken-3" type="submit" name="action">Salvar
                    <i class="material-icons right">send</i>
                </button>
            </div>
        </form:form>
    </div>

    <jsp:include page="/includes/footer.jsp"/>
</main>
</body>
</html>