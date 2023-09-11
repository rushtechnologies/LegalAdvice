<%-- 
    Document   : exit
    Created on : 17/10/2018, 07:36:55 PM
    Author     : CARLOSHG
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Exit Legal Advice</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
        <meta name="mobile-web-app-capable" content="yes">
        <link rel="icon" sizes="192x192" href="images/android-desktop.png">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-title" content="Material Design Lite">
        <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">
        <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
        <meta name="msapplication-TileColor" content="#3372DF">
        <link rel="shortcut icon" href="images/favicon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.red-light_blue.min.css" />
        <link rel="stylesheet" href="css/styles_index.css">
    </head>
    <body>
        <h1>Exit</h1>
        <%
            HttpSession sesion = request.getSession();
            if(sesion==null){
                response.sendRedirect("http://localhost:" + request.getLocalPort() + "/com.Legal_Advice/index.html");
            }else{
                sesion.invalidate();
                response.sendRedirect("http://localhost:" + request.getLocalPort() + "/com.Legal_Advice/index.html");
            }
        %>
    </body>
</html>
