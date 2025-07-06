package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelos.Usuario;
import utils.ConexaoDB;

public class DaoUsuario {

	public static Usuario insert(Usuario usuario) {
		try {
			Connection con = ConexaoDB.getConexao();
			String sql = "INSERT INTO Usuario(nome, email, senha_hash, dt_nascimento, telefone) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, usuario.getNome());
			stm.setString(2, usuario.getEmail());
			stm.setString(3, usuario.getSenha());
			stm.setDate(4, usuario.getDataNascimento());
			stm.setString(5, usuario.getFone());
			stm.execute();
			con.close();
		} catch (Exception e) {
			throw new RuntimeException("Erro ao cadastrar usuário: " + e.getMessage());
		}
		return usuario;
	}

	public static Usuario validarUsuario(String email, String senha) {
		String sql = "SELECT * FROM Usuario WHERE email = ? AND senha_hash = ?";
		Usuario usuarioEncontrado = null;

		try (Connection conn = ConexaoDB.getConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setString(1, email);
			stmt.setString(2, senha);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				usuarioEncontrado = new Usuario();
				usuarioEncontrado.setId(rs.getInt("id"));
				usuarioEncontrado.setNome(rs.getString("nome"));
				usuarioEncontrado.setEmail(rs.getString("email"));
				usuarioEncontrado.setSenha(rs.getString("senha_hash"));
				usuarioEncontrado.setDataNascimento(rs.getDate("dt_nascimento"));
				usuarioEncontrado.setFone(rs.getString("telefone"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("Erro ao validar usuário: " + e.getMessage());
		}
		return usuarioEncontrado;
	}

	public boolean validarCadastro(String email) {
		try {
			Connection con = ConexaoDB.getConexao();
			String sql = "SELECT email FROM Usuario WHERE email = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, email);
			ResultSet rs = stm.executeQuery();
			boolean exists = rs.next();
			con.close();
			return exists;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao verificar email: " + e.getMessage());
		}
	}

	public int BuscarId(String email) {
		try {
			Connection con = ConexaoDB.getConexao();
			String sql = "SELECT id FROM Usuario WHERE email = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, email);
			ResultSet rs = stm.executeQuery();
			if (rs.next()) {
				int id = rs.getInt("id");
				con.close();
				return id;
			}
			con.close();
			return 0;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao buscar ID do usuário: " + e.getMessage());
		}
	}

	public static boolean verificarEmailExistente(String email, int idUsuarioAtual) {
		String sql = "SELECT id FROM Usuario WHERE email = ? AND id != ?";

		try (Connection con = ConexaoDB.getConexao(); PreparedStatement stm = con.prepareStatement(sql)) {

			stm.setString(1, email);
			stm.setInt(2, idUsuarioAtual);

			try (ResultSet rs = stm.executeQuery()) {
				return rs.next();
			}

		} catch (SQLException e) {
			throw new RuntimeException("Erro ao verificar email existente: " + e.getMessage(), e);
		}
	}

	public static Usuario update(Usuario usuario) {
		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append("UPDATE Usuario SET nome = ?, email = ?, dt_nascimento = ?, telefone = ?");

		if (usuario.getSenha() != null && !usuario.getSenha().trim().isEmpty()) {
			sqlBuilder.append(", senha_hash = ?");
		}
		sqlBuilder.append(" WHERE id = ?");

		try (Connection conn = ConexaoDB.getConexao();
				PreparedStatement stm = conn.prepareStatement(sqlBuilder.toString())) {

			int paramIndex = 1;

			stm.setString(paramIndex++, usuario.getNome());
			stm.setString(paramIndex++, usuario.getEmail());
			stm.setDate(paramIndex++, usuario.getDataNascimento());
			stm.setString(paramIndex++, usuario.getFone());

			if (usuario.getSenha() != null && !usuario.getSenha().trim().isEmpty()) {
				stm.setString(paramIndex++, usuario.getSenha());
			}

			stm.setInt(paramIndex, usuario.getId());

			int rowsAffected = stm.executeUpdate();

			if (rowsAffected == 0) {
				throw new RuntimeException("Usuário com ID " + usuario.getId() + " não encontrado para atualização.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("Erro ao atualizar usuário: " + e.getMessage());
		}
		return usuario;
	}
}