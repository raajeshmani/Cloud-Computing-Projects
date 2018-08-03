<%-- 
    Document   : hardcode
    Created on : Jul 17, 2018, 4:05:37 PM
    Author     : Ryuuk_Shinigami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Heatmaps</title>
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
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      #floating-panel {
        background-color: #fff;
        border: 1px solid #999;
        left: 25%;
        padding: 5px;
        position: absolute;
        top: 10px;
        z-index: 5;
      }
    </style>
  </head>
 
  <body>
    <div id="floating-panel">
      <button onclick="toggleHeatmap()">Toggle Heatmap</button>
      <button onclick="changeGradient()">Change gradient</button>
      <button onclick="changeRadius()">Change radius</button>
      <button onclick="changeOpacity()">Change opacity</button>
    </div>
    <div id="map"></div>
    <script>
 
      // This example requires the Visualization library. Include the libraries=visualization
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=visualization">
 
      var map, heatmap;
 
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 13,
          center: {lat: 20.5937, lng: 78.9629},
          mapTypeId: 'satellite'
        });
 
        heatmap = new google.maps.visualization.HeatmapLayer({
          data: getPoints(),
          map: map
        });
      }
 
      function toggleHeatmap() {
        heatmap.setMap(heatmap.getMap() ? null : map);
      }
 
      function changeGradient() {
        var gradient = [
          'rgba(0, 255, 255, 0)',
          'rgba(0, 255, 255, 1)',
          'rgba(0, 191, 255, 1)',
          'rgba(0, 127, 255, 1)',
          'rgba(0, 63, 255, 1)',
          'rgba(0, 0, 255, 1)',
          'rgba(0, 0, 223, 1)',
          'rgba(0, 0, 191, 1)',
          'rgba(0, 0, 159, 1)',
          'rgba(0, 0, 127, 1)',
          'rgba(63, 0, 91, 1)',
          'rgba(127, 0, 63, 1)',
          'rgba(191, 0, 31, 1)',
          'rgba(255, 0, 0, 1)'
        ]
        heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
      }
 
      function changeRadius() {
        heatmap.set('radius', heatmap.get('radius') ? null : 20);
      }
 
      function changeOpacity() {
        heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
      }
 
      // Heatmap data: 500 Points
      function getPoints() {
        return [
          new google.maps.LatLng(15.9129, 79.7400),
          new google.maps.LatLng(15.9189, 79.7450),
          new google.maps.LatLng(15.9256, 79.7543),
          new google.maps.LatLng(15.9367, 79.7765),
          new google.maps.LatLng(15.9678, 79.7875),
          new google.maps.LatLng(15.9876, 79.7987),
          new google.maps.LatLng(15.9986, 79.7999),
          new google.maps.LatLng(16.0345, 80.1620),
          new google.maps.LatLng(16.1234, 80.1879),
          new google.maps.LatLng(16.1345, 80.1987),
          new google.maps.LatLng(16.1567, 80.2123),
          new google.maps.LatLng(16.1678, 80.2620),
          new google.maps.LatLng(16.4567, 80.2820),
         
        ];
      }
    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_0tUADYcoNRoe5mJTRDu76Cm6I-Jb5rg&libraries=visualization&callback=initMap">
    </script>
  </body>
</html>
