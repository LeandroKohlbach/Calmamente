package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import modelos.FolderSentimento;
import utils.ConexaoDB;

public class DaoSentimentos {

	public static void insert(FolderSentimento sentimento) {
		try {
			Connection con = ConexaoDB.getConexao();
			String sql = "INSERT INTO foldersentimento (tipo_emocao, fk_usuario_id) VALUES (?, ? )";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, sentimento.getTipoEmocao());
			stm.setInt(2, sentimento.getFkUsuarioId());
			stm.execute();

		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("Não foi possível salvar o sentimento: " + e.getMessage());
		}
	}

}