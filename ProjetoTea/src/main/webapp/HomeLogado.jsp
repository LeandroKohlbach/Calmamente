
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calmamente: Bem-vindo(a)!</title>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="../CSS/Nuvens.css">
    <link rel="stylesheet" type="text/css" href="../CSS/Footer.css">
    <link rel="stylesheet" type="text/css" href="../CSS/BotaoFeedback.css">
    
    <style>
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

        /* Reset Básico */
        body, h1, h2, h3, p, ul, li, button {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: var(--fonte-corpo);
            background-color: var(--cor-fundo-principal); /* Fundo branco suave */
            color: var(--cor-texto-escuro);
            line-height: 1.6;
            overflow-x: hidden;
            min-height: 100vh; /* Ocupa a altura total da viewport */
            display: flex;
            flex-direction: column;
            /* REMOVIDO: Padrão de fundo sutil para mais ludicidade */
            /* background-image: radial-gradient(circle at top left, var(--cor-grama-clara) 5%, transparent 5%),
                              radial-gradient(circle at bottom right, var(--cor-primaria-acao) 5%, transparent 5%);
            background-size: 80px 80px;
            background-repeat: repeat; */
        }

        /* ----- ESTILOS PARA O SCROLLBAR ----- */
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
        /* ----- FIM DOS ESTILOS PARA O SCROLLBAR ----- */

        main {
            flex-grow: 1; /* Faz o main ocupar o espaço restante */
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem 0; /* Ajusta o padding para centralizar o conteúdo */
        }

        /* Nuvens desnecessárias se o fundo não é mais céu */
        .cloud {
            display: none; /* Esconde as nuvens */
        }

        /* Cabeçalho - Mais Lúdico */
        header {
            background-color: var(--cor-primaria-acao); /* Azul para o céu */
            padding: 1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px var(--cor-sombra-leve);
            border-bottom-left-radius: 35px; /* MAIS ARREDONDADO */
            border-bottom-right-radius: 35px; /* MAIS ARREDONDADO */
            position: relative;
            z-index: 1000;
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
            transform: scale(1.08) rotate(-3deg); /* MAIS BRINCALHÃO */
            text-shadow: 4px 4px 0 rgba(0,0,0,0.2);
        }
        
        /* === INÍCIO: ESTILOS PARA O MENU DE USUÁRIO === */

        .nav-buttons {
            position: relative; /* Necessário para posicionar o dropdown */
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

        /* ADICIONADO: Efeito de "batida" no ícone do usuário */
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
        
        /* === FIM: ESTILOS PARA O MENU DE USUÁRIO === */
        
        /* Seção Principal (Hero) - REMOVIDA */
        .hero-world {
            display: none; /* Esconde toda a seção Hero */
        }

        /* Seção "Nossas Ilhas de Aventura" - Ajustada para ser o conteúdo principal */
        .adventure-islands {
            background-color: var(--cor-fundo-principal); /* Fundo branco suave */
            padding: 4rem 5%;
            text-align: center;
            border-radius: 40px; /* Bordas arredondadas para o container principal - MAIS ARREDONDADO */
            box-shadow: 0 15px 30px rgba(0,0,0,0.15); /* Sombra para destacá-lo - MAIS PROEMINENTE */
            position: relative;
            width: 100%;
            max-width: 1100px; /* Limita a largura para melhor visualização */
            margin: 0 auto; /* Centraliza */
            /* ADICIONADO: Borda colorida para um visual mais divertido */
            border: 4px solid var(--cor-grama-escura);
        }

        .adventure-islands h2 {
            font-family: var(--fonte-titulo);
            font-size: 4rem; /* MAIOR E MAIS IMPONENTE */
            color: var(--cor-roxo-divertido); /* Cor divertida para o título */
            margin-bottom: 3.5rem; /* MAIOR MARGEM */
            text-shadow: 3px 3px 0px rgba(0,0,0,0.08); /* SOMBRA MAIS PROEMINENTE */
            line-height: 1.1;
            /* ADICIONADO: Animação de entrada */
            animation: bounceIn 1s ease-out;
        }

        @keyframes bounceIn {
            0% { transform: scale(0.5); opacity: 0; }
            70% { transform: scale(1.05); opacity: 1; }
            100% { transform: scale(1); }
        }

        .island-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 3rem; /* MAIOR ESPAÇAMENTO ENTRE CARDS */
        }

        /* ESTILOS PARA OS CARDS DAS ILHAS E SEUS BOTÕES */
        .island-card {
            background-color: var(--cor-nuvem); /* Fundo branco para os cards (para contraste) */
            border-radius: 35px; /* MAIS ARREDONDADO */
            padding: 3rem; /* MAIOR PADDING */
            width: calc(33% - 3rem); /* Permite 3 cards por linha com gap */
            max-width: 320px; /* Limita o tamanho máximo de cada card */
            box-shadow: 0 10px 20px var(--cor-sombra-leve); /* SOMBRA MAIS FORTE */
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 3px solid var(--cor-borda-elementos); /* Borda mais forte */
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            position: relative;
            overflow: hidden; /* Para o efeito de brilho */
        }

        /* ADICIONADO: Efeito de brilho ao hover do card */
        .island-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: all 0.5s ease;
            transform: skewX(-20deg);
        }

        .island-card:hover::before {
            left: 100%;
        }

        .island-card:hover {
            transform: translateY(-15px) scale(1.03) rotate(-2deg); /* MAIS EFEITO NO HOVER */
            box-shadow: 0 15px 30px rgba(0,0,0,0.25);
            border-color: var(--cor-primaria-acao); /* Borda fica azul ao hover */
        }

        .island-card .icon-wrapper {
            background: linear-gradient(45deg, var(--cor-primaria-acao), var(--cor-secundaria-acao));
            border-radius: 50%;
            width: 110px; /* ÍCONE MAIOR */
            height: 110px; /* ÍCONE MAIOR */
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 1.8rem auto; /* MAIOR MARGEM */
            font-size: 4.5rem; /* ÍCONE MAIOR */
            color: var(--cor-texto-claro);
            box-shadow: 0 5px 10px rgba(0,0,0,0.3); /* SOMBRA MAIS PROEMINENTE */
            transition: transform 0.3s ease, background 0.3s ease;
            border: 4px solid var(--cor-texto-claro); /* Borda branca destacada */
        }
        .island-card:hover .icon-wrapper {
            transform: rotate(15deg) scale(1.05); /* MAIOR ROTAÇÃO E ESCALA */
            background: linear-gradient(45deg, var(--cor-secundaria-acao), var(--cor-primaria-acao)); /* Inverte o degradê */
        }

        /* Cores de fundo dos ícones dos cards */
        .island-card:nth-child(1) .icon-wrapper { background: linear-gradient(45deg, var(--cor-terciaria-acao), #FF66A3); } /* Rosa */
        .island-card:nth-child(2) .icon-wrapper { background: linear-gradient(45deg, var(--cor-secundaria-acao), #FFB800); } /* Amarelo */
        .island-card:nth-child(3) .icon-wrapper { background: linear-gradient(45deg, var(--cor-primaria-acao), #3399FF); } /* Azul */
        /* ADICIONADO: Card extra para demonstração, se quiser mais tarde */
        .island-card:nth-child(4) .icon-wrapper { background: linear-gradient(45deg, #B388FF, #9966FF); } /* Roxo */

        .island-card h3 {
            font-family: var(--fonte-titulo);
            font-size: 2.2rem; /* TÍTULO MAIOR */
            color: var(--cor-roxo-divertido);
            margin-bottom: 1.2rem;
            line-height: 1.2;
            text-shadow: 1px 1px 0px rgba(0,0,0,0.05);
        }

        .island-card p {
            font-family: var(--fonte-corpo);
            font-size: 1.2rem; /* TEXTO MAIOR */
            color: var(--cor-texto-medio);
            margin-bottom: 2rem; /* MAIOR MARGEM */
            line-height: 1.6;
            word-break: break-word;
        }

        /* ESTILOS ESPECÍFICOS PARA OS BOTÕES DENTRO DOS CARDS DAS ILHAS */
        .island-card .btn-explorar {
            background-color: var(--cor-primaria-acao); /* Mantém o azul primário */
            color: var(--cor-texto-claro);
            padding: 1rem 2.2rem; /* MAIOR PADDING */
            border: none;
            border-radius: 50px; /* MAIS ARREDONDADO, QUASE UMA PÍLULA */
            font-family: var(--fonte-titulo);
            font-size: 1.3rem; /* TEXTO MAIOR */
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 5px 10px rgba(0,0,0,0.25); /* SOMBRA MAIS FORTE */
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px; /* MAIOR ESPAÇAMENTO */
            margin: 2rem auto 0.5rem auto; /* MAIOR MARGEM SUPERIOR */
            max-width: 250px; /* Limita a largura do botão */
            text-decoration: none;
            /* ADICIONADO: Gradiente sutil */
            background: linear-gradient(135deg, var(--cor-primaria-acao) 0%, #33AADD 100%);
            border: 2px solid var(--cor-texto-claro); /* Borda branca para destacar */
        }
        .island-card .btn-explorar:hover {
            background-color: #33AADD; /* Azul um pouco mais escuro no hover */
            transform: translateY(-5px) scale(1.05); /* MAIOR EFEITO DE HOVER */
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
            background: linear-gradient(135deg, #33AADD 0%, var(--cor-primaria-acao) 100%); /* Inverte o gradiente */
        }
        .island-card .btn-explorar i {
            font-size: 1.5rem; /* ÍCONE MAIOR */
            color: var(--cor-secundaria-acao); /* Amarelo no ícone */
            text-shadow: 1px 1px 0 rgba(0,0,0,0.1); /* Sombra para o ícone */
        }
        /* ----- ESTILOS PARA OS MODAIS (TERMOS, PRIVACIDADE E AJUDA) ----- */
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
            display: flex; 
            opacity: 1; 
        }

        .modal-content {
            background-color: var(--cor-nuvem); 
            border-radius: 30px;
            padding: 3.5rem;
            max-width: 700px; 
            width: 90%; 
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            position: relative;
            transform: translateY(20px); 
            opacity: 0; 
            transition: transform 0.3s ease, opacity 0.3s ease;
            max-height: 80vh; 
            overflow-y: auto; 
            text-align: left; 
        }

        .modal-overlay.active .modal-content {
            transform: translateY(0); 
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
            z-index: 10; 
        }

        .close-button:hover {
            color: var(--cor-terciaria-acao); 
            transform: rotate(90deg);
        }

        @media (max-width: 768px) {
            .modal-content {
                padding: 2.5rem;
                width: 95%;
            }

            .modal-content h2 {
                font-size: 2.2rem;
            }

            .modal-content h3 {
                font-size: 1.5rem;
            }

            .modal-content p {
                font-size: 0.9rem;
            }

            .close-button {
                font-size: 1.8rem;
                top: 15px;
                right: 15px;
            }
        }

        @media (max-width: 480px) {
            .modal-content {
                padding: 1.5rem;
            }

            .modal-content h2 {
                font-size: 1.8rem;
            }

            .modal-content h3 {
                font-size: 1.3rem;
            }

            .modal-content p {
                font-size: 0.85rem;
            }

            .close-button {
                font-size: 1.5rem;
                top: 10px;
                right: 10px;
            }
        }

        @media (max-width: 1200px) {
            .island-card {
                width: calc(50% - 2.5rem);
            }
        }

        @media (max-width: 900px) {
            .adventure-islands h2 {
                font-size: 3.5rem;
            }
            .island-card {
                width: calc(50% - 2rem); 
            }
        }

        @media (max-width: 768px) {
            header {
                flex-direction: row; 
                justify-content: space-between;
                align-items: center;
                padding: 1rem 3%;
                border-bottom-left-radius: 25px;
                border-bottom-right-radius: 25px;
            }
            .logo {
                font-size: 2rem;
                text-shadow: 2px 2px 0 rgba(0,0,0,0.1);
            }
            .user-profile-button {
                width: 45px;
                height: 45px;
                font-size: 1.6rem;
            }
            .nav-buttons {
                width: auto;
            }
            .dropdown-content {
                min-width: 200px;
                border-radius: 15px;
            }
            .dropdown-content .user-info {
                font-size: 1.1rem;
                padding: 1rem 1.5rem;
            }
            .dropdown-content a {
                font-size: 1.05rem;
                padding: 1rem 1.5rem;
                gap: 8px;
            }
            .dropdown-content a i {
                font-size: 1.2rem;
            }

            .adventure-islands {
                padding: 3rem 3%;
                border-radius: 30px;
                border: 3px solid var(--cor-grama-escura);
            }
            .adventure-islands h2 {
                font-size: 3rem;
                margin-bottom: 2.5rem;
            }
            .island-container {
                flex-direction: column;
                align-items: center;
                gap: 2rem;
            }
            .island-card {
                width: 90%; 
                padding: 2.5rem;
                border-radius: 30px;
                border: 2px solid var(--cor-borda-elementos);
            }
            .island-card .icon-wrapper {
                width: 90px;
                height: 90px;
                font-size: 4rem;
            }
            .island-card h3 {
                font-size: 1.8rem;
            }
            .island-card p {
                font-size: 1.1rem;
            }
            .island-card .btn-explorar {
                padding: 0.9rem 2rem;
                font-size: 1.2rem;
            }
        }

        @media (max-width: 480px) {
            .adventure-islands h2 {
                font-size: 2.5rem;
            }
            .island-card {
                padding: 2rem 1.5rem;
            }
            .island-card h3 {
                font-size: 1.6rem;
            }
            .island-card p {
                font-size: 1rem;
            }
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
            .island-card .icon-wrapper {
                width: 70px;
                height: 70px;
                font-size: 3rem;
            }
        }

        
        .loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.95); 
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999; 
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.5s ease, visibility 0.5s ease; 
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
            padding: 3.5rem 5rem; 
            border-radius: 30px; 
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3); 
            transform: scale(0.8); 
            animation: popIn 0.6s cubic-bezier(0.68, -0.55, 0.27, 1.55) forwards; 
            border: 4px solid var(--cor-primaria-acao); 
        }

        @keyframes popIn {
            0% { transform: scale(0.5); opacity: 0; }
            70% { transform: scale(1.1); opacity: 1; }
            100% { transform: scale(1); }
        }

        .loading-content p {
            font-family: var(--fonte-titulo);
            font-size: 2rem; 
            color: var(--cor-roxo-divertido);
            text-align: center;
            line-height: 1.3;
            animation: textPulse 1.8s infinite ease-in-out; 
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1); 
        }

        @keyframes textPulse {
            0% { transform: scale(1); opacity: 1; }
            50% { transform: scale(1.08); opacity: 0.8; } 
            100% { transform: scale(1); opacity: 1; }
        }

        
        .spinner {
            width: 90px; 
            height: 90px; 
            border: 10px solid var(--cor-primaria-acao); 
            border-top: 10px solid var(--cor-secundaria-acao); 
            border-radius: 50%;
            animation: spinAndPulse 1.5s cubic-bezier(0.68, -0.55, 0.27, 1.55) infinite; 
            box-shadow: 0 0 15px rgba(0,0,0,0.2); 
        }

        @keyframes spinAndPulse {
            0% { transform: rotate(0deg) scale(1); }
            25% { transform: rotate(90deg) scale(1.1); } 
            50% { transform: rotate(180deg) scale(1); }
            75% { transform: rotate(270deg) scale(1.1); } 
            100% { transform: rotate(360deg) scale(1); }
        }
    </style>
</head>
<body>
    <div id="loadingOverlay" class="loading-overlay">
        <div class="loading-content">
            <div class="spinner"></div>
            <p>Carregando Aventura...</p>
        </div>
    </div>
    <header>
        <a href="HomeLogado.jsp" class="logo">Calmamente</a>
        
        <nav class="nav-buttons">
            <button class="user-profile-button" id="userProfileBtn">
                <i class="fas fa-user-circle"></i>
            </button>
            
            <div class="dropdown-content" id="userDropdownMenu">
                <div class="user-info">
                    Olá, <strong><%
                        String usuarioLogadoNome = (String) session.getAttribute("usuarioLogado");
                        if (usuarioLogadoNome != null && !usuarioLogadoNome.trim().isEmpty()) {
                            out.print(usuarioLogadoNome);
                        } else {
                            out.print("Convidado"); 
                        }
                    %></strong>
                </div>
                <a href="EditarPerfil.jsp">
                    <i class="fas fa-pencil-alt"></i> Editar Perfil
                </a>
                <a href="telasHome/Home.html">
                    <i class="fas fa-sign-out-alt"></i> Sair
                </a>
            </div>
        </nav>
    </header>

    <main>
        <section class="adventure-islands" id="adventure-islands">
            <h2>Escolha Sua Aventura!</h2> 
            <div class="island-container">
                <div class="island-card">
                    <div class="icon-wrapper"><i class="fas fa-volume-up"></i></div>
                    <h3>Vozes para a Comunicação</h3>
                    <p>Crie seus próprios "folders" com frases e imagens. Ao clicar, a frase se transforma em áudio MP3, dando voz aos seus pensamentos de forma fácil e divertida.</p>
                    <a href="./FolderComunicacao/foldersComunicacao.jsp" class="btn-explorar">
                        <i class="fas fa-folder-open"></i> Meus Folders
                    </a>
                </div>
                <div class="island-card">
                    <div class="icon-wrapper"><i class="fas fa-heart"></i></div>
                    <h3>Guia de Sentimentos</h3>
                    <p>Explore um mundo de emoções. Escolha o sentimento que você está sentindo e seja guiado por vídeos do YouTube que trazem conforto e compreensão.</p>
                    <a href="telasSentimentos/IlhaSentimento.jsp" class="btn-explorar"> <i class="fas fa-video"></i> Navegar Emoções
                    </a>
                </div>
                <div class="island-card">
                    <div class="icon-wrapper"><i class="fas fa-calendar-check"></i></div>
                    <h3>Relatório de Aventuras</h3>
                    <p>Visualize quais foram as suas emoções dos ultimos tempos!</p>
                    <a href="./Historico/historicov1.jsp" class="btn-explorar">
                        <i class="fas fa-book"></i> Ver Diário
                    </a>
                </div>
                
            </div>
        </section>
    </main>
<button class="botaoFeedback"><a href="#">Feedback</a></button>
    <footer>
        <p>&copy; 2025 Calmamente. Todos os direitos reservados. Feito com carinho para você!</p>
        <div class="links">
            <a href="javascript:void(0);" id="openPrivacyModal">Privacidade</a>
            <a href="javascript:void(0);" id="openTermsModal">Termos</a>
            <a href="javascript:void(0);" id="openHelpModal">Ajuda</a>
        </div>
    </footer>

    <div class="modal-overlay" id="termsModalOverlay">
        <div class="modal-content">
            <button class="close-button" id="closeTermsModal"><i class="fas fa-times"></i></button>
            <h2>Termos de Uso</h2>
            <p>Estes termos regem o uso da plataforma Calmamente.</p>

            <h3>1. Aceitação</h3>
            <p>Ao acessar e usar nosso site, você concorda com estes termos. Se você não concordar com qualquer parte
                destes termos, não poderá usar a plataforma.</p>

            <h3>2. Conduta do Usuário</h3>
            <p>Você deve utilizar os serviços de forma ética e legal, respeitando os direitos de outros usuários e as
                leis aplicáveis. Qualquer uso indevido da plataforma pode resultar na suspensão ou encerramento da sua
                conta.</p>

            <h3>3. Alterações</h3>
            <p>Os termos podem ser atualizados a qualquer momento, sem aviso prévio. Recomendamos que você visite esta
                página periodicamente para se manter informado sobre quaisquer alterações. O uso continuado da
                plataforma após as alterações constitui sua aceitação dos novos termos.</p>

            <h3>4. Propriedade Intelectual</h3>
            <p>Todo o conteúdo presente na plataforma Calmamente, incluindo textos, gráficos, logotipos, ícones,
                imagens, clipes de áudio e vídeo, dados e software, é propriedade da Calmamente ou de seus licenciadores
                e é protegido por leis de direitos autorais e outras leis de propriedade intelectual.</p>

            <h3>5. Limitação de Responsabilidade</h3>
            <p>A plataforma Calmamente é fornecida "como está", sem garantias de qualquer tipo, expressas ou implícitas.
                Não nos responsabilizamos por quaisquer danos diretos, indiretos, incidentais, especiais ou
                consequenciais resultantes do uso ou da incapacidade de usar a plataforma.</p>
        </div>
    </div>

    <div class="modal-overlay" id="privacyModalOverlay">
        <div class="modal-content">
            <button class="close-button" id="closePrivacyModal"><i class="fas fa-times"></i></button>
            <h2>Política de Privacidade</h2>
            <p>Sua privacidade é muito importante para nós. Esta política descreve como coletamos, usamos e protegemos
                suas informações.</p>

            <h3>1. Coleta de Informações</h3>
            <p>Coletamos informações que você nos fornece diretamente, como nome, endereço de e-mail e dados de uso da
                plataforma. Também podemos coletar informações automaticamente, como seu endereço IP e tipo de
                navegador, para melhorar sua experiência.</p>

            <h3>2. Uso das Informações</h3>
            <p>As informações coletadas são usadas para operar e melhorar a Calmamente, personalizar sua experiência,
                fornecer suporte ao cliente e analisar o uso da plataforma para otimização.</p>

            <h3>3. Compartilhamento de Informações</h3>
            <p>Não vendemos, alugamos ou trocamos suas informações pessoais com terceiros. Podemos compartilhar dados
                agregados e anonimizados para fins de pesquisa e desenvolvimento.</p>

            <h3>4. Segurança dos Dados</h3>
            <p>Implementamos medidas de segurança robustas para proteger suas informações contra acesso não autorizado,
                alteração, divulgação ou destruição. No entanto, lembre-se de que nenhum método de transmissão pela
                internet ou de armazenamento eletrônico é 100% seguro.</p>

            <h3>5. Seus Direitos</h3>
            <p>Você tem o direito de acessar, corrigir ou excluir suas informações pessoais a qualquer momento. Para
                exercer esses direitos, entre em contato conosco através dos canais de suporte.</p>

            <h3>6. Cookies</h3>
            <p>Utilizamos cookies para melhorar a navegação, analisar o tráfego do site e personalizar o conteúdo. Você
                pode configurar seu navegador para recusar cookies, mas isso pode afetar a funcionalidade da
                plataforma.</p>
        </div>
    </div>

    <div class="modal-overlay" id="helpModalOverlay">
        <div class="modal-content">
            <button class="close-button" id="closeHelpModal"><i class="fas fa-times"></i></button>
            <h2>Central de Ajuda</h2>

            <h3>Como criar uma conta?</h3>
            <p>Clique em “Cadastrar” e preencha seus dados para começar.</p>

            <h3>Esqueci minha senha. O que faço?</h3>
            <p>Na página de login, clique em “Esqueci minha senha” e siga as instruções.</p>

            <h3>Como entrar em contato?</h3>
            <p>Você pode nos contatar por e-mail ou pelo formulário na página de contato.</p>
        </div>
    </div>
    

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const userProfileBtn = document.getElementById('userProfileBtn');
            const userDropdownMenu = document.getElementById('userDropdownMenu');
            const loadingOverlay = document.getElementById('loadingOverlay');
            const navigateEmotionsBtn = document.querySelector('.island-card a[href="telasSentimentos/IlhaSentimento.jsp"]'); // Atualizado o seletor para o caminho correto

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

            if (navigateEmotionsBtn) {
                navigateEmotionsBtn.addEventListener('click', function(event) {
                    event.preventDefault(); 
                    
                    loadingOverlay.classList.add('show');

                    setTimeout(function() {
                        window.location.href = navigateEmotionsBtn.href;
                    }, 1500); 
                });
            }


            const openTermsModalBtn = document.getElementById('openTermsModal');
            const termsModalOverlay = document.getElementById('termsModalOverlay');
            const closeTermsModalBtn = document.getElementById('closeTermsModal');

            if (openTermsModalBtn) {
                openTermsModalBtn.addEventListener('click', () => {
                    termsModalOverlay.classList.add('active');
                    document.body.style.overflow = 'hidden';
                });
            }
            if (closeTermsModalBtn) {
                closeTermsModalBtn.addEventListener('click', () => {
                    termsModalOverlay.classList.remove('active');
                    document.body.style.overflow = ''; 
                });
            }
            if (termsModalOverlay) {
                termsModalOverlay.addEventListener('click', (event) => {
                    if (event.target === termsModalOverlay) {
                        termsModalOverlay.classList.remove('active');
                        document.body.style.overflow = '';
                    }
                });
            }

            const openPrivacyModalBtn = document.getElementById('openPrivacyModal');
            const privacyModalOverlay = document.getElementById('privacyModalOverlay');
            const closePrivacyModalBtn = document.getElementById('closePrivacyModal');

            if (openPrivacyModalBtn) {
                openPrivacyModalBtn.addEventListener('click', () => {
                    privacyModalOverlay.classList.add('active');
                    document.body.style.overflow = 'hidden';
                });
            }
            if (closePrivacyModalBtn) {
                closePrivacyModalBtn.addEventListener('click', () => {
                    privacyModalOverlay.classList.remove('active');
                    document.body.style.overflow = '';
                });
            }
            if (privacyModalOverlay) {
                privacyModalOverlay.addEventListener('click', (event) => {
                    if (event.target === privacyModalOverlay) {
                        privacyModalOverlay.classList.remove('active');
                        document.body.style.overflow = '';
                    }
                });
            }

            const openHelpModalBtn = document.getElementById('openHelpModal');
            const helpModalOverlay = document.getElementById('helpModalOverlay');
            const closeHelpModalBtn = document.getElementById('closeHelpModal');

            if (openHelpModalBtn) {
                openHelpModalBtn.addEventListener('click', () => {
                    helpModalOverlay.classList.add('active');
                    document.body.style.overflow = 'hidden';
                });
            }
            if (closeHelpModalBtn) {
                closeHelpModalBtn.addEventListener('click', () => {
                    helpModalOverlay.classList.remove('active');
                    document.body.style.overflow = '';
                });
            }
            if (helpModalOverlay) {
                helpModalOverlay.addEventListener('click', (event) => {
                    if (event.target === helpModalOverlay) {
                        helpModalOverlay.classList.remove('active');
                        document.body.style.overflow = '';
                    }
                });
            }
            document.addEventListener('keydown', (event) => {
                if (event.key === 'Escape') {
                    if (termsModalOverlay && termsModalOverlay.classList.contains('active')) {
                        termsModalOverlay.classList.remove('active');
                        document.body.style.overflow = '';
                    }
                    if (privacyModalOverlay && privacyModalOverlay.classList.contains('active')) {
                        privacyModalOverlay.classList.remove('active');
                        document.body.style.overflow = '';
                    }
                    if (helpModalOverlay && helpModalOverlay.classList.contains('active')) {
                        helpModalOverlay.classList.remove('active');
                        document.body.style.overflow = '';
                    }
                }
            });
        });
    </script>

</body>
</html>
