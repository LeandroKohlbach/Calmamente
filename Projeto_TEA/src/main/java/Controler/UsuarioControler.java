package Controler;

import Dao.DaoUsuario;
import modelos.Usuario;

public class UsuarioControler {
    private DaoUsuario daousu;

    public Usuario salvar(Usuario usuario) {

        DaoUsuario.insert(usuario);
        return usuario;
    }
}