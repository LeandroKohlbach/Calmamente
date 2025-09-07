<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="modelos.Usuario"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calmamente: Bem-vindo(a)!</title>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* VariÃ¡veis de Cores e Fontes - Mais VIBRANTES e LÃDICAS */
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
            --cor-texto-medio: #555555; /* Cinza MÃ©dio */
            --cor-texto-claro: #FFFFFF; /* Branco */

            --cor-sombra-leve: rgba(0, 0, 0, 0.1);
            --cor-borda-elementos: rgba(0, 0, 0, 0.15); /* Bordas suaves para elementos */

            --fonte-titulo: 'Fredoka', sans-serif; /* Fonte mais arredondada e divertida */
            --fonte-corpo: 'Nunito', sans-serif; /* Fonte legÃ­vel e amigÃ¡vel */
        }

        /* Reset BÃ¡sico */
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
            flex-grow: 1; /* Faz o main ocupar o espaÃ§o restante */
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem 0; /* Ajusta o padding para centralizar o conteÃºdo */
        }

        /* Nuvens desnecessÃ¡rias se o fundo nÃ£o Ã© mais cÃ©u */
        .cloud {
            display: none; /* Esconde as nuvens */
        }

        /* CabeÃ§alho - Mais LÃºdico */
        /* VariÃ¡veis de Cores e Fontes - Mais VIBRANTES e LÃDICAS */
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
            --cor-texto-medio: #555555; /* Cinza MÃ©dio */
            --cor-texto-claro: #FFFFFF; /* Branco */

            --cor-sombra-leve: rgba(0, 0, 0, 0.1);
            --cor-borda-elementos: rgba(0, 0, 0, 0.15); /* Bordas suaves para elementos */

            --fonte-titulo: 'Fredoka', sans-serif; /* Fonte mais arredondada e divertida */
            --fonte-corpo: 'Nunito', sans-serif; /* Fonte legÃ­vel e amigÃ¡vel */
        }     
        
        /* SeÃ§Ã£o Principal (Hero) - REMOVIDA */
        .hero-world {
            display: none; /* Esconde toda a seÃ§Ã£o Hero */
        }

        /* SeÃ§Ã£o "Nossas Ilhas de Aventura" - Ajustada para ser o conteÃºdo principal */
        .adventure-islands {
            background-color: var(--cor-fundo-principal); /* Fundo branco suave */
            padding: 4rem 5%;
            text-align: center;
            border-radius: 40px; /* Bordas arredondadas para o container principal - MAIS ARREDONDADO */
            box-shadow: 0 15px 30px rgba(0,0,0,0.15); /* Sombra para destacÃ¡-lo - MAIS PROEMINENTE */
            position: relative;
            width: 80%;
            max-width: 100%; /* Limita a largura para melhor visualizaÃ§Ã£o */
            margin: 0 auto; /* Centraliza */
            /* ADICIONADO: Borda colorida para um visual mais divertido */
            border: 4px solid var(--cor-grama-escura);
        }

        .adventure-islands h2 {
            font-family: var(--fonte-titulo);
            font-size: 4rem; /* MAIOR E MAIS IMPONENTE */
            color: var(--cor-roxo-divertido); /* Cor divertida para o tÃ­tulo */
            margin-bottom: 3.5rem; /* MAIOR MARGEM */
            text-shadow: 3px 3px 0px rgba(0,0,0,0.08); /* SOMBRA MAIS PROEMINENTE */
            line-height: 1.1;
            /* ADICIONADO: AnimaÃ§Ã£o de entrada */
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
            gap: 3rem; /* MAIOR ESPAÃAMENTO ENTRE CARDS */
        }

        /* ESTILOS PARA OS CARDS DAS ILHAS E SEUS BOTÃES */
        .island-card {
            background-color: var(--cor-nuvem); /* Fundo branco para os cards (para contraste) */
            border-radius: 35px; /* MAIS ARREDONDADO */
            padding: 3rem; /* MAIOR PADDING */
            width: calc(33% - 3rem); /* Permite 3 cards por linha com gap */
            max-width: 250px; /* Limita o tamanho mÃ¡ximo de cada card */
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
            width: 110px; /* ÃCONE MAIOR */
            height: 110px; /* ÃCONE MAIOR */
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 1.8rem auto; /* MAIOR MARGEM */
            font-size: 4.5rem; /* ÃCONE MAIOR */
            color: var(--cor-texto-claro);
            box-shadow: 0 5px 10px rgba(0,0,0,0.3); /* SOMBRA MAIS PROEMINENTE */
            transition: transform 0.3s ease, background 0.3s ease;
            border: 4px solid var(--cor-texto-claro); /* Borda branca destacada */
        }
        .island-card:hover .icon-wrapper {
            transform: rotate(15deg) scale(1.05); /* MAIOR ROTAÃÃO E ESCALA */
            background: linear-gradient(45deg, var(--cor-secundaria-acao), var(--cor-primaria-acao)); /* Inverte o degradÃª */
        }

        /* Cores de fundo dos Ã­cones dos cards */
        .island-card:nth-child(1) .icon-wrapper { background: linear-gradient(45deg, var(--cor-terciaria-acao), #FF66A3); } /* Rosa */
        .island-card:nth-child(2) .icon-wrapper { background: linear-gradient(45deg, var(--cor-secundaria-acao), #FFB800); } /* Amarelo */
        .island-card:nth-child(3) .icon-wrapper { background: linear-gradient(45deg, var(--cor-primaria-acao), #3399FF); } /* Azul */
        /* ADICIONADO: Card extra para demonstraÃ§Ã£o, se quiser mais tarde */
        .island-card:nth-child(4) .icon-wrapper { background: linear-gradient(45deg, #B388FF, #9966FF); } /* Roxo */

        .island-card h3 {
            font-family: var(--fonte-titulo);
            font-size: 2.2rem; /* TÃTULO MAIOR */
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

        /* ESTILOS ESPECÃFICOS PARA OS BOTÃES DENTRO DOS CARDS DAS ILHAS */
        .island-card .btn-explorar {
            background-color: var(--cor-primaria-acao); /* MantÃ©m o azul primÃ¡rio */
            color: var(--cor-texto-claro);
            padding: 1rem 2.2rem; /* MAIOR PADDING */
            border: none;
            border-radius: 50px; /* MAIS ARREDONDADO, QUASE UMA PÃLULA */
            font-family: var(--fonte-titulo);
            font-size: 1.3rem; /* TEXTO MAIOR */
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 5px 10px rgba(0,0,0,0.25); /* SOMBRA MAIS FORTE */
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px; /* MAIOR ESPAÃAMENTO */
            margin: 2rem auto 0.5rem auto; /* MAIOR MARGEM SUPERIOR */
            max-width: 250px; /* Limita a largura do botÃ£o */
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
            font-size: 1.5rem; /* ÃCONE MAIOR */
            color: var(--cor-secundaria-acao); /* Amarelo no Ã­cone */
            text-shadow: 1px 1px 0 rgba(0,0,0,0.1); /* Sombra para o Ã­cone */
        }


        /* RodapÃ© - Base do Mundo */
        footer {
            background-color: var(--cor-grama-escura); /* Mesma cor da seÃ§Ã£o de ilhas */
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
            margin-bottom: 1rem; /* EspaÃ§amento abaixo do texto */
        }

        footer .links {
            margin-top: 1.5rem;
            display: flex;
            justify-content: center;
            gap: 2rem; /* MAIOR ESPAÃAMENTO */
        }

        footer .links a {
            color: var(--cor-texto-claro);
            text-decoration: none;
            transition: color 0.3s ease, transform 0.2s ease;
            padding: 0.8rem 1rem; /* PADDING MAIOR PARA ÃREA CLICÃVEL */
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

        /* ----- ESTILOS PARA OS MODAIS (TERMOS, PRIVACIDADE E AJUDA) ----- */
        .modal-overlay {
            display: none; /* Oculto por padrÃ£o */
            position: fixed; /* Fixado na tela */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6); /* Fundo escuro semi-transparente */
            z-index: 1001; /* Acima de todo o conteÃºdo */
            justify-content: center;
            align-items: center;
            opacity: 0; /* ComeÃ§a invisÃ­vel para transiÃ§Ã£o */
            transition: opacity 0.3s ease;
        }

        .modal-overlay.active {
            display: flex; /* Exibe o overlay */
            opacity: 1; /* Torna visÃ­vel */
        }

        .modal-content {
            /* Classe genÃ©rica para o conteÃºdo do modal */
            background-color: var(--cor-nuvem); /* Fundo branco do modal */
            border-radius: 30px;
            padding: 3.5rem;
            max-width: 700px; /* Largura do modal */
            width: 90%; /* Ajuste para telas menores */
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            position: relative;
            transform: translateY(20px); /* ComeÃ§a um pouco abaixo para animaÃ§Ã£o */
            opacity: 0; /* ComeÃ§a invisÃ­vel para animaÃ§Ã£o */
            transition: transform 0.3s ease, opacity 0.3s ease;
            max-height: 80vh; /* Limita a altura do modal */
            overflow-y: auto; /* Adiciona scroll se o conteÃºdo for maior que a altura */
            text-align: left; /* Alinha o texto dentro do modal */
        }

        .modal-overlay.active .modal-content {
            transform: translateY(0); /* Sobe para a posiÃ§Ã£o final */
            opacity: 1; /* Torna visÃ­vel */
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
            z-index: 10; /* Garante que o botÃ£o esteja acima do conteÃºdo do modal */
        }

        .close-button:hover {
            color: var(--cor-terciaria-acao); /* Rosa */
            transform: rotate(90deg);
        }

        /* Responsividade para o Modal */
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


        /* Responsividade */
        @media (max-width: 1200px) {
            .island-card {
                width: calc(50% - 2.5rem); /* Duas cards por linha */
            }
        }

        @media (max-width: 900px) {
            .adventure-islands h2 {
                font-size: 3.5rem;
            }
            .island-card {
                width: calc(50% - 2rem); /* Ajuste para duas por linha */
            }
        }

        @media (max-width: 768px) {

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
                width: 90%; /* Uma card por linha */
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

            footer {
                padding: 2.5rem 3%;
                font-size: 1rem;
                border-top-left-radius: 25px;
                border-top-right-radius: 25px;
            }
            footer .links {
                flex-direction: column;
                gap: 0.8rem;
            }
            footer .links a {
                padding: 0.6rem 0.8rem;
                font-size: 0.95rem;
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
            .island-card .icon-wrapper {
                width: 70px;
                height: 70px;
                font-size: 3rem;
            }
        }

        /* ESTILOS PARA O OVERLAY DE CARREGAMENTO */
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
            transition: opacity 0.5s ease, visibility 0.5s ease; /* TransiÃ§Ã£o mais suave e longa */
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
            animation: popIn 0.6s cubic-bezier(0.68, -0.55, 0.27, 1.55) forwards; /* AnimaÃ§Ã£o de pop mais "saltitante" */
            border: 4px solid var(--cor-primaria-acao); /* Borda mais forte */
        }

        img{
            width: 80px; /* Logo um pouco maior */
            height: auto; /* MantÃ©m a proporÃ§Ã£o */
            margin-right: 20px;
        }

        /* Chaveamento para uma animaÃ§Ã£o de "pop" mais divertida */
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
    
        /* FIM DOS ESTILOS PARA O OVERLAY DE CARREGAMENTO */
    </style>
</head>
<body>

    <jsp:include page="./JSPs/headerLogado.jsp" />

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
                    <h3>Ilha dos Sentimentos</h3>
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
            <h2>Termos de Uso</h2>
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
        // LÃ³gica para o dropdown do perfil do usuÃ¡rio
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

        // LÃ³gica para os modais de Termos, Privacidade e Ajuda
        const termsLink = document.getElementById('termsLink');
        const privacyLink = document.getElementById('privacyLink');
        const privacyLinkInHelp = document.getElementById('privacyLinkInHelp'); // Link dentro do modal de Ajuda
        const helpLink = document.getElementById('helpLink');

        const termsModal = document.getElementById('termsModal');
        const privacyModal = document.getElementById('privacyModal');
        const helpModal = document.getElementById('helpModal');

        function openModal(modal) {
            modal.classList.add('active');
            // Fechar o dropdown de usuÃ¡rio se estiver aberto
            userDropdown.classList.remove('show');
        }

        function closeModal(modal) {
            modal.classList.remove('active');
        }

        // Event Listeners para abrir os modais
        termsLink.addEventListener('click', (e) => {
            e.preventDefault();
            openModal(termsModal);
        });

        privacyLink.addEventListener('click', (e) => {
            e.preventDefault();
            openModal(privacyModal);
        });

        // Abrir modal de privacidade a partir do link dentro do modal de ajuda
        privacyLinkInHelp.addEventListener('click', (e) => {
            e.preventDefault();
            closeModal(helpModal); // Fecha o modal de ajuda primeiro
            openModal(privacyModal);
        });

        helpLink.addEventListener('click', (e) => {
            e.preventDefault();
            openModal(helpModal);
        });

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