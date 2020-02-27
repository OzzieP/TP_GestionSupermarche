import Classes.Article;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(value = "/GestionServlet", name = "Gestion")
public class GestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HashMap<Long, Article> hm = (HashMap<Long, Article>) this.getServletContext().getAttribute("articles");
        String btn = request.getParameter("btn");
        Article article = null;

        if (btn.equals("Ajouter")) {
            article = new Article(
                    Long.parseLong(request.getParameter("addCodeBarre")),
                    request.getParameter("addReference"),
                    request.getParameter("addLibelle"),
                    Integer.parseInt(request.getParameter("addPrixHT")),
                    Integer.parseInt(request.getParameter("addTauxTVA"))
            );
        } else if (btn.equals("Modifier")) {
            long codeBarre = Long.parseLong(request.getParameter("updateCodeBarre"));
            article = new Article(
                    codeBarre,
                    request.getParameter("updateReference"),
                    request.getParameter("updateLibelle"),
                    Integer.parseInt(request.getParameter("updatePrixHT")),
                    Integer.parseInt(request.getParameter("updateTauxTVA"))
            );
        }

        if (article != null) {
            hm.put(article.getCodeBarre(), article);
        }

        this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String btn = request.getParameter("btn");

        if (btn.equals("Ajouter")) {
            request.setAttribute("btn", btn);
            this.getServletContext().getRequestDispatcher("/gestion.jsp").forward(request, response);
        } else if (btn.equals("Supprimer")) {
            long codeBarre = Long.parseLong(request.getParameter("codeBarre"));
            SupprimerArticle(codeBarre, btn, request);
            this.getServletContext().getRequestDispatcher("/AccueilServlet").forward(request, response);
        } else {
            this.getServletContext().getRequestDispatcher("/gestion.jsp").forward(request, response);
        }
    }

    private void SupprimerArticle(long codeBarre, String btn, HttpServletRequest request) {
        HashMap<Long, Article> hm = (HashMap<Long, Article>) this.getServletContext().getAttribute("articles");
        Article selectedArticle = hm.get(codeBarre);

        request.setAttribute("btn", btn);
        request.setAttribute("selectedArticle", selectedArticle);
        hm.remove(codeBarre);
    }
}
