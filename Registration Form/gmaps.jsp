<%-- 
    Document   : gmaps
    Created on : Jul 11, 2018, 9:36:50 AM
    Author     : Ryuuk_Shinigami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="utf-8">
        <title>Marker Labels</title>
        <style>
            /* Always set the map height explicitly to define the size of the div
             * element that contains the map. */
            #map {
                height: 100%;
            }
            /* Optional: Makes the sample page fill the window. */
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
        </style>    
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_0tUADYcoNRoe5mJTRDu76Cm6I-Jb5rg"></script>      
        <script>
        var address ="<%= (String)request.getAttribute("addr")%>";
            function initialize() {
                var directionsService = new google.maps.DirectionsService;
                var directionsDisplay = new google.maps.DirectionsRenderer;
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 7,
                    center: {lat: 10.902720, lng: 76.901246}
                });
                directionsDisplay.setMap(map);
                calculateAndDisplayRoute(directionsService, directionsDisplay);
            }

            function calculateAndDisplayRoute(directionsService, directionsDisplay) {
                directionsService.route({
                    origin: '10.902720, 76.901246',
                    destination: address,
                    travelMode: 'DRIVING'
                }, function (response, status) {
                    if (status === 'OK') {
                        directionsDisplay.setDirections(response);
                    } else {
                        window.alert('Directions request failed due to ' + status);
                    }
                });
            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
    </head>
    <body> 
        <div id="map"></div>
    </body>
</html>
