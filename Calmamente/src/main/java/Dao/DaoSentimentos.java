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
			// SQL updated to include urlImagemEstrategia, if you want to save it
            // Otherwise, keep it as it was if urlImagemEstrategia is optional/not needed for this specific insert
			String sql = "INSERT INTO foldersentimento (tipo_emocao, fk_usuario_id) VALUES (?, ? )";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, sentimento.getTipoEmocao());
			stm.setInt(2, sentimento.getFkUsuarioId());
			stm.execute();
			
		} catch (SQLException e) {
			// Log the exception details for debugging
			e.printStackTrace(); 
			throw new RuntimeException("Não foi possível salvar o sentimento: " + e.getMessage());
		}
	}
	

}