<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="modelos.Usuario, Dao.DaoUsuario"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeParseException"%>
<%@ page import="java.sql.Date"%>
<%!
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
	// Coleta os parâmetros do formulário de cadastro, ajustados para corresponder aos nomes HTML
	String nome = request.getParameter("Usuario"); // Changed from "nome" to "Usuario"
	String email = request.getParameter("Email");     // Changed from "email" to "Email"
	String telefone = request.getParameter("Telefone"); // Changed from "telefone" to "Telefone"
	String dataNascimentoStr = request.getParameter("DataNascimento"); // Changed from "dataNascimento" to "DataNascimento"
	String senha = request.getParameter("Senha");     // Changed from "senha" to "Senha"
	String confirmarSenha = request.getParameter("ConfirmarSenha"); // Changed from "confirmarSenha" to "ConfirmarSenha"

    // --- ADICIONE ESTES PRINTS PARA DEPURAR ---
    System.out.println("DEBUG JSP: Nome recebido: '" + nome + "'");
    System.out.println("DEBUG JSP: Email recebido: '" + email + "'");
    System.out.println("DEBUG JSP: Telefone recebido: '" + telefone + "'");
    System.out.println("DEBUG JSP: Data Nascimento recebida: '" + dataNascimentoStr + "'");
    System.out.println("DEBUG JSP: Senha recebida: '" + senha + "'");
    System.out.println("DEBUG JSP: Confirmar Senha recebida: '" + confirmarSenha + "'");
    // --- FIM DOS PRINTS DE DEBUG ---


	// Validação de campos vazios (lado do servidor - IMPORTANTE!)
	if (nome == null || nome.trim().isEmpty() ||
		email == null || email.trim().isEmpty() ||
		dataNascimentoStr == null || dataNascimentoStr.trim().isEmpty() ||
		senha == null || senha.trim().isEmpty() ||
		confirmarSenha == null || confirmarSenha.trim().isEmpty()) {

        System.out.println("DEBUG JSP: Redirecionando para 'campos_vazios' - Um ou mais campos obrigatórios estão vazios.");
		response.sendRedirect("Cadastro.html?erro=campos_vazios");
		return;
	}

	// Restante do seu código JSP permanece o mesmo...

	// Validação de senhas coincidentes (lado do servidor)
	if (!senha.equals(confirmarSenha)) {
		response.sendRedirect("Cadastro.html?erro=senhas_nao_coincidem");
		return;
	}

	// ... (restante do seu JSP, incluindo a verificação de email existente, data, e inserção)
	// ... (certifique-se de que o DaoUsuario.java já está com a correção do nome da tabela "Usuario")

	// === VERIFICAÇÃO DE EMAIL JÁ EXISTENTE NO BANCO DE DADOS ===
	DaoUsuario daoUsuario = new DaoUsuario();
	try {
	    if (daoUsuario.emailJaExiste(email)) {
	        response.sendRedirect("Cadastro.html?erro=email_existente");
	        return;
	    }
	} catch (Exception e) {
	    System.err.println("Erro ao verificar email existente: " + e.getMessage());
	    e.printStackTrace();
	    response.sendRedirect("Cadastro.html?erro=erro_cadastro");
	    return;
	}

	// Validação e conversão da data de nascimento
	LocalDate dataNascimento = null;
	try {
	    dataNascimento = LocalDate.parse(dataNascimentoStr);
	} catch (DateTimeParseException e) {
	    System.err.println("Erro ao fazer parse da data de nascimento: " + e.getMessage());
	    response.sendRedirect("Cadastro.html?erro=data_invalida");
	    return;
	}

	try {
		Usuario novoUsuario = new Usuario();
		novoUsuario.setNome(nome);
		novoUsuario.setEmail(email);
		novoUsuario.setDataNascimento(Date.valueOf(dataNascimento));
		novoUsuario.setFone(telefone);
		novoUsuario.setSenha(senha);

		DaoUsuario.insert(novoUsuario);

		response.sendRedirect("Login.html?cadastro_sucesso=1");

	} catch (Exception e) {
		System.err.println("Erro ao cadastrar usuário: " + e.getMessage());
		e.printStackTrace();
		response.sendRedirect("Cadastro.html?erro=erro_cadastro");
	}
	%>

</body>
</html>