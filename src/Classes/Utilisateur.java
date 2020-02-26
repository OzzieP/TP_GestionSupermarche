package Classes;

import java.util.ArrayList;

public class Utilisateur {
    String pseudo;
    ArrayList<Article> panier;

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public ArrayList<Article> getPanier() {
        return panier;
    }

    public void setPanier(ArrayList<Article> panier) {
        this.panier = panier;
    }

    public Utilisateur(String pseudo) {
        this.pseudo = pseudo;
        this.panier = new ArrayList<>();
    }
}
