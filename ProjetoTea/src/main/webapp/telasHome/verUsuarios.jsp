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
<title>Processando Cadastro</title>
</head>
<body>
   <%
    String nome = request.getParameter("Usuario");
    String email = request.getParameter("Email");
    String fone = request.getParameter("Telefone");
    String senha = request.getParameter("Senha");
    String dataNascimentoStr = request.getParameter("DataNascimento"); 

    String validationError = null;

    if (nome == null || nome.trim().isEmpty()) {
        validationError = "O campo Nome não pode ser vazio.";
    } else if (email == null || email.trim().isEmpty()) {
        validationError = "O campo Email não pode ser vazio.";
    } else if (fone == null || fone.trim().isEmpty()) {
        validationError = "O campo Telefone não pode ser vazio.";
    } else if (senha == null || senha.trim().isEmpty()) {
        validationError = "O campo Senha não pode ser vazio.";
    } else if (dataNascimentoStr == null || dataNascimentoStr.trim().isEmpty()) {
        validationError = "O campo Data de Nascimento não pode ser vazio.";
    }

    if (validationError != null) {
        response.sendRedirect("Cadastro.html?erro=1&message=" + java.net.URLEncoder.encode(validationError, "UTF-8"));
        return;
    }

    Date datamascimento = null;
    try {
        datamascimento = Date.valueOf(dataNascimentoStr);
    } catch (IllegalArgumentException e) {
        response.sendRedirect("Cadastro.html?erro=1&message=" + java.net.URLEncoder.encode("Formato de Data de Nascimento inválido. Use AAAA-MM-DD.", "UTF-8"));
        return;
    }

    Usuario usuario = new Usuario();
    usuario.setNome(nome);
    usuario.setEmail(email);
    usuario.setFone(fone);
    usuario.setSenha(senha); 
    usuario.setDataNascimento(datamascimento);

    UsuarioControler usuControler = new UsuarioControler();
    
    if (usuControler.validar(email)) {
        response.sendRedirect("Cadastro.html?erro=1&message=" + java.net.URLEncoder.encode("Email já cadastrado. Por favor, tente novamente.", "UTF-8"));
    } else {
        usuControler.salvar(usuario);
        
        session.setAttribute("usuarioLogado", nome); 
        session.setAttribute("idUsuario", usuControler.BuscarId(email)); 
        
        Usuario usuarioCompleto = DaoUsuario.validarUsuario(email, senha);
        if (usuarioCompleto != null) {
            session.setAttribute("usuarioObjeto", usuarioCompleto);
            session.setAttribute("usuarioEmail", usuarioCompleto.getEmail());
            session.setAttribute("usuarioDataNascimento", usuarioCompleto.getDataNascimento() != null ? usuarioCompleto.getDataNascimento().toString() : "");
            session.setAttribute("usuarioTelefone", usuarioCompleto.getFone());
        }
        
        response.sendRedirect("../HomeLogado.jsp");
    }
	%>
</body>
</html>
