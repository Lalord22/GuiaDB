<%-- 
    Document   : Compra
    Created on : Apr 19, 2023, 4:47:13 PM
    Author     : lalo2
--%>
<%@page import="com.progra.guia.logic.Poliza"%>
<%@page import="com.progra.guia.presentation.cliente.Poliza.Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>





<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/presentation/Head.jsp" %>
        <meta charset="UTF-8">
    </head>
    <body>
        <%@ include file="/presentation/Header.jsp" %>
        <div margin-bottom: 20px;>
        <form action="ComprarPoliza" method="POST" class="container-form">
                <div class="panel" style="width:35%;">
                    <div class="fila encabezado">Compra de Poliza</div>
                    <div class="fila">
                        <label for="numeroPlaca">Placa:</label>
                        <input type="text" id="numeroPlaca" name="numeroPlaca" required>
                    </div>
                    <div class="fila">
                        <label for="marca">Marca:</label>
                        <input type="text" id="marca" name="marca" required>
                    </div>
                    <div class="fila">
                        <label for="modelo">Modelo:</label>
                        <input type="text" id="modelo" name="modelo" required>
                    </div>
                    <div class="fila">
                        <label for="year">Año de Fabricacion:</label>
                        <input type="number" id="year" name="year" required>
                    </div>
                    <div class="fila">
                        <label for="valorAsegurado">Valor Asegurado:</label>
                        <input type="number" id="valorAsegurado" name="valorAsegurado" required>
                    </div>
                    <div class="fila">
                        <label for="periodoPago">Periodo de Pago:</label>
                        <select id="periodoPago" name="periodoPago">
                            <option value="trimestral">Trimestral</option>
                            <option value="semestral">Semestral</option>
                            <option value="anual">Anual</option>
                        </select>
                    </div>
                    <div class="fila">
                        <label for="fechaInicio">Fecha de Inicio:</label>
                        <input type="date" id="fechaInicio" name="fechaInicio" required>
                    </div>
                    <div class="fila encabezado">
                        <%-- <input type="submit" value="Comprar Poliza"> --%>
                         <div class="fila encabezado"><button type="submit" style="padding: 10px; font-size: 16px; border-radius: 5px; border: none; background-color: #007bff; color: #fff; cursor: pointer;">Comprar</button> </div>
                    </div>
                </div>
            </form>
        </div>

        <%@ include file="/presentation/Footer.jsp" %>
    </body>
</html>
