<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Dao.DaoHistorico"%>
<%@ page import="modelos.Historico"%>
<%@ page import="modelos.Usuario"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.stream.Collectors"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Calmamente: Histórico de Sentimentos</title>
<link
	href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<style>
/* Seus estilos CSS existentes aqui (copie e cole do seu ansioso.jsp) */
:root {
	--cor-fundo-principal: #E0F7FA;
	--cor-grama-escura: #A8D8B9;
	--cor-secundaria-acao: #FFD700;
	--cor-texto-claro: #FFFFFF;
	--cor-fundo-ansiedade: #F0F8FF;
	--cor-principal-calma: #76D7C4;
	--cor-acento-calma: #A3D9B1;
	--cor-sombra-suave: rgba(118, 215, 196, 0.2);
	--cor-texto-suave: #4A5568;
	/* NOVA COR PARA O BOTÃO ATIVO */
	--cor-botao-tocando: #FFB74D;
	/* Um laranja suave para indicar atividade */
	--fonte-titulo: 'Fredoka', sans-serif;
	--fonte-corpo: 'Nunito', sans-serif;
	/* Cores adicionais para o calendário (algumas podem ser removidas se não usadas) */
	--cor-header-calendario: #66CCFF;
	--cor-dias-semana: #4A5568;
	--cor-dia-comum: #F8F8F8;
	--cor-dia-hoje: #FFD700; /* Dourado */
	--cor-dia-selecionado: #76D7C4; /* Calma */
	--cor-borda-calendario: #A3D9B1;
	--cor-fundo-detalhes: #FFFFFF;
}

body, h1, h2, h3, p, ul, li, button {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: var(--fonte-corpo), sans-serif;
	background-color: var(--cor-fundo-principal);
	color: var(--cor-texto-suave);
	line-height: 1.6;
	overflow-x: hidden;
	background-image: linear-gradient(to bottom, #E0F7FA, #CCEEFF);
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

main {
	flex-grow: 1;
	display: flex;
	justify-content: center;
	align-items: flex-start; /* Altera para alinhar ao topo */
	padding: 2rem;
	position: relative;
	z-index: 1;
	flex-wrap: wrap; /* Permite que os elementos quebrem a linha */
}

.cloud {
	position: absolute;
	background: #FFFFFF;
	border-radius: 50%;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
	animation: moveCloud 40s linear infinite;
	z-index: 0;
	opacity: 0.8;
}

.cloud.small {
	width: 80px;
	height: 50px;
}

.cloud.medium {
	width: 120px;
	height: 70px;
}

.cloud.large {
	width: 150px;
	height: 90px;
}

.cloud:nth-child(1) {
	top: 10%;
	left: 5%;
	animation-duration: 35s;
}

.cloud:nth-child(2) {
	top: 20%;
	left: 40%;
	animation-duration: 45s;
	animation-delay: -10s;
}

.cloud:nth-child(3) {
	top: 15%;
	right: 5%;
	animation-duration: 50s;
	animation-delay: -20s;
}

@keyframes moveCloud {
	from { transform: translateX(-150px); }
	to { transform: translateX(100vw); }
}

header {
	background-color: #66CCFF;
	padding: 1rem 5%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-bottom-left-radius: 25px;
	border-bottom-right-radius: 25px;
	position: relative;
	z-index: 1000;
}

.logo {
	font-family: var(--fonte-titulo);
	font-size: 2.2rem;
	font-weight: 700;
	color: var(--cor-texto-claro);
	text-decoration: none;
	text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
}

.content-wrapper { /* Este estilo pode ser removido se não for mais usado no HTML */
	background-color: var(--cor-fundo-ansiedade);
	padding: 2.5rem 3rem;
	border-radius: 30px;
	box-shadow: 0 10px 30px var(--cor-sombra-suave);
	text-align: center;
	max-width: 800px;
	width: 100%;
	border: 1px solid var(--cor-principal-calma);
	margin-bottom: 2rem; /* Adicionado para espaçamento */
}

.content-wrapper h1 { /* Este estilo pode ser removido se não for mais usado no HTML */
	font-family: var(--fonte-titulo);
	font-size: 2.5rem; /* Ajustado para caber melhor */
	font-weight: 700;
	color: var(--cor-principal-calma);
	margin-bottom: 1.5rem;
}

.content-wrapper .intro-text { /* Este estilo pode ser removido se não for mais usado no HTML */
	font-size: 1.2rem;
	color: var(--cor-texto-suave);
	margin-bottom: 2.5rem;
	max-width: 600px;
	margin-left: auto;
	margin-right: auto;
}

footer {
	background-color: var(--cor-grama-escura);
	color: var(--cor-texto-claro);
	text-align: center;
	padding: 2.5rem 5%;
	font-size: 1rem;
	box-shadow: inset 0 5px 10px rgba(0, 0, 0, 0.1);
	border-top-left-radius: 25px;
	border-top-right-radius: 25px;
	position: relative;
	z-index: 1000;
}

footer .links {
	margin-top: 1.5rem;
	display: flex;
	justify-content: center;
	gap: 1.5rem;
}

footer .links a {
	color: var(--cor-texto-claro);
	text-decoration: none;
	transition: color 0.3s ease, transform 0.2s ease;
	padding: 0.5rem 0;
	font-weight: 600;
}

footer .links a:hover {
	color: var(--cor-secundaria-acao);
	transform: translateY(-2px);
}

.nav-buttons {
	position: relative;
}

.user-profile-button {
	background-color: var(--cor-roxo-divertido, #8A2BE2);
	color: var(--cor-texto-claro);
	border: none;
	border-radius: 50%;
	width: 50px;
	height: 50px;
	font-size: 1.8rem;
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
	transition: background-color 0.3s ease, transform 0.2s ease, box-shadow
		0.2s ease;
}

.user-profile-button:hover {
	background-color: #9966FF;
	transform: translateY(-2px);
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.25);
}

.dropdown-content {
	display: none;
	position: absolute;
	top: calc(100% + 10px);
	right: 0;
	background-color: var(--cor-nuvem, #FFFFFF);
	min-width: 220px;
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
	border-radius: 15px;
	z-index: 1;
	overflow: hidden;
	animation: fadeIn 0.3s ease-out;
}

@keyframes fadeIn {
	from { opacity: 0; transform: translateY(-10px); }
	to { opacity: 1; transform: translateY(0); }
}

.dropdown-content.show {
	display: block;
}

.dropdown-content .user-info {
	padding: 1rem 1.5rem;
	font-family: var(--fonte-titulo);
	font-size: 1.2rem;
	color: var(--cor-texto-escuro, #333);
	background-color: #f8f8f8;
	border-bottom: 1px solid var(--cor-borda-elementos, #ddd);
}

.dropdown-content .user-info strong {
	color: var(--cor-roxo-divertido, #8A2BE2);
}

.dropdown-content a {
	color: var(--cor-texto-medio, #555);
	padding: 1rem 1.5rem;
	text-decoration: none;
	display: flex;
	align-items: center;
	gap: 10px;
	font-size: 1.1rem;
	transition: background-color 0.2s ease;
}

.dropdown-content a:hover {
	background-color: #f1f1f1;
}

.dropdown-content a i {
	font-size: 1.2rem;
	width: 20px;
	text-align: center;
}

.dropdown-content a .fa-pencil-alt {
	color: var(--cor-secundaria-acao);
}

.dropdown-content a .fa-sign-out-alt {
	color: var(--cor-terciaria-acao, #FF6347);
}

/* Detalhes do Histórico (ajustado para ocupar mais espaço se necessário) */
.history-details-container {
	background-color: var(--cor-fundo-detalhes);
	border: 1px solid var(--cor-borda-calendario);
	border-radius: 20px;
	box-shadow: 0 10px 30px var(--cor-sombra-suave);
	padding: 2rem;
	width: 100%; /* Ajustado para ocupar a largura total disponível */
    max-width: 800px; /* Mantém um limite razoável */
	min-height: 300px; /* Altura mínima */
	display: flex;
	flex-direction: column;
}

.history-details-container h2 {
	font-family: var(--fonte-titulo);
	font-size: 2rem;
	color: var(--cor-principal-calma);
	margin-bottom: 1.5rem;
	text-align: center;
}

.history-list {
	list-style: none;
	padding: 0;
}

.history-item {
	background-color: #F0F8FF;
	border: 1px solid var(--cor-acento-calma);
	border-radius: 10px;
	padding: 1rem 1.5rem;
	margin-bottom: 1rem;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 1.1rem;
	color: var(--cor-texto-suave);
}

.history-item span {
	font-weight: 600;
	color: var(--cor-texto-suave);
}

.no-records {
	text-align: center;
	font-style: italic;
	color: #777;
	margin-top: 1rem;
}

@media ( max-width : 992px) {
	main {
		flex-direction: column;
		align-items: center;
	}
	/* Removido estilos específicos do calendário */
	.history-details-container {
		width: 100%;
		margin-right: 0;
		margin-bottom: 2rem;
	}
}
</style>
</head>
<body>
	<div class="cloud small"></div>
	<div class="cloud medium"></div>
	<div class="cloud large"></div>
	<header>
		<a href="../HomeLogado.jsp" class="logo">Calmamente</a>
		<nav class="nav-buttons">
			<button class="user-profile-button" id="userProfileBtn">
				<i class="fas fa-user-circle"></i>
			</button>

			<div class="dropdown-content" id="userDropdownMenu">
				<div class="user-info">
					Olá, <strong> <%
                        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioObjeto");
                        String userName = "Usuário";
                        int idUsuario = -1;

                        if (usuarioLogado != null) {
                            userName = usuarioLogado.getNome();
                            if (userName == null || userName.isEmpty()) {
                                userName = "Usuário";
                            }
                            idUsuario = usuarioLogado.getId();
                        } else {
                            // Se o usuário não estiver logado, redirecionar
                            response.sendRedirect(request.getContextPath() + "/login.jsp");
                            return;
                        }
                        out.print(userName);
                    %>
					</strong>
				</div>
				<a href="../EditarPerfil.jsp"> <i class="fas fa-pencil-alt"></i>
					Editar Perfil
				</a> <a href="../telasHome/Home.html"> <i
					class="fas fa-sign-out-alt"></i> Sair
				</a>
			</div>
		</nav>
	</header>
	<main>
		<%-- REMOVIDO: Calendar Container --%>
		
		<div class="history-details-container">
			<h2>Seu Histórico de Sentimentos</h2> <%-- Título atualizado --%>
			<div id="selectedDateDisplay"
				style="text-align: center; margin-bottom: 1rem; font-weight: bold; color: var(--cor-principal-calma);">
				Todos os registros</div> <%-- Texto informativo --%>
			<ul id="historyList" class="history-list">
				<%
                    List<Historico> historicosDoUsuario = new ArrayList<>();

                    // Obter o ID do usuário logado (já validado no início do JSP)
                    // idUsuario é a variável já definida e validada no topo da página.
                    
                    DaoHistorico daoHistorico = new DaoHistorico();
                    // Chame o método para listar TODOS os históricos por usuário
                    historicosDoUsuario = daoHistorico.listarHistoricosPorUsuario(idUsuario);

                    if (historicosDoUsuario.isEmpty()) {
                        out.println("<p class=\"no-records\">Nenhum registro de sentimento encontrado.</p>");
                    } else {
                        // Ordenar por data/hora mais recente primeiro, para melhor visualização
                        historicosDoUsuario.sort((h1, h2) -> h2.getDataHoraClique().compareTo(h1.getDataHoraClique()));

                        for (Historico h : historicosDoUsuario) {
                            String dataHoraFormatada = h.getDataHoraClique().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
                            out.println("<li class=\"history-item\">");
                            out.println("<span>Emoção: " + h.getNomeSentimento() + "</span>");
                            out.println("<span>Data/Hora: " + dataHoraFormatada + "</span>");
                            out.println("</li>");
                        }
                    }
                %>
			</ul>
		</div>
	</main>
	<footer>
		<p>&copy; 2025 Calmamente. Todos os direitos reservados. Feito com
			carinho para você!</p>
		<div class="links">
			<a href="#">Privacidade</a><a href="#">Termos</a><a href="#">Ajuda</a>
		</div>
	</footer>

	<script>
        // === SCRIPT PARA O MENU DROPDOWN (mantido) ===
        const userProfileBtn = document.getElementById('userProfileBtn');
        const userDropdownMenu = document.getElementById('userDropdownMenu');

        if (userProfileBtn && userDropdownMenu) {
            userProfileBtn.addEventListener('click', function(event) {
                event.stopPropagation();
                userDropdownMenu.classList.toggle('show');
            });

            window.addEventListener('click', function(event) {
                if (userDropdownMenu.classList.contains('show')) {
                    if (!userProfileBtn.contains(event.target) && !userDropdownMenu.contains(event.target)) {
                        userDropdownMenu.classList.remove('show');
                    }
                }
            });
        }

        // === REMOVIDO: SCRIPT DO CALENDÁRIO ===
        // Todo o código JavaScript relacionado ao calendário (renderCalendar,
        // event listeners para os botões de mês, seleção de dia, etc.) foi removido.
    </script>
</body>
</html>