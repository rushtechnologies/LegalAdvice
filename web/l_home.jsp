<%-- 
    Document   : l_home
    Created on : 15/09/2018, 01:52:20 PM
    Author     : CARLOSHG
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="org.owasp.esapi.ESAPI, com.Legal_Advice.Database.Encrypt, com.Legal_Advice.Models.Sugerencia, com.Legal_Advice.Models.Abogado, com.Legal_Advice.Models.Contacto, com.Legal_Advice.ImpDAO.ImpAbogado, com.Legal_Advice.ImpDAO.ImpContacto, com.Legal_Advice.ImpDAO.ImpSugerencia, com.Legal_Advice.DAO.iAbogado, com.Legal_Advice.DAO.iSugerencia, com.Legal_Advice.DAO.iContacto, java.util.List, com.Legal_Advice.Models.Usuario, com.Legal_Advice.DAO.iUsuario, com.Legal_Advice.ImpDAO.ImpUsuario"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Legal Advice</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Legal Advice">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
        <meta name="mobile-web-app-capable" content="yes">
        <link rel="icon" sizes="192x192" href="images/android-desktop.png">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="white">
        <meta name="apple-mobile-web-app-title" content="Material Design Lite">
        <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">
        <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
        <meta name="msapplication-TileColor" content="#3372DF">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.red-amber.min.css">
        <link rel="stylesheet" href="css/styles_l_home.css">
    </head>
    <body>
        <%
            HttpSession sesion=request.getSession();
            if(sesion==null){
                response.sendRedirect("http://localhost:"+request.getLocalPort()+"/com.Legal_Advice/login.html");
            }
            if(Integer.parseInt(sesion.getAttribute("id").toString())==0){
                response.sendRedirect("http://localhost:"+request.getLocalPort()+"/com.Legal_Advice/login.html");
            }
            iAbogado impabogado = new ImpAbogado();
            int abogado_id=0;
            String decrypted="";
            Encrypt cifrado = new Encrypt();
            if(!request.getParameter("abogado_id").equals("")){
                decrypted=cifrado.decrypt(request.getParameter("abogado_id"));
                abogado_id=Integer.parseInt(decrypted);
                sesion.setAttribute("pass", ESAPI.encoder().decodeForHTML(impabogado.readAbogado(abogado_id).getA_contra()));
            }
            else{
                abogado_id=Integer.parseInt(sesion.getAttribute("id").toString());
            }
            String name=impabogado.readAbogado(abogado_id).getA_nombre();
        %>
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header mdl-layout--fixed-tabs">
            <header class="mdl-layout__header mdl-layout__header--scroll mdl-color--primary">
                <div class="mdl-layout__header-row">Legal Advice</div>
                <div class="mdl-layout__header-row mdl-layout--large-screen-only"></div>
                <div class="mdl-layout__header-row">
                    <table border="0" width="100%">
                        <tr>
                            <td width=70%>
                                <span class="mdl-layout-title"><h4><%=name%></h4></span>
                            </td>
                            <td><center><img src="images/la2.fw.png" width="50%" alt="Logo"></center></td>
                        </tr>
                    </table>
                </div>
                <div class="mdl-layout__header-row"></div>
                <div class="mdl-layout__header-row mdl-layout--large-screen-only"></div>
                <nav class="mdl-layout__tab-bar mdl-js-ripple-effect mdl-color--primary-dark" style="overflow-x:auto;">
                    <a href="#fixed-tab-1" style="padding-left: 15px; padding-right: 15px" class="mdl-layout__tab is-active" onclick="call1()">Inicio</a>
                    <a href="#fixed-tab-2" style="padding-left: 15px; padding-right: 15px" class="mdl-layout__tab" onclick="call2()">Emergencias</a>
                    <a href="#fixed-tab-3" style="padding-left: 15px; padding-right: 15px" class="mdl-layout__tab" onclick="call3()">Tránsito</a>
                    <a href="#fixed-tab-4" style="padding-left: 15px; padding-right: 15px" class="mdl-layout__tab" onclick="call4()">Denuncias</a>
                    <a href="#fixed-tab-5" style="padding-left: 15px; padding-right: 15px" class="mdl-layout__tab" onclick="call5()">Trámites</a>
                </nav>
            </header>
            <div class="mdl-layout__drawer">
                <span class="mdl-layout-title">Legal Advice</span>
                <nav class="mdl-navigation">
                    <center><img src="images/la2.fw.png" width="75%" alt="Logo"></center>
                    <br/>
                    <a class="mdl-navigation__link " onclick="call8()">Actualizar información</a>
                    <a class="mdl-navigation__link " onclick="call6()">Revisar contacto</a>
                    <a class="mdl-navigation__link" onclick="call7()">Nueva sugerencia</a>
                    <br/>
                    <a class="mdl-navigation__link" onclick="call1()" >Inicio</a>
                    <a class="mdl-navigation__link " href="<%="http://localhost:"+request.getLocalPort()+"/com.Legal_Advice/exit.jsp"%>">Salir</a>
                </nav>
            </div>
            <main class="mdl-layout__content">
                <section class="mdl-layout__tab-panel is-active" id="fixed-tab-1">
                    <div class="page-content">
                        <%
                            iSugerencia impsugerencia = new ImpSugerencia();
                            List <Sugerencia> sugerencias = impsugerencia.readSugerenciasAbogados();
                            if (sugerencias.size() != 0){
                                for (int i = 0; i < sugerencias.size(); i++) {
                                    out.println("<div class='mdl-cell mdl-cell--12-col mdl-card mdl-shadow--4dp'>");
                                    out.println("<div class='mdl-card__title'><h3 class='mdl-card__title-text'>"+sugerencias.get(i).getS_titulo()+"</h2></div>");
                                    out.println("<div class='mdl-card__media'><img src=' images/sugerencia.jpg' width='100%' alt='sugerencia'></div>");
                                    out.println("<div class='mdl-card__supporting-text mdl-color-text--grey-800' style='padding: 25px'>");
                                    out.println(sugerencias.get(i).getSugerencia());
                                    out.println("</div>");
                                    out.println("<div class='mdl-card__supporting-text meta mdl-color-text--grey-600' style='padding: 25px; border-top: 1px solid rgba(0,0,0,0.1);'>");
                                    out.println("<strong>"+impabogado.readAbogado(sugerencias.get(i).getAbogado_id()).getA_nombre()+"</strong>");
                                    out.println("</div>");
                                    out.println("<div class='mdl-card__supporting-text meta mdl-color-text--grey-600' style='padding: 25px; border-top: 1px solid rgba(0,0,0,0.1);'>");
                                    String aprobacion = "";
                                    if(sugerencias.get(i).getS_aprobacion()>10){
                                        aprobacion = "Aprobada";
                                    } else
                                        if(sugerencias.get(i).getS_aprobacion()<10){
                                            aprobacion = "No aprobada";
                                        }
                                    out.println("<strong>Aprobación: "+sugerencias.get(i).getS_aprobacion()+" ("+aprobacion+")"+"</strong>");
                                    out.println("</div>");
                                    out.println("<div class='mdl-card__supporting-text meta mdl-color-text--grey-600' style='padding: 25px; border-top: 1px solid rgba(0,0,0,0.1);'>");
                                    if(sugerencias.get(i).getAbogado_id() != abogado_id){
                                        out.println("<strong><form method='post' action='Controller'><button class='mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent' onclick='return aprobar();' type='submit' name='submitla' value='Aprobar"+cifrado.encryptid(sugerencias.get(i).getSugerencia_id())+"'>✔ Aprobar</button></form></strong>");
                                    } else{
                                        out.println("<strong>No se puede aprobar una sugerencia de su autoría</strong>");
                                    }
                                    out.println("</div>");
                                    out.println("</div>");
                                }
                            } else{
                                out.println("<p>No se encontraron sugerencias por el momento.</p>");
                            }
                        %>
                        <div style="height: 42vh; width: 100%"></div>
                    </div>
                </section>
                <section class="mdl-layout__tab-panel" id="fixed-tab-2">
                    <div class="page-content">
                        <%
                            List <Sugerencia> sugerenciase = impsugerencia.readSugerenciasUsuario("emergencias");
                            if (sugerenciase.size() != 0){
                                for (int i = 0; i < sugerenciase.size(); i++) {
                                    out.println("<div class='mdl-cell mdl-cell--12-col mdl-card mdl-shadow--4dp'>");
                                    out.println("<div class='mdl-card__title'><h3 class='mdl-card__title-text'>"+sugerenciase.get(i).getS_titulo()+"</h2></div>");
                                    out.println("<div class='mdl-card__media'><img src=' images/sugerencia.jpg' width='100%' alt='sugerencia'></div>");
                                    out.println("<div class='mdl-card__supporting-text mdl-color-text--grey-800' style='padding: 25px'>");
                                    out.println(sugerenciase.get(i).getSugerencia());
                                    out.println("</div>");
                                    out.println("<div class='mdl-card__supporting-text meta mdl-color-text--grey-600' style='padding: 25px; border-top: 1px solid rgba(0,0,0,0.1);'>");
                                    out.println("<strong>"+impabogado.readAbogado(sugerenciase.get(i).getAbogado_id()).getA_nombre()+"</strong>");
                                    out.println("</div>");
                                    out.println("</div>");
                                }
                            } else{
                                out.println("<p>No se encontraron sugerencias por el momento.</p>");
                            }
                        %>
                        <div style="height: 42vh; width: 100%"></div>
                    </div>
                </section>
                <section class="mdl-layout__tab-panel" id="fixed-tab-3">
                    <div class="page-content">
                        <%
                            List <Sugerencia> sugerenciast = impsugerencia.readSugerenciasUsuario("transito");
                            if (sugerenciast.size() != 0){
                                for (int i = 0; i < sugerenciast.size(); i++) {
                                    out.println("<div class='mdl-cell mdl-cell--12-col mdl-card mdl-shadow--4dp'>");
                                    out.println("<div class='mdl-card__title'><h3 class='mdl-card__title-text'>"+sugerenciast.get(i).getS_titulo()+"</h2></div>");
                                    out.println("<div class='mdl-card__media'><img src=' images/sugerencia.jpg' width='100%' alt='sugerencia'></div>");
                                    out.println("<div class='mdl-card__supporting-text mdl-color-text--grey-800' style='padding: 25px'>");
                                    out.println(sugerenciast.get(i).getSugerencia());
                                    out.println("</div>");
                                    out.println("<div class='mdl-card__supporting-text meta mdl-color-text--grey-600' style='padding: 25px; border-top: 1px solid rgba(0,0,0,0.1);'>");
                                    out.println("<strong>"+impabogado.readAbogado(sugerenciast.get(i).getAbogado_id()).getA_nombre()+"</strong>");
                                    out.println("</div>");
                                    out.println("</div>");
                                }
                            } else{
                                out.println("<p>No se encontraron sugerencias por el momento.</p>");
                            }
                        %>
                        <div style="height: 42vh; width: 100%"></div>
                    </div>
                </section>
                <section class="mdl-layout__tab-panel" id="fixed-tab-4">
                    <div class="page-content">
                        <%
                            List <Sugerencia> sugerenciasd = impsugerencia.readSugerenciasUsuario("denuncias");
                            if (sugerenciasd.size() != 0){
                                for (int i = 0; i < sugerenciasd.size(); i++) {
                                    out.println("<div class='mdl-cell mdl-cell--12-col mdl-card mdl-shadow--4dp'>");
                                    out.println("<div class='mdl-card__title'><h3 class='mdl-card__title-text'>"+sugerenciasd.get(i).getS_titulo()+"</h2></div>");
                                    out.println("<div class='mdl-card__media'><img src=' images/sugerencia.jpg' width='100%' alt='sugerencia'></div>");
                                    out.println("<div class='mdl-card__supporting-text mdl-color-text--grey-800' style='padding: 25px'>");
                                    out.println(sugerenciasd.get(i).getSugerencia());
                                    out.println("</div>");
                                    out.println("<div class='mdl-card__supporting-text meta mdl-color-text--grey-600' style='padding: 25px; border-top: 1px solid rgba(0,0,0,0.1);'>");
                                    out.println("<strong>"+impabogado.readAbogado(sugerenciasd.get(i).getAbogado_id()).getA_nombre()+"</strong>");
                                    out.println("</div>");
                                    out.println("</div>");
                                }
                            } else{
                                out.println("<p>No se encontraron sugerencias por el momento.</p>");
                            }
                        %>
                        <div style="height: 42vh; width: 100%"></div>
                    </div>
                </section>
                <section class="mdl-layout__tab-panel" id="fixed-tab-5">
                    <div class="page-content">
                        <%
                            List <Sugerencia> sugerenciastr = impsugerencia.readSugerenciasUsuario("tramites");
                            if (sugerenciastr.size() != 0){
                                for (int i = 0; i < sugerenciastr.size(); i++) {
                                    out.println("<div class='mdl-cell mdl-cell--12-col mdl-card mdl-shadow--4dp'>");
                                    out.println("<div class='mdl-card__title'><h3 class='mdl-card__title-text'>"+sugerenciastr.get(i).getS_titulo()+"</h2></div>");
                                    out.println("<div class='mdl-card__media'><img src=' images/sugerencia.jpg' width='100%' alt='sugerencia'></div>");
                                    out.println("<div class='mdl-card__supporting-text mdl-color-text--grey-800' style='padding: 25px'>");
                                    out.println(sugerenciastr.get(i).getSugerencia());
                                    out.println("</div>");
                                    out.println("<div class='mdl-card__supporting-text meta mdl-color-text--grey-600' style='padding: 25px; border-top: 1px solid rgba(0,0,0,0.1);'>");
                                    out.println("<strong>"+impabogado.readAbogado(sugerenciastr.get(i).getAbogado_id()).getA_nombre()+"</strong>");
                                    out.println("</div>");
                                    out.println("</div>");
                                }
                            } else{
                                out.println("<p>No se encontraron sugerencias por el momento.</p>");
                            }
                        %>
                        <div style="height: 42vh; width: 100%"></div>
                    </div>
                </section>
                <section class="mdl-layout__tab-panel callableDiv" id="fixed-tab-6">
                    <div class="page-content">
                        <br/>
                        <center>
                            <h4>Contacto</h4>
                            <p>El trato con cualquiera de los usuarios es ajeno Legal Advice, sólo le presentamos una forma de contacto en caso de emergencia, todo arreglo económico con el usuario queda fuera de nuestra responsabilidad.</p>
                            <br/>
                                <%
                                    iContacto impcontacto = new ImpContacto();
                                    iUsuario impusuario = new ImpUsuario();
                                    List <Contacto> contactos = impcontacto.readContactAbogado(abogado_id);
                                    out.print("<table width='95%' class='mdl-data-table mdl-js-data-table mdl-js-data-table--selectable mdl-shadow--2dp'><thead><tr><th class='mdl-data-table__cell--non-numeric'>Nombre</th><th class='mdl-data-table__cell--non-numeric'>Correo</th><th class='mdl-data-table__cell--non-numeric'>Estado</th><th class='mdl-data-table__cell'>Revisar</th></tr></thead><tbody>");
                                    if(contactos.size() != 0){
                                        for (int i = 0; i < contactos.size(); i++) {
                                            out.println("<tr>");
                                            out.println("<td class='mdl-data-table__cell--non-numeric'>"+impusuario.readUsuario(contactos.get(i).getUsuario()).getU_nombre()+"</td>");
                                            out.println("<td class='mdl-data-table__cell--non-numeric'>"+impusuario.readUsuario(contactos.get(i).getUsuario()).getU_correo()+"</td>");
                                            out.println("<td class='mdl-data-table__cell--non-numeric'>"+contactos.get(i).getEstado()+"</td>");
                                            String revisar = "";
                                                if (contactos.get(i).getEstado().equals("Pendiente")) {
                                                    revisar = "<form action='Controller' method='post'><button class='mdl-button mdl-js-button mdl-js-ripple-effect' onclick='return revisar();' type='submit' name='submitla' value='RevisaCo" + cifrado.encryptid(contactos.get(i).getUsuario()) + "'><div class='material-icons mdl-badge mdl-badge--overlap' data-badge='1'>account_box</div></button></form>";
                                                } else {
                                                    if (contactos.get(i).getEstado().equals("Revisado")) {
                                                        revisar = "<div class='material-icons mdl-badge mdl-badge--overlap' data-badge='✔'>account_box</div>";
                                                    }
                                                }
                                            out.println("<td class='mdl-data-table__cell'>"+revisar+"</td>");
                                            out.println("<tr/>");
                                        }
                                    }
                                    else{
                                        out.println("<tr>");
                                            out.println("<td class='mdl-data-table__cell--non-numeric'>No se encontraron intentos de contacto por el momento, intente más tarde.</td>");
                                            out.println("<td class='mdl-data-table__cell--non-numeric'></td>");
                                            out.println("<td class='mdl-data-table__cell--non-numeric'></td>");
                                            out.println("<td class='mdl-data-table__cell--non-numeric'></td>");
                                            out.println("<tr/>");
                                    }
                                    out.print("</tbody></table>");
                                %>
                        </center>
                        <div style="height: 42vh; width: 100%"></div>
                    </div>
                </section>
                <section class="mdl-layout__tab-panel callableDiv" id="fixed-tab-7">
                    <div class="page-content">
                        <div class="demo-blog__posts mdl-grid">
                            <div style="padding: 30px" class="mdl-cell mdl-cell--8-col mdl-card mdl-shadow--4dp">
                                <div class='mdl-card__title'><h4 class='mdl-card__title-text'>Nueva Sugerencia</h4></div>
                                <div>
                                    <p class="mdl-color-text--primary-dark" id="msj"></p>
                                    <form  action="Controller" method="post">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width: 100%">
                                            <input class="mdl-textfield__input" type="text" name="titulo" id="titulo" autocomplete="off" onkeypress="alpha()" pattern="[a-zA-Z]+(\s*[a-zA-Z]*)*[a-zA-Z]{1,50}$"/>
                                            <label class="mdl-textfield__label" for="titulo">Título</label>
                                        </div>
                                        <div class="mdl-tooltip mdl-tooltip--large" for="titulo">Ingrese un titulo para la sugerencia de máximo 20 caracteres.</div>
                                        <br/>
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select" style="width: 100%">
                                            <select id="categoria" name="categoria" class="mdl-textfield__input" autocomplete="off">
                                                <option selected></option>
                                                <option value="emergencias">Emergencias</option>
                                                <option value="transito">Tránsito</option>
                                                <option value="denuncias">Denuncias</option>
                                                <option value="tramites">Trámites</option>
                                            </select>
                                            <label for="categoria" class="mdl-textfield__label">Selecciona la categoria de la sugerencia</label>
                                        </div>
                                        <div class="mdl-tooltip mdl-tooltip--large" for="categoria">Seleccione la categoria a la que pertenece su sugerencia.</div>
                                        <br/>
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width: 100%">
                                            <textarea class="mdl-textfield__input" type="text" name="sugerencia"  rows="7" id="sugerencia" style="margin-top: 0px; margin-bottom: 0px; height: 100px;" onkeypress="alphap()" pattern="[a-zA-Z]+(\s*[a-zA-Z]*)*[a-zA-Z]"></textarea> 
                                            <label class="mdl-textfield__label" for="sugerencia">Sugerencia</label>
                                        </div>
                                        <div class="mdl-tooltip mdl-tooltip--large" for="sugerencia">Ingrese la sugerencia en un máximo de 1000 caracteres.</div>
                                        <br/>
                                        <br/>
                                        <br/>
                                        <button onclick="return Fl_sug();" type="submit" name="submitla" value="Registrar nueva sugerencia" id="nsug" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">Registrar nueva sugerencia</button>
                                        <div class="mdl-tooltip mdl-tooltip--large" for="nsug">Registrar nueva sugerencia. (Estarán sujetas a la aprobación de los demás abogados en Legal Advice)</div>
                                    </form>
                                </div>
                            </div>
                            <div onclick="location.href='#Aprobacion'" style="padding: 30px" class="mdl-cell--4-col-desktop demo-card-image mdl-card mdl-cell mdl-card mdl-shadow--4dp mdl-cell--hide-tablet">
                                <div class="mdl-card__title mdl-card--expand"></div>
                                <div class="mdl-card__actions">
                                    <span class="demo-card-image__filename mdl-color-text--white"><strong>Revisa la aprobación de tus sugerencias abajo.</strong></span>
                                </div>
                            </div>
                        </div>
                        <div id="Aprobacion">
                            <%
                            List <Sugerencia> sugerenciasa = impsugerencia.readSugerenciasAbogado(abogado_id);
                            if (sugerenciasa.size() != 0){
                                for (int i = 0; i < sugerenciasa.size(); i++) {
                                    out.println("<div class='mdl-cell mdl-cell--12-col mdl-card mdl-shadow--4dp'>");
                                    out.println("<div class='mdl-card__title'><h3 class='mdl-card__title-text'>"+sugerenciasa.get(i).getS_titulo()+"</h2></div>");
                                    out.println("<div class='mdl-card__media'><img src=' images/sugerencia.jpg' width='100%' alt='sugerencia'></div>");
                                    out.println("<div class='mdl-card__supporting-text mdl-color-text--grey-800' style='padding: 25px'>");
                                    out.println(sugerenciasa.get(i).getSugerencia());
                                    out.println("</div>");
                                    out.println("<div class='mdl-card__supporting-text meta mdl-color-text--grey-600' style='padding: 25px; border-top: 1px solid rgba(0,0,0,0.1);'>");
                                    String aprobacion = "";
                                    if(sugerenciasa.get(i).getS_aprobacion()>10){
                                        aprobacion = "Aprobada";
                                    } else
                                        if(sugerenciasa.get(i).getS_aprobacion()<10){
                                            aprobacion = "No aprobada";
                                        }
                                    out.println("<strong>Aprobación: "+sugerenciasa.get(i).getS_aprobacion()+" ("+aprobacion+")"+"</strong>");
                                    out.println("</div>");
                                    out.println("</div>");
                                }
                            } else{
                                out.println("<div class='mdl-cell mdl-cell--12-col mdl-card mdl-shadow--4dp' style='padding: 30px;'><div class='mdl-card__title'><h4 class='mdl-card__title-text'>Todavía no ha registrado ninguna sugerencia.</h4></div></div>");
                            }
                        %>
                        </div>
                        <div style="height: 42vh; width: 100%"></div>
                    </div>
                </section>
                <section class="mdl-layout__tab-panel" id="fixed-tab-8">
                    <div class="page-content">
                        <br/>
                        <center>
                            <h3>Actualizar información</h3>
                            <div style="overflow-x:auto;">
                                <table border="0" width="90%" style="border-spacing: 50px">
                                    <tr>
                                        <td width="50%">
                                            <h4>Actualizar datos generales</h4>
                                            <p class="mdl-color-text--primary-dark" id="msj"></p>
                                            <form action="Controller" method="post">
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                    <input class="mdl-textfield__input" type="text" name="user" value="<%=name%>" id="user" autocomplete="off" onkeypress="alpha()" pattern="[a-zA-Z]+(\s*[a-zA-Z]*)*[a-zA-Z]{1,50}$"/>
                                                    <label class="mdl-textfield__label" for="user">Nombre (usuario)</label>
                                                </div>
                                                <div class="mdl-tooltip mdl-tooltip--large" for="user">Ingrese su nombre de usuario de máximo 50 caracteres.</div>
                                                <br/>
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                    <input class="mdl-textfield__input" type="email" value="<%=impabogado.readAbogado(abogado_id).getA_correo()%>" name="mail" id="mail" autocomplete="off" onkeypress="email()" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$">
                                                    <label class="mdl-textfield__label" for="mail">Correo electrónico</label>
                                                </div>
                                                <div class="mdl-tooltip mdl-tooltip--large" for="mail">Ingrese su correo electrónico (xx@xx.xx) para contactarle en caso de ser necesario.</div>
                                                <br/>
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                    <input class="mdl-textfield__input" type="text" value="<%=impabogado.readAbogado(abogado_id).getA_cedula()%>" name="ced" id="ced" autocomplete="off" onkeypress="alphanumeric()" pattern="[a-zA-Z0-9]+"/>
                                                    <label class="mdl-textfield__label" for="ced">Cédula profesional</label>
                                                </div>
                                                <div class="mdl-tooltip mdl-tooltip--large" for="ced">Ingrese su cédula profesional como abogado para corroborar sus estudios.</div>
                                                <br/>
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                    <input class="mdl-textfield__input" maxlength="10" type="text" value="<%=impabogado.readAbogado(abogado_id).getA_telefono()%>" name="ph" id="ph" autocomplete="off" onkeypress="numeric()" pattern="[0-9]{10}"/>
                                                    <label class="mdl-textfield__label" for="ph">Teléfono de contacto</label>
                                                </div>
                                                <div class="mdl-tooltip mdl-tooltip--large" for="ph">Ingrese su número telefónico para que los usuarios puedan contactarle.</div>
                                                <br/>
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select">
                                                    <select id="q" name="q" class="mdl-textfield__input" autocomplete="off">
                                                    <%
                                                        String pregunta = impabogado.readAbogado(abogado_id).getA_pregunta();
                                                        if (pregunta.equals("Nombre de tu mejor amigo de la infancia")) {
                                                            out.println("<option selected value='friend'>Nombre de tu mejor amigo de la infancia</option><option value='pet'>Nombre de tu primer macota</option><option value='col'>Nombre de tu universidad</option>");
                                                        } else {
                                                            if (pregunta.equals("Nombre de tu primer macota")) {
                                                                out.println("<option value='friend'>Nombre de tu mejor amigo de la infancia</option><option selected value='pet'>Nombre de tu primer macota</option><option value='col'>Nombre de tu universidad</option>");
                                                            } else if (pregunta.equals("Nombre de tu universidad")) {
                                                                out.println("<option value='friend'>Nombre de tu mejor amigo de la infancia</option><option value='pet'>Nombre de tu primer macota</option><option selected value='col'>Nombre de tu universidad</option>");
                                                            }
                                                        }
                                                    %>
                                                    </select>
                                                    <label for="q" class="mdl-textfield__label">Pregunta de seguridad</label>
                                                </div>
                                                <div class="mdl-tooltip mdl-tooltip--large" for="q">Seleccione una pregunta de seguridad para proteger su cuenta.</div>
                                                <br/>
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                    <input class="mdl-textfield__input" type="text" name="ans" id="ans" value="<%=impabogado.readAbogado(abogado_id).getA_respuesta()%>" autocomplete="off" onkeypress="alpha()" pattern="[a-zA-Z]+(\s*[a-zA-Z]*)*[a-zA-Z]"/>
                                                    <label class="mdl-textfield__label" for="ans">Respuesta</label>
                                                </div>
                                                <div class="mdl-tooltip mdl-tooltip--large" for="ans">Ingrese la respuesta a la pregunta de seguridad que ha seleccionado.</div>
                                                <br/>
                                                <br/>
                                                <p>Ingrese su contraseña para permirtir la actualización de sus datos.</p>
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                    <input class="mdl-textfield__input" type="password" name="pass" id="pass" autocomplete="off" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"/>
                                                    <label class="mdl-textfield__label" for="pass">Contraseña (mínimo 8 caracteres)</label>
                                                </div>
                                                <div class="mdl-tooltip mdl-tooltip--large" for="pass">Ingrese su contraseña.</div>
                                                <br/>
                                                <br/>
                                                <button onclick="return Fl_updatedata();" type="submit" name="submitla" value="Actualizar datos del abogado" id="actda" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">Actualizar datos del abogado</button>
                                                <div class="mdl-tooltip mdl-tooltip--large" for="actda">Actualizar la información ingresada</div>
                                            </form>
                                        </td>
                                        <td class="mdl-color--primary">
                                        </td>
                                        <td>
                                            <h4>Actualizar contraseña</h4>
                                            <p class="mdl-color-text--primary-dark" id="msj"></p>
                                            <form action="Controller" method="post">
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                    <input class="mdl-textfield__input" type="password" name="pass2" id="pass2" autocomplete="off" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"/>
                                                    <label class="mdl-textfield__label" for="pass2">Contraseña (mínimo 8 caracteres)</label>
                                                </div>
                                                <div class="mdl-tooltip mdl-tooltip--large" for="pass2">Ingrese su contraseña actual.</div>
                                                <br/>
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                    <input class="mdl-textfield__input" type="password" name="npass" id="npass" autocomplete="off" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"/>
                                                    <label class="mdl-textfield__label" for="npass">Nueva contraseña (mínimo 8 caracteres)</label>
                                                </div>
                                                <div class="mdl-tooltip mdl-tooltip--large" for="npass">Ingrese su nueva contraseña de mínimo 8 caracteres, se recomienda que incluya caracteres espepciales, máximo 50 caracteres.</div>
                                                <br/>
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                    <input class="mdl-textfield__input" type="password" name="npass2" id="npass2" autocomplete="off" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"/>
                                                    <label class="mdl-textfield__label" for="npass2">Repetir contraseña</label>
                                                </div>
                                                <div class="mdl-tooltip mdl-tooltip--large" for="npass2">Repita la nueva contraseña que ingresó previamente.</div>
                                                <br/>
                                                <br/>
                                                <button onclick="return Fl_updatepass();" type="submit" name="submitla" value="Actualizar abogado" id="atcpass" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">Actualizar abogado</button>
                                                <div class="mdl-tooltip mdl-tooltip--large" for="atcpass">Actualizar la contraseña</div>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <br/>
                            <br/>
                        </center>
                        <div style="height: 42vh; width: 100%"></div>
                    </div>
                </section>
                <footer class="mdl-mini-footer">
                    <div class="mdl-mini-footer--left-section">
                        <div class="mdl-logo">Legal Advice</div>
                        <ul class="mdl-mini-footer--link-list">
                            <li><a href="about.html">Acerca de</a></li>
                        </ul>
                    </div>
                    <div class="mdl-mini-footer--right-section">
                        <h6>Rush Techologies</h6>
                    </div>
                </footer>
            </main>
            <div class="mdl-layout__obfuscator"></div>
        </div>
        <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <script src="js/l_signin.js"></script>
        <script src="js/updatecp.js"></script>
        <script src='js/legal_advice.js'></script>
        <script src="js/CallableDiv.js"></script>
    </body>
</html>