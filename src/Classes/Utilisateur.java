package Classes;

import java.util.ArrayList;

public class Utilisateur {
    String pseudo;
    boolean isAdmin;

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public boolean isAdmin() { return isAdmin; }

    public void setAdmin(boolean admin) { isAdmin = admin; }

    public Utilisateur(String pseudo, boolean isAdmin) {
        this.pseudo = pseudo;
        this.isAdmin = isAdmin;
    }
}
