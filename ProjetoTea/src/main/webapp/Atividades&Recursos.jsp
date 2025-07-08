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
        /*===========
            HEADER 
          ===========
        */
       header {
        background-color: var(--cor-primaria-acao); /* Azul para o cÃ©u */
        padding: 1rem 5%;
        display: flex;
        justify-content: space-between; /* EspaÃ§o entre o primeiro e o Ãºltimo item */
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
            transform: scale(1.02); /* MAIS BRINCALHÃO */
            text-shadow: 4px 4px 0 rgba(0,0,0,0.2);
        }
        
        /* NOVO: ContÃªiner para centralizar os links e botÃ£o de perfil */
        .header-center-container {
            flex-grow: 1; /* Permite que ocupe o espaÃ§o central */
            display: flex;
            justify-content: center; /* Centraliza o conteÃºdo dentro dele */
            align-items: center;
        }
        .nav-links-container {
            display: flex;
            align-items: center;
            margin-left: 155px;
            margin-right: auto;
}
        /* NOVO: Estilos para os links do cabeÃ§alho (Home e Sobre NÃ³s) */
        .nav-link {
    text-decoration: none; /* Remove sublinhado */
    color: var(--cor-texto-claro); /* Cor branca */
    font-family: var(--fonte-titulo);
    font-weight: 700;
    transition: transform 0.2s ease, text-shadow 0.2s ease;
    text-shadow: 2px 2px 0 rgba(0,0,0,0.1);
    padding: 0.5rem 1rem; /* Adiciona padding para Ã¡rea clicÃ¡vel */
    border-radius: 15px; /* Suavemente arredondado */
    margin: 0 10px; /* EspaÃ§o entre os links */
    font-size: 1.3rem;
}

        .nav-link:hover {
    transform: translateY(-3px); /* Efeito de hover */
    text-shadow: 3px 3px 0 rgba(0,0,0,0.2);
    background-color: rgba(255, 255, 255, 0.1); /* Fundo sutil no hover */
}

        /* Tamanho especÃ­fico para o Home */
        .nav-link.home {
    font-size: 1.45rem; /* Tamanho do Home diminuÃ­do */
}

/* Tamanho especÃ­fico para o Sobre NÃ³s */
.nav-link.about-us {
    font-size: 1.45rem; /* Tamanho do Sobre NÃ³s */
}
        
        /* === INÃCIO: ESTILOS PARA O MENU DE USUÃRIO === */

        .user-nav-group {
            position: relative; /* NecessÃ¡rio para posicionar o dropdown */
            display: flex; /* Adicionado para alinhar os botÃµes/links */
            align-items: center;
            gap: 20px; /* EspaÃ§amento entre botÃµes no cabeÃ§alho */
            /* Removedo `nav-buttons` daqui, ele agora Ã© .header-center-container */
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
    font-size: 2rem; /* ÃCONE MAIOR */
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: 0 4px 8px rgba(0,0,0,0.25); /* SOMBRA MAIS SUAVE */
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
    position: relative; /* Para a bolha de notificaÃ§Ã£o se necessÃ¡rio */
}

       .user-profile-button:hover {
    background-color: #9966FF; /* Roxo um pouco mais escuro */
    transform: translateY(-3px) rotate(5deg); /* MAIS BRINCALHÃO */
    box-shadow: 0 6px 12px rgba(0,0,0,0.3);
}

/* ADICIONADO: Efeito de "batida" no Ã­cone do usuÃ¡rio */
.user-profile-button i {
    animation: pulse 2s infinite ease-in-out;
}

        @keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.1); }
    100% { transform: scale(1); }
}

        .dropdown-content {
    display: none; /* Escondido por padrÃ£o */
    position: absolute;
    top: calc(100% + 15px); /* PosiÃ§Ã£o abaixo do botÃ£o, um pouco mais afastado */
    right: 0;
    background-color: var(--cor-nuvem);
    min-width: 250px; /* UM POUCO MAIOR */
    box-shadow: 0 10px 20px 0 rgba(0,0,0,0.25); /* SOMBRA MAIS PRONUNCIADA */
    border-radius: 20px; /* MAIS ARREDONDADO */
    z-index: 1;
    overflow: hidden; /* Garante que os filhos respeitem o border-radius */
    animation: fadeInScale 0.4s ease-out; /* NOVA ANIMAÃÃO */
    border: 2px solid var(--cor-primaria-acao); /* Borda colorida */
}

/* Classe 'show' que serÃ¡ adicionada via JavaScript para exibir o menu */
.dropdown-content.show {
    display: block;
}

        .dropdown-content .user-info {
            padding: 1.2rem 1.8rem; /* MAIOR PADDING */
            font-family: var(--fonte-titulo);
            font-size: 1.3rem; /* TEXTO MAIOR */
            color: var(--cor-texto-escuro);
            background-color: #e6f7ff; /* FUNDO MAIS CLARO E AMIGÃVEL */
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
            gap: 12px; /* MAIOR ESPAÃAMENTO */
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
            font-size: 1.4rem; /* ÃCONES MAIORES */
            width: 25px; /* Alinha o texto */
            text-align: center;
        }
        
        /* Cor especÃ­fica para o Ã­cone de editar e sair */
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
        
        /* === FIM: ESTILOS PARA O MENU DE USUÃRIO === */
        
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
            width: 100%;
            max-width: 1100px; /* Limita a largura para melhor visualizaÃ§Ã£o */
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
            max-width: 320px; /* Limita o tamanho mÃ¡ximo de cada card */
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
            header {
                flex-direction: row; /* MantÃ©m em linha mas ajusta o espaÃ§amento */
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
                justify-content: center; /* Garante centralizaÃ§Ã£o */
                flex-grow: 1; /* Permite ocupar o espaÃ§o */
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
                gap: 10px; /* Reduz o espaÃ§amento entre os botÃµes no mobile */
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

            /* NOVO: Responsividade para os links do cabeÃ§alho */
            .nav-link {
                font-size: 1rem; /* Diminui a fonte no mobile */
            }
            .nav-link.home {
                font-size: 1rem;
                margin-right: 15px; /* Ajusta o espaÃ§amento no mobile */
            }
            .nav-link.about-us {
                font-size: 1rem;
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
            /* NOVO: Responsividade para os links do cabeÃ§alho */
            .nav-link {
                font-size: 0.9rem;
            }
            .nav-link.home {
                font-size: 0.9rem;
            }
            .nav-link.about-us {
                font-size: 0.9rem;
            }
            /* FIM DO NOVO */
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

    <header>
        <img src="./imagens/logo.png" alt="">
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
            <a href="./Historico/historicov1.jsp" class="nav-link" id="contactButton">
                Relatório
            </a>    
            </nav>

        <div class="user-nav">
        <button class="user-profile-button" id="userProfileBtn">
            <i class="fas fa-user-circle"></i>
        </button>
        <div class="dropdown-content" id="userDropdown">
            <div class="user-info">
                Olá, <strong>
                <%
					 Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioObjeto");
 					String userName = usuarioLogado.getNome();
 					if (userName == null || userName.isEmpty()) {
 						userName = "Usuário";
 					}
 					out.print(userName);
                %>                
                </strong>!
            </div>
            <a href="#editar-perfil"><i class="fas fa-pencil-alt"></i> Editar Perfil</a>
            <a href="#sair"><i class="fas fa-sign-out-alt"></i> Sair</a>
        </div>
        </div>
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

    <div id="termsModal" class="modal-overlay">
        <div class="modal-content">
            <button class="close-button">&times;</button>
            <h2>Termos de Serviço</h2>
<p>Bem-vindo(a) ao Calmamente! Ao acessar e usar nosso aplicativo, você concorda em cumprir e estar vinculado(a) aos seguintes termos e condições de uso. Por favor, leia-os atentamente. Se você não concordar com qualquer parte destes termos, não deverá usar o aplicativo.</p>
<h3>1. Uso do Aplicativo</h3>
<p>O aplicativo Calmamente é fornecido para fins de bem-estar e autoajuda. Ele oferece recursos como meditação guiada, diário terapêutico, sons da natureza e exercícios de respiração. O conteúdo e as ferramentas fornecidas são destinados a apoiar o seu bem-estar geral e não substituem o aconselhamento, diagnóstico ou tratamento médico ou psicológico profissional. Sempre procure o conselho de um profissional de saúde qualificado para quaisquer dúvidas sobre sua condição médica ou de saúde mental.</p>
<h3>2. Registro de Conta</h3>
<p>Para acessar certas funcionalidades do aplicativo, pode ser necessário criar uma conta. Você é responsável por manter a confidencialidade das suas informações de login e por todas as atividades que ocorrem sob sua conta. Você concorda em nos notificar imediatamente sobre qualquer uso não autorizado da sua conta ou qualquer outra violação de segurança.</p>
<h3>3. Conteúdo do Usuário</h3>
<p>Qualquer conteúdo que você crie, envie ou armazene no aplicativo, como entradas de diário ou anotações, permanece de sua propriedade. No entanto, ao usar o aplicativo, você nos concede uma licença limitada para armazenar, usar e processar esse conteúdo apenas para fornecer e melhorar os serviços do Calmamente, sempre respeitando sua privacidade conforme detalhado em nossa Política de Privacidade.</p>
<h3>4. Limitação de Responsabilidade</h3>
<p>O Calmamente é fornecido "como está" e "conforme disponível", sem garantias de qualquer tipo, expressas ou implícitas. Não garantimos que o aplicativo será ininterrupto, livre de erros, seguro ou que os resultados obtidos com o uso do aplicativo serão precisos ou confiáveis. Em nenhuma circunstância o Calmamente ou seus criadores serão responsáveis por quaisquer danos diretos, indiretos, incidentais, especiais, consequenciais ou punitivos resultantes do uso ou da incapacidade de usar o aplicativo.</p>
<h3>5. Modificações dos Termos</h3>
<p>Reservamo-nos o direito de modificar estes Termos de Serviço a qualquer momento. Quaisquer alterações serão efetivas imediatamente após a publicação da versão revisada no aplicativo. Seu uso contínuo do aplicativo após a publicação de quaisquer modificações constitui sua aceitação dessas alterações.</p>
<h3>6. Lei Aplicável</h3>
<p>Estes Termos de Serviço serão regidos e interpretados de acordo com as leis do Brasil, sem levar em conta seus princípios de conflitos de leis.</p>
<p>Ao usar o Calmamente, você reconhece que leu, entendeu e concorda em estar vinculado(a) a estes Termos de Serviço.</p>

        </div>
    </div>

    <div id="privacyModal" class="modal-overlay">
        <div class="modal-content">
            <button class="close-button">&times;</button>
            <h2>Política de Privacidade</h2>
<p>Sua privacidade é de extrema importância para nós no Calmamente. Esta Política de Privacidade descreve como coletamos, usamos e protegemos suas informações pessoais ao usar nosso aplicativo.</p>
<h3>1. Coleta de Informações</h3>
<p>Coletamos informações para fornecer e melhorar nossos serviços. Isso pode incluir:</p>
<ul>
    <li><strong>Informações de Registro:</strong> Quando você cria uma conta, podemos solicitar seu nome, endereço de e-mail e outras informações básicas.</li>
    <li><strong>Conteúdo Gerado pelo Usuário:</strong> Informações que você insere voluntariamente, como entradas de diário, anotações de meditação e progresso em exercícios. Este conteúdo é criptografado e tratado com a máxima confidencialidade.</li>
    <li><strong>Dados de Uso:</strong> Coletamos dados anônimos sobre como você interage com o aplicativo, como recursos acessados, tempo de uso e frequência. Isso nos ajuda a entender o comportamento do usuário e a aprimorar a experiência.</li>
    <li><strong>Informações Técnicas:</strong> Dados sobre seu dispositivo (tipo de dispositivo, sistema operacional, versão do aplicativo) para fins de compatibilidade e otimização.</li>
</ul>
<h3>2. Uso das Informações</h3>
<p>Usamos as informações coletadas para:</p>
<ul>
    <li>Fornecer e personalizar os serviços do Calmamente.</li>
    <li>Melhorar e otimizar o desempenho e os recursos do aplicativo.</li>
    <li>Analisar tendências de uso e comportamento do usuário de forma anonimizada para pesquisas e desenvolvimento.</li>
    <li>Comunicar-nos com você sobre atualizações do aplicativo, suporte ou informações relevantes, se você optar por receber.</li>
    <li>Garantir a segurança e integridade do aplicativo.</li>
</ul>
<h3>3. Compartilhamento de Informações</h3>
<p>Nós não vendemos, alugamos ou compartilhamos suas informações pessoais com terceiros para fins de marketing sem o seu consentimento explícito.</p>
<ul>
    <li><strong>Provedores de Serviço:</strong> Podemos usar terceiros confiáveis para realizar funções em nosso nome, como hospedagem de dados, análise de dados ou serviços de suporte. Esses provedores têm acesso às informações necessárias para desempenhar suas funções, mas são obrigados a manter a confidencialidade e não podem usar as informações para outros fins.</li>
    <li><strong>Requisitos Legais:</strong> Podemos divulgar informações se exigido por lei ou em resposta a um processo legal válido, como uma intimação ou ordem judicial.</li>
    <li><strong>Proteção de Direitos:</strong> Podemos divulgar informações quando acreditamos ser apropriado para investigar, prevenir ou tomar medidas relacionadas a atividades ilegais, suspeita de fraude, situações que envolvam ameaças potenciais à segurança física de qualquer pessoa, violações de nossos Termos de Serviço, ou conforme exigido por lei.</li>
</ul>
<h3>4. Segurança dos Dados</h3>
<p>Implementamos medidas de segurança técnicas e organizacionais rigorosas para proteger suas informações contra acesso não autorizado, alteração, divulgação ou destruição. Isso inclui criptografia de dados, firewalls e controles de acesso. No entanto, nenhum método de transmissão pela internet ou de armazenamento eletrônico é 100% seguro, e não podemos garantir a segurança absoluta dos seus dados.</p>
<h3>5. Seus Direitos</h3>
<p>Você tem o direito de acessar, corrigir, atualizar ou excluir suas informações pessoais. Se desejar exercer esses direitos, entre em contato conosco através dos canais de suporte.</p>
<h3>6. Alterações na Política de Privacidade</h3>
<p>Podemos atualizar esta Política de Privacidade periodicamente para refletir mudanças em nossas práticas ou regulamentações. Notificaremos você sobre quaisquer alterações significativas publicando a nova política no aplicativo. Seu uso contínuo do aplicativo após essas alterações constitui sua aceitação da política revisada.</p>
<h3>7. Contato</h3>
<p>Se tiver alguma dúvida sobre esta Política de Privacidade, entre em contato conosco através do e-mail: suporte@calmamente.com</p>

        </div>
    </div>

    <div id="helpModal" class="modal-overlay">
        <div class="modal-content">
            <button class="close-button">&times;</button>
            <h2>Ajuda e Suporte</h2>
<p>Bem-vindo à seção de Ajuda do Calmamente! Aqui você encontra informações úteis para aproveitar ao máximo nosso aplicativo e resolver possíveis dúvidas.</p>
<h3>Perguntas Frequentes (FAQ)</h3>
<h4>Como faço para começar uma meditação?</h4>
<p>Na tela inicial, toque na "Ilha de Meditação Guiada". Lá você encontrará diversas opções de meditações por tema ou duração. Escolha a que mais te agrada e toque em "Iniciar Meditação".</p>
<h4>Posso usar o diário sem conexão com a internet?</h4>
<p>Sim, você pode registrar suas entradas no diário mesmo offline. Elas serão salvas localmente e sincronizadas com sua conta quando você estiver online novamente.</p>
<h4>Como ajusto o volume dos Sons da Natureza?</h4>
<p>Dentro da "Ilha de Sons da Natureza", ao iniciar uma trilha sonora, você verá um controle de volume na tela. Você também pode usar os botões de volume do seu dispositivo.</p>
<h4>Minhas informações no diário são privadas?</h4>
<p>Sim, suas entradas de diário são criptografadas e apenas você tem acesso a elas. Consulte nossa <a href="#" id="privacyLinkInHelp">Política de Privacidade</a> para mais detalhes sobre como protegemos seus dados.</p>
<h4>Esqueci minha senha, o que faço?</h4>
<p>Na tela de login, toque em "Esqueci minha senha". Siga as instruções para redefinir sua senha através do seu e-mail cadastrado.</p>

<h3>Suporte Técnico</h3>
<p>Se você não encontrou a resposta para sua pergunta aqui ou está enfrentando algum problema técnico, nossa equipe de suporte está pronta para ajudar.</p>
<p>Você pode nos contatar através do e-mail:</p>
<p><strong>calmamente.project@gmail.com</strong></p>
<p>Por favor, inclua o máximo de detalhes possível sobre o seu problema, como:</p>
<ul>
    <li>Descrição do problema</li>
    <li>Passos para reproduzir (se aplicável)</li>
    <li>Capturas de tela (se possível)</li>
    <li>Modelo do seu dispositivo e versão do sistema operacional</li>
    <li>Versão do aplicativo Calmamente</li>
</ul>
<p>Nosso objetivo é responder a todas as solicitações de suporte em até 24 horas úteis.</p>

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

        // Event Listeners para fechar os modais (botÃ£o 'x' e clique fora)
        document.querySelectorAll('.modal-overlay .close-button').forEach(button => {
            button.addEventListener('click', (e) => {
                closeModal(e.target.closest('.modal-overlay'));
            });
        });

        document.querySelectorAll('.modal-overlay').forEach(overlay => {
            overlay.addEventListener('click', (e) => {
                if (e.target === overlay) {
                    closeModal(overlay);
                }
            });
        });
    </script>
</body>
</html>