<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Dao.DaoHistorico"%>
<%@ page import="modelos.Historico"%>
<%@ page import="modelos.Usuario"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Calmamente: Cuidando do Lumi</title>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
    	html, body {
    		margin: 0;
    		padding: 0;	
		}
    	
        :root {
            /* ... (Variáveis de Cor - sem alterações) ... */
            --cor-fundo-noite-1: #2c3e50;
            --cor-fundo-noite-2: #465a70;
            --cor-fundo-container: #ffffff;
            --cor-titulo-calmo: #e5a963;
            --cor-texto-conforto: #5c6b7a;
            --cor-botao-calmo: #f0c48a;
            --cor-botao-tocando: #e5a963;
            --cor-sombra-sonho: rgba(229, 169, 99, 0.15);
            --cor-lumi-corpo: #fdeec9;
            --cor-lumi-olhos: #5c6b7a;
            --cor-lumi-sombra: rgba(44, 62, 80, 0.2);
            --cor-lumi-brilho: #fff;
            --cor-estrela-luz: #fff;
            
            
            --cor-fundo-principal: #F8F8F8; /* AGORA BRANCO SUAVE */
            --cor-nuvem: #FFFFFF; /* Branco Nuvem (mantido para os cards) */
            --cor-grama-clara: #DCE8CC; /* Verde Menta Claro */
            --cor-grama-escura: #A8D8B9; /* Verde Pastel Vibrante */

            --cor-primaria-acao: #66CCFF; /* Azul Brilhante */
            --cor-secundaria-acao: #FFD700; /* Amarelo Sol */
            --cor-terciaria-acao: #FF99CC; /* Rosa Chiclete */
            --cor-roxo-divertido: #B388FF; /* Roxo Claro */

            --cor-texto-escuro: #333333; /* Cinza Escuro */
            --cor-texto-medio: #555555; /* Cinza Médio */
            --cor-texto-claro: #FFFFFF; /* Branco */

            --cor-sombra-leve: rgba(0, 0, 0, 0.1);
            --cor-borda-elementos: rgba(0, 0, 0, 0.15); /* Bordas suaves para elementos */

            --fonte-titulo: 'Fredoka', sans-serif; /* Fonte mais arredondada e divertida */
            --fonte-corpo: 'Nunito', sans-serif; /* Fonte legível e amigável */
        }

        body, h1, h2, h3, p, ul, li, button {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: var(--fonte-corpo), sans-serif;
            color: var(--cor-texto-conforto);
            line-height: 1.6;
            overflow-x: hidden;
            background-image: linear-gradient(to bottom, var(--cor-fundo-noite-1), var(--cor-fundo-noite-2));
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

        /* CSS das Estrelas (REINTRODUZIDO) */
        .star {
            position: absolute;
            background-color: var(--cor-estrela-luz);
            border-radius: 50%;
            box-shadow: 0 0 5px var(--cor-estrela-luz), 0 0 10px var(--cor-estrela-luz);
            animation: twinkle 5s linear infinite;
            z-index: 0;
            cursor: pointer;
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
        @keyframes twinkle {
            0% {
                opacity: 0.6;
            }
            50% {
                opacity: 1;
            }
            100% {
                opacity: 0.6;
            }
        }

        /* CSS da Luz da Estrela (REINTRODUZIDO) */
        .star-light {
            position: fixed;
            background-color: var(--cor-estrela-luz);
            width: 5px;
            height: 5px;
            border-radius: 50%;
            opacity: 1;
            box-shadow: 0 0 10px var(--cor-estrela-luz);
            z-index: 10;
            transition: transform 0.8s ease-in, opacity 0.8s ease-in;
            pointer-events: none;
        }
		
		/* ===========
         SCROLLBAR 
        ===========
        */
        /* Customiza o scrollbar para navegadores WebKit (Chrome, Safari, Edge, Opera) */
        ::-webkit-scrollbar {
            width: 12px; /* Largura da barra de rolagem vertical */
            height: 12px; /* Altura da barra de rolagem horizontal */
        }

        ::-webkit-scrollbar-track {
            background: var(--cor-fundo-principal); /* Fundo da trilha do scrollbar */
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb {
            background: var(--cor-primaria-acao); /* Cor do "po legar" (draggable part) do scrollbar */
            border-radius: 10px;
            border: 3px solid var(--cor-fundo-principal); /* Adiciona uma borda ao polegar */
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #33AADD; /* Cor mais escura no hover do polegar */
        }

        ::-webkit-scrollbar-corner {
            background: transparent; /* Canto onde as barras vertical e horizontal se encontram */
        }
        /* FIM DOS ESTILOS PARA O SCROLLBAR */
		
        /* ===========
         HEADER 
        ===========
        */
       header {
        background-color: var(--cor-primaria-acao); /* Azul para o céu */
        padding: 1rem 5%;
        display: flex;
        justify-content: space-between; /* Espaço entre o primeiro e o último item */
        align-items: center;
         box-shadow: 0 4px 8px var(--cor-sombra-leve);
        border-bottom-left-radius: 10px; /* MAIS ARREDONDADO */
        border-bottom-right-radius: 10px; /* MAIS ARREDONDADO */
        position: relative;
        z-index: 1000;
        max-height: 65px;
		}

        .logo {
            font-family: var(--fonte-titulo);
            font-size: 2.5rem; /* UM POUCO MAIOR */
            font-weight: 700;
            color: var(--cor-texto-claro);
            text-decoration: none;
            text-shadow: 3px 3px 0 rgba(0,0,0,0.15); /* SOMBRA MAIS PROEMINENTE */
            transition: transform 0.2s ease, text-shadow 0.2s ease;
        }
        .logo:hover {
            transform: scale(1.02); /* MAIS BRINCALHÃO */
            text-shadow: 4px 4px 0 rgba(0,0,0,0.2);
        }
        
        /* Contêiner para centralizar os links e botão de perfil */
        .header-center-container {
            flex-grow: 1; /* Permite que ocupe o espaço central */
            display: flex;
            justify-content: center; /* Centraliza o conteúdo dentro dele */
            align-items: center;
        }
        .nav-links-container {
            display: flex;
            align-items: center;
            margin-left: 155px;
            margin-right: auto;
        }
        /* Estilos para os links do cabeçalho (Home e Sobre Nós) */
        .nav-link {
            text-decoration: none; /* Remove sublinhado */
            color: var(--cor-texto-claro); /* Cor branca */
            font-family: var(--fonte-titulo);
            font-weight: 700;
            transition: transform 0.2s ease, text-shadow 0.2s ease;
            text-shadow: 2px 2px 0 rgba(0,0,0,0.1);
            padding: 0.5rem 1rem; /* Adiciona padding para área clicável */
            border-radius: 15px; /* Suavemente arredondado */
            margin: 0 10px; /* Espaço entre os links */
            font-size: 1.3rem; /* Tamanho padrão para todos os links */
        }

        .nav-link:hover {
            transform: translateY(-3px); /* Efeito de hover */
            text-shadow: 3px 3px 0 rgba(0,0,0,0.2);
            background-color: rgba(255, 255, 255, 0.1); /* Fundo sutil no hover */
        }
        
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
            box-shadow: 0 4px 8px rgba(0,0,0,0.25); /* SOMBRA MAIS SUAVE */
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
            position: relative; /* Para a bolha de notificação se necessário */
        }

        .user-profile-button:hover {
            background-color: #9966FF; /* Roxo um pouco mais escuro */
            transform: translateY(-3px) rotate(5deg); /* MAIS BRINCALHÃO */
            box-shadow: 0 6px 12px rgba(0,0,0,0.3);
        }

        /* Efeito de "batida" no ícone do usuário */
        .user-profile-button i {
            animation: pulse 2s infinite ease-in-out;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        .dropdown-content {
            display: none; /* Escondido por padrão */
            position: absolute;
            top: calc(100% + 15px); /* Posição abaixo do botão, um pouco mais afastado */
            right: 0;
            background-color: var(--cor-nuvem);
            min-width: 250px; /* UM POUCO MAIOR */
            box-shadow: 0 10px 20px 0 rgba(0,0,0,0.25); /* SOMBRA MAIS PRONUNCIADA */
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
            border-bottom: 2px solid var(--cor-primaria-acao); /* Borda mais forte */
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
            border-bottom: 1px solid rgba(0,0,0,0.05); /* Separador suave */
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
        .dropdown-content a .fa-pencil-alt { color: var(--cor-secundaria-acao); }
        .dropdown-content a .fa-sign-out-alt { color: var(--cor-terciaria-acao); }

        @keyframes fadeInScale {
            from {
                opacity: 0;
                transform: scale(0.9) translateY(-20px);
            }
            to {
                opacity: 1;
                transform: scale(1) translateY(0);
            }
        }
        
        /* FIM: ESTILOS PARA O MENU DE USUÁRIO */
        .content-wrapper {
            background-color: var(--cor-fundo-container);
            padding: 2.5rem 3rem;
            border-radius: 30px;
            box-shadow: 0 10px 40px var(--cor-sombra-sonho);
            text-align: center;
            max-width: 800px;
            width: 100%;
            border: 1px solid var(--cor-botao-calmo);
        }
        .content-wrapper h1 {
            font-family: var(--fonte-titulo);
            font-size: 3rem;
            font-weight: 700;
            color: var(--cor-titulo-calmo);
            margin-bottom: 1.5rem;
        }
        .content-wrapper .intro-text {
            font-size: 1.2rem;
            color: var(--cor-texto-conforto);
            margin-bottom: 2.5rem;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
        .activity-area {
            margin-bottom: 2.5rem;
            padding: 1.5rem;
            border-radius: 20px;
            min-height: 250px;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        /* --- CSS DO LUMI (Com todas as animações) --- */
        .lumi-container {
            position: relative;
            animation: float 6s ease-in-out infinite;
            cursor: pointer;
        }
        .lumi-body {
            width: 180px;
            height: 160px;
            background: radial-gradient(circle at 50% 100%, #fff, var(--cor-lumi-corpo) 70%);
            border-radius: 50% 50% 45% 45%;
            position: relative;
            animation: gentleBreathe 5s ease-in-out infinite;
            box-shadow: inset 0 -10px 20px rgba(0, 0, 0, 0.05);
        }
        .lumi-body.is-fed {
            animation: gentleBreathe 5s ease-in-out infinite, lumiFeed 0.5s ease-out;
        }
        .lumi-container.is-tickled {
            animation: tickleAnimation 1s ease-in-out;
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
            transition: all 0.2s ease;
        }
        .lumi-container.is-tickled .lumi-eye {
            height: 5px;
            transform: translateY(7px);
        }
        .lumi-mouth {
            position: absolute;
            bottom: 25%;
            left: 50%;
            width: 30px;
            height: 10px;
            background-color: transparent;
            border: 2px solid var(--cor-lumi-olhos);
            border-color: transparent transparent var(--cor-lumi-olhos) transparent;
            border-radius: 0 0 15px 15px;
            transform: translateX(-50%);
            opacity: 0.7;
            transition: all 0.2s ease;
        }
        .lumi-container.is-tickled .lumi-mouth {
            width: 40px;
            height: 20px;
            border-radius: 0 0 20px 20px;
        }
        .lumi-shadow {
            width: 120px;
            height: 20px;
            background-color: var(--cor-lumi-sombra);
            border-radius: 50%;
            margin: 20px auto 0;
            filter: blur(8px);
            opacity: 0.7;
            animation: shadowBreathe 5s ease-in-out infinite;
        }

        @keyframes float {
            0% {
                transform: translateY(0px);
            }
            50% {
                transform: translateY(-15px);
            }
            100% {
                transform: translateY(0px);
            }
        }
        @keyframes gentleBreathe {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }
        @keyframes shadowBreathe {
            0% {
                transform: scale(1);
                opacity: 0.7;
            }
            50% {
                transform: scale(0.95);
                opacity: 0.5;
            }
            100% {
                transform: scale(1);
                opacity: 0.7;
            }
        }
        @keyframes blink {
            0%, 90%, 100% {
                transform: scaleY(1);
            }
            95% {
                transform: scaleY(0.1);
            }
        }
        @keyframes lumiFeed {
            0% {
                transform: scale(1.05);
            }
            50% {
                transform: scale(1.15);
                box-shadow: 0 0 25px var(--cor-lumi-brilho);
            }
            100% {
                transform: scale(1.05);
            }
        }
        @keyframes tickleAnimation {
            0% {
                transform: translateX(0) rotate(0);
            }
            15% {
                transform: translateX(-8px) rotate(-4deg);
            }
            30% {
                transform: translateX(8px) rotate(4deg);
            }
            45% {
                transform: translateX(-8px) rotate(-4deg);
            }
            60% {
                transform: translateX(8px) rotate(4deg);
            }
            75% {
                transform: translateX(-5px) rotate(-2deg);
            }
            90% {
                transform: translateX(5px) rotate(2deg);
            }
            100% {
                transform: translateX(0) rotate(0);
            }
        }

        /* ... (Restante do CSS sem alterações) ... */
        .action-box h3 {
            font-family: var(--fonte-titulo);
            font-size: 1.8rem;
            margin-bottom: 1rem;
            color: var(--cor-texto-conforto);
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
            transition: transform 0.2s ease, box-shadow 0.2s ease, background-color 0.3s ease;
            background-color: var(--cor-botao-calmo);
            color: var(--cor-texto-conforto);
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
        /* ===========
         FOOTER 
        ===========
        */
        footer {
            background-color: var(--cor-grama-escura); /* Mesma cor da seção de ilhas */
            color: var(--cor-texto-claro);
            text-align: center;
            padding: 3rem 5%; /* MAIOR PADDING */
            font-size: 1.1rem; /* TEXTO MAIOR */
            box-shadow: inset 0 6px 12px rgba(0,0,0,0.15); /* SOMBRA MAIS FORTE */
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
            background-color: rgba(255,255,255,0.1); /* Fundo sutil */
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        footer .links a:hover {
            color: var(--cor-secundaria-acao);
            transform: translateY(-3px) scale(1.05); /* MAIOR EFEITO DE HOVER */
            background-color: rgba(255,255,255,0.2);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
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
            background-color: rgba(0, 0, 0, 0.6); /* Fundo escuro semi-transparente */
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
            overflow-y: auto; /* Adiciona scroll se o conteúdo for maior que a altura */
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
            text-shadow: 2px 2px 0px rgba(0,0,0,0.05);
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
            z-index: 10; /* Garante que o botão esteja acima do conteúdo do modal */
        }

        .close-button:hover {
            color: var(--cor-terciaria-acao); /* Rosa */
            transform: rotate(90deg);
        }
        .nav-buttons {
            position: relative;
        }
        
        img{
            width: 80px; /* Logo um pouco maior */
            height: auto; /* Mantém a proporção */
            margin-right: 20px;
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
        <img src="../imagens/logo.png" alt="Logo Calmamente">
        <h1 class="logo">Calmamente</h1>
        
            <nav class="nav-links-container">
            <a href="../HomeLogado.jsp" class="nav-link" id="homeButton">
                Home
            </a>
            <a href="../SobreNosLogado.jsp" class="nav-link" id="aboutUsLink">
                Sobre Nós
            </a>
            <a href="../Atividades&Recursos.jsp" class="nav-link" id="activitiesResourcesButton">
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
                Olá, <strong><strong>
                    <%
					 Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioObjeto");
 					String userName = usuarioLogado.getNome();
 					if (userName == null || userName.isEmpty()) {
 						userName = "Usuário";
 					}
 					out.print(userName);

 					int idUsuario = usuarioLogado.getId();
 					String tipoEmocao = "Medo";
					Historico his = new Historico(java.time.LocalDateTime.now(), tipoEmocao, idUsuario);
 					DaoHistorico daohis = new DaoHistorico();
 					daohis.salvar(his);
 					%>
                    </strong>!
            </div>
            <a href="EditarPerfil.jsp"><i class="fas fa-pencil-alt"></i> Editar Perfil</a>
            <a href="telasHome/Home.html">
                    <i class="fas fa-sign-out-alt"></i> Sair
                </a>
        </div>
        </div>
    </header>

    <main>
        <div class="content-wrapper medo">
            <h1>Um Amigo para se Divertir</h1>
            <p class="intro-text">Às vezes, um pouco de diversão é a melhor forma de esquecer o medo. Que tal fazer cócegas no seu amigo Lumi?</p>

            <div class="activity-area">
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
                <h3>Cuide e divirta-se com o Lumi</h3>
                <p>Clique nas estrelas para alimentá-lo ou clique diretamente nele para fazer cócegas!</p>

                <button id="play-pause-button-medo" class="audio-button">
                    <i class="fas fa-headphones-alt"></i> Tocar Música Calma
                </button>

                <audio id="audio-conforto" src="${pageContext.request.contextPath}/audios/audio-medo.mp3" loop preload="auto"></audio>
                <audio id="audio-giggle" src="${pageContext.request.contextPath}/audios/audio-risada.mp3" preload="auto"></audio>
            </div>
        </div>
    </main>

   <footer>
        <p>&copy; 2025 Calmamente. Todos os direitos reservados.</p>
        <div class="links">
            <a href="#" id="termsLink">Termos de Serviço</a>
            <a href="#" id="privacyLink">Política de Privacidade</a>
            <a href="#" id="helpLink">Ajuda</a>
        </div>
    </footer>

    <div class="modal-overlay" id="termsModal">
        <div class="modal-content">
            <button class="close-button">&times;</button>
            <h2>Termos de Serviço</h2>
            <h3>1. Aceitação dos Termos</h3>
            <p>Ao acessar e utilizar o site Calmamente, você concorda em cumprir e estar vinculado a estes Termos de Uso. Se você não concorda com qualquer parte destes termos, por favor, não utilize nosso site.</p>
            <h3>2. Uso do Conteúdo</h3>
            <p>Todo o conteúdo fornecido neste site é apenas para fins informativos e educacionais. Não se destina a substituir aconselhamento profissional, diagnóstico ou tratamento. Sempre procure o conselho de um profissional de saúde qualificado para quaisquer perguntas que você possa ter sobre uma condição médica.</p>
            <h3>3. Propriedade Intelectual</h3>
            <p>Todo o conteúdo, design, gráficos, logotipos e outros materiais neste site são propriedade do Calmamente ou de seus licenciadores e são protegidos por leis de direitos autorais e marcas registradas. Você não pode reproduzir, distribuir, modificar ou criar trabalhos derivados de qualquer conteúdo sem permissão prévia por escrito.</p>
            <h3>4. Conduta do Usuário</h3>
            <p>Você concorda em usar o site de forma responsável e respeitosa. Não é permitido postar ou transmitir qualquer material que seja ilegal, difamatório, obsceno, ameaçador, invasivo da privacidade de terceiros, ou que possa constituir ou encorajar uma ofensa criminal, violar os direitos de qualquer parte ou que de outra forma dê origem a responsabilidade ou viole qualquer lei.</p>
            <h3>5. Limitação de Responsabilidade</h3>
            <p>O Calmamente não será responsável por quaisquer danos diretos, indiretos, incidentais, consequenciais ou punitivos decorrentes do seu acesso ou uso do site.</p>
            <h3>6. Modificações dos Termos</h3>
            <p>Reservamo-nos o direito de modificar estes Termos de Uso a qualquer momento. Quaisquer alterações serão efetivas imediatamente após a publicação no site. Seu uso continuado do site após a publicação de quaisquer alterações constitui sua aceitação dessas alterações.</p>
            <h3>7. Lei Aplicável</h3>
            <p>Estes Termos de Uso serão regidos e interpretados de acordo com as leis do Brasil.</p>
        </div>
    </div>

    <div class="modal-overlay" id="privacyModal">
        <div class="modal-content">
            <button class="close-button">&times;</button>
            <h2>Política de Privacidade</h2>
            <h3>1. Coleta de Informações</h3>
            <p>Coletamos informações que você nos fornece diretamente, como nome, endereço de e-mail e outras informações de contato quando você se registra, preenche um formulário ou interage com nossos serviços. Também podemos coletar automaticamente certas informações sobre seu dispositivo e uso do site, como endereço IP, tipo de navegador e páginas visitadas, por meio de cookies e tecnologias semelhantes.</p>
            <h3>2. Uso das Informações</h3>
            <p>Utilizamos as informações coletadas para: fornecer e melhorar nossos serviços; personalizar sua experiência no site; comunicar-nos com você sobre atualizações, promoções e informações relevantes; analisar o uso do site para otimizar o conteúdo e a funcionalidade; e garantir a segurança e a integridade de nossa plataforma.</p>
            <h3>3. Compartilhamento de Informações</h3>
            <p>Não vendemos, alugamos ou compartilhamos suas informações pessoais com terceiros, exceto nas seguintes circunstâncias: com seu consentimento explícito; para cumprir obrigações legais; para proteger nossos direitos, privacidade, segurança ou propriedade; ou com provedores de serviços que nos auxiliam na operação do site, desde que eles concordem em manter a confidencialidade de suas informações.</p>
            <h3>4. Segurança dos Dados</h3>
            <p>Implementamos medidas de segurança razoáveis para proteger suas informações contra acesso não autorizado, alteração, divulgação ou destruição. No entanto, nenhum método de transmissão pela internet ou armazenamento eletrônico é 100% seguro, e não podemos garantir segurança absoluta.</p>
            <h3>5. Seus Direitos</h3>
            <p>Você tem o direito de acessar, corrigir, atualizar ou solicitar a exclusão de suas informações pessoais a qualquer momento. Para exercer esses direitos, entre em contato conosco através dos canais fornecidos em nossa página de Contato.</p>
            <h3>6. Cookies</h3>
            <p>Nosso site utiliza cookies para melhorar sua experiência de navegação. Você pode configurar seu navegador para recusar todos ou alguns cookies, ou para alertá-lo quando os sites definirem ou acessarem cookies. No entanto, se você desativar ou recusar cookies, algumas partes do site podem se tornar inacessíveis ou não funcionar corretamente.</p>
            <h3>7. Links para Terceiros</h3>
            <p>Nosso site pode conter links para sites de terceiros. Não somos responsáveis pelas práticas de privacidade ou pelo conteúdo desses sites. Recomendamos que você revise as políticas de privacidade de qualquer site de terceiros que visitar.</p>
            <h3>8. Alterações a Esta Política</h3>
            <p>Podemos atualizar nossa Política de Privacidade periodicamente. Publicaremos quaisquer alterações nesta página e, se as alterações forem significativas, forneceremos um aviso mais proeminente. Recomendamos que você revise esta política regularmente para se manter informado sobre como protegemos suas informações.</p>
        </div>
    </div>

    <div class="modal-overlay" id="helpModal">
        <div class="modal-content">
            <button class="close-button">&times;</button>
            <h2>Ajuda e Suporte</h2>
            <h3>1. Como me Registro?</h3>
            <p>Para se registrar, clique no ícone de perfil no canto superior direito do cabeçalho e siga as instruções para criar sua conta. É rápido e fácil!</p>
            <h3>2. Onde Encontro as Atividades?</h3>
            <p>Todas as nossas atividades e recursos estão na seção "Atividades & Recursos" no menu principal. Lá você encontrará ferramentas como o registro de emoções, artigos e muito mais.</p>
            <h3>3. Como Posso Contribuir?</h3>
            <p>Se você tem sugestões, ideias ou deseja colaborar, por favor, entre em contato conosco através da página "Contato". Adoramos receber feedback e novas parcerias!</p>
            <h3>4. Problemas Técnicos?</h3>
            <p>Se estiver enfrentando algum problema técnico com o site, por favor, descreva o ocorrido em detalhes na nossa página de "Contato" ou envie um e-mail para suporte@calmamente.com.br. Nossa equipe fará o possível para ajudar.</p>
            <h3>5. Como Funciona o Fórum?</h3>
            <p>Nosso fórum é um espaço seguro para compartilhar experiências, fazer perguntas e oferecer apoio. Para participar, basta se registrar e seguir as regras da comunidade. Você pode criar novos tópicos ou responder aos existentes.</p>
            <h3>6. Posso Usar o Site no Celular?</h3>
            <p>Sim! O site Calmamente é totalmente responsivo e foi projetado para funcionar perfeitamente em dispositivos móveis, tablets e computadores.</p>
            <h3>7. Esqueci Minha Senha. O Que Faço?</h3>
            <p>Na tela de login, clique em "Esqueci minha senha" e siga as instruções para redefinir. Um link será enviado para o seu e-mail cadastrado.</p>
        </div>
    </div>

    <script>
        const stars = document.querySelectorAll('.star');
        const lumiContainer = document.getElementById('lumiContainer');
        const lumiBody = document.getElementById('lumiBody');
        const audioGiggle = document.getElementById('audio-giggle');

        // --- Interação 1: Alimentar com Estrelas (REINTEGRADA) ---
        stars.forEach(star => {
            star.addEventListener('click', function(event) {
                event.stopPropagation(); // ESSENCIAL: Impede que o clique na estrela acione a cócega.

                const starRect = star.getBoundingClientRect();
                const startX = starRect.left + starRect.width / 2;
                const startY = starRect.top + starRect.height / 2;

                const light = document.createElement('div');
                light.classList.add('star-light');
                document.body.appendChild(light);

                light.style.left = `${startX}px`;
                light.style.top = `${startY}px`;

                window.requestAnimationFrame(() => {
                    const lumiRect = lumiBody.getBoundingClientRect();
                    const endX = lumiRect.left + lumiRect.width / 2;
                    const endY = lumiRect.top + lumiRect.height / 2;

                    light.style.transform = `translate(${endX - startX}px, ${endY - startY}px)`;
                    light.style.opacity = '0';

                    light.addEventListener('transitionend', () => {
                        light.remove();
                        lumiBody.classList.add('is-fed');
                        setTimeout(() => {
                            lumiBody.classList.remove('is-fed');
                        }, 500);
                    }, {
                        once: true
                    });
                });
            });
        });

        // --- Interação 2: Cócegas ao Clicar no Lumi ---
        if (lumiContainer) {
            lumiContainer.addEventListener('click', function() {
                if (!lumiContainer.classList.contains('is-tickled')) {
                    if (audioGiggle) {
                        audioGiggle.currentTime = 0;
                        audioGiggle.play();
                    }
                    lumiContainer.classList.add('is-tickled');
                    setTimeout(() => {
                        lumiContainer.classList.remove('is-tickled');
                    }, 1000);
                }
            });
        }

        // --- SCRIPT PARA CONTROLAR O ÁUDIO DE FUNDO ---
        const playButtonMedo = document.getElementById('play-pause-button-medo');
        const audioConforto = document.getElementById('audio-conforto');
        // ... (resto do script de áudio e dropdown permanece igual)
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
			
			
			   /* FIM DO SCRIPT PARA MENU  DE USUÁRIO*/
			
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