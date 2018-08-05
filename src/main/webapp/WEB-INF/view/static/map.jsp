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
    function initMap() {
        //LatLngBounds para ajustar o mapa aos pontos exibidos
        var bounds = new google.maps.LatLngBounds();

        //Criar o mapa
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 10,
            center: {lat:0, lng:0}
        });

        var coordinates;
        var elements = [];

        <c:forEach items="${elements}" var="element">
            coordinates = [];
            <c:forEach items="${element.coords}" var="coordinate">
                coordinates.push({
                    latLng: new google.maps.LatLng(${coordinate.lat}, ${coordinate.lng}),
                    marker: ${coordinate.marker}
                });
            </c:forEach>
            elements.push(
                addElement({
                    name: '${element.name}',
                    desc: '${element.desc}',
                    iconTxt: '${element.icon}', //Validate not null...
                    coordinates: coordinates
                }, map)
            );
            for(let i = 0; i < coordinates.length; i++)
                bounds.extend(coordinates[i].latLng);
        </c:forEach>

        // bounds.extend(myLatLng);
        map.fitBounds(bounds);
        map.panToBounds(bounds);
    }
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=${}&callback=initMap">
</script>
</body>
</html>