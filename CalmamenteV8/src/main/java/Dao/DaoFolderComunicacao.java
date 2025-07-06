package Dao; // Certifique-se de que o pacote corresponde à sua estrutura

import modelos.FolderComunicacao; // Importa a classe modelo
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.ConexaoDB; // Importa a sua nova classe de conexão

public class DaoFolderComunicacao {

    /**
     * Cadastra um novo FolderComunicacao no banco de dados.
     * @param folder O objeto FolderComunicacao a ser cadastrado.
     * @return true se o cadastro for bem-sucedido, false caso contrário.
     */
    public boolean cadastrar(FolderComunicacao folder) {
        // SQL atualizado para usar img_url e audio_url
        String sql = "INSERT INTO FolderComunicacao (titulo, frase, img_url, audio_url, fk_usuario_id) VALUES (?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = ConexaoDB.getConexao(); // Usa a sua nova classe de conexão
            if (conn == null) {
                System.err.println("DEBUG DAO: Conexão com o banco de dados é nula em cadastrar().");
                return false;
            }
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, folder.getTitulo());
            stmt.setString(2, folder.getFrase());
            stmt.setString(3, folder.getImgUrl());
            stmt.setString(4, folder.getAudioUrl());
            stmt.setInt(5, folder.getFkUsuarioId());

            System.out.println("DEBUG DAO: Executando INSERT SQL: " + sql);
            System.out.println("DEBUG DAO: Parâmetros: titulo=" + folder.getTitulo() + ", frase=" + folder.getFrase() +
                               ", imgUrl=" + folder.getImgUrl() + ", audioUrl=" + folder.getAudioUrl() +
                               ", fk_usuario_id=" + folder.getFkUsuarioId());

            int rowsAffected = stmt.executeUpdate();
            System.out.println("DEBUG DAO: Linhas afetadas pelo INSERT: " + rowsAffected);
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("DEBUG DAO: Erro ao cadastrar folder de comunicação: " + e.getMessage());
            e.printStackTrace(); // Imprime o stack trace completo para mais detalhes
            return false;
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                    System.out.println("DEBUG DAO: PreparedStatement fechado em cadastrar().");
                } catch (SQLException e) {
                    System.err.println("DEBUG DAO: Erro ao fechar PreparedStatement em cadastrar(): " + e.getMessage());
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println("DEBUG DAO: Conexão fechada em cadastrar().");
                } catch (SQLException e) {
                    System.err.println("DEBUG DAO: Erro ao fechar Connection em cadastrar(): " + e.getMessage());
                }
            }
        }
    }

    /**
     * Lista todos os FoldersComunicacao de um usuário específico.
     * @param fkUsuarioId O ID do usuário.
     * @return Uma lista de objetos FolderComunicacao.
     */
    public List<FolderComunicacao> listarFoldersPorUsuario(int fkUsuarioId) {
        List<FolderComunicacao> folders = new ArrayList<>();
        // SQL atualizado para selecionar img_url e audio_url
        String sql = "SELECT id, titulo, frase, img_url, audio_url, fk_usuario_id FROM FolderComunicacao WHERE fk_usuario_id = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = ConexaoDB.getConexao();
            if (conn == null) {
                System.err.println("DEBUG DAO: Conexão com o banco de dados é nula em listarFoldersPorUsuario().");
                return folders;
            }
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, fkUsuarioId);
            rs = stmt.executeQuery();

            System.out.println("DEBUG DAO: Executando SELECT SQL: " + sql + " para fk_usuario_id=" + fkUsuarioId);

            while (rs.next()) {
                FolderComunicacao folder = new FolderComunicacao();
                folder.setId(rs.getInt("id"));
                folder.setTitulo(rs.getString("titulo"));
                folder.setFrase(rs.getString("frase"));
                folder.setImgUrl(rs.getString("img_url"));
                folder.setAudioUrl(rs.getString("audio_url"));
                folder.setFkUsuarioId(rs.getInt("fk_usuario_id"));
                folders.add(folder);
                System.out.println("DEBUG DAO: Folder encontrado: " + folder.getTitulo() + " (ID: " + folder.getId() + ")");
            }
            System.out.println("DEBUG DAO: Total de folders encontrados para o usuário " + fkUsuarioId + ": " + folders.size());
        } catch (SQLException e) {
            System.err.println("DEBUG DAO: Erro ao listar folders de comunicação por usuário: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                    System.out.println("DEBUG DAO: ResultSet fechado em listarFoldersPorUsuario().");
                } catch (SQLException e) { System.err.println("DEBUG DAO: Erro ao fechar ResultSet em listarFoldersPorUsuario(): " + e.getMessage()); }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                    System.out.println("DEBUG DAO: PreparedStatement fechado em listarFoldersPorUsuario().");
                } catch (SQLException e) { System.err.println("DEBUG DAO: Erro ao fechar PreparedStatement em listarFoldersPorUsuario(): " + e.getMessage()); }
            }
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println("DEBUG DAO: Conexão fechada em listarFoldersPorUsuario().");
                } catch (SQLException e) {
                    System.err.println("DEBUG DAO: Erro ao fechar Connection em listarFoldersPorUsuario(): " + e.getMessage());
                }
            }
        }
        return folders;
    }

    /**
     * Busca um FolderComunicacao pelo seu ID.
     * @param id O ID do folder.
     * @return O objeto FolderComunicacao encontrado, ou null se não for encontrado.
     */
    public FolderComunicacao buscarFolderPorId(int id) {
        FolderComunicacao folder = null;
        // SQL atualizado para selecionar img_url e audio_url
        String sql = "SELECT id, titulo, frase, img_url, audio_url, fk_usuario_id FROM FolderComunicacao WHERE id = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = ConexaoDB.getConexao();
            if (conn == null) {
                System.err.println("DEBUG DAO: Conexão com o banco de dados é nula em buscarFolderPorId().");
                return null;
            }
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            System.out.println("DEBUG DAO: Executando SELECT SQL: " + sql + " para ID=" + id);

            if (rs.next()) {
                folder = new FolderComunicacao();
                folder.setId(rs.getInt("id"));
                folder.setTitulo(rs.getString("titulo"));
                folder.setFrase(rs.getString("frase"));
                folder.setImgUrl(rs.getString("img_url"));
                folder.setAudioUrl(rs.getString("audio_url"));
                folder.setFkUsuarioId(rs.getInt("fk_usuario_id"));
                System.out.println("DEBUG DAO: Folder encontrado por ID: " + folder.getTitulo() + " (ID: " + folder.getId() + ")");
            } else {
                System.out.println("DEBUG DAO: Nenhum folder encontrado para ID: " + id);
            }
        } catch (SQLException e) {
            System.err.println("DEBUG DAO: Erro ao buscar folder de comunicação por ID: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                    System.out.println("DEBUG DAO: ResultSet fechado em buscarFolderPorId().");
                } catch (SQLException e) { System.err.println("DEBUG DAO: Erro ao fechar ResultSet em buscarFolderPorId(): " + e.getMessage()); }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                    System.out.println("DEBUG DAO: PreparedStatement fechado em buscarFolderPorId().");
                } catch (SQLException e) { System.err.println("DEBUG DAO: Erro ao fechar PreparedStatement em buscarFolderPorId(): " + e.getMessage()); }
            }
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println("DEBUG DAO: Conexão fechada em buscarFolderPorId().");
                } catch (SQLException e) {
                    System.err.println("DEBUG DAO: Erro ao fechar Connection em buscarFolderPorId(): " + e.getMessage());
                }
            }
        }
        return folder;
    }

    /**
     * Atualiza um FolderComunicacao existente no banco de dados.
     * @param folder O objeto FolderComunicacao com os dados atualizados.
     * @return true se a atualização for bem-sucedida, false caso contrário.
     */
    public boolean atualizar(FolderComunicacao folder) {
        // SQL atualizado para usar img_url e audio_url
        String sql = "UPDATE FolderComunicacao SET titulo = ?, frase = ?, img_url = ?, audio_url = ? WHERE id = ? AND fk_usuario_id = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = ConexaoDB.getConexao();
            if (conn == null) {
                System.err.println("DEBUG DAO: Conexão com o banco de dados é nula em atualizar().");
                return false;
            }
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, folder.getTitulo());
            stmt.setString(2, folder.getFrase());
            stmt.setString(3, folder.getImgUrl());
            stmt.setString(4, folder.getAudioUrl());
            stmt.setInt(5, folder.getId());
            stmt.setInt(6, folder.getFkUsuarioId());

            System.out.println("DEBUG DAO: Executando UPDATE SQL: " + sql);
            System.out.println("DEBUG DAO: Parâmetros: titulo=" + folder.getTitulo() + ", frase=" + folder.getFrase() +
                               ", imgUrl=" + folder.getImgUrl() + ", audioUrl=" + folder.getAudioUrl() +
                               ", id=" + folder.getId() + ", fk_usuario_id=" + folder.getFkUsuarioId());

            int rowsAffected = stmt.executeUpdate();
            System.out.println("DEBUG DAO: Linhas afetadas pelo UPDATE: " + rowsAffected);
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("DEBUG DAO: Erro ao atualizar folder de comunicação: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                    System.out.println("DEBUG DAO: PreparedStatement fechado em atualizar().");
                } catch (SQLException e) {
                    System.err.println("DEBUG DAO: Erro ao fechar PreparedStatement em atualizar(): " + e.getMessage());
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println("DEBUG DAO: Conexão fechada em atualizar().");
                } catch (SQLException e) {
                    System.err.println("DEBUG DAO: Erro ao fechar Connection em atualizar(): " + e.getMessage());
                }
            }
        }
    }

    /**
     * Exclui um FolderComunicacao do banco de dados pelo seu ID.
     * @param id O ID do folder a ser excluído.
     * @return true se a exclusão for bem-sucedida, false caso contrário.
     */
    public boolean excluir(int id) {
        String sql = "DELETE FROM FolderComunicacao WHERE id = ?";
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = ConexaoDB.getConexao();
            if (conn == null) {
                System.err.println("DEBUG DAO: Conexão com o banco de dados é nula em excluir().");
                return false;
            }
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            System.out.println("DEBUG DAO: Executando DELETE SQL: " + sql + " para ID=" + id);

            int rowsAffected = stmt.executeUpdate();
            System.out.println("DEBUG DAO: Linhas afetadas pelo DELETE: " + rowsAffected);
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("DEBUG DAO: Erro ao excluir folder de comunicação: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                    System.out.println("DEBUG DAO: PreparedStatement fechado em excluir().");
                } catch (SQLException e) {
                    System.err.println("DEBUG DAO: Erro ao fechar PreparedStatement em excluir(): " + e.getMessage());
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println("DEBUG DAO: Conexão fechada em excluir().");
                } catch (SQLException e) {
                    System.err.println("DEBUG DAO: Erro ao fechar Connection em excluir(): " + e.getMessage());
                }
            }
        }
    }
}
