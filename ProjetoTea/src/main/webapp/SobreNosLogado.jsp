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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
        body,
        h1,
        h2,
        h3,
        p,
        ul,
        li,
        button {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: var(--fonte-corpo);
            background-color: var(--cor-fundo-principal);
            color: var(--cor-texto-escuro);
            line-height: 1.6;
            overflow-x: hidden;
            /* **Mantido aqui para controle global** */
            background-image: linear-gradient(to bottom, var(--cor-fundo-principal), var(--cor-grama-clara));
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

        @keyframes moveCloud {
            0% {
                transform: translateX(-100vw);
            }

            100% {
                transform: translateX(100vw);
            }
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

        @keyframes bounceIn {

            0%,
            20%,
            40%,
            60%,
            80%,
            100% {
                animation-timing-function: cubic-bezier(0.215, .61, .355, 1);
            }

            0% {
                opacity: 0;
                transform: scale3d(.3, .3, .3);
            }

            20% {
                transform: scale3d(1.1, 1.1, 1.1);
            }

            40% {
                transform: scale3d(.9, .9, .9);
            }

            60% {
                opacity: 1;
                transform: scale3d(1.03, 1.03, 1.03);
            }

            80% {
                transform: scale3d(.97, .97, .97);
            }

            100% {
                opacity: 1;
                transform: scale3d(1, 1, 1);
            }
        }

        /* CONTEÚDO DA PÁGINA SOBRE NÓS */
        .about-us-container {
            max-width: 1100px;
            margin: 4rem auto;
            padding: 3rem;
            background-color: var(--cor-nuvem);
            border-radius: 40px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
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
            text-shadow: 3px 3px 0px rgba(0,0,0,0.08);
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
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
            border: 8px solid var(--cor-nuvem);
            outline: 3px solid var(--cor-primaria-acao);
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

       img{
            width: 80px; /* Logo um pouco maior */
            height: auto; /* Mantém a proporção */
            margin-right: 20px;
        }

         @keyframes bounceIn {
            0%, 20%, 40%, 60%, 80%, 100% {
                animation-timing-function: cubic-bezier(0.215, .61, .355, 1);
            }
            0% {
                opacity: 0;
                transform: scale3d(.3, .3, .3);
            }
            20% {
                transform: scale3d(1.1, 1.1, 1.1);
            }
            40% {
                transform: scale3d(.9, .9, .9);
            }
            60% {
                opacity: 1;
                transform: scale3d(1.03, 1.03, 1.03);
            }
            80% {
                transform: scale3d(.97, .97, .97);
            }
            100% {
                opacity: 1;
                transform: scale3d(1, 1, 1);
            }
        }
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
            <a href="#" class="nav-link" id="contactButton">
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
        <div class="about-us-container">
            <div class="about-us-text">
                <h1>Sobre o Calmamente</h1>
                <p>Bem-vindo ao <strong>Calmamente</strong>, um espaço digital seguro e acolhedor, criado com muito carinho para a comunidade autista, suas famílias e amigos. Nascemos do desejo de construir um mundo mais inclusivo, onde cada indivíduo se sinta compreendido, apoiado e valorizado em sua essência.</p>
                <p>Nossa missão é ser um farol de esperança e conhecimento, oferecendo ferramentas práticas, atividades lúdicas e uma rede de apoio mútua. Acreditamos que, ao conectar pessoas e compartilhar experiências, podemos desmistificar o Transtorno do Espectro Autista (TEA) e fortalecer os laços que nos unem.</p>
                <p>No Calmamente, você encontrará desde recursos para o registro e compreensão das emoções até atividades desenvolvidas para estimular habilidades sociais e cognitivas, tudo em um ambiente leve, divertido e, acima de tudo, respeitoso.</p>
            </div>
            <div class="about-us-image">
                <img src="./imagens/crianca.jpg" alt="Criança brincando com blocos coloridos em um ambiente calmo">
            </div>
        </div>
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

        const userProfileBtn = document.getElementById('userProfileBtn');
        const userDropdown = document.getElementById('userDropdown');

        userProfileBtn.addEventListener('click', () => {
            userDropdown.classList.toggle('show');
        });

        window.addEventListener('click', (event) => {
            if (!userProfileBtn.contains(event.target) && !userDropdown.contains(event.target)) {
                userDropdown.classList.remove('show');
            }
        });

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