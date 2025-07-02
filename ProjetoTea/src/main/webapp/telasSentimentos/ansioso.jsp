<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Dao.DaoHistorico"%>
<%@ page import="modelos.Historico" %>
<%@ page import="modelos.Usuario" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Calmamente: Hora de Respirar</title>
<link
	href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<style>
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
	align-items: center;
	padding: 2rem;
	position: relative;
	z-index: 1;
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

.content-wrapper {
	background-color: var(--cor-fundo-ansiedade);
	padding: 2.5rem 3rem;
	border-radius: 30px;
	box-shadow: 0 10px 30px var(--cor-sombra-suave);
	text-align: center;
	max-width: 800px;
	width: 100%;
	border: 1px solid var(--cor-principal-calma);
}

.content-wrapper h1 {
	font-family: var(--fonte-titulo);
	font-size: 3.2rem;
	font-weight: 700;
	color: var(--cor-principal-calma);
	margin-bottom: 1.5rem;
	animation: fadeInAndFloat 4s ease-in-out infinite;
}

@
keyframes fadeInAndFloat { 0% {
	opacity: 0.7;
	transform: translateY(5px);
}

50
%
{
opacity
:
1;
transform
:
translateY(
-5px
);
}
100
%
{
opacity
:
0.7;
transform
:
translateY(
5px
);
}
}
.content-wrapper .intro-text {
	font-size: 1.2rem;
	color: var(--cor-texto-suave);
	margin-bottom: 2.5rem;
	max-width: 600px;
	margin-left: auto;
	margin-right: auto;
}

.activity-area {
	margin-bottom: 2.5rem;
	padding: 1.5rem;
	border-radius: 20px;
	background-color: #FFFFFF;
}

.breathing-circle {
	width: 180px;
	height: 180px;
	background-color: var(--cor-principal-calma);
	border-radius: 50%;
	margin: 1rem auto;
	display: flex;
	justify-content: center;
	align-items: center;
	color: var(--cor-texto-claro);
	font-family: var(--fonte-titulo);
	font-size: 1.8rem;
	font-weight: 500;
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
	animation: breathe 8s ease-in-out infinite;
	box-shadow: 0 0 40px var(--cor-sombra-suave);
}

@
keyframes breathe { 0% {
	transform: scale(0.9);
	opacity: 0.8;
}

50
%
{
transform
:
scale(
1.1
);
opacity
:
1;
}
100
%
{
transform
:
scale(
0.9
);
opacity
:
0.8;
}
}
.action-box h3 {
	font-family: var(--fonte-titulo);
	font-size: 1.8rem;
	margin-bottom: 1rem;
	color: var(--cor-texto-suave);
}

.action-box p {
	font-size: 1.1rem;
	margin-bottom: 1.5rem;
}

.audio-button {
	font-family: var(--fonte-titulo);
	font-size: 1.2rem;
	padding: 0.8rem 1.8rem;
	border: none;
	border-radius: 50px;
	cursor: pointer;
	transition: transform 0.2s ease, box-shadow 0.2s ease, background-color
		0.3s ease;
	background-color: var(--cor-acento-calma);
	color: var(--cor-texto-claro);
	font-weight: 500;
	display: inline-flex;
	align-items: center;
	gap: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.audio-button:hover {
	transform: translateY(-3px);
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
}

.audio-button.playing {
	background-color: var(--cor-botao-tocando);
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
	background-color: var(--cor-roxo-divertido, #8A2BE2); /* Cor fallback */
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
	background-color: var(--cor-nuvem, #FFFFFF); /* Cor fallback */
	min-width: 220px;
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
	border-radius: 15px;
	z-index: 1;
	overflow: hidden;
	animation: fadeIn 0.3s ease-out;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(-10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.dropdown-content.show {
	display: block;
}

.dropdown-content .user-info {
	padding: 1rem 1.5rem;
	font-family: var(--fonte-titulo);
	font-size: 1.2rem;
	color: var(--cor-texto-escuro, #333); /* Cor fallback */
	background-color: #f8f8f8;
	border-bottom: 1px solid var(--cor-borda-elementos, #ddd);
	/* Cor fallback */
}

.dropdown-content .user-info strong {
	color: var(--cor-roxo-divertido, #8A2BE2); /* Cor fallback */
}

.dropdown-content a {
	color: var(--cor-texto-medio, #555); /* Cor fallback */
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
} /* Cor fallback */
</style>
</head>
<body>
	<div class="cloud small"></div>
	<div class="cloud medium"></div>
	<div class="cloud large"></div>
	<header>
		<a href="IlhaSentimento.jsp" class="logo">Calmamente</a>
		<nav class="nav-buttons">
			<%-- Ícone do Perfil do Usuário com Dropdown --%>
			<button class="user-profile-button" id="userProfileBtn">
				<i class="fas fa-user-circle"></i>
			</button>

			<div class="dropdown-content" id="userDropdownMenu">
				<div class="user-info">
					Olá, <strong> <%
	Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioObjeto");
 String userName = usuarioLogado.getNome();
 if (userName == null || userName.isEmpty()) {
 	userName = "Usuário";
 }
 out.print(userName);
 		
 		int idUsuario = usuarioLogado.getId();
		String tipoEmocao = "Ansioso";
		Historico his = new Historico(java.time.LocalDateTime.now(), tipoEmocao, idUsuario);
		DaoHistorico daohis = new DaoHistorico();
		daohis.salvar(his);
		
 
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
		<div class="content-wrapper ansioso">
			<h1>Respire Fundo e Acalme a Mente</h1>
			<p class="intro-text">Quando nos sentimos ansiosos, nosso corpo
				fica agitado. Respirar devagar ajuda a encontrar a calma.</p>
			<div class="activity-area">
				<div id="breathing-animation" class="breathing-circle">Inspire</div>
			</div>
			<div class="action-box">
				<h3>Vamos Tentar Juntos?</h3>
				<p>Ouça o som da calma e acompanhe o círculo. Quando ele
					crescer, puxe o ar pelo nariz. Quando encolher, solte o ar pela
					boca.</p>

				<button id="play-pause-button" class="audio-button">
					<i class="fas fa-music"></i> Tocar Som da Calma
				</button>

				<audio id="audio-calmo"
					src="${pageContext.request.contextPath}/audios/audio-calmo.mp3"
					loop preload="auto"></audio>

			</div>
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
        const textElement = document.querySelector('#breathing-animation');
        if (textElement) {
            setInterval(() => {
                textElement.textContent = 'Inspire';
                setTimeout(() => { textElement.textContent = 'Expire'; }, 4000);
            }, 8000);
        }

        // --- SCRIPT PARA CONTROLAR O ÁUDIO ---
        const playButton = document.getElementById('play-pause-button');
        const audio = document.getElementById('audio-calmo');
        const playContent = '<i class="fas fa-music"></i> Tocar Som da Calma';
        const pauseContent = '<i class="fas fa-pause"></i> Pausar Som';

        if (playButton && audio) {
            playButton.addEventListener('click', () => {
                if (audio.paused) {
                    audio.play();
                    playButton.innerHTML = pauseContent;
                    playButton.classList.add('playing');
                } else {
                    audio.pause();
                    playButton.innerHTML = playContent;
                    playButton.classList.remove('playing');
                }
            });

            audio.addEventListener('ended', () => {
                playButton.innerHTML = pauseContent;
                playButton.classList.add('playing');
            });
        }
        
        // === SCRIPT PARA O MENU DROPDOWN ===
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
    </script>
</body>
</html>