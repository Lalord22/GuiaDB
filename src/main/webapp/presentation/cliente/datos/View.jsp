<%@page import="com.progra.guia.presentation.cliente.datos.Model"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <%@ include file="/presentation/Head.jsp" %>
</head>
<body >
  
    <%@ include file="/presentation/Header.jsp" %>

        <% Model model= (Model) request.getAttribute("model"); %>
        <% Map<String,String> errores = (Map<String,String>) request.getAttribute("errores"); %>
        <% Map<String,String[]> form = (errores==null)?this.getForm(model):request.getParameterMap();%>
        
        <form name="form" action="presentation/cliente/datos/update" method="post" > 
            <div class="panel" style="width:30%;">
                <div class="fila encabezado">Actualiza tu Informacion</div>
                <div class="fila">
                       <div class="etiqueta">Cedula</div>
                      <div class="campo"><%=model.getCurrent().getCedula()%></div>
                </div>
                <div class="fila">
                  
                  <div class="etiqueta">Nombre</div>
                  <div class="campo"><input class="<%=erroneo("nombreFld",errores)%>" placeholder="Nombre del usuario" type="text" name="nombreFld" value="<%=form.get("nombreFld")[0]%>" title="<%=title("nombreFld",errores)%>"></div>
                  
                  <div class="etiqueta">Contraseña</div>
                  <div class="campo"><input class="<%=erroneo("passwordFld",errores)%>" placeholder="Nueva contraseña" type="password" name="passwordFld"  ></div>
                  
                  <div class="etiqueta">Telefono</div>
                  <div class="campo"><input class="<%=erroneo("phoneFld",errores)%>" placeholder="Nuevo telefono" type="tel" name="phoneFld"  "></div>
                  
                  <div class="etiqueta">Email</div>
                  <div class="campo"><input class="<%=erroneo("emailFld",errores)%>" placeholder="Nuevo Email" type="email" name="emailFld" ></div>
                  
                  <div class="etiqueta">Numero de tarjeta</div>
                  <div class="campo"><input class="<%=erroneo("creditCardFld",errores)%>" placeholder="Nuevo nuemero de tarjeta" type="text" name="creditCardFld" ></div>
             
                </div>
                <div class="fila encabezado"><button  style="margin-bottom: 15px">Actualizar</button> </div>
            </div>
        </form>
    <%@ include file="/presentation/Footer.jsp" %>                  
</body>
</html>
<%!
    private String erroneo(String campo, Map<String,String> errores){
      if ( (errores!=null) && (errores.get(campo)!=null) )
        return "is-invalid";
      else
        return "";
    }

    private String title(String campo, Map<String,String> errores){
      if ( (errores!=null) && (errores.get(campo)!=null) )
        return errores.get(campo);
      else
        return "";
    }

    private Map<String,String[]> getForm(Model model){
       Map<String,String[]> values = new HashMap<>();
       values.put("cedulaFld", new String[]{model.getCurrent().getCedula()});
       values.put("nombreFld", new String[]{model.getCurrent().getNombre()});
       return values;
    }
    
%> 