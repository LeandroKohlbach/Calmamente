 package Dao;

import modelos.Historico;
import utils.ConexaoDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate; // Importar LocalDate
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class DaoHistorico {

    public void salvar(Historico historico) {
        try (Connection con = ConexaoDB.getConexao();
             PreparedStatement stm = con.prepareStatement("INSERT INTO historico (fk_usuario_id, nome_emocao, data_hora_clique) VALUES (?, ?, ?)")) {

            stm.setInt(1, historico.getFkUsuarioId());
            stm.setString(2, historico.getNomeSentimento());

            Timestamp dataHoraTimestamp = Timestamp.valueOf(historico.getDataHoraClique());
            stm.setTimestamp(3, dataHoraTimestamp);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Método para listar históricos de um usuário específico
    public List<Historico> listarHistoricosPorUsuario(int fkUsuarioId) {
        List<Historico> historicos = new ArrayList<>();
        // A coluna 'id' é a chave primária, conforme seu script SQL
        String sql = "SELECT id, nome_emocao, data_hora_clique, fk_usuario_id FROM historico WHERE fk_usuario_id = ?";
        try (Connection con = ConexaoDB.getConexao();
             PreparedStatement stm = con.prepareStatement(sql)) {

            stm.setInt(1, fkUsuarioId);
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    Historico h = new Historico();
                    // Pegando o ID pela coluna 'id'
                    h.setId(rs.getInt("id"));
                    h.setNomeSentimento(rs.getString("nome_emocao"));
                    Timestamp timestamp = rs.getTimestamp("data_hora_clique");
                    if (timestamp != null) {
                        h.setDataHoraClique(timestamp.toLocalDateTime());
                    }
                    h.setFkUsuarioId(rs.getInt("fk_usuario_id"));
                    historicos.add(h);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return historicos;
    }


    // Novo método para listar históricos de um usuário em uma data específica
    public List<Historico> listarHistoricosPorDataEUsuario(int fkUsuarioId, LocalDate data) {
        List<Historico> historicos = new ArrayList<>();
        // A consulta SQL agora filtra por fk_usuario_id e pela data (ignorando a hora)
        // Usamos DATE() para comparar apenas a parte da data da coluna data_hora_clique
        String sql = "SELECT id, nome_emocao, data_hora_clique, fk_usuario_id FROM historico WHERE fk_usuario_id = ? AND DATE(data_hora_clique) = ?";
        
        try (Connection con = ConexaoDB.getConexao();
             PreparedStatement stm = con.prepareStatement(sql)) {

            stm.setInt(1, fkUsuarioId);
            stm.setDate(2, java.sql.Date.valueOf(data)); // Converte LocalDate para java.sql.Date

            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    Historico h = new Historico();
                    h.setId(rs.getInt("id"));
                    h.setNomeSentimento(rs.getString("nome_emocao"));
                    Timestamp timestamp = rs.getTimestamp("data_hora_clique");
                    if (timestamp != null) {
                        h.setDataHoraClique(timestamp.toLocalDateTime());
                    }
                    h.setFkUsuarioId(rs.getInt("fk_usuario_id"));
                    historicos.add(h);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return historicos;
    }
}