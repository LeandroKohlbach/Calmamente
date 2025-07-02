package Controler;

import java.io.IOException;
import java.time.LocalDateTime;

import Dao.DaoHistorico;
import Dao.DaoSentimentos;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelos.FolderSentimento;
import modelos.Historico;

public class SentimentoController extends HttpServlet {

    protected void salvar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acao = request.getParameter("acao");

        if ("registrar".equals(acao)) {
            HttpSession session = request.getSession();
            Integer idUsuario = (Integer) session.getAttribute("idUsuario");
            String tipoEmocao = request.getParameter("tipoEmocao");

            if (idUsuario != null && tipoEmocao != null && !tipoEmocao.isEmpty()) {
                FolderSentimento sentimento = new FolderSentimento();
                sentimento.setFkUsuarioId(idUsuario);
                sentimento.setTipoEmocao(tipoEmocao);
                DaoSentimentos dao = new DaoSentimentos();
                dao.insert(sentimento);

                Historico historico = new Historico();
                historico.setFkUsuarioId(idUsuario);
                historico.setNomeSentimento(tipoEmocao);;
                historico.setDataHoraClique(LocalDateTime.now());

                DaoHistorico daoHistorico = new DaoHistorico();
                daoHistorico.salvar(historico);

                response.sendRedirect("IlhaSentimento.jsp?sucesso=true");
            } else {
                response.sendRedirect("IlhaSentimento.jsp?erro=1");
            }
        }
    }
}
