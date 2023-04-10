<!DOCTYPE html>

<%@page import="com.progra.guia.presentation.login.Model"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
	
        <%@ include file="/presentation/Head.jsp" %>
</head>
<body class="rBody">
	<%@ include file="/presentation/Header.jsp" %>

        <div class="registrationBox" >
            
        
  <form method="post" action= "presentation/login/register" class="registrationForm">
    
    <div>Add your information</div>
    
    <label for="id"></label>
    <input type="text" id="id" name="id" placeholder="ID Number" required><br>
    <label for="password"></label>
    <input type="password" id="password" name="password" placeholder="Password" required><br>
    <label for="name"></label>
    <input type="text" id="name" name="name" placeholder="Name" required><br>
    <label for="telephone"></label>
    <input type="tel" id="telephone" name="telephone" placeholder="Telephone" required><br>
    <label for="email"></label>
    <input type="email" id="email" name="email" placeholder="Email" required><br>
    <label for="creditcard"></label>
    <input type="text" id="creditcard" name="creditcard" placeholder="Credit Card Number" required><br> 
   
    
    <input type="submit" value="Register" class="submit">
  </form>
        
   </div>     
  <%@ include file="/presentation/Footer.jsp" %>   
</body>
</html>
