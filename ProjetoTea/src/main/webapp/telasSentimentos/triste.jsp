<%@ taglib uri="jakarta.tags.core" prefix="c"%>
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
<title>Calmamente: O Show do Lumi</title>
<link
	href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<style>
:root {
	--cor-fundo-triste: #D6EAF8;
	--cor-fundo-feliz: #FFFBEB;
	--cor-cortina: #C0392B;
	--cor-palco: #8B4513;
	--cor-texto-principal: #34495E;
	--cor-acento-feliz: #E67E22;
	--cor-lumi-corpo: #fdeec9;
	--cor-lumi-olhos: #4A5568;
	--fonte-titulo: 'Fredoka', sans-serif;
	--fonte-corpo: 'Nunito', sans-serif;
}

body {
	font-family: var(--fonte-corpo), sans-serif;
	background-color: var(--cor-fundo-triste);
	transition: background-color 2s ease;
	overflow: hidden;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

body.is-happy {
	background-color: var(--cor-fundo-feliz);
}

main {
	flex-grow: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 1rem;
}

.content-wrapper {
	text-align: center;
	max-width: 900px;
	width: 100%;
}

.content-wrapper h1 {
	font-family: var(--fonte-titulo);
	font-size: 2.5rem;
	color: var(--cor-texto-principal);
	margin-bottom: 0.5rem;
}

.content-wrapper p {
	font-size: 1.2rem;
	color: #5D6D7E;
	margin-bottom: 1.5rem;
}

header {
	background-color: rgba(0, 0, 0, 0.1);
	padding: 1rem 5%;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo {
	font-family: var(--fonte-titulo);
	font-size: 2.2rem;
	font-weight: 700;
	color: var(--cor-texto-principal);
	text-decoration: none;
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
}

.is-happy .logo {
	color: var(--cor-acento-feliz);
}

.theatre-container {
	background-color: #fff;
	border-radius: 20px;
	padding: 2rem;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
	position: relative;
}

.stage-area {
	background-color: var(--cor-palco);
	height: 250px;
	border-radius: 10px;
	position: relative;
	overflow: hidden;
	border-bottom: 10px solid #613205;
}

.curtain {
	position: absolute;
	top: 0;
	width: 55%;
	height: 100%;
	background-color: var(--cor-cortina);
	transition: transform 2s ease-in-out;
	z-index: 2;
}

.curtain.left {
	left: 0;
	box-shadow: inset -10px 0 20px rgba(0, 0, 0, 0.3);
}

.curtain.right {
	right: 0;
	box-shadow: inset 10px 0 20px rgba(0, 0, 0, 0.3);
}

.is-happy .curtain.left {
	transform: translateX(-100%);
}

.is-happy .curtain.right {
	transform: translateX(100%);
}

.lumi-audience {
	position: absolute;
	bottom: -20px;
	left: 50px;
	z-index: 5;
}

.lumi-container {
	position: relative;
	transform: scale(0.8);
	transition: transform 1s ease, filter 1s ease;
	animation: breathe-sad 2s infinite alternate;
}

.lumi-body {
	width: 140px;
	height: 120px;
	background: radial-gradient(circle at 50% 100%, #fff, var(--cor-lumi-corpo)
		70%);
	border-radius: 50% 50% 45% 45%;
	position: relative;
}

.lumi-eyes {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -60%);
	display: flex;
	gap: 20px;
}

.lumi-eye {
	width: 12px;
	height: 18px;
	background-color: var(--cor-lumi-olhos);
	border-radius: 50%;
}

.lumi-mouth {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	transition: all 0.5s ease;
	border: 3px solid var(--cor-lumi-olhos);
}

.lumi-eyebrows {
	position: absolute;
	top: 35%;
	left: 50%;
	transform: translateX(-50%);
	width: 60px;
	display: flex;
	justify-content: space-between;
	transition: transform 0.3s ease;
}

.lumi-eyebrow {
	width: 25px;
	height: 4px;
	background-color: var(--cor-lumi-olhos);
	border-radius: 2px;
	transition: transform 0.3s ease;
}

.is-happy .lumi-container {
	animation: float 6s ease-in-out infinite;
}

.is-happy .lumi-body {
	animation: gentleBreathe 5s ease-in-out infinite;
}

.is-happy .lumi-eye {
	animation: blink 7s ease-in-out infinite;
}

.lumi-container.is-laughing-animation {
	animation: laughAnimation 1s ease-in-out;
}

.puppet-on-stage {
	position: absolute;
	bottom: 20px;
	left: 50%;
	transform: translateX(-50%);
	font-size: 4rem;
	z-index: 3;
	cursor: pointer;
}

.puppet-on-stage.star {
	color: #F1C40F;
	animation: star-dance-loop 2.5s ease-in-out infinite !important;
}

.puppet-on-stage.robot {
	color: #7F8C8D;
	animation: robot-loop 3s ease-in-out infinite !important;
}

.puppet-on-stage.ball {
	color: #E74C3C;
	animation: ball-bounce-loop 2.2s ease-in-out infinite !important;
}

.puppet-box {
	display: flex;
	justify-content: center;
	gap: 1rem;
	margin-top: 1.5rem;
}

.puppet-choice {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 8px;
	border: 2px dashed #ccc;
	background-color: #f8f9fa;
	padding: 1rem;
	border-radius: 20px;
	cursor: pointer;
	transition: all 0.3s ease;
	min-width: 120px;
	text-align: center;
}

.puppet-choice:hover {
	transform: translateY(-5px);
	border-style: solid;
	border-color: var(--cor-acento-feliz);
}

.puppet-choice.is-used {
	border-style: solid;
	border-color: var(--cor-acento-feliz);
	background-color: #fdf2e9;
}

.puppet-choice.disabled {
	cursor: not-allowed;
	opacity: 0.5;
}

.puppet-choice .puppet-icon {
	font-size: 3rem;
}

.puppet-choice span {
	font-family: var(--fonte-titulo);
	font-size: 1rem;
	color: #555;
}

.restart-button {
	margin-top: 1.5rem;
	font-family: var(--fonte-titulo);
	font-size: 1.2rem;
	padding: 1rem 2rem;
	border: none;
	border-radius: 50px;
	background-color: var(--cor-acento-feliz);
	color: #fff;
	cursor: pointer;
	display: none;
}

.restart-button.show {
	display: inline-block;
	animation: fadeIn 1s;
}

.star.is-acting {
	animation: star-spin 0.5s ease-out;
}

.robot.is-acting {
	animation: robot-glitch 0.6s steps(2, end);
}

.ball.is-acting {
	animation: ball-squash 0.5s ease-in-out;
}

@
keyframes star-spin { 50% {
	transform: translateX(-50%) rotate(180deg) scale(1.3);
}

100


%
{
transform


:


translateX
(


-50
%


)


rotate
(


360deg


)


scale
(


1


)
;


}
}
@
keyframes robot-glitch { 0%, 100% {
	transform: translateX(-50%) skewX(0);
}

20


%
{
color


:


#3498db
;


transform


:


translateX
(


-52
%


)


skewX
(


10deg


)
;


}
40


%
{
transform


:


translateX
(


-48
%


)


skewX
(


-10deg


)
;


}
60


%
{
opacity


:


0
.5
;


transform


:


translateX
(


-50
%


)


scale
(


1
.1


)
;


}
}
@
keyframes ball-squash { 30% {
	transform: translateX(-50%) translateY(10px) scale(1.2, 0.8);
}

60


%
{
transform


:


translateX
(


-50
%


)


translateY
(


-30px


)


scale
(


0
.9
,
1
.1


)
;


}
}
@
keyframes star-dance-loop { 0%, 100% {
	transform: translate(-50%, 0) rotate(0deg) scale(1);
	text-shadow: 0 0 5px #F1C40F;
}

25


%
{
transform


:


translate
(


-50
%
,
5px


)


scale
(


0
.9
,
1
.1


)
;


}
50


%
{
transform


:


translate
(


-50
%
,
-40px


)


rotate
(


180deg


)


scale
(


1
.2


)
;


text-shadow


:


0


0


15px


#F1C40F
,
0


0


25px


#F1C40F
;


}
75


%
{
transform


:


translate
(


-50
%
,
5px


)


scale
(


1
.1
,
0
.9


)
;


}
}
@
keyframes robot-loop { 0%, 100% {
	transform: translate(-50%, 0) skew(0, 0) rotate(0);
}

15


%
{
transform


:


translate
(


-60
%
,
-20px


)


skew
(


-10deg
,
-5deg


)
;


}
30


%
{
transform


:


translate
(


-50
%
,
0


)


skew
(


0
,
0


)
;


}
45


%
{
transform


:


translate
(


-40
%
,
-20px


)


skew
(


10deg
,
5deg


)
;


}
60


%
{
transform


:


translate
(


-50
%
,
0


)


scale
(


1
.1
,
0
.9


)
;


}
80


%
{
transform


:


translate
(


-50
%
,
-50px


)


rotateY
(


360deg


)


scale
(


0
.9
,
1
.1


)
;


opacity


:


0
.8
;


}
}
@
keyframes ball-bounce-loop { 0%, 100% {
	transform: translate(-50%, 0) scale(1, 1);
	animation-timing-function: ease-in;
}

10


%
{
transform


:


translate
(


-50
%
,
0


)


scale
(


1
.2
,
0
.8


)
;


}
50


%
{
transform


:


translate
(


-50
%
,
-120px


)


scale
(


1
,
1


)
;


animation-timing-function


:


ease-out
;


}
90


%
{
transform


:


translate
(


-50
%
,
0


)


scale
(


1
.2
,
0
.8


)
;


}
95


%
{
transform


:


translate
(


-50
%
,
-20px


)


scale
(


1
,
1


)
;


animation-timing-function


:


ease-out
;


}
}
@
keyframes breathe-sad { 50% {
	transform: scale(0.8) translateY(-5px);
}

}
@
keyframes float { 0% {
	transform: translateY(0px);
}

50


%
{
transform


:


translateY
(


-15px


)
;


}
100


%
{
transform


:


translateY
(


0px


)
;


}
}
@
keyframes gentleBreathe { 0% {
	transform: scale(1);
}

50


%
{
transform


:


scale
(


1
.05


)
;


}
100


%
{
transform


:


scale
(


1


)
;


}
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


scaleY
(


0
.1


)
;


}
}
@
keyframes laughAnimation { 0% {
	transform: scale(0.8) translateX(0) rotate(0);
}

15


%
{
transform


:


scale
(


0
.8


)


translateX
(


-8px


)


rotate
(


-4deg


)
;


}
30


%
{
transform


:


scale(0.8) translateX (8px) rotate (4deg);
}
45%{
transform: scale(0.8)
translateX(-8px) rotate(-4deg);
}
60%{
transform


:


scale
(


0
.8


)


translateX
(


8px


)


rotate
(


4deg


)
;


}
75


%
{
transform


:


scale
(


0
.8


)


translateX
(


-5px


)


rotate
(


-2deg


)
;


}
90


%
{
transform


:


scale
(


0
.8


)


translateX
(


5px


)


rotate
(


2deg


)
;


}
100


%
{
transform


:


scale
(


0
.8


)


translateX
(


0


)


rotate
(


0


)
;


}
}
@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
keyframes fadeInDropdown {from { opacity:0;
	transform: translateY(-10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.nav-buttons, footer {
	position: relative;
	z-index: 1000;
}

.user-profile-button {
	background-color: rgba(0, 0, 0, 0.15);
	color: var(--cor-texto-principal);
	border: none;
	border-radius: 50%;
	width: 50px;
	height: 50px;
	font-size: 1.8rem;
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.is-happy .user-profile-button {
	background-color: var(--cor-acento-feliz);
	color: #fff;
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
	animation: fadeInDropdown 0.3s ease-out;
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
	color: var(--cor-acento-feliz);
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

footer {
	background-color: rgba(0, 0, 0, 0.1);
	color: #5D6D7E;
	text-align: center;
	padding: 2rem 1rem;
	font-size: 1rem;
	margin-top: auto;
}

.is-happy footer {
	background-color: rgba(230, 126, 34, 0.1);
}

footer .links {
	margin-top: 0.5rem;
}

footer .links a {
	color: #5D6D7E;
	margin: 0 10px;
	text-decoration: none;
	transition: color 0.2s ease;
}

footer .links a:hover {
	color: var(--cor-acento-feliz);
}
</style>
</head>
<body>
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
 					String tipoEmocao = "Triste";
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
			<h1 id="main-title">O Lumi está se sentindo um pouco... triste.</h1>
			<p id="main-text">Escolha uma marionete para animá-lo!</p>
			<div class="theatre-container">
				<div class="stage-area" id="stage">
					<div class="lumi-audience">
						<div class="lumi-container" id="lumiContainer">
							<div class="lumi-body" id="lumiBody">
								<div class="lumi-eyebrows" id="lumiEyebrows">
									<div class="lumi-eyebrow"></div>
									<div class="lumi-eyebrow"></div>
								</div>
								<div class="lumi-eyes">
									<div class="lumi-eye"></div>
									<div class="lumi-eye"></div>
								</div>
								<div class="lumi-mouth" id="lumiMouth"></div>
							</div>
						</div>
					</div>
					<div class="curtain left"></div>
					<div class="curtain right"></div>
				</div>
			</div>
			<div class="puppet-box">
				<div class="puppet-choice" data-puppet="star">
					<i class="fas fa-star puppet-icon" style="color: #F1C40F;"></i><span>Estrela
						Dançante</span>
				</div>
				<div class="puppet-choice" data-puppet="robot">
					<i class="fas fa-robot puppet-icon" style="color: #7F8C8D;"></i><span>Robô
						Maluco</span>
				</div>
				<div class="puppet-choice" data-puppet="ball">
					<i class="fas fa-basketball-ball puppet-icon"
						style="color: #E74C3C;"></i><span>Bola Saltitante</span>
				</div>
			</div>
			<button id="restart-button" class="restart-button">Começar
				de Novo</button>
		</div>
	</main>

	<audio id="laughAudio"
		src="${pageContext.request.contextPath}/audios/audio-risada.mp3"
		preload="auto"></audio>

	<footer>
		<p>&copy; 2025 Calmamente. Todos os direitos reservados.</p>
		<div class="links">
			<a href="#">Privacidade</a> <a href="#">Termos de Uso</a> <a href="#">Ajuda</a>
		</div>
	</footer>

<script>
    // --- ELEMENTOS ---
    const stage = document.getElementById('stage');
    const lumiContainer = document.getElementById('lumiContainer');
    const lumiBody = document.getElementById('lumiBody');
    const lumiMouth = document.getElementById('lumiMouth');
    const lumiEyebrows = document.getElementById('lumiEyebrows');
    const mainTitle = document.getElementById('main-title');
    const mainText = document.getElementById('main-text');
    const restartButton = document.getElementById('restart-button');
    const puppetChoices = document.querySelectorAll('.puppet-choice');
    const userProfileBtn = document.getElementById('userProfileBtn');
    const userDropdownMenu = document.getElementById('userDropdownMenu');
    const laughAudio = document.getElementById('laughAudio');

    // --- ESTADO DO JOGO ---
    let currentPuppetOnStage = null;
    let puppetsShown = new Set();
    let isShowOver = false;

    // <%-- FUNÇÃO DE ESTILO COM A NOVA SEQUÊNCIA DE SORRISOS --%>
    function setMouthStyle(state) {
        lumiMouth.style.cssText = '';
        lumiMouth.style.position = 'absolute';
        lumiMouth.style.left = '50%';
        lumiMouth.style.transform = 'translateX(-50%)';
        lumiMouth.style.transition = 'all 0.5s ease';
        lumiMouth.style.border = '3px solid var(--cor-lumi-olhos)';

        switch(state) {
            case 'serious': // Estado inicial com boca reta
                lumiMouth.style.width = '30px';
                lumiMouth.style.height = '1px';
                lumiMouth.style.borderColor = 'transparent transparent var(--cor-lumi-olhos) transparent';
                lumiMouth.style.borderRadius = '0';
                lumiMouth.style.bottom = '25%';
                break;
            case 'light-smile': // 1º Clique: Leve sorriso
                lumiMouth.style.width = '30px';
                lumiMouth.style.height = '15px';
                lumiMouth.style.borderColor = 'transparent transparent var(--cor-lumi-olhos) transparent';
                lumiMouth.style.borderRadius = '0 0 15px 15px';
                lumiMouth.style.bottom = '22%';
                break;
            case 'open-smile': // 2º Clique: Sorriso mais aberto
                lumiMouth.style.width = '35px';
                lumiMouth.style.height = '18px';
                lumiMouth.style.borderColor = 'transparent transparent var(--cor-lumi-olhos) transparent';
                lumiMouth.style.borderRadius = '0 0 18px 18px';
                lumiMouth.style.bottom = '22%';
                break;
            case 'laughing': // 3º Clique: Risada
                lumiMouth.style.width = '40px';
                lumiMouth.style.height = '20px';
                lumiMouth.style.borderColor = 'var(--cor-lumi-olhos)';
                lumiMouth.style.borderRadius = '0 0 20px 20px';
                lumiMouth.style.bottom = '22%';
                break;
        }
    }

    function initializeGame() {
        resetGame();
        puppetChoices.forEach(choice => {
            choice.addEventListener('click', () => {
                if (isShowOver) {
                    showPuppet(choice, false); return;
                }
                if (choice.classList.contains('is-used')) {
                    showPuppet(choice, false);
                } else {
                    showPuppet(choice, true);
                }
            });
        });
        restartButton.addEventListener('click', resetGame);
        if (userProfileBtn) {
             userProfileBtn.addEventListener('click', (event) => {
                event.stopPropagation();
                userDropdownMenu.classList.toggle('show');
            });
        }
        window.addEventListener('click', (event) => {
            if (userDropdownMenu && userDropdownMenu.classList.contains('show')) {
                if (!userProfileBtn.contains(event.target) && !userDropdownMenu.contains(event.target)) {
                    userDropdownMenu.classList.remove('show');
                }
            }
        });
    }

    function showPuppet(choiceElement, isNewChoice) {
        if (currentPuppetOnStage) {
            currentPuppetOnStage.remove();
        }
        const puppetType = choiceElement.dataset.puppet;
        const puppet = document.createElement('div');
        puppet.className = `puppet-on-stage ${puppetType}`;
        puppet.innerHTML = choiceElement.querySelector('.puppet-icon').outerHTML;
        puppet.addEventListener('click', handlePuppetInteraction);
        stage.appendChild(puppet);
        currentPuppetOnStage = puppet;
        if (isNewChoice) {
            puppetsShown.add(puppetType);
            choiceElement.classList.add('is-used');
            updateLumiReaction(puppetsShown.size);
            if (puppetsShown.size >= puppetChoices.length) {
                isShowOver = true;
                setTimeout(startHappySequence, 2000);
            }
        }
    }

    function handlePuppetInteraction(event) {
        const puppet = event.currentTarget;
        if (puppet.classList.contains('is-acting')) return;
        const originalAnimation = window.getComputedStyle(puppet).animation;
        puppet.classList.add('is-acting');
        const interactionType = puppet.classList.contains('star') ? 'star-spin' : puppet.classList.contains('robot') ? 'robot-glitch' : 'ball-squash';
        puppet.style.animation = `${interactionType} 0.6s ease-out`;
        puppet.addEventListener('animationend', () => {
            puppet.classList.remove('is-acting');
            puppet.style.animation = originalAnimation;
        }, { once: true });
    }
    
    // <%-- LÓGICA DE REAÇÃO ATUALIZADA PARA A NOVA SEQUÊNCIA --%>
    function updateLumiReaction(count) {
        lumiEyebrows.className = 'lumi-eyebrows'; 

        if (count === 1) {
            setMouthStyle('light-smile');
            mainText.textContent = 'O Lumi deu um leve sorriso!';
        } else if (count === 2) {
            setMouthStyle('open-smile');
            mainText.textContent = 'O Lumi está gostando!';
        } else if (count === 3) {
            setMouthStyle('laughing');
            mainText.textContent = 'O Lumi está rindo!';
            lumiContainer.classList.add('is-laughing-animation');
            setTimeout(() => {
                lumiContainer.classList.remove('is-laughing-animation');
            }, 1000);
            if (laughAudio) {
                laughAudio.currentTime = 0;
                laughAudio.play();
            }
        }
    }

    function startHappySequence() {
        if (currentPuppetOnStage) {
            currentPuppetOnStage.remove();
            currentPuppetOnStage = null;
        }
        document.body.classList.add('is-happy');
        lumiEyebrows.className = 'lumi-eyebrows'; 
        setMouthStyle('laughing');
        mainTitle.textContent = 'O Lumi está muito feliz agora!';
        mainText.innerHTML = 'Seu show foi um sucesso! <br>Clique nas marionetes para brincar livremente no palco.';
        restartButton.textContent = 'Começar de Novo';
        restartButton.classList.add('show');
        puppetChoices.forEach(btn => btn.classList.remove('disabled'));
    }

    function resetGame() {
        if (currentPuppetOnStage) {
            currentPuppetOnStage.remove();
            currentPuppetOnStage = null;
        }
        puppetsShown.clear();
        isShowOver = false;
        document.body.classList.remove('is-happy');
        lumiContainer.className = 'lumi-container';
        
        // ESTADO INICIAL SÉRIO
        lumiEyebrows.className = 'lumi-eyebrows';
        setMouthStyle('serious');
        
        mainTitle.textContent = "O Lumi está se sentindo um pouco triste.";
        mainText.textContent = "Escolha uma marionete para animá-lo!";
        restartButton.textContent = 'Brincar de Novo';
        puppetChoices.forEach(choice => {
            choice.classList.remove('is-used', 'disabled');
        });
        restartButton.classList.remove('show');
    }

    initializeGame();
</script>
</body>
</html>