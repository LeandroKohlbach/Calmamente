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
<title>Insert title here</title>
</head>
<body>
    <%
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
    session.setAttribute("usuarioLogado", nome); 
    response.sendRedirect("HomeLogado.jsp");

    %>
</body>
</html>