// Certifique-se que este é o nome do seu pacote
package Controler;

 import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import modelos.FolderComunicacao;
import Dao.DaoFolderComunicacao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import modelos.Usuario;

// A anotação @WebServlet mapeia a URL /criar-folder para esta classe.
@WebServlet("/criar-folder")
// A anotação @MultipartConfig habilita o upload de arquivos para este Servlet. É aqui que a mágica acontece.
@MultipartConfig
public class CriarFolderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioObjeto");

        // Validação de segurança: o usuário está logado?
        if (usuarioLogado == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            request.setCharacterEncoding("UTF-8");

            // Com um Servlet, request.getParameter funciona corretamente mesmo com upload
            String titulo = request.getParameter("titulo");
            String frase = request.getParameter("frase");
            Part filePart = request.getPart("imagem");

            // Validação dos dados
            if (titulo == null || titulo.trim().isEmpty() || frase == null || frase.trim().isEmpty() || filePart == null || filePart.getSize() == 0) {
                session.setAttribute("mensagemErro", "Todos os campos (título, frase e imagem) são obrigatórios.");
                response.sendRedirect(request.getContextPath() + "/FolderComunicacao/CriarFolder.jsp?status=error");
                return;
            }

            // --- Lógica de Upload da Imagem ---
            String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uniqueFileName = System.currentTimeMillis() + "_" + originalFileName;
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads" + File.separator + "folders";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            File fileToSave = new File(uploadDir, uniqueFileName);
            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, fileToSave.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
            String imgUrl = "uploads/folders/" + uniqueFileName;

            // --- Lógica de Cadastro no Banco de Dados ---
            DaoFolderComunicacao daoFolder = new DaoFolderComunicacao();
            FolderComunicacao novoFolder = new FolderComunicacao();
            novoFolder.setTitulo(titulo.trim());
            novoFolder.setFrase(frase.trim());
            novoFolder.setImgUrl(imgUrl);
            novoFolder.setAudioUrl("");
            novoFolder.setFkUsuarioId(usuarioLogado.getId());

            boolean sucesso = daoFolder.cadastrar(novoFolder);

            if (sucesso) {
                response.sendRedirect(request.getContextPath() + "/FolderComunicacao/foldersComunicacao.jsp?status=success");
            } else {
                session.setAttribute("mensagemErro", "Ocorreu um erro ao salvar o folder no banco de dados.");
                response.sendRedirect(request.getContextPath() + "/FolderComunicacao/CriarFolder.jsp?status=error");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("mensagemErro", "Um erro inesperado ocorreu: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/FolderComunicacao/CriarFolder.jsp?status=error");
        }
    }
}