<%-- 
    Document   : AgregarCategoria
    Created on : Apr 21, 2023, 9:39:44 PM
    Author     : lalo2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/presentation/Head.jsp" %>
    </head>
    <body>
        <%@ include file="/presentation/Header.jsp" %>
        <div margin-bottom: 20px;>
            <div class="panel" style="width:30%;">
                <form action="admin/addCategoria" method="POST" style="max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; background-color: #fff; margin-left: auto; margin-right: auto;">
                    <h1 style="text-align: center;">Add Categoria</h1>
                    <div style="margin-bottom: 20px;">
                        <label for="descripcion" style="display: block; margin-bottom: 5px;">Descripcion:</label>
                        <input type="text" id="descripcion" name="descripcion" required style="padding: 10px; font-size: 16px; border-radius: 5px; border: 1px solid #ccc; width: 100%; box-sizing: border-box;">
                    </div>
                    <div>
                        <button type="submit" style="padding: 10px; font-size: 16px; border-radius: 5px; border: none; background-color: #007bff; color: #fff; cursor: pointer;">Agregar</button>
                    </div>
                </form>
            </div>
        </div>
        <%@ include file="/presentation/Footer.jsp" %>
    </body>
</html>

<%-- 

        Body Original
 <body>
        <%@ include file="/presentation/Header.jsp" %>
        <h1>Add Categoria</h1>
        <form action="admin/addCategoria" method="POST">
            <label for="descripcion">Descripcion:</label>
            <input type="text" id="descripcion" name="descripcion" required><br><br>
            <button type="submit">Add Categoria</button>
        </form>
         <%@ include file="/presentation/Footer.jsp" %>
    </body> 
--%>