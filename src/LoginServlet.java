import Classes.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/LoginServlet", name = "Login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pseudo = request.getParameter("pseudo");
        String password = request.getParameter("password");

        if (pseudo != null && password != null) {
            if (pseudo.equals("Administrateur") && password.equals("admin123")) {
                HttpSession session = request.getSession(true);

                if (session != null && session.getAttribute("admin") == null) {
                    session.setAttribute("admin", new Utilisateur("Administrateur", true));
                    this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                }
            } else {
                this.getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
            }
        } else {
            this.getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("admin") == null) {
            this.getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
        } else if (session != null && session.getAttribute("admin") != null) {
            session.removeAttribute("admin");
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
