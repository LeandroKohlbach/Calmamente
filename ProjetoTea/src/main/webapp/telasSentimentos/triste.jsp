<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Dao.DaoHistorico"%>
<%@ page import="modelos.Historico"%>
<%@ page import="modelos.Usuario"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Calmamente: O Show do Lumi</title>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
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

        body {
		    font-family: var(--fonte-corpo), sans-serif;
		    background-color: var(--cor-fundo-triste);
		    transition: background-color 2s ease;
		    overflow-y: auto; 
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

        .is-happy {
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
            background: radial-gradient(circle at 50% 100%, #fff, var(--cor-lumi-corpo) 70%);
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

        @keyframes star-spin {
            50% {
                transform: translateX(-50%) rotate(180deg) scale(1.3);
            }
            100% {
                transform: translateX(-50%) rotate(360deg) scale(1);
            }
        }

        @keyframes robot-glitch {
            0%, 100% {
                transform: translateX(-50%) skewX(0);
            }
            20% {
                color: #3498db;
                transform: translateX(-52%) skewX(10deg);
            }
            40% {
                transform: translateX(-48%) skewX(-10deg);
            }
            60% {
                opacity: 0.5;
                transform: translateX(-50%) scale(1.1);
            }
        }

        @keyframes ball-squash {
            30% {
                transform: translateX(-50%) translateY(10px) scale(1.2, 0.8);
            }
            60% {
                transform: translateX(-50%) translateY(-30px) scale(0.9, 1.1);
            }
        }

        @keyframes star-dance-loop {
            0%, 100% {
                transform: translate(-50%, 0) rotate(0deg) scale(1);
                text-shadow: 0 0 5px #F1C40F;
            }
            25% {
                transform: translate(-50%, 5px) scale(0.9, 1.1);
            }
            50% {
                transform: translate(-50%, -40px) rotate(180deg) scale(1.2);
                text-shadow: 0 0 15px #F1C40F, 0 0 25px #F1C40F;
            }
            75% {
                transform: translate(-50%, 5px) scale(1.1, 0.9);
            }
        }

        @keyframes robot-loop {
            0%, 100% {
                transform: translate(-50%, 0) skew(0, 0) rotate(0);
            }
            15% {
                transform: translate(-60%, -20px) skew(-10deg, -5deg);
            }
            30% {
                transform: translate(-50%, 0) skew(0, 0);
            }
            45% {
                transform: translate(-40%, -20px) skew(10deg, 5deg);
            }
            60% {
                transform: translate(-50%, 0) scale(1.1, 0.9);
            }
            80% {
                transform: translate(-50%, -50px) rotateY(360deg) scale(0.9, 1.1);
                opacity: 0.8;
            }
        }

        @keyframes ball-bounce-loop {
            0%, 100% {
                transform: translate(-50%, 0) scale(1, 1);
                animation-timing-function: ease-in;
            }
            10% {
                transform: translate(-50%, 0) scale(1.2, 0.8);
            }
            50% {
                transform: translate(-50%, -120px) scale(1, 1);
                animation-timing-function: ease-out;
            }
            90% {
                transform: translate(-50%, 0) scale(1.2, 0.8);
            }
            95% {
                transform: translate(-50%, -20px) scale(1, 1);
                animation-timing-function: ease-out;
            }
        }

        @keyframes breathe-sad {
            50% {
                transform: scale(0.8) translateY(-5px);
            }
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

        @keyframes blink {
            0%, 90%, 100% {
                transform: scaleY(1);
            }
            95% {
                transform: scaleY(0.1);
            }
        }

        @keyframes laughAnimation {
            0% {
                transform: scale(0.8) translateX(0) rotate(0);
            }
            15% {
                transform: scale(0.8) translateX(-8px) rotate(-4deg);
            }
            30% {
                transform: scale(0.8) translateX(8px) rotate(4deg);
            }
            45% {
                transform: scale(0.8) translateX(-8px) rotate(-4deg);
            }
            60% {
                transform: scale(0.8) translateX(8px) rotate(4deg);
            }
            75% {
                transform: scale(0.8) translateX(-5px) rotate(-2deg);
            }
            90% {
                transform: scale(0.8) translateX(5px) rotate(2deg);
            }
            100% {
                transform: scale(0.8) translateX(0) rotate(0);
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes fadeInDropdown {
            from {
                opacity: 0;
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
        
        img {
            width: 80px; /* Logo um pouco maior */
            height: auto; /* Mantém a proporção */
            margin-right: 20px;
        }
    </style>
</head>
<body>

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
                    <i class="fas fa-star puppet-icon" style="color: #F1C40F;"></i><span>Estrela Dançante</span>
                </div>
                <div class="puppet-choice" data-puppet="robot">
                    <i class="fas fa-robot puppet-icon" style="color: #7F8C8D;"></i><span>Robô Maluco</span>
                </div>
                <div class="puppet-choice" data-puppet="ball">
                    <i class="fas fa-basketball-ball puppet-icon" style="color: #E74C3C;"></i><span>Bola Saltitante</span>
                </div>
            </div>
            <button id="restart-button" class="restart-button">Começar de Novo</button>
        </div>
    </main>

    <audio id="laughAudio" src="${pageContext.request.contextPath}/audios/audio-risada.mp3" preload="auto"></audio>

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
        /* SCRIPT PARA MENU DE USUÁRIO - ESTE É O QUE VAI FUNCIONAR */
        const userProfileBtn = document.getElementById('userProfileBtn');
        const userDropdown = document.getElementById('userDropdown');
        
        if (userProfileBtn && userDropdown) { // Verificação para garantir que os elementos existem
            userProfileBtn.addEventListener('click', (event) => {
                event.stopPropagation(); // Impede que o clique se propague para o window listener
                userDropdown.classList.toggle('show');
            });
        
            // Fecha o dropdown se clicar fora dele
            window.addEventListener('click', (event) => {
                // Certifica-se de que o clique não foi no botão de perfil nem dentro do dropdown
                if (!userProfileBtn.contains(event.target) && !userDropdown.contains(event.target)) {
                    userDropdown.classList.remove('show');
                }
            });
        }
        /* FIM DO SCRIPT PARA MENU DE USUÁRIO */
        
        // --- SCRIPT PARA OS MODAIS (TERMOS, PRIVACIDADE E AJUDA) ---
        
        // Modal de Termos de Uso
        const openTermsModalBtn = document.getElementById('termsLink');
        const termsModalOverlay = document.getElementById('termsModal');
        
        if (openTermsModalBtn) {
           openTermsModalBtn.addEventListener('click', (event) => {
               event.preventDefault();
               termsModalOverlay.classList.add('active');
               document.body.style.overflow = 'hidden';
           });
        }
        
        // Modal de Política de Privacidade
        const openPrivacyModalBtn = document.getElementById('privacyLink');
        const privacyModalOverlay = document.getElementById('privacyModal');
        
        if (openPrivacyModalBtn) {
           openPrivacyModalBtn.addEventListener('click', (event) => {
               event.preventDefault();
               privacyModalOverlay.classList.add('active');
               document.body.style.overflow = 'hidden';
           });
        }
        
        // Modal de Ajuda
        const openHelpModalBtn = document.getElementById('helpLink');
        const helpModalOverlay = document.getElementById('helpModal');
        
        if (openHelpModalBtn) {
           openHelpModalBtn.addEventListener('click', (event) => {
               event.preventDefault();
               helpModalOverlay.classList.add('active');
               document.body.style.overflow = 'hidden';
           });
        }
        
        // --- Botão Genérico de Fechar e Clique no Overlay para todos os Modais ---
        // Seleciona todos os botões de fechar
        const closeButtons = document.querySelectorAll('.modal-content .close-button');
        closeButtons.forEach(button => {
           button.addEventListener('click', (event) => {
               event.target.closest('.modal-overlay').classList.remove('active');
               document.body.style.overflow = '';
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
        
        // --- ELEMENTOS DO JOGO ---
        const stage = document.getElementById('stage');
        const lumiContainer = document.getElementById('lumiContainer');
        const lumiBody = document.getElementById('lumiBody');
        const lumiMouth = document.getElementById('lumiMouth');
        const lumiEyebrows = document.getElementById('lumiEyebrows');
        const mainTitle = document.getElementById('main-title');
        const mainText = document.getElementById('main-text');
        const restartButton = document.getElementById('restart-button');
        const puppetChoices = document.querySelectorAll('.puppet-choice');
        // REMOVIDA A DECLARAÇÃO userProfileBtn e userDropdownMenu AQUI, JÁ QUE SÃO DECLARADAS ACIMA E userDropdownMenu ESTAVA INCORRETA.
        const laughAudio = document.getElementById('laughAudio');
        
        // --- ESTADO DO JOGO ---
        let currentPuppetOnStage = null;
        let puppetsShown = new Set();
        let isShowOver = false;
        
        // FUNÇÃO DE ESTILO COM A NOVA SEQUÊNCIA DE SORRISOS
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
                        showPuppet(choice, false);
                        return;
                    }
                    if (choice.classList.contains('is-used')) {
                        showPuppet(choice, false);
                    } else {
                        showPuppet(choice, true);
                    }
                });
            });
            restartButton.addEventListener('click', resetGame);
            // CÓDIGO DO MENU DE USUÁRIO REMOVIDO DAQUI
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
        
        // LÓGICA DE REAÇÃO ATUALIZADA PARA A NOVA SEQUÊNCIA
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