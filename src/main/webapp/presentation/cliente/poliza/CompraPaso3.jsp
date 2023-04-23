<%@page import="com.progra.guia.presentation.coberturas.Model"%>
<%@page import="com.progra.guia.logic.Cobertura"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Model model = (Model) request.getAttribute("model");
String numeroPlaca = request.getParameter("numeroPlaca");
String marca = request.getParameter("marca");
String modelo = request.getParameter("modelo");
int year = Integer.parseInt(request.getParameter("year"));
double valorAsegurado = Double.parseDouble(request.getParameter("valorAsegurado"));
String periodoPago = request.getParameter("periodoPago");
String fechaInicio = request.getParameter("fechaInicio");
List<Cobertura> coberturas = (List<Cobertura>) request.getAttribute("coberturas");
%>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/presentation/Head.jsp" %>
        <meta charset="UTF-8">
        <title>Resumen de Compra</title>
    </head>
    <body>
        <%@ include file="/presentation/Header.jsp" %>
        <h1>Resumen de Compra</h1>
        <p>Número de placa: <%=numeroPlaca%></p>
        <p>Marca: <%=marca%></p>
        <p>Modelo: <%=modelo%></p>
        <p>Año: <%=year%></p>
        <p>Valor asegurado: <%=valorAsegurado%></p>
        <p>Periodo de pago: <%=periodoPago%></p>
        <p>Fecha de inicio: <%=fechaInicio%></p>
        <p>Coberturas seleccionadas:</p>
        <table>
            <thead>
                <tr>
                    <th>Descripción</th>
                    <th>Categoría</th>
                    <th>Costo</th>
                    
                            </tr>
        </thead>
        <tbody>
           <% double totalCosto = 0.0;
            int multiplicadorPeriodoPago = 1;
            if (periodoPago.equals("trimestral")) {
    multiplicadorPeriodoPago = 3;
} else if (periodoPago.equals("semestral")) {
    multiplicadorPeriodoPago = 6;
} else {multiplicadorPeriodoPago = 12;}
   for (Cobertura cobertura : coberturas) { 
       double costo = valorAsegurado < 300 ? cobertura.getCostoMinimo() : cobertura.getCostoPorcentual();
       totalCosto += costo;
%>
       <tr>
           <td><%=cobertura.getDescripcion()%></td>
           <td><%=cobertura.getCategoria().getDescripcion()%></td>
           <td><%=costo%></td>
       </tr>
<% } %>

<%   totalCosto *= multiplicadorPeriodoPago;
if (periodoPago.equals("semestral")) {
    totalCosto *= 0.95; // aplicar 5% de descuento para semestral
} else if (periodoPago.equals("anual")) {
    totalCosto *= 0.9; // aplicar 10% de descuento para anual
}       %>

<tfoot>
    <tr>
        <td colspan="2"><strong>Total Costo:</strong></td>
        <td><%=totalCosto%></td>
    </tr>
</tfoot>
        </tbody>
    </table>
      
    <form action="compraFinalizada.jsp" method="POST">
        <input type="hidden" name="numeroPlaca" value="<%=numeroPlaca%>">
        <input type="hidden" name="marca" value="<%=marca%>">
        <input type="hidden" name="modelo" value="<%=modelo%>">
        <input type="hidden" name="year" value="<%=year%>">
        <input type="hidden" name="valorAsegurado" value="<%=valorAsegurado%>">
        <input type="hidden" name="periodoPago" value="<%=periodoPago%>">
        <input type="hidden" name="fechaInicio" value="<%=fechaInicio%>">
        

        <input type="submit" value="Confirmar Compra">
    </form>
    <%@ include file="/presentation/Footer.jsp" %>
</body

</html>
