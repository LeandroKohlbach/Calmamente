package Controler;

import Dao.DaoUsuario;

import modelos.Usuario;

public class UsuarioControler {

	private DaoUsuario daousu;

	public UsuarioControler() {

		daousu = new DaoUsuario();

	}

	public Usuario salvar(Usuario usuario) {

		daousu.insert(usuario);

		return usuario;

	}

	public boolean validar(String email) {

		return daousu.validarCadastro(email);

	}
	
	public int BuscarId(String email) {
		return daousu.BuscarId(email);
	}

}