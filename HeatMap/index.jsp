<%-- 
    Document   : heat
    Created on : Jul 13, 2018, 10:01:02 AM
    Author     : Ryuuk_Shinigami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Fusion Tables heatmaps</title>
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
  </head>
  <body>
    <div id="map"></div>
    <script>
        var map, layer;
      function initMap() {
         map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 10, lng: -140},
          zoom: 3
        });

         layer = new google.maps.FusionTablesLayer({
          query: {
            select: 'location',
            weight: 'weight',
            from: '10lJt-bmKCA2v8pJMIaOBY5b5PQoX9M0VOu9jRpP2'
          },
          heatmap: {
              enable: true
//            radius: '40',
//            opacity: '0.6',
//            weight: 'weight',
//            where: 'weight > 2.0',
//            set: 'gradient: #FFFFFF'
          }
        });
        layer.setMap(map);
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_0tUADYcoNRoe5mJTRDu76Cm6I-Jb5rg&callback=initMap">
    </script>
  </body>
</html>
