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
                <a id="icons-dropdown-trigger" class="dropdown-trigger btn deep-purple darken-3" data-target="icons-dropdown">
                    ${element.icon == null ? "Icone":"<i class=\"material-icons\">".concat(element.icon).concat("</i>")}
                </a>
                <ul id='icons-dropdown' class='dropdown-content'>
                </ul>
                <form:hidden id="icon" path="icon"/>
            </div>

            <br>

            <div class="input-field">
                <label class="active" for="name">Nome</label>
                <form:input id="name" path="name"/>
                <form:errors path="name" cssClass="helper-text red-text"/>
            </div>

            <div class="input-field">
                <label class="active" for="desc">Descriçao</label>
                <form:textarea id="desc" path="desc" cssClass="materialize-textarea"/>
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

<script>
    //Inicializar dropdown (icones)
    document.addEventListener('DOMContentLoaded', function() {
        var elems = document.querySelectorAll('.dropdown-trigger');
        var instances = M.Dropdown.init(elems, {});
    });
    //Selecionar item e exibir (no botao)
    function setIcon(icon) {
        document.getElementById('icon').value = icon;
        document.getElementById('icons-dropdown-trigger').innerHTML = '<i class=\"material-icons\">'+icon+'</i>';
    }
    //icones oferecidos
    let material_icons = ['360','add_location','atm','beenhere','category','compass_calibration','departure_board','directions','directions_bike','directions_boat','directions_bus','directions_car','directions_railway','directions_run','directions_subway','directions_transit','directions_walk','edit_attributes','edit_location','ev_station','fastfood','flight','hotel','layers','layers_clear','local_activity','local_airport','local_atm','local_bar','local_cafe','local_car_wash','local_convenience_store','local_dining','local_drink','local_florist','local_gas_station','local_grocery_store','local_hospital','local_hotel','local_laundry_service','local_library','local_mall','local_movies','local_offer','local_parking','local_pharmacy','local_phone','local_pizza','local_play','local_post_office','local_printshop','local_see','local_shipping','local_taxi','map','money','my_location','navigation','near_me','not_listed_location','person_pin','person_pin_circle','pin_drop','place','rate_review','restaurant','restaurant_menu','satellite','store_mall_directory','streetview','subway','terrain','traffic','train','tram','transfer_within_a_station','transit_enterexit','trip_origin','zoom_out_map'];
    //Criar dropdown dinamicamente
    for (i = 0; i < material_icons.length; i++) {
        let icon = document.createElement('i');
        icon.className = 'material-icons';
        icon.innerText = material_icons[i];
        //Embrulhar em botao para ficar responsivo
        let a = document.createElement('a');
        a.className = 'waves-effect waves-light btn-flat';
        a.appendChild(icon);
        a.onclick = function () {
            setIcon(this.firstChild.innerText);
        };
        let li = document.createElement('li');
        li.appendChild(a);
        document.getElementById('icons-dropdown').appendChild(li);
    }
</script>

</body>
</html>