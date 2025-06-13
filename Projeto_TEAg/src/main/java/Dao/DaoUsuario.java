package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date; 

import modelos.Usuario;
import utils.ConexaoDB;

public class DaoUsuario {

	 public static Usuario insert(Usuario usuario) {
	        try {
	            Connection con = ConexaoDB.getConexao();
	            String sql = "insert into Usuario(nome, email , senha_hash , dt_nascimento, telefone)" + "values(?,?,?,?,?)";
	            PreparedStatement stm = con.prepareStatement(sql);
	            stm.setString(1, usuario.getNome());
	            stm.setString(2, usuario.getEmail());
	            stm.setString(3, usuario.getSenha());
	            stm.setDate(4, usuario.getDataNascimento()); // Certifique-se de que getDataNascimento retorna java.sql.Date
	            stm.setString(5, usuario.getFone());
	            stm.execute();

	        } catch (Exception e) {
	            throw new RuntimeException(e.getMessage() + "usuario nao cadastrado"); // This is where the custom message is generated
	        }
	        return usuario;
	    }

    public static Usuario validarUsuario(String email, String senha) {
        // Assegure-se de que 'senha_hash' é o nome da coluna no seu banco de dados para a senha
        String sql = "SELECT * FROM Usuario WHERE email = ? AND senha_hash = ?";
        Usuario usuarioEncontrado = null; // Inicializa como null

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, senha);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) { // Verifica se há um resultado na consulta
                // Se houver um resultado, preenche o objeto Usuario
                usuarioEncontrado = new Usuario();
                usuarioEncontrado.setId(rs.getInt("id"));
                usuarioEncontrado.setNome(rs.getString("nome"));
                usuarioEncontrado.setEmail(rs.getString("email"));
                usuarioEncontrado.setSenha(rs.getString("senha_hash")); // Adapte para o nome correto da coluna
                usuarioEncontrado.setDataNascimento(rs.getDate("dt_nascimento")); // Obtém a data como java.sql.Date
                usuarioEncontrado.setFone(rs.getString("telefone"));
            }
            // Se rs.next() for falso, usuarioEncontrado permanece null, indicando que o usuário não foi encontrado.

        } catch (SQLException e) {
            e.printStackTrace(); // Imprime o erro no console do servidor para depuração
            // Opcional: Você pode lançar uma RuntimeException aqui se quiser que o erro
            // seja propagado para a camada superior (Login.jsp, por exemplo)
            // throw new RuntimeException("Erro ao validar usuário no banco de dados: " + e.getMessage());
        }
        return usuarioEncontrado; // Retorna o objeto Usuario (se encontrado) ou null
    }
}