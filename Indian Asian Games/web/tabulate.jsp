<%-- 
    Document   : tabulate
    Created on : Sep 2, 2018, 10:00:36 PM
    Author     : ryuuk
--%>
<%@page import="com.amazonaws.regions.Regions"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="com.amazonaws.auth.AWSStaticCredentialsProvider"%>
<%@page import="com.amazonaws.auth.AWSStaticCredentialsProvider"%>
<%@page import="com.amazonaws.services.s3.AmazonS3Client"%>
<%@page import="com.amazonaws.services.s3.model.S3Object"%>
<%@page import="com.amazonaws.services.s3.AmazonS3"%>
<%@page import="com.amazonaws.services.s3.AmazonS3"%>
<%@page import="com.amazonaws.auth.BasicAWSCredentials"%>
<%@page import="storage.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registered Table</title>
        <link rel="stylesheet" href="seller.css">
        <script type="text/javascript" src="jquery-latest.js"></script> 
        <script type="text/javascript" src="jquery.tablesorter.js"></script> 
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <script>
            $(document).ready(function ()
            {
                $("#myTable").tablesorter();
            }
            );
        </script>
        
       


    </head>
    <body>
        <%@ page import="java.io.*"%>
        <%@page import="java.util.ArrayList"%>
        <%
            String readFilePath = "/home/ryuuk/Academic/Cloud Computing/AWS/aws.data";

            //AWS Code Start -->
            BasicAWSCredentials creds = new BasicAWSCredentials("", "");
            String bucketName = "ryuuk-asian-games";
            String path = readFilePath;
            String foldername = "medalsbysport";
            AmazonS3 s3 = AmazonS3Client.builder().withRegion(Regions.US_EAST_1).withCredentials(new AWSStaticCredentialsProvider(creds)).build();
            S3Object s3object = s3.getObject(bucketName, foldername);
            try (InputStream inputStream = s3object.getObjectContent()) {
                Files.copy(inputStream, Paths.get(readFilePath));
            }

            FileInputStream fin = new FileInputStream(readFilePath);
            ObjectInputStream oi = new ObjectInputStream(fin);
            ArrayList<User> userList = (ArrayList<User>) oi.readObject();
        %>

        <table id="myTable" class="tablesorter">
            <thead>
                <tr>
                    <th onclick="sortTable(0)">Sport</th>
                    <th>Gold</th>
                    <th>Silver</th>
                    <th>Bronze</th>
                    <th onclick="sortTable(1)">Total</th>
                </tr>
            </thead>

            <tbody>
                <%
                    for (int i = 0; i < userList.size(); i++) {
                        User temp = userList.get(i);
                %>
                <tr id=<%=temp.sport%>>
                    <td><%=temp.sport%></td>

                    <td><%=temp.total%></td>
                <tr>
                    <%
                        }

                        File filedel = new File("/home/ryuuk/Academic/Cloud Computing/AWS/aws.data");
                        filedel.delete();
                    %>
            </tbody>
        </table>
            
             <script>
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                    title: {
                        text: "Desktop Search Engine Market Share - 2016"
                    },
                    data: [{
                            type: "pie",
                            startAngle: 240,
                            yValueFormatString: "##0.00\"%\"",
                            indexLabel: "{label} {y}",
                             
                            dataPoints: [
                                <%
                    for (int i = 0; i < userList.size(); i++) {
                        User temp = userList.get(i);
                %>
                                {y: <%=temp.total%>, label: "<%=temp.sport%>"},
                            
                            <%
                        }

                    %>
                                            
                                            ]
                        }]
                });
                chart.render();

            }
        </script>
        
        
        <div id="chartContainer" style="height: 370px; width: 100%;"></div>
        
        <script>
            function sortTable(n) {
                var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
                table = document.getElementById("myTable");
                switching = true;
                // Set the sorting direction to ascending:
                dir = "asc";
                /* Make a loop that will continue until
                 no switching has been done: */
                while (switching) {
                    // Start by saying: no switching is done:
                    switching = false;
                    rows = table.rows;
                    /* Loop through all table rows (except the
                     first, which contains table headers): */
                    for (i = 1; i < (rows.length - 1); i++) {
                        // Start by saying there should be no switching:
                        shouldSwitch = false;
                        /* Get the two elements you want to compare,
                         one from current row and one from the next: */
                        x = rows[i].getElementsByTagName("TD")[n];
                        y = rows[i + 1].getElementsByTagName("TD")[n];
                        /* Check if the two rows should switch place,
                         based on the direction, asc or desc: */
                        if (dir == "asc") {
                            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                                // If so, mark as a switch and break the loop:
                                shouldSwitch = true;
                                break;
                            }
                        } else if (dir == "desc") {
                            if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                                // If so, mark as a switch and break the loop:
                                shouldSwitch = true;
                                break;
                            }
                        }
                    }
                    if (shouldSwitch) {
                        /* If a switch has been marked, make the switch
                         and mark that a switch has been done: */
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                        // Each time a switch is done, increase this count by 1:
                        switchcount++;
                    } else {
                        /* If no switching has been done AND the direction is "asc",
                         set the direction to "desc" and run the while loop again. */
                        if (switchcount == 0 && dir == "asc") {
                            dir = "desc";
                            switching = true;
                        }
                    }
                }
            }
        </script>
        <br>
        <br>
        <br>

        <a href="index.html">Home</a>
    </body>
</html>
