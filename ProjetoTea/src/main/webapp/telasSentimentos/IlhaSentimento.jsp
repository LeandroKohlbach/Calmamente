<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Calmamente: Ilha dos Sentimentos</title>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="../CSS/headerLogado.css">
    <style>
        /* Variáveis de Cores e Fontes */
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

        /* Variáveis de Cores e Fontes - Mais VIBRANTES e LÚDICAS */
        :root {
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


        /* Tamanho específico para o Sobre Nós */
        .nav-link.about-us {
            font-size: 1.45rem; /* Tamanho do Sobre Nós */
        }

        /* === INÍCIO: ESTILOS PARA O MENU DE USUÁRIO === */
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
            box-shadow: 0 4px 8px rgba(0,0,0,0.2); /* SOMBRA MAIS PROEMINENTE */
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
            outline: none; /* Remove outline no focus */
            flex-shrink: 0; /* Não encolher */
        }

        .user-profile-button:hover {
            background-color: #9966FF; /* Roxo um pouco mais escuro */
            transform: translateY(-3px); /* Efeito de "levitar" mais pronunciado */
            box-shadow: 0 6px 12px rgba(0,0,0,0.3); /* Sombra maior no hover */
        }

        .dropdown-content {
            display: none; /* Escondido por padrão */
            position: absolute;
            top: calc(100% + 15px); /* Posição um pouco mais abaixo do botão */
            right: 0;
            background-color: var(--cor-nuvem);
            min-width: 250px; /* MAIOR LARGURA */
            box-shadow: 0 10px 20px 0 rgba(0,0,0,0.25); /* SOMBRA MAIS SUAVE E ESPALHADA */
            border-radius: 20px; /* MAIS ARREDONDADO */
            z-index: 1001; /* Garante que fique acima de outros elementos */
            overflow: hidden; /* Garante que os filhos respeitem o border-radius */
            animation: fadeInScale 0.3s ease-out forwards; /* Animação ao aparecer */
            border: 1px solid var(--cor-borda-elementos); /* Borda suave */
        }

        /* Classe 'show' que será adicionada via JavaScript para exibir o menu */
        .dropdown-content.show {
            display: block;
        }

        .dropdown-content .user-info {
            padding: 1.2rem 1.5rem; /* UM POUCO MAIS DE PADDING */
            font-family: var(--fonte-titulo);
            font-size: 1.4rem; /* TEXTO MAIOR */
            color: var(--cor-texto-escuro);
            background-color: #f0f8ff; /* Fundo suave para o nome de usuário */
            border-bottom: 1px solid var(--cor-borda-elementos); /* Separador */
            text-align: center; /* Centraliza o texto */
        }

        .dropdown-content .user-info strong {
            color: var(--cor-roxo-divertido);
            display: block; /* Garante que o nome de usuário fique em sua própria linha */
            margin-top: 5px;
        }

        .dropdown-content a {
            color: var(--cor-texto-medio);
            padding: 1rem 1.5rem;
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

        /* === FIM: ESTILOS PARA O MENU DE USUÁRIO === */

        /* ===========
        SCROLLBAR
        =========== */
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
            background: var(--cor-primaria-acao); /* Cor do "polegar" (draggable part) do scrollbar */
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
        FOOTER
        ===========*/
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
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        /* Estilos para Modais (Termos de Uso, Política de Privacidade, Ajuda) */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6); /* Fundo semi-transparente escuro */
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 10000; /* Garante que fique acima de tudo */
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.3s ease, visibility 0.3s ease;
        }

        .modal-overlay.active {
            opacity: 1;
            visibility: visible;
        }

        .modal-content {
            background-color: var(--cor-nuvem);
            padding: 2.5rem 3.5rem; /* Mais espaçoso */
            border-radius: 25px; /* Mais arredondado */
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3); /* Sombra mais pronunciada */
            max-width: 700px; /* Largura máxima */
            width: 90%;
            position: relative;
            transform: translateY(-20px) scale(0.95); /* Começa um pouco acima e menor */
            transition: transform 0.3s ease, opacity 0.3s ease;
            max-height: 80vh; /* Altura máxima para conteúdo rolável */
            overflow-y: auto; /* Adiciona rolagem se o conteúdo for grande */
        }

        .modal-overlay.active .modal-content {
            transform: translateY(0) scale(1); /* Desliza para a posição final e tamanho normal */
            opacity: 1;
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
            z-index: 10; /* Garante que o botão esteja clicável */
        }

        .close-button:hover {
            color: var(--cor-terciaria-acao);
            transform: rotate(90deg) scale(1.1);
        }
        /* FIM DOS ESTILOS DE MODAIS */

        /* Reset Básico */
        body, h1, h2, h3, p, ul, li, button { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Nunito', sans-serif;
            background-color: #E0F7FA;
            color: #333333;
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

        /* Estilo para as nuvens */
        .cloud {
            position: absolute;
            background: #FFFFFF;
            border-radius: 50%;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            animation: moveCloud 30s linear infinite;
            z-index: 0;
        }
        .cloud.small { width: 80px; height: 50px; }
        .cloud.medium { width: 120px; height: 70px; }
        .cloud.large { width: 150px; height: 90px; }
        .cloud:nth-child(1) { top: 10%; left: 5%; animation-duration: 25s; }
        .cloud:nth-child(2) { top: 20%; left: 40%; animation-duration: 35s; animation-delay: -10s; }
        .cloud:nth-child(3) { top: 15%; right: 5%; animation-duration: 40s; animation-delay: -20s; }
        .cloud:nth-child(4) { top: 30%; left: 15%; animation-duration: 30s; animation-delay: -5s; }
        .cloud:nth-child(5) { top: 25%; right: 20%; animation-duration: 38s; animation-delay: -15s; }

        @keyframes moveCloud {
            0% { transform: translateX(-100vw); }
            100% { transform: translateX(200vw); }
        }


        /* Seção Emoções */
        .emotions-section {
            background-color: #FFFFFF;
            padding: 3rem 4rem;
            border-radius: 30px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 600px;
            width: 100%;
            border: 2px solid rgba(0, 0, 0, 0.15);
        }

        .emotions-section h2 {
            font-family: 'Fredoka', sans-serif;
            font-size: 3rem;
            color: #B388FF;
            margin-bottom: 2.5rem;
            text-shadow: 1px 1px 0px rgba(0,0,0,0.05);
        }

        .emotions-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 2rem;
            justify-content: center;
            place-items: center;
            margin: 0 auto;
        }

        .emotion-card {
            width: 170px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
            padding: 1.5rem 1rem;
            background-color: #E0F7FA;
            border-radius: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
            border: 1px solid rgba(0, 0, 0, 0.15);
        }

        .emotion-card:hover {
            transform: translateY(-8px) scale(1.03);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            background-color: #F0F8FF;
        }

        .emotion-card .icon-emotion {
            font-size: 5rem;
            color: #66CCFF;
            margin-bottom: 0.5rem;
            transition: transform 0.3s ease;
        }

        .emotion-card:hover .icon-emotion {
            transform: scale(1.1) rotate(5deg);
        }

        /* Cores dos ícones */
        .emotion-card.ansioso .icon-emotion { color: #FFB800; }
        .emotion-card.medo .icon-emotion { color: #8A2BE2; }
        .emotion-card.bravo .icon-emotion { color: #FF4500; }
        .emotion-card.triste .icon-emotion { color: #3366FF; }
        .emotion-card.feliz .icon-emotion { color: #00CC66; }
        .emotion-card.calmo .icon-emotion { color: #66CCFF; }

        .emotion-card p {
            font-family: 'Fredoka', sans-serif;
            font-size: 1.6rem;
            font-weight: 700;
            color: #333333;
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

        /* Responsividade (não precisa de mudanças aqui, já estava correto) */
        @media (max-width: 1024px) {
            .emotions-section h2 { font-size: 2.5rem; }
            .emotions-grid { grid-template-columns: repeat(2, 1fr); /* Mantém 2 colunas */ }
            .emotion-card .icon-emotion { font-size: 4rem; }
            .emotion-card p { font-size: 1.4rem; }
        }

        @media (max-width: 768px) {
            header { flex-direction: column; align-items: center; padding: 1rem 3%; }
            .logo { margin-bottom: 0.8rem; font-size: 1.8rem; }
            /* Ajuste para o botão do perfil no mobile */
            .nav-buttons {
                width: 100%; /* Ocupa a largura total */
                display: flex;
                justify-content: flex-end; /* Alinha o botão do perfil à direita no mobile */
            }
            .user-profile-button {
                margin-left: auto; /* Empurra para a direita */
                margin-right: 0;
            }
            /* Fim do ajuste */

            main { padding: 1.5rem; }
            .emotions-section { padding: 2rem 1rem; }
            .emotions-section h2 { font-size: 2rem; margin-bottom: 2rem; }
            .emotions-grid { grid-template-columns: repeat(2, 1fr); gap: 1.5rem; }
            .emotion-card .icon-emotion { font-size: 3.5rem; }
            .emotion-card p { font-size: 1.2rem; }
            footer { padding: 2rem 3%; font-size: 0.9rem; }
            footer .links { flex-direction: column; gap: 0.5rem; }
        }

        @media (max-width: 480px) {
            .emotions-grid { grid-template-columns: 1fr; }
            .emotions-section h2 { font-size: 1.8rem; }
            .emotion-card .icon-emotion { font-size: 3rem; }
            .emotion-card p { font-size: 1.1rem; }
            .logo {
                font-size: 1.6rem;
            }
            .user-profile-button {
                width: 40px;
                height: 40px;
                font-size: 1.4rem;
            }
            .dropdown-content {
                min-width: 180px;
                top: calc(100% + 10px);
                right: 0;
                font-size: 0.9rem;
            }
            .dropdown-content .user-info {
                font-size: 1rem;
            }
            .dropdown-content a {
                font-size: 0.95rem;
            }
            .dropdown-content a i {
                font-size: 1.1rem;
            }
        }

        /* ESTILOS PARA O OVERLAY DE CARREGAMENTO (COPIADO DA HOME LOGADO) */
        .loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.95); /* Fundo um pouco mais opaco */
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999; /* Garante que fique acima de tudo */
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.5s ease, visibility 0.5s ease; /* Transição mais suave e longa */
        }

        .loading-overlay.show {
            opacity: 1;
            visibility: visible;
        }

        .loading-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            background-color: var(--cor-nuvem);
            padding: 3.5rem 5rem; /* Um pouco mais de padding */
            border-radius: 30px; /* Bordas mais arredondadas */
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3); /* Sombra mais pronunciada */
            transform: scale(0.8); /* Inicia menor */
            animation: popIn 0.6s cubic-bezier(0.68, -0.55, 0.27, 1.55) forwards; /* Animação de pop mais "saltitante" */
            border: 4px solid var(--cor-primaria-acao); /* Borda mais forte */
        }

        /* Chaveamento para uma animação de "pop" mais divertida */
        @keyframes popIn {
            0% { transform: scale(0.5); opacity: 0; }
            70% { transform: scale(1.1); opacity: 1; }
            100% { transform: scale(1); }
        }

        .loading-content p {
            font-family: var(--fonte-titulo);
            font-size: 2rem; /* Texto um pouco maior */
            color: var(--cor-roxo-divertido);
            text-align: center;
            line-height: 1.3;
            animation: textPulse 1.8s infinite ease-in-out; /* Velocidade do pulso levemente alterada */
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1); /* Sombra suave no texto */
        }

        @keyframes textPulse {
            0% { transform: scale(1); opacity: 1; }
            50% { transform: scale(1.08); opacity: 0.8; } /* Pulsa mais e fica levemente transparente */
            100% { transform: scale(1); opacity: 1; }
        }

        /* Animação do Spinner (opção 1: icone giratório) - MAIS ANIMADO */
        .spinner {
            width: 90px; /* Um pouco maior */
            height: 90px; /* Um pouco maior */
            border: 10px solid var(--cor-primaria-acao); /* Borda mais grossa */
            border-top: 10px solid var(--cor-secundaria-acao); /* Borda mais grossa */
            border-radius: 50%;
            animation: spinAndPulse 1.5s cubic-bezier(0.68, -0.55, 0.27, 1.55) infinite; /* Animação combinada de girar e pulsar */
            box-shadow: 0 0 15px rgba(0,0,0,0.2); /* Sombra sutil no spinner */
        }

        /* Nova animação combinada para o spinner */
        @keyframes spinAndPulse {
            0% { transform: rotate(0deg) scale(1); }
            25% { transform: rotate(90deg) scale(1.1); } /* Pulsa no 1/4 do giro */
            50% { transform: rotate(180deg) scale(1); }
            75% { transform: rotate(270deg) scale(1.1); } /* Pulsa novamente */
            100% { transform: rotate(360deg) scale(1); }
        }
        /* FIM DOS ESTILOS PARA O OVERLAY DE CARREGAMENTO */
        
        img{
            width: 80px; /* Logo um pouco maior */
            height: auto; /* Mantém a proporção */
            margin-right: 20px;
        }
        
    </style>
</head>
<body>
    <div id="loadingOverlay" class="loading-overlay">
        <div class="loading-content">
            <div class="spinner"></div>
            <p>Registrando sua emoção...</p>
        </div>
    </div>

    <div class="cloud small" style="top: 10%; left: 5%;"></div>
    <div class="cloud medium" style="top: 20%; left: 40%;"></div>
    <div class="cloud large" style="top: 15%; right: 5%;"></div>
    <div class="cloud small" style="top: 30%; left: 15%;"></div>
    <div class="cloud medium" style="top: 25%; right: 20%;"></div>

    <header>
        <img src="../imagens/logo.png" alt="">
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
                    Olá, <strong><%
                            String userName = (String) session.getAttribute("usuarioLogado");
                            if (userName == null || userName == "") { // Corrigido para comparação segura com String vazia
                                userName = "Usuário";
                            }
                            out.print(userName);
                        %></strong>!
                </div>
                <a href="../EditarPerfil.jsp"><i class="fas fa-pencil-alt"></i> Editar Perfil</a>
                <a href="../telasHome/Home.html"><i class="fas fa-sign-out-alt"></i> Sair</a>
            </div>
        </div>
    </header>

    <main>
        <section class="emotions-section">
            <h2>Descubra o Mundo das Emoções!</h2>
            <div class="emotions-grid">
                <div class="emotion-card ansioso" data-emotion="ansioso">
                    <i class="far fa-frown-open icon-emotion"></i>
                    <p>Ansioso</p>
                </div>
                <div class="emotion-card medo" data-emotion="medo">
                    <i class="far fa-grimace icon-emotion"></i>
                    <p>Medo</p>
                </div>
                <div class="emotion-card bravo" data-emotion="bravo">
                    <i class="far fa-angry icon-emotion"></i>
                    <p>Bravo</p>
                </div>
                <div class="emotion-card triste" data-emotion="triste">
                    <i class="far fa-sad-tear icon-emotion"></i>
                    <p>Triste</p>
                </div>
            </div>
        </section>
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
            <p>Utilizamos as informações coletadas para: fornecer e melhorar nossos serviços; personalizar sua experiência no site; comunicarmo-nos com você sobre atualizações, promoções e informações relevantes; analisar o uso do site para otimizar o conteúdo e a funcionalidade; e garantir a segurança e a integridade de nossa plataforma.</p>
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
            <p>Podemos atualizar esta Política de Privacidade periodicamente. Quaisquer alterações serão publicadas nesta página com a data de revisão atualizada. Seu uso contínuo do site após a publicação de quaisquer alterações constitui sua aceitação dessas alterações.</p>
        </div>
    </div>

    <div class="modal-overlay" id="helpModal">
        <div class="modal-content">
            <button class="close-button">&times;</button>
            <h2>Central de Ajuda</h2>
            <h3>1. Perguntas Frequentes (FAQ)</h3>
            <p><strong>Como faço para me cadastrar?</strong> Clique em "Registrar" no canto superior direito e preencha o formulário com suas informações.</p>
            <p><strong>Esqueci minha senha, e agora?</strong> Na tela de login, clique em "Esqueceu a senha?" e siga as instruções para redefini-la.</p>
            <p><strong>Como altero meus dados de perfil?</strong> Após fazer login, clique no ícone do seu perfil no canto superior direito e selecione "Editar Perfil".</p>
            <p><strong>O que são as atividades e recursos?</strong> São ferramentas e conteúdos para auxiliar no seu bem-estar emocional, como exercícios de respiração, meditações guiadas e artigos informativos.</p>
            <h3>2. Suporte Técnico</h3>
            <p>Se você encontrar algum problema técnico ou tiver dificuldades ao usar o site, por favor, entre em contato com nossa equipe de suporte através do email: <strong>suporte@calmamente.com.br</strong> ou pelo telefone: <strong>(XX) XXXX-XXXX</strong>. Descreva o problema detalhadamente para que possamos ajudá-lo de forma eficiente.</p>
            <h3>3. Feedback e Sugestões</h3>
            <p>Sua opinião é muito importante para nós! Se você tiver sugestões de melhorias, novas ideias ou quiser deixar um feedback sobre sua experiência no Calmamente, por favor, envie um e-mail para: <strong>feedback@calmamente.com.br</strong>. Agradecemos sua colaboração para construirmos uma plataforma cada vez melhor.</p>
        </div>
    </div>
    <script>
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

        document.addEventListener('DOMContentLoaded', () => {
            const emotionCards = document.querySelectorAll('.emotion-card');
            const loadingOverlay = document.getElementById('loadingOverlay'); // Get the loading overlay element

            // Recupera o ID do usuário da sessão e o passa para o JavaScript
            // Garante que userId seja um número ou null
            const userId = <%= session.getAttribute("userId") instanceof Integer ? session.getAttribute("userId") : "null" %>;

            emotionCards.forEach(card => {
                card.addEventListener('click', (event) => { // Pass event object
                    event.preventDefault(); // Prevent default navigation immediately
                    const emotion = card.dataset.emotion.toLowerCase();
                    const page = emotion + ".jsp"; // Página de destino após o registro

                    loadingOverlay.classList.add('show'); // Mostra o overlay de carregamento

                    // Prepara os dados a serem enviados
                    const dataToSend = new URLSearchParams();
                    dataToSend.append('tipoEmocao', emotion);
                    if (userId !== null) { // Apenas envia userId se ele existir
                        dataToSend.append('fkUsuarioId', userId);
                    } else {
                        console.warn('Usuário ID não encontrado na sessão. A emoção será registrada sem associação de usuário.');
                    }

                    // Nota: 'urlImagemEstrategia' não está sendo enviada do frontend.
                    // Ela será definida no 'registrarEmocao.jsp' ou no DAO/Controller.

                    // Envia requisição assíncrona para o JSP handler
                    fetch('../registrarEmocao.jsp', { // Caminho para o handler de registro
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: dataToSend.toString()
                    })
                    .then(response => {
                        if (!response.ok) {
                            console.error('Erro ao registrar emoção no servidor:', response.status, response.statusText);
                            // Opcional: Ler a mensagem de erro do JSON da resposta
                            // return response.json().then(data => console.error("Mensagem do servidor:", data.message));
                        }
                        return response.text(); // Lê a resposta como texto (pode ser JSON ou apenas status)
                    })
                    .then(data => {
                        console.log("Resposta do servidor:", data);
                        // Navega para a próxima página após um pequeno atraso, independentemente do sucesso do fetch
                        setTimeout(() => {
                            window.location.href = page;
                        }, 1500); // 1.5 segundos de atraso para a animação de carregamento
                    })
                    .catch(error => {
                        console.error('Erro na requisição fetch:', error);
                        // Navega para a próxima página mesmo se houver um erro de rede
                        setTimeout(() => {
                            window.location.href = page;
                        }, 1500);
                    });
                });
            });

            // === SCRIPT PARA O MENU DROPDOWN (COPIADO DA HOME LOGADO) ===
            const userProfileBtn = document.getElementById('userProfileBtn');
            const userDropdownMenu = document.getElementById('userDropdownMenu');

            // Exibe ou esconde o dropdown quando o botão é clicado
            userProfileBtn.addEventListener('click', function(event) {
                event.stopPropagation(); // Impede que o evento de clique se propague para a janela
                userDropdownMenu.classList.toggle('show');
            });

            // Fecha o dropdown se o usuário clicar fora dele
            window.addEventListener('click', function(event) {
                if (userDropdownMenu.classList.contains('show')) {
                    if (!userProfileBtn.contains(event.target) && !userDropdownMenu.contains(event.target)) {
                        userDropdownMenu.classList.remove('show');
                    }
                }
            });
            // === FIM: SCRIPT PARA O MENU DROPDOWN ===
        });
    </script>
</body>
</html>