package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

import modelos.Usuario;
import utils.ConexaoDB;

public class DaoUsuario {

    /**
     * Insere um novo usuário no banco de dados.
     *
     * ATENÇÃO DE SEGURANÇA: Este método armazena a senha diretamente no banco de dados
     * sem hash. Isso é EXTREMAMENTE INSEGURO e não recomendado para produção.
     * @param usuario O objeto Usuario a ser inserido.
     * @return O objeto Usuario inserido.
     * @throws RuntimeException se ocorrer um erro ao inserir o usuário.
     */
    public static Usuario insert(Usuario usuario) {
        try {
            Connection con = ConexaoDB.getConexao();
            String sql = "INSERT INTO Usuario(nome, email, senha_hash, dt_nascimento, telefone) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, usuario.getNome());
            stm.setString(2, usuario.getEmail());
            stm.setString(3, usuario.getSenha()); // Senha em texto plano sendo salva aqui! RISCO!
            stm.setDate(4, usuario.getDataNascimento());
            stm.setString(5, usuario.getFone());
            stm.execute();
            con.close();
        } catch (Exception e) {
            throw new RuntimeException("Erro ao cadastrar usuário: " + e.getMessage());
        }
        return usuario;
    }

    /**
     * Valida um usuário com base no email e senha.
     *
     * ATENÇÃO DE SEGURANÇA: Este método compara a senha em texto plano fornecida
     * com a senha armazenada (também em texto plano) no banco de dados.
     * Isso é EXTREMAMENTE INSEGURO e não recomendado para produção.
     * @param email O email do usuário.
     * @param senha A senha do usuário (texto plano).
     * @return O objeto Usuario encontrado, ou null se não for encontrado.
     * @throws RuntimeException se ocorrer um erro durante a consulta.
     */
    public static Usuario validarUsuario(String email, String senha) {
        String sql = "SELECT * FROM Usuario WHERE email = ? AND senha_hash = ?";
        Usuario usuarioEncontrado = null;

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, senha); // Senha em texto plano sendo usada na comparação! RISCO!
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                usuarioEncontrado = new Usuario();
                usuarioEncontrado.setId(rs.getInt("id"));
                usuarioEncontrado.setNome(rs.getString("nome"));
                usuarioEncontrado.setEmail(rs.getString("email"));
                usuarioEncontrado.setSenha(rs.getString("senha_hash")); // Recupera a senha em texto plano
                usuarioEncontrado.setDataNascimento(rs.getDate("dt_nascimento"));
                usuarioEncontrado.setFone(rs.getString("telefone"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao validar usuário: " + e.getMessage());
        }
        return usuarioEncontrado;
    }

    /**
     * Verifica se um email já está cadastrado no banco de dados.
     * @param email O email a ser verificado.
     * @return true se o email já estiver cadastrado, false caso contrário.
     * @throws RuntimeException se ocorrer um erro durante a consulta.
     */
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

    /**
     * Busca o ID de um usuário pelo email.
     * @param email O email do usuário.
     * @return O ID do usuário, ou 0 se não for encontrado.
     * @throws RuntimeException se ocorrer um erro durante a consulta.
     */
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

    // ======================================================================
    // MÉTODO NOVO ADICIONADO
    // ======================================================================
    /**
     * Verifica se um email já está cadastrado no banco de dados para OUTRO usuário.
     * Este método é ideal para a tela de edição de perfil, pois ignora o próprio
     * usuário na verificação, permitindo que ele mantenha seu email atual.
     *
     * @param email O email a ser verificado.
     * @param idUsuarioAtual O ID do usuário que está realizando a edição.
     * @return true se o email já estiver cadastrado para outro usuário, false caso contrário.
     * @throws RuntimeException se ocorrer um erro durante a consulta.
     */
    public static boolean verificarEmailExistente(String email, int idUsuarioAtual) {
        // A consulta SQL verifica se o email existe E se o ID é diferente do usuário atual
        String sql = "SELECT id FROM Usuario WHERE email = ? AND id != ?";
        
        try (Connection con = ConexaoDB.getConexao();
             PreparedStatement stm = con.prepareStatement(sql)) {
            
            stm.setString(1, email);
            stm.setInt(2, idUsuarioAtual);
            
            try (ResultSet rs = stm.executeQuery()) {
                // Se rs.next() for true, significa que encontrou um registro,
                // ou seja, o email está em uso por outro usuário.
                return rs.next();
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao verificar email existente: " + e.getMessage(), e);
        }
    }

    /**
     * Atualiza as informações de um usuário no banco de dados.
     * Se o campo de senha no objeto Usuario for nulo ou vazio, a senha_hash não será atualizada.
     *
     * ATENÇÃO DE SEGURANÇA: Este método armazena a nova senha diretamente no banco de dados
     * sem hash, se uma nova senha for fornecida. Isso é EXTREMAMENTE INSEGURO e não recomendado para produção.
     * @param usuario O objeto Usuario com as informações a serem atualizadas (o ID é obrigatório).
     * @return O objeto Usuario com as informações atualizadas.
     * @throws RuntimeException se ocorrer um erro ao atualizar o usuário.
     */
    public static Usuario update(Usuario usuario) {
        StringBuilder sqlBuilder = new StringBuilder();
        sqlBuilder.append("UPDATE Usuario SET nome = ?, email = ?, dt_nascimento = ?, telefone = ?");

        if (usuario.getSenha() != null && !usuario.getSenha().trim().isEmpty()) {
            sqlBuilder.append(", senha_hash = ?"); // Senha em texto plano sendo atualizada aqui! RISCO!
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
                stm.setString(paramIndex++, usuario.getSenha()); // Senha em texto plano! RISCO!
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