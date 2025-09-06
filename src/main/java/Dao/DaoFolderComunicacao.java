package Dao;

import modelos.FolderComunicacao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.ConexaoDB;

public class DaoFolderComunicacao {

    public List<FolderComunicacao> listarFoldersPorUsuario(int fkUsuarioId) {
        List<FolderComunicacao> folders = new ArrayList<>();
        String sql = "SELECT id, titulo, frase, img_url, audio_url, fk_usuario_id FROM FolderComunicacao WHERE fk_usuario_id = ?";
        
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, fkUsuarioId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    FolderComunicacao folder = new FolderComunicacao();
                    folder.setId(rs.getInt("id"));
                    folder.setTitulo(rs.getString("titulo"));
                    folder.setFrase(rs.getString("frase"));
                    folder.setImgUrl(rs.getString("img_url"));
                    folder.setAudioUrl(rs.getString("audio_url"));
                    folder.setFkUsuarioId(rs.getInt("fk_usuario_id"));
                    folders.add(folder);
                }
            }
        } catch (SQLException e) {
            System.err.println("DAO ERRO: Falha ao listar folders por usuário.");
            e.printStackTrace();
        }
        return folders;
    }

    /**
     * Exclui um FolderComunicacao do banco de dados.
     * @param id O ID do folder a ser excluído.
     * @return true se a exclusão for bem-sucedida, false caso contrário.
     */
    public boolean excluir(int id) {
        String sql = "DELETE FROM FolderComunicacao WHERE id = ?";
        
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("DAO ERRO: Falha ao excluir o folder com ID " + id);
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean cadastrar(FolderComunicacao folder) {
        String sql = "INSERT INTO FolderComunicacao (titulo, frase, img_url, audio_url, fk_usuario_id) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, folder.getTitulo());
            stmt.setString(2, folder.getFrase());
            stmt.setString(3, folder.getImgUrl());
            stmt.setString(4, folder.getAudioUrl());
            stmt.setInt(5, folder.getFkUsuarioId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Seus outros métodos (atualizar, etc.) podem ser modernizados da mesma forma...
}