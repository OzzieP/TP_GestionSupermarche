import Classes.Article;
import Classes.Utilisateur;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(value = "/AccueilServlet", name = "Accueil", loadOnStartup = 1)
public class AccueilServlet extends javax.servlet.http.HttpServlet {
    //public static ArrayList<Article> panier = new ArrayList<>();

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

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

        this.getServletContext().setAttribute("articles", hm);
    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null) {
            HashMap<Long, Article> hm = (HashMap<Long, Article>) this.getServletContext().getAttribute("articles");
            long codeBarre = Long.parseLong(request.getParameter("addArticlePanier"));
            Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");

            Article selectedArticle =  hm.get(codeBarre);
            if (selectedArticle != null) {
                utilisateur.getPanier().add(selectedArticle);
            }
        }


//        HashMap<Long, Article> hm = (HashMap<Long, Article>) this.getServletContext().getAttribute("articles");
//        long codeBarre = Long.parseLong(request.getParameter("addArticlePanier"));
//
//        Article selectedArticle =  hm.get(codeBarre);
//        if (selectedArticle != null) {
//            this.panier.add(selectedArticle);
//        }

        this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        HttpSession session = request.getSession(true);

        if (session != null && session.getAttribute("utilisateur") == null) {
            session.setAttribute("utilisateur", new Utilisateur("Utilisateur"));
        }

        this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
