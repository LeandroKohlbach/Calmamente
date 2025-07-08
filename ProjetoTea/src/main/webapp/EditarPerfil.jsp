<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="Dao.DaoUsuario, modelos.Usuario, java.sql.Date"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Calmamente: Editar Perfil</title>
	<link
	href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="../CSS/Footer.css">
	
<style>
/* Variáveis de Cores e Fontes - Mais VIBRANTES e LÚDICAS */
:root {
	--cor-fundo-principal: #E0F7FA;
	--cor-nuvem: #FFFFFF;
	--cor-grama-clara: #DCE8CC;
	--cor-grama-escura: #A8D8B9;
	--cor-primaria-acao: #66CCFF;
	--cor-secundaria-acao: #FFD700;
	--cor-terciaria-acao: #FF99CC;
	--cor-roxo-divertido: #B388FF;
	--cor-texto-escuro: #333333;
	--cor-texto-medio: #555555;
	--cor-texto-claro: #FFFFFF;
	--cor-sombra-leve: rgba(0, 0, 0, 0.1);
	--cor-borda-elementos: rgba(0, 0, 0, 0.15);
	--fonte-titulo: 'Fredoka', sans-serif;
	--fonte-corpo: 'Nunito', sans-serif;
}

/* Reset e Estilos Globais */
body, h1, h2, h3, p, ul, li, button, input {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: var(--fonte-corpo);
}

body {
	background-color: var(--cor-fundo-principal);
	color: var(--cor-texto-escuro);
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	background-image: linear-gradient(to bottom, var(--cor-fundo-principal),
		var(--cor-grama-clara));
}

main {
	flex-grow: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 3rem 2rem;
}

header, footer {
	flex-shrink: 0;
}

/* Estilos do Cabeçalho e Rodapé */
header {
	background-color: var(--cor-primaria-acao);
	padding: 1rem 5%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 4px 8px var(--cor-sombra-leve);
	border-bottom-left-radius: 25px;
	border-bottom-right-radius: 25px;
}

.logo {
	font-family: var(--fonte-titulo);
	font-size: 2.2rem;
	font-weight: 700;
	color: var(--cor-texto-claro);
	text-decoration: none;
	text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
}


/* Estilos para o formulário de edição */
.form-container {
	background-color: var(--cor-nuvem);
	padding: 2.5rem 3rem;
	border-radius: 30px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 550px;
	text-align: center;
}

.form-container h1 {
	font-family: var(--fonte-titulo);
	color: var(--cor-roxo-divertido);
	font-size: 2.5rem;
	margin-bottom: 1rem;
}

.form-container h2 {
	font-family: var(--fonte-corpo);
	color: var(--cor-texto-medio);
	font-size: 1.2rem;
	margin-bottom: 2rem;
	font-weight: 400;
}

.form-group {
	margin-bottom: 1.5rem;
	text-align: left;
}

.form-group label {
	display: block;
	font-weight: 600;
	color: var(--cor-texto-medio);
	margin-bottom: 0.5rem;
}

.form-group input {
	width: 100%;
	padding: 0.8rem 1rem;
	border: 2px solid var(--cor-borda-elementos);
	border-radius: 15px;
	font-size: 1rem;
	transition: border-color 0.3s, box-shadow 0.3s;
}

.form-group input:focus {
	outline: none;
	border-color: var(--cor-primaria-acao);
	box-shadow: 0 0 0 3px rgba(102, 204, 255, 0.5);
}

.form-section-divider {
	border: 0;
	border-top: 2px dashed var(--cor-borda-elementos);
	margin: 2.5rem 0;
}

/* Mensagem de Erro */
.error-message {
	background-color: #ffdddd;
	color: #d8000c;
	border: 1px solid #ffbaba;
	border-radius: 10px;
	padding: 1rem;
	margin-bottom: 1.5rem;
	text-align: center;
	font-weight: 600;
}

.form-actions {
	display: flex;
	gap: 1rem;
	justify-content: center;
	margin-top: 2rem;
}

.btn {
	padding: 0.8rem 1.5rem;
	border: none;
	border-radius: 20px;
	font-family: var(--fonte-titulo);
	font-size: 1.1rem;
	font-weight: 700;
	cursor: pointer;
	transition: transform 0.2s, box-shadow 0.2s;
	text-decoration: none;
	display: inline-flex;
	align-items: center;
	justify-content: center;
}

.btn:hover {
	transform: translateY(-3px);
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
}

.btn-salvar {
	background-color: var(--cor-primaria-acao);
	color: var(--cor-texto-claro);
}

.btn-cancelar {
	background-color: #ddd;
	color: var(--cor-texto-medio);
}
</style>
</head>
<body>
	<header>
		<a href="HomeLogado.jsp" class="logo">Calmamente</a>
	</header>

	<main>
		<div class="form-container">
			<h1>Editar Perfil</h1>
			<h2>Atualize seus dados pessoais e de segurança.</h2>
			<%
			Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioObjeto");

			if (usuarioLogado == null) {
				response.sendRedirect("Login.html");
				return;
			}

			String errorMessage = null;
			String successMessage = null;

			if ("POST".equalsIgnoreCase(request.getMethod())) {
				try {
					String nome = request.getParameter("nome");
					String email = request.getParameter("email");
					String dataNascimentoStr = request.getParameter("nascimento");
					String telefone = request.getParameter("telefone");
					String senhaAtual = request.getParameter("senhaAtual");
					String novaSenha = request.getParameter("novaSenha");
					String confirmarSenha = request.getParameter("confirmarSenha");

					if (nome == null || nome.trim().isEmpty() || email == null || email.trim().isEmpty() || telefone == null
					|| telefone.trim().isEmpty() || senhaAtual == null || senhaAtual.trim().isEmpty()) {
				errorMessage = "Por favor, preencha todos os campos obrigatórios.";
					} else {
				Usuario authenticatedUser = Dao.DaoUsuario.validarUsuario(usuarioLogado.getEmail(), senhaAtual);

				if (authenticatedUser == null || authenticatedUser.getId() != usuarioLogado.getId()) {
					errorMessage = "Senha atual incorreta. Não foi possível salvar as alterações.";
				} else {

					if (!email.equalsIgnoreCase(usuarioLogado.getEmail())) {
						if (Dao.DaoUsuario.verificarEmailExistente(email, usuarioLogado.getId())) {
							errorMessage = "O email '" + email
									+ "' já está em uso por outro usuário. Por favor, escolha outro.";
						}
					}

					if (errorMessage == null) {
						if (novaSenha != null && !novaSenha.trim().isEmpty()) {
							if (!novaSenha.equals(confirmarSenha)) {
								errorMessage = "A Nova Senha e a Confirmação de Nova Senha não correspondem.";
							} else {
								usuarioLogado.setSenha(novaSenha);
							}
						} else {
							usuarioLogado.setSenha(null);
						}
					}

					if (errorMessage == null) {
						usuarioLogado.setNome(nome);
						usuarioLogado.setEmail(email);
						usuarioLogado.setFone(telefone);

						Date dataNascimento = null;
						if (dataNascimentoStr != null && !dataNascimentoStr.trim().isEmpty()) {
							try {
								dataNascimento = Date.valueOf(dataNascimentoStr);
							} catch (IllegalArgumentException e) {
								errorMessage = "Formato de Data de Nascimento inválido. Use AAAA-MM-DD.";
							}
						}

						if (errorMessage == null) {
							usuarioLogado.setDataNascimento(dataNascimento);

							Usuario updatedUser = Dao.DaoUsuario.update(usuarioLogado);

							session.setAttribute("usuarioObjeto", updatedUser);
							session.setAttribute("usuarioLogado", updatedUser.getNome());

							successMessage = "Perfil atualizado com sucesso!";
							response.sendRedirect("HomeLogado.jsp?status=success&message="
									+ java.net.URLEncoder.encode(successMessage, "UTF-8"));
							return;
						}
					}
				}
					}
				} catch (RuntimeException e) {
					e.printStackTrace();
					errorMessage = "Erro interno ao atualizar o perfil: " + e.getMessage();
				}
			}

			if (errorMessage != null) {
			%>
			<div class="error-message"><%=errorMessage%></div>
			<%
			}
			%>

			<form id="editProfileForm" action="EditarPerfil.jsp" method="post">
				<div class="form-group">
					<label for="nome">Nome de Usuário</label> <input type="text"
						id="nome" name="nome"
						value="<%out.print(usuarioLogado.getNome() != null ? usuarioLogado.getNome() : "");%>"
						required>
				</div>

				<div class="form-group">
					<label for="email">Email</label> <input type="email" id="email"
						name="email"
						value="<%out.print(usuarioLogado.getEmail() != null ? usuarioLogado.getEmail() : "");%>"
						required>
				</div>

				<div class="form-group">
					<label for="nascimento">Data de Nascimento</label>
					<%
					String dataNascimentoFormatted = "";
					if (usuarioLogado.getDataNascimento() != null) {
						dataNascimentoFormatted = usuarioLogado.getDataNascimento().toString();
					}
					%>
					<input type="date" id="nascimento" name="nascimento"
						value="<%=dataNascimentoFormatted%>">
				</div>

				<div class="form-group">
					<label for="telefone">Telefone</label> <input type="tel"
						id="telefone" name="telefone" placeholder="(99) 99999-9999"
						value="<%out.print(usuarioLogado.getFone() != null ? usuarioLogado.getFone() : "");%>">
				</div>

				<hr class="form-section-divider">

				<div class="form-group">
					<label for="senhaAtual">Senha Atual (obrigatória para
						salvar)</label> <input type="password" id="senhaAtual" name="senhaAtual"
						required>
				</div>
				<div class="form-group">
					<label for="novaSenha">Nova Senha (deixe em branco para não
						alterar)</label> <input type="password" id="novaSenha" name="novaSenha">
				</div>
				<div class="form-group">
					<label for="confirmarSenha">Confirmar Nova Senha</label> <input
						type="password" id="confirmarSenha" name="confirmarSenha">
				</div>

				<div class="form-actions">
					<button type="submit" class="btn btn-salvar">Salvar
						Alterações</button>
					<a href="HomeLogado.jsp" class="btn btn-cancelar">Cancelar</a>
				</div>
			</form>
		</div>
	</main>

	<footer>
		<p>&copy; 2025 Calmamente. Todos os direitos reservados.</p>
	</footer>

	<script>
		document
				.getElementById('editProfileForm')
				.addEventListener(
						'submit',
						function(event) {
							const novaSenha = document
									.getElementById('novaSenha').value;
							const confirmarSenha = document
									.getElementById('confirmarSenha').value;

							if (novaSenha !== ''
									&& novaSenha !== confirmarSenha) {
								alert('A "Nova Senha" e a "Confirmação" não correspondem!');
								event.preventDefault();
							}
						});

		const telefoneInput = document.getElementById('telefone');
		telefoneInput.addEventListener('input', function(e) {
			let value = e.target.value.replace(/\D/g, '');
			value = value.replace(/^(\d{2})(\d)/g, '($1) $2');
			value = value.replace(/(\d{5})(\d)/, '$1-$2');
			e.target.value = value.slice(0, 15);
		});
	</script>
</body>
</html>