package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.owasp.esapi.ESAPI;
import com.Legal_Advice.Database.Encrypt;
import com.Legal_Advice.Models.Abogado;
import com.Legal_Advice.ImpDAO.ImpAbogado;
import com.Legal_Advice.DAO.iAbogado;
import com.Legal_Advice.Models.Usuario;
import com.Legal_Advice.DAO.iUsuario;
import com.Legal_Advice.ImpDAO.ImpUsuario;

public final class activation_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Activación de Usuario</title>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"description\" content=\"A front-end template that helps you build fast, modern mobile web apps.\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, minimum-scale=1.0\">\n");
      out.write("        <meta name=\"mobile-web-app-capable\" content=\"yes\">\n");
      out.write("        <link rel=\"icon\" sizes=\"192x192\" href=\"images/android-desktop.png\">\n");
      out.write("        <meta name=\"apple-mobile-web-app-capable\" content=\"yes\">\n");
      out.write("        <meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\">\n");
      out.write("        <meta name=\"apple-mobile-web-app-title\" content=\"Material Design Lite\">\n");
      out.write("        <link rel=\"apple-touch-icon-precomposed\" href=\"images/ios-desktop.png\">\n");
      out.write("        <meta name=\"msapplication-TileImage\" content=\"images/touch/ms-touch-icon-144x144-precomposed.png\">\n");
      out.write("        <meta name=\"msapplication-TileColor\" content=\"#3372DF\">\n");
      out.write("        <link rel=\"shortcut icon\" href=\"images/favicon.png\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/icon?family=Material+Icons\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://code.getmdl.io/1.3.0/material.red-pink.min.css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/styles_login.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            HttpSession sesion;
            iAbogado impabogado = new ImpAbogado();
            iUsuario impusuario = new ImpUsuario();
            Encrypt cifrado = new Encrypt();
            String error = "http://localhost:" + request.getLocalPort() + "/com.Legal_Advice/login.html";
            String encrypted = "";
            int id = 0;
            String nombre = "";
            String decrypted="";
            if(request.getParameter("id") != null && !request.getParameter("id").equals("")){
                encrypted = request.getParameter("id");
                decrypted = cifrado.decrypt(encrypted);
                id = Integer.parseInt(decrypted);
                if(impusuario.readUsuario(id) != null){
                    Usuario usuario = impusuario.readUsuario(id);
                    nombre = usuario.getU_nombre();
                    sesion = request.getSession(true);
                    sesion.setAttribute("id", id);
                } else{
                    if(impabogado.readAbogado(id) != null){
                        Abogado abogado = new Abogado();
                        nombre = abogado.getA_nombre();
                        sesion = request.getSession(true);
                        sesion.setAttribute("id", id);
                    } else{
                        out.println("<script>failedLogin();</script>");
                        response.sendRedirect(error);
                    }
                }
            }
        
      out.write("\n");
      out.write("        <div class=\"demo-layout mdl-layout mdl-layout--fixed-header mdl-js-layout mdl-color--grey-100\">\n");
      out.write("            <header class=\"demo-header mdl-layout__header mdl-layout__header--scroll mdl-color--grey-100 mdl-color-text--grey-800\">\n");
      out.write("                <div class=\"mdl-layout__header-row\">\n");
      out.write("                    <span class=\"mdl-layout-title\">Activación de Usuario</span>\n");
      out.write("                    <div class=\"mdl-layout-spacer\"></div>\n");
      out.write("                </div>\n");
      out.write("            </header>\n");
      out.write("            <div class=\"demo-ribbon\"></div>\n");
      out.write("            <main class=\"demo-main mdl-layout__content\">\n");
      out.write("                <div class=\"demo-container mdl-grid\">\n");
      out.write("                    <div class=\"mdl-cell mdl-cell--2-col mdl-cell--hide-tablet mdl-cell--hide-phone\"></div>\n");
      out.write("                    <div class=\"demo-content mdl-color--white mdl-shadow--4dp content mdl-color-text--grey-800 mdl-cell mdl-cell--8-col\">\n");
      out.write("                        <div class=\"demo-crumbs mdl-color-text--grey-500\">\n");
      out.write("                            Legal Advice\n");
      out.write("                        </div>\n");
      out.write("                        <table border=\"0\" width=\"100%\">\n");
      out.write("                            <tr><td colspan=\"2\" width=\"100%\"><center><p><img src=\"images/logo.png\" width=\"25%\" alt=\"Logo\"></p></center></td></tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td width=\"70%\">\n");
      out.write("                                    <h3>Activación de Usuario</h3>\n");
      out.write("                                    <p class=\"mdl-color-text--primary-dark\" id=\"msj\"></p>\n");
      out.write("                                    <form action=\"Controller\" method=\"post\" name=\"login\">\n");
      out.write("                                        <h4>");
      out.print(nombre);
      out.write("</h4>\n");
      out.write("                                        <br/>\n");
      out.write("                                        <div class=\"mdl-textfield mdl-js-textfield mdl-textfield--floating-label\">\n");
      out.write("                                            <input class=\"mdl-textfield__input\" type=\"password\" name=\"pass\" id=\"pass\" pattern=\"(?=^.{8,}$)((?=.*\\d)|(?=.*\\W+))(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$\"/>\n");
      out.write("                                            <label class=\"mdl-textfield__label\" for=\"pass\">Contraseña</label>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"mdl-tooltip mdl-tooltip--large\" for=\"pass\">Ingrese su contraseña.</div>\n");
      out.write("                                        <br/>\n");
      out.write("                                        <br/>\n");
      out.write("                                        <p id=\"fp\">¿Olvidó su contraseña?</p>\n");
      out.write("                                        <div class=\"mdl-tooltip mdl-tooltip--large\" for=\"fp\">Intente ingresar su contraseña y de ser usuario podrá recuperar su contraseña.</div>\n");
      out.write("                                        <br/>\n");
      out.write("                                        <br/>\n");
      out.write("                                        <button type=\"submit\" id=\"activate\" onclick=\"return Factivate();\" name=\"submitla\" value=\"Activacion\" class=\"mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent\">Activar cuenta</button>\n");
      out.write("                                    </form>\n");
      out.write("                                </td>\n");
      out.write("                                <td class=\"mdl-layout--large-screen-only\" width=\"30%\"><center><p><img src=\"images/la2.fw.png\" width=\"90%\" alt=\"Logo\"></p></center></td>\n");
      out.write("                            </tr>\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div style=\"height: 42vh; width: 100%\"></div>\n");
      out.write("                <footer class=\"demo-footer mdl-mini-footer\">\n");
      out.write("                    <div class=\"mdl-mini-footer--left-section\">\n");
      out.write("                        <ul class=\"mdl-mini-footer--link-list\">\n");
      out.write("                            <li><a href=\"index.html\">Pagina de inicio</a></li>\n");
      out.write("                            <li><a href=\"signin.html\">Nuevo Usuario</a></li>\n");
      out.write("                            <li><a href=\"l_signin.html\">Nuevo abogado</a></li>\n");
      out.write("                            <li><a href=\"about.html\">Acerca de</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"mdl-mini-footer--right-section\">\n");
      out.write("                        Rush Techologies\n");
      out.write("                    </div>\n");
      out.write("                </footer>\n");
      out.write("            </main>\n");
      out.write("        </div>\n");
      out.write("        <script src=\"js/legal_advice.js\"></script>\n");
      out.write("        <script src=\"js/signincp.js\"></script>\n");
      out.write("        <script src=\"js/login.js\"></script>\n");
      out.write("        <script src=\"js/forgot.js\"></script>\n");
      out.write("        <script src=\"https://code.getmdl.io/1.3.0/material.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
