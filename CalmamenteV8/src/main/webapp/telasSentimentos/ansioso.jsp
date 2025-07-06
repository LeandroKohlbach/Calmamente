<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Dao.DaoHistorico"%>
<%@ page import="modelos.Historico"%>
<%@ page import="modelos.Usuario"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Calmamente: Respire para Acalmar a Ansiedade</title>
<link
	href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<style>
:root {
	/* Paleta de Cores da Ansiedade */
	--cor-fundo-principal: #E0F7FA;
	--cor-grama-escura: #A8D8B9;
	--cor-secundaria-acao: #FFD700;
	--cor-texto-claro: #FFFFFF;
	--cor-fundo-ansiedade: #F0F8FF;
	--cor-principal-calma: #76D7C4;
	--cor-acento-calma: #A3D9B1;
	--cor-sombra-suave: rgba(118, 215, 196, 0.2);
	--cor-texto-suave: #4A5568;
	--cor-botao-tocando: #FFB74D;
	--fonte-titulo: 'Fredoka', sans-serif;
	--fonte-corpo: 'Nunito', sans-serif;
	/* Cores do Lumi */
	--cor-lumi-corpo: #fdeec9;
	--cor-lumi-olhos: #5c6b7a;
	--cor-lumi-sombra: rgba(44, 62, 80, 0.2);
	--cor-estrela-luz: #fff;
}

body, h1, h2, h3, p, ul, li, button {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: var(--fonte-corpo), sans-serif;
	color: var(--cor-texto-suave);
	line-height: 1.6;
	overflow-x: hidden;
	background-image: linear-gradient(to bottom, #E0F7FA, #CCEEFF);
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	position: relative;
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

.star {
	position: absolute;
	background-color: var(--cor-estrela-luz);
	border-radius: 50%;
	box-shadow: 0 0 5px var(--cor-estrela-luz), 0 0 10px
		var(--cor-estrela-luz);
	animation: twinkle 5s linear infinite;
	z-index: 0;
}

.star.s1 {
	width: 2px;
	height: 2px;
	top: 15%;
	left: 10%;
	animation-duration: 4s;
}

.star.s2 {
	width: 3px;
	height: 3px;
	top: 30%;
	left: 80%;
	animation-duration: 6s;
}

.star.s3 {
	width: 2px;
	height: 2px;
	top: 50%;
	left: 30%;
	animation-duration: 3s;
}

.star.s4 {
	width: 1px;
	height: 1px;
	top: 70%;
	left: 90%;
	animation-duration: 5s;
}

.star.s5 {
	width: 2px;
	height: 2px;
	top: 80%;
	left: 20%;
	animation-duration: 7s;
}

@
keyframes twinkle { 0% {
	opacity: 0.6;
}

50
%
{
opacity
:
1;
}
100
%
{
opacity
:
0.6;
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
}

.content-wrapper .intro-text {
	font-size: 1.2rem;
	color: var(--cor-texto-suave);
	margin-bottom: 1rem;
	max-width: 600px;
	margin-left: auto;
	margin-right: auto;
}

.activity-area {
	margin-bottom: 1.5rem;
	padding: 1.5rem 0;
	border-radius: 20px;
	min-height: 250px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	position: relative;
}

@
keyframes breathe { 0% {
	transform: scale(0.9);
}

50
%
{
transform
:
scale(
1.05
);
}
100
%
{
transform
:
scale(
0.9
);
}
}
@
keyframes breathe-mouth { 0%, 90%, 100% {
	width: 25px;
	height: 3px;
	border: none;
	border-radius: 3px;
	background-color: var(--cor-lumi-olhos);
}

40
%
,
60
%
{
width
:
25px;
height
:
25px;
background-color
:
transparent;
border
:
3px
solid
var(
--cor-lumi-olhos
);
border-radius
:
50%;
}
}
.lumi-container {
	position: relative;
	animation: breathe 8s ease-in-out infinite;
}

.lumi-body {
	width: 180px;
	height: 160px;
	background: radial-gradient(circle at 50% 100%, #fff, var(--cor-lumi-corpo)
		70%);
	border-radius: 50% 50% 45% 45%;
	position: relative;
	box-shadow: inset 0 -10px 20px rgba(0, 0, 0, 0.05);
}

.lumi-eyes {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -60%);
	display: flex;
	gap: 30px;
}

.lumi-eye {
	width: 15px;
	height: 20px;
	background-color: var(--cor-lumi-olhos);
	border-radius: 50%;
	animation: blink 7s ease-in-out infinite;
}

.lumi-mouth {
	position: absolute;
	bottom: 30%;
	left: 50%;
	transform: translateX(-50%);
	opacity: 0.7;
	animation: breathe-mouth 8s ease-in-out infinite;
}

.lumi-shadow {
	width: 120px;
	height: 20px;
	background-color: var(--cor-lumi-sombra);
	border-radius: 50%;
	margin: 20px auto 0;
	filter: blur(8px);
	opacity: 0.7;
	animation: breathe-shadow 8s ease-in-out infinite;
}

@
keyframes blink { 0%, 90%, 100% {
	transform: scaleY(1);
}

95
%
{
transform
:
scaleY(
0.1
);
}
}
@
keyframes breathe-shadow { 0% {
	transform: scale(1);
	opacity: 0.7;
}

50
%
{
transform
:
scale(
0.9
);
opacity
:
0.5;
}
100
%
{
transform
:
scale(
1
);
opacity
:
0.7;
}
}
#breathing-text {
	font-family: var(--fonte-titulo);
	font-size: 2rem;
	font-weight: 500;
	color: var(--cor-principal-calma);
	margin-bottom: 1.5rem;
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
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
	background-color: var(--cor-principal-calma);
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
}

.dropdown-content {
	display: none;
	position: absolute;
	top: calc(100% + 10px);
	right: 0;
	background-color: #fff;
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
	color: #333;
	background-color: #f8f8f8;
	border-bottom: 1px solid #ddd;
}

.dropdown-content .user-info strong {
	color: var(--cor-principal-calma);
}

.dropdown-content a {
	color: #555;
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
	color: #FF6347;
}
</style>
</head>
<body>
	<div class="star s1"></div>
	<div class="star s2"></div>
	<div class="star s3"></div>
	<div class="star s4"></div>
	<div class="star s5"></div>

	<header>
		<a href="IlhaSentimento.jsp" class="logo">Calmamente</a>
		<nav class="nav-buttons">
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
				<a href="../EditarPerfil.jsp"><i class="fas fa-pencil-alt"></i>
					Editar Perfil</a> <a href="../telasHome/Home.html"><i
					class="fas fa-sign-out-alt"></i> Sair</a>
			</div>
		</nav>
	</header>

	<main>
		<div class="content-wrapper">
			<h1>Respire Fundo para Acalmar</h1>
			<p class="intro-text">Quando a ansiedade chegar e deixar o
				coração acelerado, respirar devagar com um amigo ajuda a trazer a
				tranquilidade de volta. Vamos tentar juntos?</p>

			<div class="activity-area">
				<h2 id="breathing-text">Inspire</h2>

				<div class="lumi-container" id="lumiContainer">
					<div class="lumi-body" id="lumiBody">
						<div class="lumi-eyes">
							<div class="lumi-eye"></div>
							<div class="lumi-eye"></div>
						</div>
						<div class="lumi-mouth" id="lumiMouth"></div>
					</div>
					<div class="lumi-shadow"></div>
				</div>
			</div>

			<div class="action-box">
				<h3>Acompanhe o seu amigo</h3>
				<p>Quando o Lumi crescer, puxe o ar pelo nariz. Quando ele
					encolher, solte o ar devagar pela boca.</p>

				<button id="play-pause-button-medo" class="audio-button">
					<i class="fas fa-headphones-alt"></i> Tocar Música Calma
				</button>

				<audio id="audio-conforto"
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
        const textElement = document.getElementById('breathing-text');
        if (textElement) {
            setInterval(() => {
                textElement.textContent = 'Inspire';
                setTimeout(() => { textElement.textContent = 'Expire'; }, 4000);
            }, 8000);
        }

        const playButtonMedo = document.getElementById('play-pause-button-medo');
        const audioConforto = document.getElementById('audio-conforto');
        const playContentMedo = '<i class="fas fa-headphones-alt"></i> Tocar Música Calma';
        const pauseContentMedo = '<i class="fas fa-pause"></i> Pausar Música';

        if (playButtonMedo && audioConforto) {
            playButtonMedo.addEventListener('click', () => {
                if (audioConforto.paused) {
                    audioConforto.play();
                    playButtonMedo.innerHTML = pauseContentMedo;
                    playButtonMedo.classList.add('playing');
                } else {
                    audioConforto.pause();
                    playButtonMedo.innerHTML = playContentMedo;
                    playButtonMedo.classList.remove('playing');
                }
            });
        }

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