function getCoordinates(address, callback) {
    //https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=YOUR_API_KEY

    let query = `https://maps.googleapis.com/maps/api/geocode/json?address=${address.replace(/ /g, "+")}&key=AIzaSyD4-X8XVCwRJ3gMOj-FW0xS5MFs_Pmf5_U`;

    console.log(query);

    let xhr = new XMLHttpRequest();
    xhr.open('GET', query, true);
    xhr.onload = function() {
        if(this.status = 200) {
            let response = JSON.parse(this.responseText);
            console.log(response);
            if(response.status === "OK") {
                callback({
                    lat: response.results[0].geometry.location.lat,
                    lng: response.results[0].geometry.location.lng
                });
            } else this.onerror();
        }
    };
    xhr.onerror = function(){alert('Erro ao receber dados')};
    xhr.send();
}