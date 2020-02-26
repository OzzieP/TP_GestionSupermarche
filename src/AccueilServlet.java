import Classes.Article;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/AccueilServlet")
public class AccueilServlet extends javax.servlet.http.HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        ServletContext application = getServletConfig().getServletContext();

        HashMap<Long, Article> hm = new HashMap<Long, Article>();

        Article a1 = new Article(123L, "abc", " Riz Oncle Bens", 90, 0);
        Article a2 = new Article(456L, "efg", " Pate Panzani", 75, 1);
        Article a3 = new Article(789L, "hij", "Ketchup", 25, 0);
        Article a4 = new Article(1011L, "klm", "Moutarde de Dijon ", 50, 1);
        Article a5 = new Article(1213L, "nop", "Mayonnaise Amora", 82, 1);

        hm.put(123L, a1);
        hm.put(456L, a2);
        hm.put(789L, a3);
        hm.put(1011L, a4);
        hm.put(1213L, a5);

        application.setAttribute("articles", hm);



        //for(Long key: hm.keySet()) { hm.get(key).codeBarre}
    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }
}
