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
    </head>
    <body>
        <%@ page import="java.io.*"%>
                <%@page import="java.util.ArrayList"%>
                <%
                    String readFilePath = "/home/ryuuk/Academic/Cloud Computing/AWS/aws.txt";
 
                    //AWS Code Start -->
                    BasicAWSCredentials creds = new BasicAWSCredentials("AKIAI5T76BMJ2GXVLHMQ", "afhvRcRoOfDV3UxXHs+sCw3zZoMfYNRBim2Sz+Re");
                    String bucketName = "keralafloodhelprequest";
                    String path = readFilePath;
                    String foldername = "keralaflood";
                    AmazonS3 s3 = AmazonS3Client.builder().withRegion(Regions.US_EAST_1).withCredentials(new AWSStaticCredentialsProvider(creds)).build();
                    S3Object s3object = s3.getObject(bucketName, foldername);
                    try (InputStream inputStream = s3object.getObjectContent()) {
                        Files.copy(inputStream, Paths.get(readFilePath));
                    }
 
                    FileInputStream fin = new FileInputStream(readFilePath);
                    ObjectInputStream oi = new ObjectInputStream(fin);
                    ArrayList<User> userList = (ArrayList<User>) oi.readObject();
                %>
                
                <table>
                    <tr>
                        <th>Name</th>
                        <th>District</th>
                        <th>Requested</th>
                        <th>Location</th>
                        <th>Date</th>
                        <th>Phone Number</th>
                    </tr>
                    <%
                        for (int i = 0; i < userList.size(); i++) {
                            User temp = userList.get(i);
                    %>
                    <tr id=<%=temp.name%>>
                        <td><%=temp.name%></td>
                        <td><%=temp.district%></td>
                        <td><%=temp.requested%></td>
                        <td><%=temp.location%></td>
                        <td><%=temp.date%></td>
                        <td><%=temp.pno%></td>
                    <tr>
                        <%
                            }

                            File filedel = new File ("/home/ryuuk/Academic/Cloud Computing/AWS/aws.txt");
                               filedel.delete();
                        %>
 
                </table>
                <br>
                <br>
                <br>

                <a href="index.html">Home</a>
    </body>
</html>
