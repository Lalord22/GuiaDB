<%-- 
    Document   : registrationSuccess
    Created on : Apr 10, 2023, 12:46:54 AM
    Author     : lalo2
--%>

<%@page import="com.progra.guia.presentation.login.Model"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
            <head>
            <title>Registration Success</title>
            </head>
            <body>
                <h1>Registration Successful</h1>
            <p>Click the button below to return to the login page:</p>
<<<<<<< HEAD
            <form method='get' action="presentation/login/logout">
=======
            <form method='post' action="/GuiaDB/presentation/login/show">
>>>>>>> 3e6ba5ec751f76a5570652d561b1ac7ec0dd36cf
            <input type='submit' value='Return to Login'>
            </form>
            </body>
</html>
