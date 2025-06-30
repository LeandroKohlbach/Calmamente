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
    // Coleta os parâmetros do formulário de cadastro
    String nome = request.getParameter("Usuario");
    String email = request.getParameter("Email");
    String fone = request.getParameter("Telefone");
    String senha = request.getParameter("Senha");
    String dataNascimentoStr = request.getParameter("DataNascimento"); // Captura como String

    // --- Início da Validação Detalhada de Campos no Servidor ---
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
        // Redireciona de volta para a página de cadastro com uma mensagem de erro
        response.sendRedirect("Cadastro.html?erro=1&message=" + java.net.URLEncoder.encode(validationError, "UTF-8"));
        return;
    }
    // --- Fim da Validação Detalhada de Campos no Servidor ---

    Date datamascimento = null;
    try {
        datamascimento = Date.valueOf(dataNascimentoStr); // Tenta converter a string da data
    } catch (IllegalArgumentException e) {
        // Captura o erro se o formato da data for inválido (raro com input type="date" mas possível com manipulação)
        response.sendRedirect("Cadastro.html?erro=1&message=" + java.net.URLEncoder.encode("Formato de Data de Nascimento inválido. Use AAAA-MM-DD.", "UTF-8"));
        return;
    }

    Usuario usuario = new Usuario();
    usuario.setNome(nome);
    usuario.setEmail(email);
    usuario.setFone(fone);
    usuario.setSenha(senha); // Senha em texto plano. Lembre-se do risco de segurança.
    usuario.setDataNascimento(datamascimento);

    UsuarioControler usuControler = new UsuarioControler();
    
    // Verifica se o email já está cadastrado
    if (usuControler.validar(email)) { // Este método retorna true se o email já existe
        response.sendRedirect("Cadastro.html?erro=1&message=" + java.net.URLEncoder.encode("Email já cadastrado. Por favor, tente novamente.", "UTF-8"));
    } else {
        // Salva o novo usuário
        usuControler.salvar(usuario);
        
        // Define atributos da sessão para o usuário recém-cadastrado e logado
        session.setAttribute("usuarioLogado", nome); // Nome para exibição na Home
        session.setAttribute("idUsuario", usuControler.BuscarId(email)); // Pega o ID do usuário cadastrado
        
        // Armazena o OBJETO Usuario completo na sessão para EditarPerfil.jsp
        // Busca o usuário completo novamente para ter o ID e outros dados do DB.
        // É importante que o 'validarUsuario' do DaoUsuario retorne o objeto completo corretamente.
        Usuario usuarioCompleto = DaoUsuario.validarUsuario(email, senha); // Usa o email e senha cadastrados para buscar o objeto completo
        if (usuarioCompleto != null) {
            session.setAttribute("usuarioObjeto", usuarioCompleto);
            session.setAttribute("usuarioEmail", usuarioCompleto.getEmail());
            session.setAttribute("usuarioDataNascimento", usuarioCompleto.getDataNascimento() != null ? usuarioCompleto.getDataNascimento().toString() : "");
            session.setAttribute("usuarioTelefone", usuarioCompleto.getFone());
        }
        
        response.sendRedirect("../HomeLogado.jsp"); // Redireciona para a página inicial logada
    }
	%>
</body>
</html>
