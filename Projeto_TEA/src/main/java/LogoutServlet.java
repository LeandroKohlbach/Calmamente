import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/LogoutServlet") // Esta anotação mapeia a URL para este Servlet
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtém a sessão atual. Se não houver, não cria uma nova.
        HttpSession session = request.getSession(false);

        // Verifica se a sessão existe e a invalida
        if (session != null) {
            session.invalidate(); // Invalida a sessão, removendo todos os atributos
            System.out.println("Sessão invalidada com sucesso."); // Para fins de depuração
        }

        // Redireciona o usuário para a página de login
        // Certifique-se de que "index.jsp" ou "login.jsp" é o nome correto da sua página de login
        response.sendRedirect("Home.html"); // Ou "login.jsp", dependendo do nome do seu arquivo de login
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Para garantir que GET e POST funcionem da mesma forma para logout
        doGet(request, response);
    }
}