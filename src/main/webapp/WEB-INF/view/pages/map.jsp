<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Maps App</title>

    <link rel="stylesheet" href="<c:url value="/assets/css/map.css" />">

</head>
<body>
<jsp:include page="/includes/header.jsp"/>
<div id="map"></div>
<jsp:include page="/includes/footer.jsp"/>
<script src="<c:url value="/assets/js/map.js"/>"></script>
<script>
    function drawMap(elements) {
        //LatLngBounds para ajustar o mapa aos pontos exibidos
        var bounds = new google.maps.LatLngBounds();

        //Criar o mapa
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 10,
            center: {lat:0, lng:0}
        });
        //Adicionar elementos
        for(let i = 0; i < elements.length; i++) {
            addElement(elements[i], map);
            let coords = elements[i].coords;
            //ajustar apenas se for marker ou linha
            if(coords.length > 1 || coords.length === 1 && coords[0].marker)
                for(j = 0; j < coords.length; j++)
                    bounds.extend(new google.maps.LatLng(coords[j].lat, coords[j].lng));
        }
        map.fitBounds(bounds);
        map.panToBounds(bounds);
    }
    //wrapper: Buscar elementos via AJAX e desenhar o mapa
    function initMap() {
        getElements(drawMap, '<c:url value="/api" />');
    }
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBZmlqYc6qdj0hx1ADuYShZ0e1DHnZDjgc&callback=initMap">
</script>
</body>
</html>