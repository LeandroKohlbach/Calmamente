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

        main {
            flex-grow: 1; /* Faz o main ocupar o espaço restante */
            display: flex;
            flex-direction: column; /* Adicionado para empilhar seções */
            justify-content: flex-start; /* Alinha ao topo */
            align-items: center;
            padding: 2rem 0; /* Ajusta o padding para centralizar o conteúdo */
        }

        /* Nuvens desnecessárias se o fundo não é mais céu */
        .cloud {
            display: none; /* Esconde as nuvens */
        }

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
            /* Borda colorida para um visual mais divertido */
            border: 4px solid var(--cor-grama-escura);
        }

        .adventure-islands h2 {
            font-family: var(--fonte-titulo);
            font-size: 4rem; /* MAIOR E MAIS IMPONENTE */
            color: var(--cor-roxo-divertido); /* Cor divertida para o título */
            margin-bottom: 3.5rem; /* MAIOR MARGEM */
            text-shadow: 3px 3px 0px rgba(0,0,0,0.08); /* SOMBRA MAIS PROEMINENTE */
            line-height: 1.1;
            /* Animação de entrada */
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

        /* ===========
         CARDS DAS ILHAS E BOTÕES 
        ===========
        */
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

        /* Efeito de brilho ao hover do card */
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
        /* Card extra para demonstração, se quiser mais tarde */
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
            /* Gradiente sutil */
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

        /* ===========
         RESPONSIVIDADE GERAL 
        ===========
        */

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
            header {
                flex-direction: row; /* Mantém em linha mas ajusta o espaçamento */
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

            /* Ajuste para o container centralizado no mobile */
            .header-center-container {
                justify-content: center; /* Garante centralização */
                flex-grow: 1; /* Permite ocupar o espaço */
                margin: 0; /* Remove margens extras */
                padding: 0;
            }

            .user-profile-button {
                width: 45px;
                height: 45px;
                font-size: 1.6rem;
                margin-left: 10px; /* Reduz a margem no mobile */
            }
            .user-nav-group {
                gap: 10px; /* Reduz o espaçamento entre os botões no mobile */
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

            /* Responsividade para os links do cabeçalho */
            .nav-link {
                font-size: 1rem; /* Diminui a fonte no mobile */
            }
            /* FIM DO NOVO */

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
            /* Responsividade para os links do cabeçalho */
            .nav-link {
                font-size: 0.9rem;
            }
            /* FIM DO NOVO */
            .island-card .icon-wrapper {
                width: 70px;
                height: 70px;
                font-size: 3rem;
            }
        }

        

        img{
            width: 80px; /* Logo um pouco maior */
            height: auto; /* Mantém a proporção */
            margin-right: 20px;
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
            line-height: 1;
        }

        /* ===========
         SEÇÃO HERO (BANNER PRINCIPAL) 
        ===========
        */
        .hero-banner {
            background: linear-gradient(135deg, var(--cor-primaria-acao) 0%, var(--cor-roxo-divertido) 100%);
            color: var(--cor-texto-claro);
            padding: 6rem 5%;
            text-align: center;
            position: relative;
            overflow: hidden;
            border-bottom-left-radius: 50px;
            border-bottom-right-radius: 50px;
            margin-bottom: 4rem; /* Espaço antes da próxima seção */
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
            width: 100%; /* Ocupa toda a largura */
        }

        .hero-banner h1 {
            font-family: var(--fonte-titulo);
            font-size: 5rem; /* Título maior e mais impactante */
            margin-bottom: 1.5rem;
            text-shadow: 4px 4px 0 rgba(0,0,0,0.2);
            animation: slideInUp 1s ease-out;
        }

        .hero-banner p {
            font-family: var(--fonte-corpo);
            font-size: 1.8rem;
            max-width: 800px;
            margin: 0 auto 3rem auto;
            line-height: 1.5;
            animation: fadeIn 1.5s ease-out 0.5s forwards;
            opacity: 0; /* Começa invisível */
        }

        .hero-banner .cta-group {
            display: flex;
            justify-content: center;
            gap: 2rem;
            animation: fadeIn 1.5s ease-out 1s forwards;
            opacity: 0; /* Começa invisível */
        }

        .hero-banner .btn-primary, .hero-banner .btn-secondary {
            padding: 1.2rem 2.8rem;
            border: none;
            border-radius: 50px;
            font-family: var(--fonte-titulo);
            font-size: 1.4rem;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .hero-banner .btn-primary {
            background-color: var(--cor-secundaria-acao); /* Amarelo */
            color: var(--cor-texto-escuro);
        }

        .hero-banner .btn-primary:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
            background-color: #FFC000; /* Amarelo mais escuro */
        }

        .hero-banner .btn-secondary {
            background-color: var(--cor-terciaria-acao); /* Rosa */
            color: var(--cor-texto-claro);
            border: 2px solid var(--cor-texto-claro);
        }

        .hero-banner .btn-secondary:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
            background-color: #FF66B2; /* Rosa mais escuro */
        }

        @keyframes slideInUp {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* ===========
         SEÇÃO BEM-VINDOS 
        ===========
        */
        .welcome-section {
            background-color: var(--cor-nuvem);
            padding: 4rem 5%;
            text-align: center;
            border-radius: 40px;
            box-shadow: 0 10px 20px var(--cor-sombra-leve);
            max-width: 1000px;
            margin: 2rem auto 4rem auto;
            border: 3px solid var(--cor-grama-clara);
        }

        .welcome-section h2 {
            font-family: var(--fonte-titulo);
            font-size: 3.5rem;
            color: var(--cor-primaria-acao);
            margin-bottom: 1.5rem;
            text-shadow: 2px 2px 0px rgba(0,0,0,0.05);
        }

        .welcome-section p {
            font-family: var(--fonte-corpo);
            font-size: 1.3rem;
            color: var(--cor-texto-escuro);
            max-width: 800px;
            margin: 0 auto 2rem auto;
            line-height: 1.8;
        }

        /* Seção de Destaques de Conteúdo (reutiliza .adventure-islands) */
        .content-highlights {
            background-color: var(--cor-fundo-principal);
            padding: 4rem 5%;
            text-align: center;
            border-radius: 40px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
            position: relative;
            width: 100%;
            max-width: 1500px;
            margin: 0 auto 4rem auto; /* Ajusta margem para espaçamento */
            border: 4px solid var(--cor-grama-escura);
        } 

        .content-highlights h2 {
            font-family: var(--fonte-titulo);
            font-size: 4rem;
            color: var(--cor-roxo-divertido);
            margin-bottom: 3.5rem;
            text-shadow: 3px 3px 0px rgba(0,0,0,0.08);
            line-height: 1.1;
        }
          

        @keyframes popIn {
            0% { transform: scale(0.5); opacity: 0; }
            70% { transform: scale(1.1); opacity: 1; }
            100% { transform: scale(1); }
        }

        /* Responsividade para as novas seções */
        @media (max-width: 900px) {
            .hero-banner h1 { font-size: 4rem; }
            .hero-banner p { font-size: 1.5rem; }
            .hero-banner .cta-group { flex-direction: column; gap: 1.5rem; }
            .hero-banner .btn-primary, .hero-banner .btn-secondary { width: 80%; max-width: 350px; }
            .welcome-section h2 { font-size: 3rem; }
            .welcome-section p { font-size: 1.2rem; }
            .content-highlights h2 { font-size: 3.5rem; }
        }

        @media (max-width: 768px) {
            .hero-banner { padding: 4rem 3%; margin-bottom: 3rem; border-bottom-left-radius: 30px; border-bottom-right-radius: 30px;}
            .hero-banner h1 { font-size: 3.5rem; }
            .hero-banner p { font-size: 1.3rem; }
            .hero-banner .btn-primary, .hero-banner .btn-secondary { font-size: 1.2rem; padding: 1rem 2rem; }
            .welcome-section { padding: 3rem 3%; margin: 1.5rem auto 3rem auto; border-radius: 30px; }
            .welcome-section h2 { font-size: 2.5rem; }
            .welcome-section p { font-size: 1.1rem; }
            .content-highlights { padding: 3rem 3%; margin: 0 auto 3rem auto; border-radius: 30px; }
            .content-highlights h2 { font-size: 3rem; }
        }

        @media (max-width: 480px) {
            .hero-banner { padding: 3rem 2%; margin-bottom: 2rem; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px;}
            .hero-banner h1 { font-size: 2.5rem; }
            .hero-banner p { font-size: 1rem; margin-bottom: 2rem;}
            .hero-banner .cta-group { gap: 1rem; }
            .hero-banner .btn-primary, .hero-banner .btn-secondary { font-size: 1rem; padding: 0.8rem 1.5rem; width: 90%; }
            .welcome-section { padding: 2rem 2%; margin: 1rem auto 2rem auto; border-radius: 20px; }
            .welcome-section h2 { font-size: 2rem; }
            .welcome-section p { font-size: 0.95rem; }
            .content-highlights { padding: 2.5rem 2%; margin: 0 auto 2.5rem auto; border-radius: 20px; }
            .content-highlights h2 { font-size: 2.5rem; }
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

    </style>
</head>
<body>


    <header>
        <img src="./imagens/logo.png" alt="Logo Calmamente">
        <h1 class="logo">Calmamente</h1>
        
            <nav class="nav-links-container">
            <a href="HomeLogado.jsp" class="nav-link" id="homeButton">
                Home
            </a>
            <a href="SobreNosLogado.jsp" class="nav-link" id="aboutUsLink">
                Sobre Nós
            </a>
            <a href="Atividades&Recursos.jsp" class="nav-link" id="activitiesResourcesButton">
                Atividades & Recursos
            </a>
            <a href="" class="nav-link" id="contactButton">
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
					Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioObjeto");
 					String userName = usuarioLogado.getNome();
 					if (userName == null || userName.isEmpty()) {
 						userName = "Usuário";
 					}
 					out.print(userName.trim());
 					%></strong>!
            </div>
            <a href="EditarPerfil.jsp"><i class="fas fa-pencil-alt"></i> Editar Perfil</a>
            <a href="telasHome/Home.html">
                    <i class="fas fa-sign-out-alt"></i> Sair
                </a>
        </div>
        </div>
    </header>

    <main>
        <section class="hero-banner">
            <h1>Conectando, Apoiando e Inspirando para um Mundo Mais Inclusivo.</h1>
            <p>Um espaço seguro e acolhedor para a comunidade autista e suas famílias, oferecendo ferramentas, atividades e uma rede de apoio mútuo.</p>
            <div class="cta-group">
                <a href="Atividades&Recursos.html" class="btn-primary"><i class="fas fa-compass"></i> Explorar emoções</a>
            </div>
        </section>

        <section class="welcome-section">
            <h2>Bem-vindos ao Calmamente!</h2>
            <p>Nossa missão é ser um farol de apoio e compreensão, proporcionando recursos valiosos e um ambiente onde todos se sintam vistos, ouvidos e valorizados. Acreditamos no poder da conexão e do conhecimento para transformar vidas.</p>
            <p>Aqui você encontrará ferramentas para o registro de emoções, atividades para o desenvolvimento de habilidades, artigos informativos e uma comunidade vibrante pronta para compartilhar experiências.</p>
        </section>

        <section class="content-highlights">
            <h2>Nossos Destaques</h2>
            <div class="island-container">
                <div class="island-card">
                    <div class="icon-wrapper">
                        <i class="fas fa-brain"></i>
                    </div>
                    <h3>Relatório de Emoções</h3>
                    <p>Entenda e interprete suas emoções com nossa ferramenta. Um passo essencial para o autoconhecimento.</p>
                    <a href="./Historico/historicov1.jsp" class="btn-explorar"><i class="fas fa-arrow-right"></i> Começar </a>
                </div>

                <div class="island-card">
                    <div class="icon-wrapper">
                        <i class="fas fa-cogs"></i>
                    </div>
                    <h3>Atividades & Recursos</h3>
                    <p>Encontre atividades e dinâmicas que auxiliam no tratamento e na convivência com o autismo.</p>
                    <a href="Atividades&Recursos.jsp" class="btn-explorar"><i class="fas fa-arrow-right"></i> Ler Mais</a>
                </div>

                <div class="island-card">
                    <div class="icon-wrapper">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3>Conheça nosso projeto</h3>
                    <p>Venha explorar nosso projeto mais detalhadamente e descubra todas as suas incríveis possibilidades.</p>
                    <a href="Login.html" class="btn-explorar"><i class="fas fa-arrow-right"></i> Participar</a>
                </div>

            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2025 Calmamente. Todos os direitos reservados.</p>
        <div class="links">
            <a href="#" id="termsLink">Termos de Uso</a>
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