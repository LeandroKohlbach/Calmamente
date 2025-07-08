<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="modelos.Usuario, Dao.DaoUsuario"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeParseException"%>
<%@ page import="java.sql.Date"%>
<%!
    // idUsuario é uma variável de instância JSP, segura para ser usada em scriptlets
    // dentro da mesma página para manter o estado do usuário logado.
    // Será preenchida no bloco de verificação de sessão.
    int idUsuario = -1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Processando Cadastro</title>
</head>
<body>

	<%
	// Coleta os parâmetros do formulário de cadastro
	String nome = request.getParameter("nome");
	String email = request.getParameter("email");
	String telefone = request.getParameter("telefone");
	String dataNascimentoStr = request.getParameter("dataNascimento");
	String senha = request.getParameter("senha");
	String confirmarSenha = request.getParameter("confirmarSenha");

	// Validação de campos vazios (lado do servidor - IMPORTANTE!)
	// Este bloco estava comentado e foi DESCOMENTADO.
	if (nome == null || nome.trim().isEmpty() ||
		email == null || email.trim().isEmpty() ||
		dataNascimentoStr == null || dataNascimentoStr.trim().isEmpty() ||
		senha == null || senha.trim().isEmpty() ||
		confirmarSenha == null || confirmarSenha.trim().isEmpty()) {
		response.sendRedirect("Cadastro.html?erro=campos_vazios");
		return; // Impede que o restante do JSP seja executado
	}

	// Validação de senhas coincidentes (lado do servidor)
	// Este bloco estava comentado e foi DESCOMENTADO.
	if (!senha.equals(confirmarSenha)) {
		response.sendRedirect("Cadastro.html?erro=senhas_nao_coincidem");
		return; // Impede que o restante do JSP seja executado
	}

	// === VERIFICAÇÃO DE EMAIL JÁ EXISTENTE NO BANCO DE DADOS ===
	// Esta validação já estava ativa.
	DaoUsuario daoUsuario = new DaoUsuario();
	try {
	    if (daoUsuario.emailJaExiste(email)) {
	        response.sendRedirect("Cadastro.html?erro=email_existente");
	        return; // Impede que o restante do JSP seja executado
	    }
	} catch (Exception e) {
	    System.err.println("Erro ao verificar email existente: " + e.getMessage());
	    e.printStackTrace();
	    response.sendRedirect("Cadastro.html?erro=erro_cadastro");
	    return; // Impede que o restante do JSP seja executado
	}

	// Validação e conversão da data de nascimento
	LocalDate dataNascimento = null;
	try {
	    dataNascimento = LocalDate.parse(dataNascimentoStr);
	} catch (DateTimeParseException e) {
	    System.err.println("Erro ao fazer parse da data de nascimento: " + e.getMessage());
	    response.sendRedirect("Cadastro.html?erro=data_invalida");
	    return; // Impede que o restante do JSP seja executado
	}

	try {
		// Cria um novo objeto Usuario, usando a classe Usuario fornecida
		Usuario novoUsuario = new Usuario();
		novoUsuario.setNome(nome);
		novoUsuario.setEmail(email);
		// Converte LocalDate para java.sql.Date, conforme exigido pelo DaoUsuario.insert()
		novoUsuario.setDataNascimento(Date.valueOf(dataNascimento)); // Usa java.sql.Date
		novoUsuario.setFone(telefone); // Pode ser null se o campo não for obrigatório no seu BD
		novoUsuario.setSenha(senha); // ATENÇÃO: A senha DEVE ser HASHEADA antes de ser salva no BD!

		// Tenta cadastrar o usuário usando o método estático insert do DaoUsuario
		DaoUsuario.insert(novoUsuario);

		// Cadastro bem-sucedido, redireciona para a página de login com sucesso
		response.sendRedirect("Login.html?cadastro_sucesso=1"); // Parâmetro para mensagem de sucesso no Login.html

	} catch (Exception e) {
		System.err.println("Erro ao cadastrar usuário: " + e.getMessage());
		e.printStackTrace();
		response.sendRedirect("Cadastro.html?erro=erro_cadastro"); // Erro genérico no cadastro
	}
	%>

</body>
</html>