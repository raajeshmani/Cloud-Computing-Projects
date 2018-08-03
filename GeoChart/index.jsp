<%-- 
    Document   : index
    Created on : Jul 27, 2018, 9:17:12 AM
    Author     : Ryuuk_Shinigami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {
                'packages': ['geochart'],
                'mapsApiKey': 'AIzaSyC_0tUADYcoNRoe5mJTRDu76Cm6I-Jb5rg'
            });
            google.charts.setOnLoadCallback(drawRegionsMap);
            function drawRegionsMap() {
                var data = google.visualization.arrayToDataTable([
                    ['State', 'Growth rate in GSDP-Agriculture'],
                    ['Andhra Pradesh', 6],
                    ['Arunachal Pradesh', 16],
                    ['Assam', 7],
                    ['Bihar', 15],
                    ['Uttar Pradesh', 9],
                    ['Maharashtra', 11],
                    ['West Bengal', 13],
                    ['Madhya Pradesh', 1],
                    ['Tamil Nadu', 18],
                    ['Rajasthan', 26],
                    ['Karnataka', 29],
                    ['Gujarat', 25],
                    ['Orissa', 22],
                    ['Kerala', 24],
                    ['Jharkhand', 2],
                    ['Punjab', 23],
                    ['Chhattisgarh', 5],
                    ['Haryana', 14],
                    ['Jammu and Kashmir', 20],
                    ['Uttarakhand', 11],
                    ['Himachal Pradesh', 4],
                    ['Tripura', 12],
                    ['Meghalaya', 10],
                    ['Manipur', 19],
                    ['Nagaland', 8],
                    ['Goa', 27],
                    ['Mizoram', 28],
                    ['Sikkim', 3],
                    ['Delhi', 17],
                    ['Chandigarh', 5]
                ]);
                var options = {
                    region: 'IN',
                    displayMode: 'regions',
                    resolution: 'provinces',
                    width: 1850,
                    height: 920
                };
                var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));
                chart.draw(data, options);
            }
        </script>
    </head>
    <body>
        <div id="regions_div" style="width: 900px; height: 500px;"></div>
    </body>
</html>
