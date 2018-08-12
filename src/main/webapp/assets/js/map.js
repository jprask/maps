function getElements(callback, query) {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', query, true);
    xhr.onload = function() {
        if(this.status = 200) {
            callback(JSON.parse(this.responseText));
        }
    };
    xhr.onerror = function(){alert('Erro ao receber dados')};
    xhr.send();
}

function makeMarker(lat, lng, map, icon, name) {
    return new google.maps.Marker({
        position: new google.maps.LatLng(lat, lng),
        map: map,
        label: {
            fontFamily: 'Material Icons',
            fontSize: '24px',
            text: (icon == null) ? 'explore':icon
        },
        icon: {
            path: google.maps.SymbolPath.CIRCLE,
            fillColor: 'red',
            strokeColor: 'red',
            scale: 6,
            strokeWeight: 12
        },
        title: name
    })
}

function makeInfoWindow(marker, map, element) {
    let content =
        `<div class="container">
            <h2 class="flow-text">
                ${element.name}
            </h2>
            <br>
            <p>
                ${(element.desc == null) ? 'Nao ah descricao!':element.desc}
            </p>
        </div>`;
    let infoWIndow = new google.maps.InfoWindow({
        content: content
    });
    marker.addListener('click', function() {
        infoWIndow.open(map, marker);
    });
    return infoWIndow;
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
    if(element.coords.length < 1) return {};
    if(element.coords.length === 1) {
        if(!element.coords[0].marker) return {};
        else {
            let marker = makeMarker(element.coords[0].lat, element.coords[0].lng, map, element.icon, element.name);
            return {
                markers: [
                    marker
                ],
                infoWindows: [
                    makeInfoWindow(marker, map, element)
                ],
                line: null
            }
        }
    }

    let ref = {
        markers: [],
        infoWindows: []
    };

    let lineCoords = [];

    for(let i = 0; i < element.coords.length; i++) {
        lineCoords.push(
            new google.maps.LatLng(element.coords[i].lat, element.coords[i].lng)
        );

        if(element.coords[i].marker) {
            let marker = makeMarker(element.coords[i].lat, element.coords[i].lng, map, element.icon, element.name);
            ref.markers.push(marker);
            ref.infoWindows.push(
                makeInfoWindow(marker, map, element)
            );
        }
    }

    ref.line = makeLine(lineCoords, map);

    return ref;
}