package Controler;

import java.io.File;
import java.io.IOException;

import Dao.DaoFolderComunicacao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/excluir-folder")
public class ExcluirFolderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(">> [ExcluirFolderServlet] POST recebido para exclusão de folder.");

        try {
            request.setCharacterEncoding("UTF-8");
            String idParam = request.getParameter("id");

            if (idParam == null || idParam.trim().isEmpty()) {
                System.err.println(">> ERRO: Parâmetro 'id' ausente.");
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parâmetro 'id' é obrigatório.");
                return;
            }

            int folderId = Integer.parseInt(idParam);
            System.out.println(">> Tentando excluir folder com ID: " + folderId);

            DaoFolderComunicacao dao = new DaoFolderComunicacao();
            boolean sucesso = dao.excluir(folderId);

            if (sucesso) {
                System.out.println(">> Exclusão bem-sucedida.");
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                System.err.println(">> ERRO: Exclusão falhou no DAO.");
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Falha ao excluir o folder.");
            }

        } catch (NumberFormatException e) {
            System.err.println(">> ERRO: ID inválido - " + request.getParameter("id"));
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID inválido.");
        } catch (Exception e) {
            System.err.println(">> ERRO inesperado ao excluir folder.");
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro inesperado.");
        }
    }
}
