<%@page import="com.progra.guia.presentation.coberturas.Model"%>
<%@page import="com.progra.guia.logic.Cobertura"%>
<%@page import="com.progra.guia.logic.Poliza"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Poliza poliza = (Poliza) request.getAttribute("poliza");
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
        <p>Número de placa: <%=poliza.getNumeroPlaca()%></p>
        <p>Marca: <%=poliza.getModelo().getMarca().getDescripcion()%></p>
        <p>Modelo: <%=poliza.getModelo().getDescripcion()%></p>
        <p>Año: <%=poliza.getAnno()%></p>
        <p>Valor asegurado: <%=poliza.getValorAsegurado()%></p>
        <p>Periodo de pago: <%=poliza.getPlazoPago()%></p>
        <p>Fecha de inicio: <%=poliza.getFechaInicio()%></p>
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
            double valorCalculado = poliza.getValorAsegurado();
            if (poliza.getPlazoPago().equals("trimestral")) {
    multiplicadorPeriodoPago = 3;
} else if (poliza.getPlazoPago().equals("semestral")) {
    multiplicadorPeriodoPago = 6;
} else {multiplicadorPeriodoPago = 12;}
   for (Cobertura cobertura : coberturas) { 
       double costo = valorCalculado < 300 ? cobertura.getCostoMinimo() : cobertura.getCostoPorcentual();
       totalCosto += costo;
%>
       <tr>
           <td><%=cobertura.getDescripcion()%></td>
           <td><%=cobertura.getCategoria().getDescripcion()%></td>
           <td><%=costo%></td>
       </tr>
<% } %>

<%   totalCosto *= multiplicadorPeriodoPago;
if (poliza.getPlazoPago().equals("semestral")) {
    totalCosto *= 0.95; // aplicar 5% de descuento para semestral
} else if (poliza.getPlazoPago().equals("anual")) {
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
      
    <form action="compraFinalizada" method="POST">
    
        

        <input type="submit" value="Confirmar Compra">
    </form>
    <%@ include file="/presentation/Footer.jsp" %>
    </body>

</html>
