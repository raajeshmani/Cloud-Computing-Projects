<%-- 
    Document   : visualize
    Created on : Sep 7, 2018, 10:43:02 AM
    Author     : ryuuk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            $(document).ready(function ()
            {
                var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,

                    title: {
                        text: "Asian Games Table"
                    },
                    axisX: {
                        interval: 1
                    },
                    axisY2: {
                        interlacedColor: "rgba(1,77,101,.2)",
                        gridColor: "rgba(1,77,101,.1)",
                        title: "Points"
                    },
                    data: [{
                            type: "pie",
                            name: "companies",
                            axisYType: "secondary",
                            color: "#014D65",
                            dataPoints: [
            //ADD DETAILS TO TEMP POINTS AND TEMP NAME
                                    {y: <%=.total%>, label: "<%=temp.sport%>"},
                                    
                        <%
                                }
                            %>
                            ]
                        }]
                });
                chart.render();
            }
            );
</script>
    </body>
</html>
