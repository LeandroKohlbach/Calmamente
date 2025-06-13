<%@page import="Controler.UsuarioControler"%>
<%@page import="Dao.DaoUsuario"%>
<%@page import="modelos.Usuario"%>
<%@page import= "java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Processando Cadastro...</title>
</head>
<body>
    <%
    try {
        String nome = request.getParameter("Usuario");
        String email = request.getParameter("Email");
        String fone = request.getParameter("Telefone");
        String senha = request.getParameter("Senha");
        Date datamascimento = Date.valueOf(request.getParameter("DataNascimento"));

        Usuario usuario = new Usuario();
        usuario.setNome(nome);
        usuario.setEmail(email);
        usuario.setFone(fone);
        usuario.setSenha(senha);
        usuario.setDataNascimento(datamascimento);

        UsuarioControler usuControler = new UsuarioControler();
        usuControler.salvar(usuario);

        // Se o salvamento for bem-sucedido:
        // 1. Armazenar o nome do usuário na sessão para exibir na HomeLogado.jsp
        session.setAttribute("usuarioLogado", usuario.getNome());

        // 2. Redirecionar para a página HomeLogado.jsp
        response.sendRedirect("HomeLogado.jsp");

    } catch (Exception e) {
        // Em caso de erro, você pode exibir uma mensagem de erro ou redirecionar para uma página de erro
        // É importante NÃO usar out.println() e response.sendRedirect() na mesma resposta HTTP
        // pois o redirecionamento deve ocorrer antes de qualquer conteúdo ser enviado ao navegador.
        // Se já houve um out.println(), sendRedirect() pode causar um IllegalStateException.

        // Para fins de depuração, imprima o stack trace no console do servidor:
        e.printStackTrace();

        // Armazena a mensagem de erro na sessão para exibir em uma página de erro
        session.setAttribute("erroCadastro", "Erro ao cadastrar usuário: " + e.getMessage());
        response.sendRedirect("erro.jsp"); // Crie uma página erro.jsp para exibir a mensagem

    }
    %>
</body>
</html>