package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import ma.school.beans.Machine;
import ma.school.beans.Marque;
import ma.school.service.MachineService;
import ma.school.service.MarqueService;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import ma.school.util.HibernateUtil;

public final class chart_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=UTF-8");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

MachineService machineService = new MachineService();
MarqueService marqueService = new MarqueService();

List<Marque> marques = marqueService.findAll();
Gson gson = new Gson();
JsonArray dataArray = new JsonArray();

for (Marque marque : marques) {
    JsonObject brandObject = new JsonObject();
    brandObject.addProperty("label", marque.getLibelle()); // Use the appropriate attribute or method
    int machineCount = marqueService.getCountByMarque(marque); // Implement this method in your service
    brandObject.addProperty("data", machineCount);
    dataArray.add(brandObject);
}

String jsonData = gson.toJson(dataArray);

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Graphique avec Chart.js</title>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/chart.js\"></script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div style=\"width: 40%; margin: 0 auto;\">\n");
      out.write("        <canvas id=\"machineChart\" width=\"400\" height=\"400\"></canvas>\n");
      out.write("    </div>\n");
      out.write("    <script>\n");
      out.write("    var jsonData = ");
      out.print( jsonData );
      out.write(";\n");
      out.write("\n");
      out.write("    var labels = [];\n");
      out.write("    var data = [];\n");
      out.write("\n");
      out.write("    jsonData.forEach(function(item) {\n");
      out.write("        labels.push(item.label); // Brand names\n");
      out.write("        data.push(item.data); // Machine counts\n");
      out.write("    });\n");
      out.write("\n");
      out.write("    var ctx = document.getElementById(\"machineChart\").getContext(\"2d\");\n");
      out.write("    var machineChart = new Chart(ctx, {\n");
      out.write("        type: \"bar\",\n");
      out.write("        data: {\n");
      out.write("            labels: labels,\n");
      out.write("            datasets: [\n");
      out.write("                {\n");
      out.write("                    label: \"Number of Machines\",\n");
      out.write("                    data: data,\n");
      out.write("                    backgroundColor: \"rgba(75, 192, 192, 0.2)\",\n");
      out.write("                    borderColor: \"rgba(75, 192, 192, 1)\",\n");
      out.write("                    borderWidth: 1\n");
      out.write("                }\n");
      out.write("            ]\n");
      out.write("        },\n");
      out.write("        options: {\n");
      out.write("            scales: {\n");
      out.write("                x: {\n");
      out.write("                    beginAtZero: true,\n");
      out.write("                },\n");
      out.write("                y: {\n");
      out.write("                    beginAtZero: true,\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("    });\n");
      out.write("    </script>\n");
      out.write("</body>\n");
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
