<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="modelos.Usuario"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Calmamente: Seu Mundo de Emoções!</title>
<link
	href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
/* Variáveis de Cores e Fontes - Mais VIBRANTES e LÚDICAS */
:root {
	--cor-fundo-principal: #E0F7FA;
	/* Azul Céu Bem Leve */
	--cor-nuvem: #FFFFFF;
	/* Branco Nuvem */
	--cor-grama-clara: #DCE8CC;
	/* Verde Menta Claro */
	--cor-grama-escura: #A8D8B9;
	/* Verde Pastel Vibrante */
	--cor-primaria-acao: #66CCFF;
	/* Azul Brilhante */
	--cor-secundaria-acao: #FFD700;
	/* Amarelo Sol */
	--cor-terciaria-acao: #FF99CC;
	/* Rosa Chiclete */
	--cor-roxo-divertido: #B388FF;
	/* Roxo Claro */
	--cor-texto-escuro: #333333;
	/* Cinza Escuro */
	--cor-texto-medio: #555555;
	/* Cinza Médio */
	--cor-texto-claro: #FFFFFF;
	/* Branco */
	--cor-sombra-leve: rgba(0, 0, 0, 0.1);
	--cor-borda-elementos: rgba(0, 0, 0, 0.15);
	/* Bordas suaves para elementos */
	--fonte-titulo: 'Fredoka', sans-serif;
	/* Fonte mais arredondada e divertida */
	--fonte-corpo: 'Nunito', sans-serif;
	/* Fonte legível e amigável */
}

/* Reset Básico */
body, h1, h2, h3, p, ul, li, button {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html, body {
	max-width: 100%;
}

body {
	font-family: var(--fonte-corpo);
	background-color: var(--cor-fundo-principal);
	color: var(--cor-texto-escuro);
	line-height: 1.6;
	overflow-x: hidden;
	/* **Mantido aqui para controle global** */
	background-image: linear-gradient(to bottom, var(--cor-fundo-principal),
		var(--cor-grama-clara));
	/* Degradê suave de céu para terra */
	min-height: 100vh;
	/* Ocupa a altura total da viewport */
	display: flex;
	flex-direction: column;
}

main {
	flex-grow: 1;
	/* Faz o main ocupar o espaço restante */
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 2rem 0;
	/* Add some vertical padding for main content */
}

/* Estilo para as nuvens (elementos decorativos) */
.cloud {
	position: absolute;
	background: var(--cor-nuvem);
	border-radius: 50%;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
	animation: moveCloud 30s linear infinite;
	z-index: 0;
	/* Fica atrás do conteúdo */
}

.cloud.small {
	width: 80px;
	height: 50px;
	top: 10%;
	left: -10%;
	animation-duration: 25s;
}

.cloud.medium {
	width: 120px;
	height: 70px;
	top: 5%;
	left: 30%;
	animation-duration: 35s;
}

.cloud.large {
	width: 150px;
	height: 90px;
	top: 15%;
	right: -10%;
	animation-duration: 40s;
}

.cloud:nth-child(2) {
	animation-delay: -10s;
}

.cloud:nth-child(3) {
	animation-delay: -20s;
}

.cloud:nth-child(4) {
	animation-delay: -5s;
	left: -20%;
}

.cloud:nth-child(5) {
	animation-delay: -15s;
	top: 20%;
	right: -15%;
	animation-duration: 30s;
}

@
keyframes moveCloud { 0% {
	transform: translateX(-100vw);
}

100
%
{
transform
:
translateX(
100vw
);
}
}
@
keyframes bounceIn { 0%, 20%, 40%, 60%, 80%, 100% {
	animation-timing-function: cubic-bezier(0.215, .61, .355, 1);
}

0
%
{
opacity
:
0;
transform
:
scale3d(
.3
,
.3
,
.3
);
}
20
%
{
transform
:
scale3d(
1.1
,
1.1
,
1.1
);
}
40
%
{
transform
:
scale3d(
.9
,
.9
,
.9
);
}
60
%
{
opacity
:
1;
transform
:
scale3d(
1.03
,
1.03
,
1.03
);
}
80
%
{
transform
:
scale3d(
.97
,
.97
,
.97
);
}
100
%
{
opacity
:
1;
transform
:
scale3d(
1
,
1
,
1
);
}
}

/* CONTEÚDO DA PÁGINA SOBRE NÓS */
.about-us-container {
	max-width: 1100px;
	margin: 4rem auto;
	padding: 3rem;
	background-color: var(--cor-nuvem);
	border-radius: 40px;
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
	border: 4px solid var(--cor-grama-escura);
	display: flex;
	gap: 3rem;
	align-items: center;
	animation: bounceIn 1s;
}

.about-us-text {
	flex: 1;
}

.about-us-text h1 {
	font-family: var(--fonte-titulo);
	font-size: 4rem;
	color: var(--cor-roxo-divertido);
	margin-bottom: 2rem;
	text-shadow: 3px 3px 0px rgba(0, 0, 0, 0.08);
}

.about-us-text p {
	font-family: var(--fonte-corpo);
	font-size: 1.2rem;
	color: var(--cor-texto-medio);
	margin-bottom: 1.5rem;
	line-height: 1.8;
}

.about-us-image {
	flex: 1;
	max-width: 450px;
}

.about-us-image img {
	width: 100%;
	border-radius: 30px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
	border: 8px solid var(--cor-nuvem);
	outline: 3px solid var(--cor-primaria-acao);
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

img {
	width: 80px; /* Logo um pouco maior */
	height: auto; /* Mantém a proporção */
	margin-right: 20px;
}

@
keyframes bounceIn { 0%, 20%, 40%, 60%, 80%, 100% {
	animation-timing-function: cubic-bezier(0.215, .61, .355, 1);
}

0
%
{
opacity
:
0;
transform
:
scale3d(
.3
,
.3
,
.3
);
}
20
%
{
transform
:
scale3d(
1.1
,
1.1
,
1.1
);
}
40
%
{
transform
:
scale3d(
.9
,
.9
,
.9
);
}
60
%
{
opacity
:
1;
transform
:
scale3d(
1.03
,
1.03
,
1.03
);
}
80
%
{
transform
:
scale3d(
.97
,
.97
,
.97
);
}
100
%
{
opacity
:
1;
transform
:
scale3d(
1
,
1
,
1
);
}
}

/*
 * MEDIA QUERIES PARA RESPONSIVIDADE
 *
 * @media (max-width: 992px): Layout para tablets em modo paisagem.
 * @media (max-width: 768px): Layout para tablets e celulares em modo retrato.
 * @media (max-width: 576px): Layout para celulares pequenos.
 */

/* Ajustes para telas médias (Tablets) */
@media ( max-width : 992px) {
	/* Ajusta o espaçamento do main para não ser tão grande */
	main {
		padding: 1rem 0;
	}

	/* Reduz o tamanho do container principal e muda a direção do flex */
	.about-us-container {
		flex-direction: column; /* Empilha os elementos verticalmente */
		margin: 2rem auto;
		padding: 2rem;
		max-width: 90%; /* Limita a largura a 90% da tela */
	}

	/* Reduz o tamanho das fontes e margens do texto */
	.about-us-text h1 {
		font-size: 3rem;
		margin-bottom: 1rem;
	}
	.about-us-text p {
		font-size: 1.1rem;
		margin-bottom: 1rem;
	}
}

--- /* Ajustes para telas pequenas (Celulares) */


@media ( max-width : 768px) {
	/* Oculta as nuvens para não sobrecarregar o layout em telas menores */
	.cloud {
		display: none;
	}
	.about-us-container {
		padding: 1.5rem;
		margin: 1rem auto;
		border-radius: 20px;
		gap: 1.5rem;
	}
	.about-us-text h1 {
		font-size: 2.5rem;
		text-align: center; /* Centraliza o título */
	}
	.about-us-text p {
		font-size: 1rem;
		text-align: justify; /* Justifica o texto para melhor leitura */
	}

	/* Oculta as imagens se necessário, ou ajusta o tamanho */
	.about-us-image {
		display: block; /* Garante que a imagem seja um bloco */
		width: 100%; /* Ocupa 100% da largura do contêiner */
		max-width: 100%; /* Garante que a imagem não ultrapasse o tamanho */
	}
	.about-us-image img {
		width: 100%; /* A imagem em si ocupa a largura total do seu contêiner */
		border-radius: 20px;
		border-width: 4px;
		outline-width: 2px;
	}
}

/* Ajustes para telas muito pequenas, caso necessário */
@media ( max-width : 576px) {
	.about-us-container {
		padding: 1rem;
		gap: 1rem;
	}
	.about-us-text h1 {
		font-size: 2rem;
	}
	.about-us-text p {
		font-size: 0.9rem;
	}
}
</style>
</head>

<body>
	<jsp:include page="./JSPs/headerLogado.jsp" />

	<main>
		<div class="about-us-container">
			<div class="about-us-text">
				<h1>Sobre o Calmamente</h1>
				<p>
					Bem-vindo ao <strong>Calmamente</strong>, um espaço digital seguro
					e acolhedor, criado com muito carinho para a comunidade autista,
					suas famílias e amigos. Nascemos do desejo de construir um mundo
					mais inclusivo, onde cada indivíduo se sinta compreendido, apoiado
					e valorizado em sua essência.
				</p>
				<p>Nossa missão é ser um farol de esperança e conhecimento,
					oferecendo ferramentas práticas, atividades lúdicas e uma rede de
					apoio mútua. Acreditamos que, ao conectar pessoas e compartilhar
					experiências, podemos desmistificar o Transtorno do Espectro
					Autista (TEA) e fortalecer os laços que nos unem.</p>
				<p>No Calmamente, você encontrará desde recursos para o registro
					e compreensão das emoções até atividades desenvolvidas para
					estimular habilidades sociais e cognitivas, tudo em um ambiente
					leve, divertido e, acima de tudo, respeitoso.</p>
			</div>
			<div class="about-us-image">
				<img src="./imagens/crianca.jpg"
					alt="Criança brincando com blocos coloridos em um ambiente calmo">
			</div>
		</div>
	</main>

	<jsp:include page="./JSPs/footer.jsp"/>

</body>

</html>