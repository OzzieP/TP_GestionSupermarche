import Classes.Article;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(value = "/AccueilServlet", name = "Accueil", loadOnStartup = 1)
public class AccueilServlet extends javax.servlet.http.HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        ArrayList<Article> panier = new ArrayList<Article>();
        HashMap<Long, Article> hm = new HashMap<Long, Article>();

        Article a1 = new Article(123L, "REF-123", " Riz Uncle Ben's", 303, 0);
        Article a2 = new Article(456L, "REF-890", " Pâtes Panzani", 193, 1);
        Article a3 = new Article(789L, "REF-456", "Ketchup", 168, 0);
        Article a4 = new Article(1011L, "REF-567", "Moutarde de Dijon ", 131, 1);
        Article a5 = new Article(1213L, "REF-150", "Mayonnaise Amora", 293, 1);

        hm.put(123L, a1);
        hm.put(456L, a2);
        hm.put(789L, a3);
        hm.put(1011L, a4);
        hm.put(1213L, a5);

        this.getServletContext().setAttribute("panier", panier);
        this.getServletContext().setAttribute("articles", hm);
    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        ArrayList<Article> panier = (ArrayList<Article>) this.getServletContext().getAttribute("panier");
        String code = request.getParameter("addArticlePanier");

        AjouterArticleAuPanier(panier, code);
        CalculerTotaux(panier);

        this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        ArrayList<Article> panier = (ArrayList<Article>) this.getServletContext().getAttribute("panier");
        String codeBarre = request.getParameter("codeBarre");
        String btn = request.getParameter("btn");

        if (btn.equals("Retirer")) {
            for (Article article : panier) {
                if (article.getCodeBarre() == Long.parseLong(codeBarre)) {
                    panier.remove(article);
                    break;
                }
            }
        }

        CalculerTotaux(panier);

        this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }

    private void CalculerTotaux(ArrayList<Article> panier) {
        float totalTTC = 0f;
        float totalTVA = 0f;

        for (Article article : panier) {
            float tva = (article.getPrixHT() / 100f) * (article.getTauxTVA() / 100f);
            float prixTTC = article.getPrixHT() / 100f + tva;

            totalTTC += prixTTC;
            totalTVA += tva;
        }

        this.getServletContext().setAttribute("totalTTC", totalTTC);
        this.getServletContext().setAttribute("totalTVA", totalTVA);
    }

    private void AjouterArticleAuPanier(ArrayList<Article> panier, String code) {
        HashMap<Long, Article> hm = (HashMap<Long, Article>) this.getServletContext().getAttribute("articles");

        if (code != null || !code.isEmpty() || !code.isBlank()) {
            long codeBarre = Long.parseLong(code);

            Article selectedArticle =  hm.get(codeBarre);
            if (selectedArticle != null) {
                panier.add(selectedArticle);
            }
        }
    }
}
