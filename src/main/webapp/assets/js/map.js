function makeMarker(latLng, map, icon, name) {
    return new google.maps.Marker({
        position: latLng,
        map: map,
        label: {
            fontFamily: 'Material Icons',
            fontSize: '24px',
            text: icon
        },
        title: name
    })
}

function makeLine(path, map) {
    return new google.maps.Polyline({
        path: path,
        map: map,
        geodesic: true,
        strokeColor: '#9a28ff',
        strokeOpacity: 1.0,
        strokeWeight: 2
    });
}

function addElement(element, map) {
    if(element.coordinates.length < 1) return {};
    if(element.coordinates.length === 1) {
        if(!element.coordinates[0].marker) return {};
        return {
            markers: [
                makeMarker(element.coordinates[0].latLng, map, element.iconTxt, element.name)
            ],
            line: null
        }
    }

    let ref = {
        markers: []
    };

    let lineCoords = [];

    for(let i = 0; i < element.coordinates.length; i++) {
        lineCoords.push(
           element.coordinates[i].latLng
        );
        if(element.coordinates[i].marker)
            ref.markers.push(
                makeMarker(element.coordinates[i].latLng, map, element.iconTxt, element.name)
            );
    }

    ref.line = makeLine(lineCoords, map);

    return ref;
}