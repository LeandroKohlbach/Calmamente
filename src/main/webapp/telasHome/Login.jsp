<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="modelos.Usuario, Dao.DaoUsuario, Controler.UsuarioControler"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

	<%
	// Coleta os parâmetros do formulário de login
	String email = request.getParameter("email");
	String senha = request.getParameter("senha");

	// Validação de campos vazios (mantido do seu código original)
	if (email == null || email.trim().isEmpty()) {
		out.println(
		"<script> alert('Erro: O campo Email não pode ser vazio.'); window.location.href='./Login.html'; </script>");
		return;
	}

	if (senha == null || senha.trim().isEmpty()) {
		out.println(
		"<script> alert('Erro: O campo Senha não pode ser vazio.'); window.location.href='./Login.html'; </script>");
		return;
	}

	// === PONTO CRÍTICO DE SEGURANÇA E LÓGICA ===
	// IMPORTANTE: Seu método DaoUsuario.validarUsuario(email, senha) provavelmente espera
	// que 'senha' já seja o HASH da senha para comparar com 'senha_hash' no banco de dados.
	// Se 'senha' aqui é o texto plano vindo do formulário, você PRECISA HASHEÁ-LA.
	// Exemplo (com BCrypt, você precisaria adicionar a biblioteca ao seu projeto):
	// String senhaHasheada = org.mindrot.jbcrypt.BCrypt.hashpw(senha, org.mindrot.jbcrypt.BCrypt.gensalt());
	// Usuario usu = DaoUsuario.validarUsuario(email, senhaHasheada);
	// Por enquanto, estou mantendo seu código original, mas ciente do risco se a senha não for hasheada.

	Usuario usu = DaoUsuario.validarUsuario(email, senha); // <-- ATENÇÃO: Senha deve ser HASHED

	if (usu != null) {
		// Login bem-sucedido
		// out.println("<script> alert('Login realizado com sucesso!'); </script>"); // Removido alert para evitar conflito com redirect

		// === CORREÇÃO AQUI: Armazenar o objeto Usuario completo na sessão ===
		session.setAttribute("usuarioObjeto", usu); // <--- ISSO É O QUE SUA AtualizarPerfil.jsp PRECISA

		// Armazenar outros atributos para conveniência e para HomeLogado.jsp
		session.setAttribute("usuarioLogado", usu.getNome()); // Nome para exibição na Home
		session.setAttribute("usuarioEmail", usu.getEmail());
		// Converte Date para String para ser mais fácil de usar no HTML/JSP
		session.setAttribute("usuarioDataNascimento", usu.getDataNascimento() != null ? usu.getDataNascimento().toString() : "");
		session.setAttribute("usuarioTelefone", usu.getFone());
		
		// Se você realmente precisa do ID separado, use usu.getId()
		// session.setAttribute("IdUsuario", usu.getId()); // Correto se você precisa do ID separado

		// Redireciona para a HomeLogado.jsp.
		// É melhor fazer o redirecionamento direto sem script alert para evitar problemas de headers já enviados.
		response.sendRedirect("../HomeLogado.jsp");
	} else {
		// Login falhou
		// out.println("<script> alert('Erro: Usuário ou senha inválidos.'); </script>"); // Removido alert para evitar conflito com redirect
		response.sendRedirect("Login.html?erro=1"); // Redireciona para a página de login com parâmetro de erro
	}
	%>

</body>
</html>
