<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Dao.DaoHistorico"%>
<%@ page import="modelos.Historico"%>
<%@ page import="modelos.Usuario"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.format.DateTimeParseException"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.stream.Collectors"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Comparator"%>

<%!// idUsuario é uma variável de instância JSP, segura para ser usada em scriptlets
	// dentro da mesma página para manter o estado do usuário logado.
	// Será preenchida no bloco de verificação de sessão.
	int idUsuario = -1;%>

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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" href="../CSS/headerLogado.css">
<style>
/* Seus estilos CSS existentes aqui (mantidos e ajustados) */
:root {
	--cor-fundo-principal: #E0F7FA;
	--cor-grama-escura: #A8D8B9;
	--cor-secundaria-acao: #FFD700;
	--cor-primaria-acao: #66CCFF;
	--cor-texto-claro: #FFFFFF;
	--cor-fundo-ansiedade: #F0F8FF;
	--cor-principal-calma: #76D7C4;
	--cor-acento-calma: #A3D9B1;
	--cor-sombra-suave: rgba(118, 215, 196, 0.2);
	--cor-texto-suave: #4A5568;
	--cor-botao-tocando: #FFB74D;
	--fonte-titulo: 'Fredoka', sans-serif;
	--fonte-corpo: 'Nunito', sans-serif;
	--cor-header-calendario: #66CCFF;
	--cor-dias-semana: #4A5568;
	--cor-dia-comum: #F8F8F8;
	--cor-dia-hoje: #FFD700;
	--cor-dia-selecionado: #76D7C4;
	--cor-borda-calendario: #A3D9B1;
	--cor-fundo-detalhes: #FFFFFF;
	--cor-nuvem: #FFFFFF;
	--cor-texto-escuro: #333;
	--cor-borda-elementos: #ddd;
	--cor-roxo-divertido: #B388FF;
	--cor-terciaria-acao: #FF99CC; /* Rosa Chiclete */
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
	align-items: flex-start;
	padding: 2rem;
	position: relative;
	z-index: 1;
	flex-wrap: wrap;
	gap: 2rem; /* Espaçamento entre os dois containers */
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

@
keyframes moveCloud {from { transform:translateX(-150px);
	
}

to {
	transform: translateX(100vw);
}

}

/* ===========
         HEADER 
        ===========

/* ===========
         MENU DE USUÁRIO 
        ===========
        */
.user-nav-group {
	position: relative; /* Necessário para posicionar o dropdown */
	display: flex; /* Adicionado para alinhar os botões/links */
	align-items: center;
	gap: 20px; /* Espaçamento entre botões no cabeçalho */
	/* Removedo `nav-buttons` daqui, ele agora é .header-center-container */
}

.user-nav {
	position: relative;
	display: flex;
	align-items: center;
}

.user-profile-button {
	background-color: var(--cor-roxo-divertido);
	color: var(--cor-texto-claro);
	border: none;
	border-radius: 50%;
	width: 55px; /* UM POUCO MAIOR */
	height: 55px; /* UM POUCO MAIOR */
	font-size: 2rem; /* ÍCONE MAIOR */
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.25); /* SOMBRA MAIS SUAVE */
	transition: background-color 0.3s ease, transform 0.2s ease, box-shadow
		0.2s ease;
	position: relative; /* Para a bolha de notificação se necessário */
}

.user-profile-button:hover {
	background-color: #9966FF; /* Roxo um pouco mais escuro */
	transform: translateY(-3px) rotate(5deg); /* MAIS BRINCALHÃO */
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
}

/* Efeito de "batida" no ícone do usuário */
.user-profile-button i {
	animation: pulse 2s infinite ease-in-out;
}

@
keyframes pulse { 0% {
	transform: scale(1);
}

50


%
{
transform:scale(1.1);
}
100%{
	transform:scale(1);
}
}
.dropdown-content {
	display: none; /* Escondido por padrão */
	position: absolute;
	top: calc(100% + 15px);
	/* Posição abaixo do botão, um pouco mais afastado */
	right: 0;
	background-color: var(--cor-nuvem);
	min-width: 250px; /* UM POUCO MAIOR */
	box-shadow: 0 10px 20px 0 rgba(0, 0, 0, 0.25);
	/* SOMBRA MAIS PRONUNCIADA */
	border-radius: 20px; /* MAIS ARREDONDADO */
	z-index: 1;
	overflow: hidden; /* Garante que os filhos respeitem o border-radius */
	animation: fadeInScale 0.4s ease-out; /* NOVA ANIMAÇÃO */
	border: 2px solid var(--cor-primaria-acao); /* Borda colorida */
}

/* Classe 'show' que será adicionada via JavaScript para exibir o menu */
.dropdown-content.show {
	display: block;
}

.dropdown-content .user-info {
	padding: 1.2rem 1.8rem; /* MAIOR PADDING */
	font-family: var(--fonte-titulo);
	font-size: 1.3rem; /* TEXTO MAIOR */
	color: var(--cor-texto-escuro);
	background-color: #e6f7ff; /* FUNDO MAIS CLARO E AMIGÁVEL */
	border-bottom: 2px solid var(--cor-primaria-acao);
	/* Borda mais forte */
	text-align: center; /* CENTRALIZADO */
}

.dropdown-content .user-info strong {
	color: var(--cor-roxo-divertido);
	display: block; /* Nome em nova linha */
	margin-top: 5px;
}

.dropdown-content a {
	color: var(--cor-texto-medio);
	padding: 1.2rem 1.8rem; /* MAIOR PADDING */
	text-decoration: none;
	display: flex;
	align-items: center;
	gap: 12px; /* MAIOR ESPAÇAMENTO */
	font-size: 1.2rem; /* TEXTO MAIOR */
	transition: background-color 0.2s ease, transform 0.1s ease;
	border-bottom: 1px solid rgba(0, 0, 0, 0.05); /* Separador suave */
}

.dropdown-content a:last-child {
	border-bottom: none;
}

.dropdown-content a:hover {
	background-color: #f0f8ff; /* Um azulzinho bem clarinho no hover */
	transform: translateX(5px); /* Desliza um pouco */
}

.dropdown-content a i {
	font-size: 1.4rem; /* ÍCONES MAIORES */
	width: 25px; /* Alinha o texto */
	text-align: center;
}

/* Cor específica para o ícone de editar e sair */
.dropdown-content a .fa-pencil-alt {
	color: var(--cor-secundaria-acao);
}

.dropdown-content a .fa-sign-out-alt {
	color: var(--cor-terciaria-acao);
}

@
keyframes fadeInScale {from { opacity:0;
	transform: scale(0.9) translateY(-20px);
}

to {
	opacity: 1;
	transform: scale(1) translateY(0);
}

}

/* FIM: ESTILOS PARA O MENU DE USUÁRIO */
img {
	width: 80px; /* Logo um pouco maior */
	height: auto; /* Mantém a proporção */
	margin-right: 20px;
}

/*      ===========   
          FOOTER 
        ===========
        */
footer {
	background-color: var(--cor-grama-escura);
	/* Mesma cor da seção de ilhas */
	color: var(--cor-texto-claro);
	text-align: center;
	padding: 3rem 5%; /* MAIOR PADDING */
	font-size: 1.1rem; /* TEXTO MAIOR */
	box-shadow: inset 0 6px 12px rgba(0, 0, 0, 0.15);
	/* SOMBRA MAIS FORTE */
	border-top-left-radius: 35px; /* MAIS ARREDONDADO */
	border-top-right-radius: 35px; /* MAIS ARREDONDADO */
	position: relative;
	margin-top: 2rem; /* Adiciona margem superior para separar do main */
}

footer p {
	margin-bottom: 1rem; /* Espaçamento abaixo do texto */
}

footer .links {
	margin-top: 1.5rem;
	display: flex;
	justify-content: center;
	gap: 2rem; /* MAIOR ESPAÇAMENTO */
}

footer .links a {
	color: var(--cor-texto-claro);
	text-decoration: none;
	transition: color 0.3s ease, transform 0.2s ease;
	padding: 0.8rem 1rem; /* PADDING MAIOR PARA ÁREA CLICÁVEL */
	font-weight: 700; /* MAIS NEGRITO */
	border-radius: 15px; /* ARREDONDADO */
	background-color: rgba(255, 255, 255, 0.1); /* Fundo sutil */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

footer .links a:hover {
	color: var(--cor-secundaria-acao);
	transform: translateY(-3px) scale(1.05); /* MAIOR EFEITO DE HOVER */
	background-color: rgba(255, 255, 255, 0.2);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
/* ===========
         MODAIS (TERMOS, PRIVACIDADE E AJUDA) 
        ===========
        */
.modal-overlay {
	display: none; /* Oculto por padrão */
	position: fixed; /* Fixado na tela */
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.6);
	/* Fundo escuro semi-transparente */
	z-index: 1001; /* Acima de todo o conteúdo */
	justify-content: center;
	align-items: center;
	opacity: 0; /* Começa invisível para transição */
	transition: opacity 0.3s ease;
}

.modal-overlay.active {
	display: flex; /* Exibe o overlay */
	opacity: 1; /* Torna visível */
}

.modal-content {
	/* Classe genérica para o conteúdo do modal */
	background-color: var(--cor-nuvem); /* Fundo branco do modal */
	border-top-left-radius: 30px;
	border-bottom-left-radius: 30px;
	border-bottom-right-radius: 12px;
	border-top-right-radius: 12px;
	padding: 3.5rem;
	max-width: 700px; /* Largura do modal */
	width: 90%; /* Ajuste para telas menores */
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
	position: relative;
	transform: translateY(20px); /* Começa um pouco abaixo para animação */
	opacity: 0; /* Começa invisível para animação */
	transition: transform 0.3s ease, opacity 0.3s ease;
	max-height: 80vh; /* Limita a altura do modal */
	overflow-y: auto;
	/* Adiciona scroll se o conteúdo for maior que a altura */
	text-align: left; /* Alinha o texto dentro do modal */
	padding-right: 20px;
}

.modal-overlay.active .modal-content {
	transform: translateY(0); /* Sobe para a posição final */
	opacity: 1; /* Torna visível */
}

.modal-content h2 {
	font-family: var(--fonte-titulo);
	font-size: 2.8rem;
	color: var(--cor-roxo-divertido);
	margin-bottom: 1.5rem;
	text-align: center;
	text-shadow: 2px 2px 0px rgba(0, 0, 0, 0.05);
}

.modal-content h3 {
	font-family: var(--fonte-titulo);
	font-size: 1.8rem;
	color: var(--cor-primaria-acao);
	margin-top: 1.5rem;
	margin-bottom: 0.8rem;
	border-bottom: 1px solid var(--cor-borda-elementos);
	padding-bottom: 0.5rem;
}

.modal-content p {
	font-family: var(--fonte-corpo);
	font-size: 1rem;
	color: var(--cor-texto-escuro);
	margin-bottom: 0.8rem;
	line-height: 1.7;
}

.close-button {
	position: absolute;
	top: 20px;
	right: 20px;
	background: none;
	border: none;
	font-size: 2rem;
	color: var(--cor-texto-medio);
	cursor: pointer;
	transition: color 0.2s ease, transform 0.2s ease;
	z-index: 10;
	/* Garante que o botão esteja acima do conteúdo do modal */
}

.close-button:hover {
	color: var(--cor-terciaria-acao); /* Rosa */
	transform: rotate(90deg);
}

/* ===================
              FIM DO FOOTER 
           =================== */

/* ===========
            SCROLLBAR 
           =========== */

/* Customiza o scrollbar para navegadores WebKit (Chrome, Safari, Edge, Opera) */
::-webkit-scrollbar {
	width: 12px; /* Largura da barra de rolagem vertical */
	height: 12px; /* Altura da barra de rolagem horizontal */
}

::-webkit-scrollbar-track {
	background: var(--cor-fundo-principal);
	/* Fundo da trilha do scrollbar */
	border-radius: 10px;
}

::-webkit-scrollbar-thumb {
	background: var(--cor-primaria-acao);
	/* Cor do "polegar" (draggable part) do scrollbar */
	border-radius: 10px;
	border: 3px solid var(--cor-fundo-principal);
	/* Adiciona uma borda ao polegar */
}

::-webkit-scrollbar-thumb:hover {
	background: #33AADD; /* Cor mais escura no hover do polegar */
}

::-webkit-scrollbar-corner {
	background: transparent;
	/* Canto onde as barras vertical e horizontal se encontram */
}
/* FIM DOS ESTILOS PARA O SCROLLBAR */

/* Detalhes do Histórico e Campo de Data */
.date-input-container {
	background-color: var(--cor-fundo-detalhes);
	border: 1px solid var(--cor-borda-elementos);
	border-radius: 15px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	padding: 1.5rem;
	margin-bottom: 2rem;
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
	max-width: 400px; /* Largura para o container de input */
	gap: 1rem; /* Espaçamento entre os elementos */
}

/* Estilos para o campo de input da data */
.date-input-container label {
	font-family: var(--fonte-titulo);
	/* Usa a fonte de título para o label */
	font-size: 1.3rem;
	color: var(--cor-texto-escuro);
	margin-bottom: 0.5rem; /* Espaçamento entre o label e o input */
}

.date-input {
	width: calc(100% - 2rem);
	/* Ocupa quase toda a largura do container, considerando padding */
	padding: 0.8rem 1rem;
	border: 1px solid var(--cor-borda-elementos);
	border-radius: 10px; /* Bordas arredondadas */
	font-size: 1.1rem;
	font-family: var(--fonte-corpo);
	color: var(--cor-texto-suave);
	background-color: var(--cor-fundo-ansiedade); /* Um fundo suave */
	box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.08);
	/* Sombra interna para profundidade */
	transition: all 0.3s ease; /* Transição suave para foco */
	text-align: center; /* Centraliza o texto */
	cursor: pointer; /* Indica que é clicável */
}

.date-input:focus {
	outline: none; /* Remove o contorno padrão ao focar */
	border-color: var(--cor-principal-calma);
	/* Muda a cor da borda ao focar */
	box-shadow: 0 0 0 3px rgba(118, 215, 196, 0.4);
	/* Sombra mais visível ao focar */
	background-color: var(--cor-nuvem); /* Fundo branco ao focar */
}

.date-input::placeholder {
	color: #999;
	font-style: italic;
}

/* Estilo para o botão "Mostrar Todos" */
.filter-button {
	background-color: var(--cor-principal-calma);
	/* Cor principal do tema */
	color: var(--cor-texto-claro);
	border: none;
	border-radius: 15px;
	padding: 0.7rem 1.2rem;
	font-size: 1rem;
	font-weight: 600;
	cursor: pointer;
	box-shadow: 0 4px 8px var(--cor-sombra-suave);
	transition: background-color 0.3s ease, transform 0.2s ease, box-shadow
		0.2s ease;
}

.filter-button:hover {
	background-color: var(--cor-acento-calma);
	transform: translateY(-2px);
	box-shadow: 0 6px 12px rgba(118, 215, 196, 0.3);
}

.filter-button:active {
	background-color: var(--cor-principal-calma);
	transform: translateY(0);
	box-shadow: 0 2px 4px var(--cor-sombra-suave);
}

/* Flatpickr overrides for better styling */
.flatpickr-calendar {
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	border-radius: 15px;
	border: 1px solid var(--cor-borda-calendario);
	font-family: var(--fonte-corpo);
	color: var(--cor-texto-suave);
}

.flatpickr-months .flatpickr-prev-month, .flatpickr-months .flatpickr-next-month
	{
	color: var(--cor-principal-calma);
	fill: var(--cor-principal-calma);
}

.flatpickr-current-month .flatpickr-month, .flatpickr-current-month .flatpickr-numInputWrapper
	{
	color: var(--cor-principal-calma);
}

.flatpickr-weekday {
	color: var(--cor-dias-semana);
	font-weight: 600;
}

.dayContainer {
	justify-content: center; /* Center days in the grid */
}

.flatpickr-day {
	color: var(--cor-texto-suave);
	border-radius: 8px; /* Slightly rounded days */
}

.flatpickr-day.today {
	border-color: var(--cor-dia-hoje);
	background-color: var(--cor-dia-hoje);
	color: var(--cor-texto-claro);
}

.flatpickr-day.selected, .flatpickr-day.startRange, .flatpickr-day.endRange,
	.flatpickr-day.selected.inRange, .flatpickr-day.startRange.inRange,
	.flatpickr-day.endRange.inRange, .flatpickr-day.selected:focus,
	.flatpickr-day.startRange:focus, .flatpickr-day.endRange:focus,
	.flatpickr-day.selected:hover, .flatpickr-day.startRange:hover,
	.flatpickr-day.endRange:hover, .flatpickr-day.selected.prevMonthDay,
	.flatpickr-day.selected.nextMonthDay, .flatpickr-day.startRange.prevMonthDay,
	.flatpickr-day.startRange.nextMonthDay, .flatpickr-day.endRange.prevMonthDay,
	.flatpickr-day.endRange.nextMonthDay {
	background-color: var(--cor-principal-calma);
	border-color: var(--cor-principal-calma);
	color: var(--cor-texto-claro);
}

.flatpickr-day:hover {
	background-color: var(--cor-acento-calma);
	color: var(--cor-texto-claro);
}

.flatpickr-innerContainer {
	padding: 0.5rem; /* Add some padding inside the calendar */
}

.history-details-container {
	background-color: var(--cor-fundo-detalhes);
	border: 1px solid var(--cor-borda-calendario);
	border-radius: 20px;
	box-shadow: 0 10px 30px var(--cor-sombra-suave);
	padding: 2rem;
	width: 100%;
	max-width: 600px; /* Largura para o container de detalhes */
	min-height: 300px;
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
	flex-wrap: wrap; /* Permite quebrar linha em telas pequenas */
	gap: 0.5rem; /* Espaçamento entre os spans */
}

.history-item span:first-child {
	flex-grow: 1;
	/* Permite que o primeiro span ocupe o espaço disponível */
}

.no-records {
	text-align: center;
	font-style: italic;
	color: #777;
	margin-top: 1rem;
}

/* Responsividade */
@media ( max-width : 992px) {
	main {
		flex-direction: column;
		align-items: center;
		padding: 1.5rem;
	}
	.date-input-container, .history-details-container {
		max-width: 90%;
		margin-bottom: 2rem;
		/* Adiciona margem inferior para espaçar quando empilhado */
		padding: 1.5rem;
	}
	.user-profile-button {
		width: 45px;
		height: 45px;
		font-size: 1.5rem;
	}
}

@media ( max-width : 576px) {
	main {
		padding: 1rem;
	}
	.date-input-container, .history-details-container {
		max-width: 95%;
		padding: 1rem;
	}
	.history-item {
		flex-direction: column;
		align-items: flex-start;
	}
	.history-item span {
		width: 100%;
		text-align: left;
	}
	.date-input-group {
		flex-direction: column; /* Empilha input e botão em telas pequenas */
		gap: 0.5rem;
	}
}
</style>
</head>
<body>
	<div class="cloud small"></div>
	<div class="cloud medium"></div>
	<div class="cloud large"></div>

	<header>
		<img src="../imagens/logo.png" alt="Logo Calmamente">
		<h1 class="logo">Calmamente</h1>

			<nav class="nav-links-container">
			<a href="../HomeLogado.jsp" class="nav-link" id="homeButton">
			 	Home 
			 </a>
			<a href="../SobreNosLogado.jsp" class="nav-link" id="aboutUsLink">
				Sobre Nós
			</a>
			<a href="../Atividades&Recursos.jsp" class="nav-link"id="activitiesResourcesButton">
			 	Atividades & Recursos
			</a>
			<a href="../Historico/historicov1.jsp" class="nav-link" id="contactButton">
			 	Relatório
			</a>
		</nav>

		<div class="user-nav">
			<button class="user-profile-button" id="userProfileBtn">
				<i class="fas fa-user-circle"></i>
			</button>
			<div class="dropdown-content" id="userDropdown">
				<div class="user-info">
					Olá, <strong> <%
 Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioObjeto");
 String userName = "Usuário";
 // A variável idUsuario é a variável de instância declarada no topo do JSP
 // e será atualizada aqui.
 if (usuarioLogado != null) {
 	userName = usuarioLogado.getNome();
 	if (userName == null || userName.isEmpty()) {
 		userName = "Usuário";
 	}
 	idUsuario = usuarioLogado.getId(); // Atualiza a variável de instância
 } else {
 	// Se o usuário não estiver logado, redirecionar
 	response.sendRedirect(request.getContextPath() + "/login.jsp");
 	return; // Importante para parar a execução do JSP aqui
 }
 out.print(userName);
 %>
					</strong>!
				</div>
				<a href="EditarPerfil.jsp"><i class="fas fa-pencil-alt"></i>
					Editar Perfil</a> <a href="telasHome/Home.html"> <i
					class="fas fa-sign-out-alt"></i> Sair
				</a>
			</div>
		</div>
	</header>
	<main>
		<div class="date-input-container">
			<label for="calendarInput">Selecione uma Data:</label> <input
				type="text" id="calendarInput" class="date-input"
				placeholder="Clique para selecionar a data">
		</div>

		<div class="history-details-container">
			<h2>Seu Histórico de Sentimentos</h2>
			<div id="selectedDateDisplay"
				style="text-align: center; margin-bottom: 1rem; font-weight: bold; color: var(--cor-principal-calma);">
				<%
				// Lógica para exibição inicial e processamento de requisições AJAX
				DaoHistorico daoHistorico = new DaoHistorico();

				String displayDateText = "Todos os registros";
				String dataParam = request.getParameter("data"); // Parâmetro 'data' vindo da URL ou AJAX

				// DEBUG: Log para ver o que está sendo recebido no parâmetro 'data'
				System.out.println("DEBUG JSP: Request received. Parameter 'data': " + dataParam);

				if (dataParam != null && !dataParam.trim().isEmpty()) {
					try {
						// Tenta fazer o parse da data. O input type="date" envia no formatoYYYY-MM-DD,
						// que é o formato padrão do LocalDate.parse()
						LocalDate parsedDate = LocalDate.parse(dataParam.trim());
						displayDateText = "Registros para: " + parsedDate.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
						System.out.println("DEBUG JSP: Successfully parsed date for display: " + parsedDate);
					} catch (DateTimeParseException e) {
						displayDateText = "Erro no formato da data, mostrando todos os registros.";
						System.err.println("DEBUG JSP ERROR: Failed to parse date parameter '" + dataParam + "': " + e.getMessage());
					}
				} else {
					System.out.println("DEBUG JSP: No date parameter or empty. Displaying all records.");
				}
				out.print(displayDateText);
				%>
			</div>
			<ul id="historyList" class="history-list">
				<%
				List<Historico> historicosDoUsuario = new ArrayList<>();

				try {
					if (dataParam != null && !dataParam.trim().isEmpty()) {
						try {
					LocalDate dataFiltro = LocalDate.parse(dataParam.trim());
					System.out.println("DEBUG JSP: Filtering records for date: " + dataFiltro);
					historicosDoUsuario = daoHistorico.listarHistoricosPorDataEUsuario(idUsuario, dataFiltro);
					System.out.println(
							"DEBUG JSP: Number of records found for " + dataFiltro + ": " + historicosDoUsuario.size());
						} catch (DateTimeParseException e) {
					// Se a data for inválida, volta a listar todos os históricos
					System.err.println(
							"DEBUG JSP ERROR: Date parse error for filter. Listing all records for user. " + e.getMessage());
					historicosDoUsuario = daoHistorico.listarHistoricosPorUsuario(idUsuario);
					System.out.println(
							"DEBUG JSP: Number of all records for user (after parse error): " + historicosDoUsuario.size());
						}
					} else {
						// Se o parâmetro 'data' for nulo ou vazio, lista todos os históricos do usuário
						System.out.println("DEBUG JSP: No date filter applied. Listing all records for user.");
						historicosDoUsuario = daoHistorico.listarHistoricosPorUsuario(idUsuario);
						System.out.println("DEBUG JSP: Number of all records for user: " + historicosDoUsuario.size());
					}
				} catch (Exception e) {
					// Captura qualquer outra exceção (incluindo SQLException do DAO)
					System.err.println("DEBUG JSP ERROR: General error fetching historicos: " + e.getMessage());
					e.printStackTrace(); // IMPRIME A PILHA DE ERRO COMPLETA NO CONSOLE!
					out.println("<p class=\"no-records\">Erro ao carregar registros do banco de dados.</p>");
					historicosDoUsuario = new ArrayList<>(); // Garante que a lista esteja vazia em caso de erro
				}

				if (historicosDoUsuario.isEmpty()) {
					System.out.println("DEBUG JSP: No records found for display after filter/fetch.");
					out.println(
					"<p class=\"no-records\">Nenhum registro de sentimento encontrado para esta data ou para o usuário.</p>");
				} else {
					System.out.println("DEBUG JSP: Displaying " + historicosDoUsuario.size() + " records.");
					// Ordenar por data/hora mais recente primeiro, para melhor visualização
					historicosDoUsuario
					.sort(Comparator.comparing(Historico::getDataHoraClique, Comparator.nullsLast(Comparator.reverseOrder())));

					for (Historico h : historicosDoUsuario) {
						String dataHoraFormatada = "Data/Hora Indisponível"; // Fallback para caso getDataHoraClique() retorne null
						if (h.getDataHoraClique() != null) {
					dataHoraFormatada = h.getDataHoraClique().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
						}
						out.println("<li class=\"history-item\">");
						out.println("<span>Emoção: " + (h.getNomeSentimento() != null ? h.getNomeSentimento() : "N/A") + "</span>");
						out.println("<span>Data/Hora: " + dataHoraFormatada + "</span>");
						out.println("</li>");
					}
				}
				%>
			</ul>
		</div>
	</main>
	<footer>
		<p>&copy; 2025 Calmamente. Todos os direitos reservados.</p>
		<div class="links">
			<a href="#" id="termsLink">Termos de Serviço</a> <a href="#"
				id="privacyLink">Política de Privacidade</a> <a href="#"
				id="helpLink">Ajuda</a>
		</div>
	</footer>

	<div class="modal-overlay" id="termsModal">
		<div class="modal-content">
			<button class="close-button">&times;</button>
			<h2>Termos de Serviço</h2>
			<h3>1. Aceitação dos Termos</h3>
			<p>Ao acessar e utilizar o site Calmamente, você concorda em
				cumprir e estar vinculado a estes Termos de Uso. Se você não
				concorda com qualquer parte destes termos, por favor, não utilize
				nosso site.</p>
			<h3>2. Uso do Conteúdo</h3>
			<p>Todo o conteúdo fornecido neste site é apenas para fins
				informativos e educacionais. Não se destina a substituir
				aconselhamento profissional, diagnóstico ou tratamento. Sempre
				procure o conselho de um profissional de saúde qualificado para
				quaisquer perguntas que você possa ter sobre uma condição médica.</p>
			<h3>3. Propriedade Intelectual</h3>
			<p>Todo o conteúdo, design, gráficos, logotipos e outros
				materiais neste site são propriedade do Calmamente ou de seus
				licenciadores e são protegidos por leis de direitos autorais e
				marcas registradas. Você não pode reproduzir, distribuir, modificar
				ou criar trabalhos derivados de qualquer conteúdo sem permissão
				prévia por escrito.</p>
			<h3>4. Conduta do Usuário</h3>
			<p>Você concorda em usar o site de forma responsável e
				respeitosa. Não é permitido postar ou transmitir qualquer material
				que seja ilegal, difamatório, obsceno, ameaçador, invasivo da
				privacidade de terceiros, ou que possa constituir ou encorajar uma
				ofensa criminal, violar os direitos de qualquer parte ou que de
				outra forma dê origem a responsabilidade ou viole qualquer lei.</p>
			<h3>5. Limitação de Responsabilidade</h3>
			<p>O Calmamente não será responsável por quaisquer danos diretos,
				indiretos, incidentais, consequenciais ou punitivos decorrentes do
				seu acesso ou uso do site.</p>
			<h3>6. Modificações dos Termos</h3>
			<p>Reservamo-nos o direito de modificar estes Termos de Uso a
				qualquer momento. Quaisquer alterações serão efetivas imediatamente
				após a publicação no site. Seu uso continuado do site após a
				publicação de quaisquer alterações constitui sua aceitação dessas
				alterações.</p>
			<h3>7. Lei Aplicável</h3>
			<p>Estes Termos de Uso serão regidos e interpretados de acordo
				com as leis do Brasil.</p>
		</div>
	</div>

	<div class="modal-overlay" id="privacyModal">
		<div class="modal-content">
			<button class="close-button">&times;</button>
			<h2>Política de Privacidade</h2>
			<h3>1. Coleta de Informações</h3>
			<p>Coletamos informações que você nos fornece diretamente, como
				nome, endereço de e-mail e outras informações de contato quando você
				se registra, preenche um formulário ou interage com nossos serviços.
				Também podemos coletar automaticamente certas informações sobre seu
				dispositivo e uso do site, como endereço IP, tipo de navegador e
				páginas visitadas, por meio de cookies e tecnologias semelhantes.</p>
			<h3>2. Uso das Informações</h3>
			<p>Utilizamos as informações coletadas para: fornecer e melhorar
				nossos serviços; personalizar sua experiência no site; comunicar-nos
				com você sobre atualizações, promoções e informações relevantes;
				analisar o uso do site para otimizar o conteúdo e a funcionalidade;
				e garantir a segurança e a integridade de nossa plataforma.</p>
			<h3>3. Compartilhamento de Informações</h3>
			<p>Não vendemos, alugamos ou compartilhamos suas informações
				pessoais com terceiros, exceto nas seguintes circunstâncias: com seu
				consentimento explícito; para cumprir obrigações legais; para
				proteger nossos direitos, privacidade, segurança ou propriedade; ou
				com provedores de serviços que nos auxiliam na operação do site,
				desde que eles concordem em manter a confidencialidade de suas
				informações.</p>
			<h3>4. Segurança dos Dados</h3>
			<p>Implementamos medidas de segurança razoáveis para proteger
				suas informações contra acesso não autorizado, alteração, divulgação
				ou destruição. No entanto, nenhum método de transmissão pela
				internet ou armazenamento eletrônico é 100% seguro, e não podemos
				garantir segurança absoluta.</p>
			<h3>5. Seus Direitos</h3>
			<p>Você tem o direito de acessar, corrigir, atualizar ou
				solicitar a exclusão de suas informações pessoais a qualquer
				momento. Para exercer esses direitos, entre em contato conosco
				através dos canais fornecidos em nossa página de Contato.</p>
			<h3>6. Cookies</h3>
			<p>Nosso site utiliza cookies para melhorar sua experiência de
				navegação. Você pode configurar seu navegador para recusar todos ou
				alguns cookies, ou para alertá-lo quando os sites definirem ou
				acessarem cookies. No entanto, se você desativar ou recusar cookies,
				algumas partes do site podem se tornar inacessíveis ou não funcionar
				corretamente.</p>
			<h3>7. Links para Terceiros</h3>
			<p>Nosso site pode conter links para sites de terceiros. Não
				somos responsáveis pelas práticas de privacidade ou pelo conteúdo
				desses sites. Recomendamos que você revise as políticas de
				privacidade de qualquer site de terceiros que visitar.</p>
			<h3>8. Alterações a Esta Política</h3>
			<p>Podemos atualizar nossa Política de Privacidade
				periodicamente. Publicaremos quaisquer alterações nesta página e, se
				as alterações forem significativas, forneceremos um aviso mais
				proeminente. Recomendamos que você revise esta política regularmente
				para se manter informado sobre como protegemos suas informações.</p>
		</div>
	</div>

	<div class="modal-overlay" id="helpModal">
		<div class="modal-content">
			<button class="close-button">&times;</button>
			<h2>Ajuda e Suporte</h2>
			<h3>1. Como me Registro?</h3>
			<p>Para se registrar, clique no ícone de perfil no canto superior
				direito do cabeçalho e siga as instruções para criar sua conta. É
				rápido e fácil!</p>
			<h3>2. Onde Encontro as Atividades?</h3>
			<p>Todas as nossas atividades e recursos estão na seção
				"Atividades & Recursos" no menu principal. Lá você encontrará
				ferramentas como o registro de emoções, artigos e muito mais.</p>
			<h3>3. Como Posso Contribuir?</h3>
			<p>Se você tem sugestões, ideias ou deseja colaborar, por favor,
				entre em contato conosco através da página "Contato". Adoramos
				receber feedback e novas parcerias!</p>
			<h3>4. Problemas Técnicos?</h3>
			<p>Se estiver enfrentando algum problema técnico com o site, por
				favor, descreva o ocorrido em detalhes na nossa página de "Contato"
				ou envie um e-mail para suporte@calmamente.com.br. Nossa equipe fará
				o possível para ajudar.</p>
			<h3>5. Como Funciona o Fórum?</h3>
			<p>Nosso fórum é um espaço seguro para compartilhar experiências,
				fazer perguntas e oferecer apoio. Para participar, basta se
				registrar e seguir as regras da comunidade. Você pode criar novos
				tópicos ou responder aos existentes.</p>
			<h3>6. Posso Usar o Site no Celular?</h3>
			<p>Sim! O site Calmamente é totalmente responsivo e foi projetado
				para funcionar perfeitamente em dispositivos móveis, tablets e
				computadores.</p>
			<h3>7. Esqueci Minha Senha. O Que Faço?</h3>
			<p>Na tela de login, clique em "Esqueci minha senha" e siga as
				instruções para redefinir. Um link será enviado para o seu e-mail
				cadastrado.</p>
		</div>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/pt.js"></script>
	<script>
    	
    
    /* SCRIPT PARA MENU DE USUÁRIO*/
    // Lógica para o dropdown do perfil do usuário
const userProfileBtn = document.getElementById('userProfileBtn');
const userDropdown = document.getElementById('userDropdown');

userProfileBtn.addEventListener('click', () => {
   userDropdown.classList.toggle('show');
});

// Fecha o dropdown se clicar fora dele
window.addEventListener('click', (event) => {
   if (!userProfileBtn.contains(event.target) && !userDropdown.contains(event.target)) {
       userDropdown.classList.remove('show');
   }
});
''

/* FIM DO SCRIPT PARA MENU  DE USUÁRIO*/

        // === SCRIPT PARA O CALENDÁRIO E FILTRAGEM ===
        const calendarInput = document.getElementById('calendarInput');
        const selectedDateDisplay = document.getElementById('selectedDateDisplay');
        const historyList = document.getElementById('historyList');

        // Função para buscar o histórico para uma data específica (ou todos os registros)
        function fetchHistoryForDate(dateString) {
            console.log("DEBUG JS: fetchHistoryForDate() called with date:", dateString);

            // Construa a URL com ou sem o parâmetro 'data'
            let fetchUrl = 'historicov1.jsp'; // Ensure this points to the current JSP
            if (dateString) {
                // FIX: Escapar o '$' para que o JSP não tente interpretar como EL
                fetchUrl += `?data=\${encodeURIComponent(dateString)}`;
            } else {
                // Se a data for vazia, queremos limpar o parâmetro da URL para mostrar todos
                fetchUrl = window.location.pathname; // Apenas o caminho, sem query parameters
            }
            console.log("DEBUG JS: Fetching URL:", fetchUrl);

            fetch(fetchUrl)
                .then(response => {
                    console.log("DEBUG JS: Fetch response received. Status:", response.status);
                    if (!response.ok) {
                        throw new Error(`HTTP error! Status: ${response.status} - ${response.statusText}`);
                    }
                    return response.text();
                })
                .then(html => {
                    const parser = new DOMParser();
                    const doc = parser.parseFromString(html, 'text/html');
                    const newHistoryList = doc.getElementById('historyList');
                    const newSelectedDateDisplay = doc.getElementById('selectedDateDisplay');

                    if (newHistoryList) {
                        console.log("DEBUG JS: Updating historyList. New content length:", newHistoryList.innerHTML.length);
                        historyList.innerHTML = newHistoryList.innerHTML;
                    } else {
                        console.error("DEBUG JS: newHistoryList not found in fetched HTML. This might be an error page.");
                    }
                    if (newSelectedDateDisplay) {
                        console.log("DEBUG JS: Updating selectedDateDisplay. New content:", newSelectedDateDisplay.textContent.trim());
                        selectedDateDisplay.textContent = newSelectedDateDisplay.textContent.trim();
                    } else {
                        console.error("DEBUG JS: newSelectedDateDisplay not found in fetched HTML. This might be an error page.");
                    }
                })
                .catch(error => {
                    console.error('DEBUG JS ERROR: Erro ao buscar histórico:', error);
                    historyList.innerHTML = '<p class="no-records">Não foi possível carregar os registros para esta data. Por favor, tente novamente.</p>';
                });
        }

        // Inicialização do Flatpickr
        document.addEventListener('DOMContentLoaded', () => {
            const urlParams = new URLSearchParams(window.location.search);
            const initialDateFromUrl = urlParams.get('data');

            const fp = flatpickr(calendarInput, {
                dateFormat: "Y-m-d", // Formato para o valor do input (YYYY-MM-DD)
                locale: "pt", // Define o idioma para português
                defaultDate: initialDateFromUrl || null, // Define a data inicial se presente na URL
                onChange: function(selectedDates, dateStr, instance) {
                    // Este evento é disparado quando uma data é selecionada no calendário
                    console.log("DEBUG JS: Flatpickr onChange. Selected date string:", dateStr);
                    fetchHistoryForDate(dateStr); // Filtra pela data selecionada

                    // Atualiza a URL sem recarregar a página
                    if (dateStr) {
                        // FIX: Escapar o '$' para que o JSP não tente interpretar como EL
                        history.pushState(null, '', `?data=\${encodeURIComponent(dateStr)}`);
                        console.log("DEBUG JS: URL updated to:", `?data=${dateStr}`);
                    } else {
                        history.pushState(null, '', window.location.pathname); // Limpa o parâmetro 'data' da URL
                        console.log("DEBUG JS: Date input cleared, URL reset.");
                    }
                },
                onReady: function(selectedDates, dateStr, instance) {
                    // Este evento é disparado quando o calendário é inicializado
                    // Se houver uma data inicial na URL, garanta que o filtro seja aplicado
                    if (initialDateFromUrl) {
                        fetchHistoryForDate(initialDateFromUrl);
                        console.log("DEBUG JS: Flatpickr onReady. Initial date from URL set and fetched:", initialDateFromUrl);
                    } else {
                        // Se não houver data na URL, buscar todos os registros na carga inicial
                        fetchHistoryForDate('');
                        console.log("DEBUG JS: Flatpickr onReady. No initial date in URL, fetching all records.");
                    }
                }
            });

            // Adicionar um botão ou funcionalidade para "Limpar Filtro" / "Mostrar Todos"
            const clearFilterButton = document.createElement('button');
            clearFilterButton.textContent = 'Mostrar Todos';
            clearFilterButton.classList.add('filter-button'); // Reutiliza o estilo do botão de filtro
            clearFilterButton.style.marginTop = '1rem'; // Adiciona margem
            clearFilterButton.addEventListener('click', () => {
                fp.clear(); // Limpa a data selecionada no Flatpickr
                fetchHistoryForDate(''); // Busca todos os registros
                history.pushState(null, '', window.location.pathname); // Limpa o parâmetro 'data' da URL
                console.log("DEBUG JS: Clear filter button clicked. Displaying all records.");
            });
            calendarInput.parentNode.appendChild(clearFilterButton); // Adiciona o botão abaixo do input
        });
         // --- SCRIPT PARA OS MODAIS (TERMOS, PRIVACIDADE E AJUDA) ---

        // Modal de Termos de Uso
        const openTermsModalBtn = document.getElementById('termsLink'); // Alterado de openTermsModal para termsLink
        const termsModalOverlay = document.getElementById('termsModal'); // Alterado de termsModalOverlay para termsModal
        
        if (openTermsModalBtn) {
            openTermsModalBtn.addEventListener('click', (event) => { // Adicionado o parâmetro event
                event.preventDefault(); // Previne o comportamento padrão do link
                termsModalOverlay.classList.add('active');
                document.body.style.overflow = 'hidden'; // Impede a rolagem do corpo
            });
        }

        // Modal de Política de Privacidade
        const openPrivacyModalBtn = document.getElementById('privacyLink'); // Alterado de openPrivacyModal para privacyLink
        const privacyModalOverlay = document.getElementById('privacyModal'); // Alterado de privacyModalOverlay para privacyModal

        if (openPrivacyModalBtn) {
            openPrivacyModalBtn.addEventListener('click', (event) => { // Adicionado o parâmetro event
                event.preventDefault(); // Previne o comportamento padrão do link
                privacyModalOverlay.classList.add('active');
                document.body.style.overflow = 'hidden';
            });
        }

        // Modal de Ajuda
        const openHelpModalBtn = document.getElementById('helpLink'); // Alterado de openHelpModal para helpLink
        const helpModalOverlay = document.getElementById('helpModal'); // Alterado de helpModalOverlay para helpModal

        if (openHelpModalBtn) {
            openHelpModalBtn.addEventListener('click', (event) => { // Adicionado o parâmetro event
                event.preventDefault(); // Previne o comportamento padrão do link
                helpModalOverlay.classList.add('active');
                document.body.style.overflow = 'hidden';
            });
        }

        // --- Botão Genérico de Fechar e Clique no Overlay para todos os Modais ---
        // Seleciona todos os botões de fechar
        const closeButtons = document.querySelectorAll('.modal-content .close-button');
        closeButtons.forEach(button => {
            button.addEventListener('click', (event) => {
                // Encontra o overlay modal pai e remove a classe 'active'
                event.target.closest('.modal-overlay').classList.remove('active');
                document.body.style.overflow = ''; // Restaura a rolagem do corpo
            });
        });

        // Seleciona todos os overlays de modais para fechar ao clicar fora do conteúdo
        const modalOverlays = document.querySelectorAll('.modal-overlay');
        modalOverlays.forEach(overlay => {
            overlay.addEventListener('click', (event) => {
                if (event.target === overlay) {
                    overlay.classList.remove('active');
                    document.body.style.overflow = '';
                }
            });
        });


        // Fechar qualquer modal com a tecla ESC
        document.addEventListener('keydown', (event) => {
            if (event.key === 'Escape') {
                modalOverlays.forEach(overlay => {
                    if (overlay.classList.contains('active')) {
                        overlay.classList.remove('active');
                        document.body.style.overflow = '';
                    }
                });
            }
        });

    </script>
</body>
</html>