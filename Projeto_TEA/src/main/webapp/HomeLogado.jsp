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
    <style>
        /* Variáveis de Cores e Fontes - Mais VIBRANTES e LÚDICAS */
        :root {
            --cor-fundo-principal: #E0F7FA; /* Azul Céu Bem Leve */
            --cor-nuvem: #FFFFFF; /* Branco Nuvem */
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
            background-color: var(--cor-fundo-principal);
            color: var(--cor-texto-escuro);
            line-height: 1.6;
            overflow-x: hidden;
            background-image: linear-gradient(to bottom, var(--cor-fundo-principal), var(--cor-grama-clara)); /* Degradê suave de céu para terra */
            min-height: 100vh; /* Ocupa a altura total da viewport */
            display: flex;
            flex-direction: column;
        }

        main {
            flex-grow: 1; /* Faz o main ocupar o espaço restante */
        }

        /* Estilo para as nuvens (elementos decorativos) */
        .cloud {
            position: absolute;
            background: var(--cor-nuvem);
            border-radius: 50%;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            animation: moveCloud 30s linear infinite;
            z-index: 0; /* Fica atrás do conteúdo */
        }
        .cloud.small { width: 80px; height: 50px; top: 10%; left: -10%; animation-duration: 25s; }
        .cloud.medium { width: 120px; height: 70px; top: 5%; left: 30%; animation-duration: 35s; }
        .cloud.large { width: 150px; height: 90px; top: 15%; right: -10%; animation-duration: 40s; }
        .cloud:nth-child(2) { animation-delay: -10s; }
        .cloud:nth-child(3) { animation-delay: -20s; }
        .cloud:nth-child(4) { animation-delay: -5s; left: -20%; }
        .cloud:nth-child(5) { animation-delay: -15s; top: 20%; right: -15%; animation-duration: 30s;}

        @keyframes moveCloud {
            0% { transform: translateX(-100vw); }
            100% { transform: translateX(200vw); }
        }

        /* Cabeçalho - Mais Lúdico */
        header {
            background-color: var(--cor-primaria-acao); /* Azul para o céu */
            padding: 1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px var(--cor-sombra-leve);
            border-bottom-left-radius: 25px;
            border-bottom-right-radius: 25px;
            position: relative;
            z-index: 1000;
        }

        .logo {
            font-family: var(--fonte-titulo);
            font-size: 2.2rem;
            font-weight: 700;
            color: var(--cor-texto-claro);
            text-decoration: none;
            text-shadow: 2px 2px 0 rgba(0,0,0,0.1);
            transition: transform 0.2s ease;
        }
        .logo:hover {
            transform: scale(1.05);
        }

        /* Novo estilo para o display do usuário logado */
        .nav-buttons .user-display {
            font-family: var(--fonte-corpo);
            font-size: 1.1rem;
            font-weight: 700;
            color: var(--cor-texto-claro);
            padding: 0.5rem 1.2rem;
            background-color: var(--cor-roxo-divertido); /* Cor de destaque para o nome do usuário */
            border-radius: 20px;
            box-shadow: 0 3px 6px rgba(0,0,0,0.2);
            display: flex;
            align-items: center;
            gap: 8px;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
        }

        .nav-buttons .user-display:hover {
            background-color: #9966FF; /* Roxo um pouco mais escuro */
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0,0,0,0.25);
        }
        .nav-buttons .user-display i {
            font-size: 1.3rem;
        }

        /* Seção Principal (Hero) - Mundo de Descobertas */
        .hero-world {
            position: relative;
            text-align: center;
            padding: 6rem 5% 8rem;
            margin-bottom: 3rem;
            overflow: hidden; /* Para as nuvens */
            min-height: 400px;
        }

        .hero-content {
            position: relative;
            z-index: 1; /* Garante que o conteúdo fique acima das nuvens */
        }

        .hero-world h1 {
            font-family: var(--fonte-titulo);
            font-size: 4rem;
            color: var(--cor-roxo-divertido); /* Roxo divertido */
            margin-bottom: 1.5rem;
            font-weight: 700;
            text-shadow: 3px 3px 0px rgba(0,0,0,0.05);
            animation: bounceIn 1s ease-out; /* Animação de entrada */
            line-height: 1.2;
        }

        .hero-world p {
            font-family: var(--fonte-corpo);
            font-size: 1.5rem;
            color: var(--cor-texto-medio);
            max-width: 800px;
            margin: 0 auto 2.5rem auto;
            line-height: 1.6;
            word-break: break-word;
        }

        /* ESTILOS PARA O BOTÃO PRINCIPAL "EXPLORAR" (usado também nos cards) */
        .btn-explorar {
            background-color: var(--cor-primaria-acao);
            color: var(--cor-texto-claro);
            padding: 1.2rem 2.8rem;
            border: none;
            border-radius: 40px;
            font-family: var(--fonte-titulo);
            font-size: 1.8rem;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin: 2.5rem auto 0.5rem auto;
            max-width: 300px;
            text-align: center;
            text-decoration: none;
        }
        .btn-explorar:hover {
            background-color: #33AADD;
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.25);
        }
        .btn-explorar i {
            font-size: 2rem;
            color: var(--cor-secundaria-acao); /* Amarelo no ícone */
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

        /* Seção "Nossas Ilhas de Aventura" */
        .adventure-islands {
            background-color: var(--cor-grama-escura); /* Fundo verde */
            padding: 4rem 5%;
            text-align: center;
            border-top-left-radius: 50px;
            border-top-right-radius: 50px;
            border-bottom-left-radius: 50px;
            border-bottom-right-radius: 50px;
            box-shadow: inset 0 8px 15px rgba(0,0,0,0.1);
            position: relative;
        }

        .adventure-islands h2 {
            font-family: var(--fonte-titulo);
            font-size: 3.5rem;
            color: var(--cor-texto-claro); /* Branco para contraste */
            margin-bottom: 3rem;
            text-shadow: 2px 2px 0px rgba(0,0,0,0.15);
            line-height: 1.2;
        }

        .island-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 2.5rem;
        }

        /* ESTILOS PARA OS CARDS DAS ILHAS E SEUS BOTÕES */
        .island-card {
            background-color: var(--cor-nuvem); /* Fundo branco para os cards */
            border-radius: 30px;
            padding: 2.5rem;
            width: 320px;
            box-shadow: 0 8px 16px var(--cor-sombra-leve);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 2px solid var(--cor-borda-elementos);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
        }

        .island-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 12px 24px rgba(0,0,0,0.2);
        }

        .island-card .icon-wrapper {
            background: linear-gradient(45deg, var(--cor-primaria-acao), var(--cor-secundaria-acao));
            border-radius: 50%;
            width: 100px;
            height: 100px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 1.5rem auto;
            font-size: 4rem;
            color: var(--cor-texto-claro);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            transition: transform 0.3s ease;
        }
        .island-card:hover .icon-wrapper {
            transform: rotate(5deg);
        }

        /* Cores de fundo dos ícones dos cards */
        .island-card:nth-child(1) .icon-wrapper { background: linear-gradient(45deg, var(--cor-terciaria-acao), #FF66A3); } /* Rosa */
        .island-card:nth-child(2) .icon-wrapper { background: linear-gradient(45deg, var(--cor-secundaria-acao), #FFB800); } /* Amarelo */
        .island-card:nth-child(3) .icon-wrapper { background: linear-gradient(45deg, var(--cor-primaria-acao), #3399FF); } /* Azul */
        .island-card:nth-child(4) .icon-wrapper { background: linear-gradient(45deg, #B388FF, #9966FF); } /* Roxo */

        .island-card h3 {
            font-family: var(--fonte-titulo);
            font-size: 2rem;
            color: var(--cor-roxo-divertido);
            margin-bottom: 1rem;
            line-height: 1.2;
        }

        .island-card p {
            font-family: var(--fonte-corpo);
            font-size: 1.15rem;
            color: var(--cor-texto-medio);
            margin-bottom: 1.5rem;
            line-height: 1.5;
            word-break: break-word;
        }

        /* ESTILOS ESPECÍFICOS PARA OS BOTÕES DENTRO DOS CARDS DAS ILHAS */
        .island-card .btn-explorar {
            padding: 0.8rem 1.8rem;
            font-size: 1.2rem;
            max-width: 220px;
            margin: 1.5rem auto 0.5rem auto;
        }

        .island-card .btn-explorar i {
            font-size: 1.3rem;
        }

        /* Rodapé - Base do Mundo */
        footer {
            background-color: var(--cor-grama-escura); /* Mesma cor da seção de ilhas */
            color: var(--cor-texto-claro);
            text-align: center;
            padding: 2.5rem 5%;
            font-size: 1rem;
            box-shadow: inset 0 5px 10px rgba(0,0,0,0.1);
            border-top-left-radius: 25px;
            border-top-right-radius: 25px;
            position: relative;
        }

        footer .links {
            margin-top: 1.5rem;
            display: flex;
            justify-content: center;
            gap: 1.5rem;
        }

        footer .links a {
            color: var(--cor-texto-claro);
            text-decoration: none;
            transition: color 0.3s ease, transform 0.2s ease;
            padding: 0.5rem 0;
            font-weight: 600;
        }

        footer .links a:hover {
            color: var(--cor-secundaria-acao);
            transform: translateY(-2px);
        }

        /* Responsividade */
        @media (max-width: 1024px) {
            .hero-world h1 {
                font-size: 3.5rem;
            }
            .hero-world p {
                font-size: 1.3rem;
            }
            .btn-explorar {
                font-size: 1.5rem;
                padding: 1rem 2.5rem;
            }
            .btn-explorar i {
                font-size: 1.8rem;
            }
            .adventure-islands h2 {
                font-size: 3rem;
            }
            .island-card {
                width: 45%;
            }
        }

        @media (max-width: 768px) {
            header {
                flex-direction: column;
                align-items: center;
                padding: 1rem 3%;
            }
            .logo {
                margin-bottom: 0.8rem;
                font-size: 1.8rem;
            }
            .nav-buttons {
                width: 100%;
                justify-content: center;
            }
            .nav-buttons .user-display {
                font-size: 0.95rem;
                padding: 0.4rem 0.8rem;
                margin: 0;
            }
            .hero-world {
                padding: 4rem 3% 6rem;
            }
            .hero-world h1 {
                font-size: 2.8rem;
            }
            .hero-world p {
                font-size: 1.1rem;
            }
            .btn-explorar {
                font-size: 1.3rem;
                padding: 1rem 2rem;
                gap: 8px;
            }
            .btn-explorar i {
                font-size: 1.5rem;
            }

            .adventure-islands {
                padding: 3rem 3%;
                border-top-left-radius: 40px;
                border-top-right-radius: 40px;
            }
            .adventure-islands h2 {
                font-size: 2.5rem;
            }
            .island-container {
                flex-direction: column;
                align-items: center;
                gap: 1.5rem;
            }
            .island-card {
                width: 90%;
                padding: 2rem;
            }
            .island-card .icon-wrapper {
                width: 80px;
                height: 80px;
                font-size: 3.5rem;
            }
            .island-card h3 {
                font-size: 1.7rem;
            }
            .island-card p {
                font-size: 1.05rem;
            }

            footer {
                padding: 2rem 3%;
                font-size: 0.9rem;
            }
            footer .links {
                flex-direction: column;
                gap: 0.5rem;
            }
        }

        @media (max-width: 480px) {
            .hero-world h1 {
                font-size: 2.2rem;
            }
            .btn-explorar {
                font-size: 1.1rem;
                padding: 0.8rem 1.5rem;
            }
            .adventure-islands h2 {
                font-size: 2rem;
            }
            .island-card h3 {
                font-size: 1.5rem;
            }
            .island-card p {
                font-size: 1rem;
            }
            .logo {
                margin-bottom: 0.8rem;
                text-align: center;
                width: 100%;
            }
            .nav-buttons {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="cloud small" style="top: 10%; left: 5%;"></div>
    <div class="cloud medium" style="top: 20%; left: 40%;"></div>
    <div class="cloud large" style="top: 15%; right: 5%;"></div>
    <div class="cloud small" style="top: 30%; left: 15%;"></div>
    <div class="cloud medium" style="top: 25%; right: 20%;"></div>

    <header>
        <a href="HomeLogado.jsp" class="logo">Calmamente</a>
        <nav class="nav-buttons">
            <span class="user-display">
                <i class="fas fa-user-circle"></i> Olá, <%
                // Acessa o nome do usuário da sessão.
                // Se o usuário não estiver logado (sessão vazia), exibe "Convidado".
                String usuarioLogadoNome = (String) session.getAttribute("usuarioLogado");
                if (usuarioLogadoNome != null && !usuarioLogadoNome.trim().isEmpty()) {
                    out.print(usuarioLogadoNome);
                } else {
                    out.print("Convidado"); // Idealmente, esta página não deveria ser acessada sem login
                }
                %>
            </span>
            <a href="LogoutServlet" class="user-display" style="background-color: var(--cor-terciaria-acao); margin-left: 10px;">
                <i class="fas fa-sign-out-alt"></i> Sair
            </a>
        </nav>
    </header>

    <main>
        <section class="hero-world">
            <div class="hero-content">
                <h1>Bem-vindo(a) de volta ao Calmamente!</h1>
                <p>Que bom ter você aqui novamente. Continue sua jornada de descobertas e explore as ferramentas que te ajudarão a expressar e entender suas emoções!</p>
                <a href="#adventure-islands" class="btn-explorar">
                    <i class="fas fa-magic"></i> Começar Sua Aventura!
                </a>
            </div>
        </section>

  <section class="adventure-islands" id="adventure-islands">
    <h2>Nossas Ferramentas Mágicas</h2>
    <div class="island-container">
        <div class="island-card">
            <div class="icon-wrapper" style="background: linear-gradient(45deg, var(--cor-terciaria-acao), #FF66A3);"><i class="fas fa-volume-up"></i></div>
            <h3>Vozes para a Comunicação</h3>
            <p>Crie seus próprios "folders" com frases e imagens. Ao clicar, a frase se transforma em áudio MP3, dando voz aos seus pensamentos de forma fácil e divertida.</p>
            <a href="GerenciarFolders.html" class="btn-explorar">
                <i class="fas fa-folder-open"></i> Meus Folders
            </a>
        </div>
        <div class="island-card">
            <div class="icon-wrapper" style="background: linear-gradient(45deg, var(--cor-secundaria-acao), #FFB800);"><i class="fas fa-heart"></i></div>
            <h3>Guia de Sentimentos</h3>
            <p>Explore um mundo de emoções. Escolha o sentimento que você está sentindo e seja guiado por vídeos do YouTube que trazem conforto e compreensão.</p>
            <a href="IlhaSentimento.jsp" class="btn-explorar"> <i class="fas fa-video"></i> Navegar Emoções
            </a>
        </div>
        <div class="island-card">
            <div class="icon-wrapper" style="background: linear-gradient(45deg, var(--cor-primaria-acao), #3399FF);"><i class="fas fa-calendar-check"></i></div>
            <h3>Relatório de Aventuras</h3>
            <p>Visualize quais foram as suas emoções dos ultimos tempos!</p>
            <a href="MeuDiario.html" class="btn-explorar">
                <i class="fas fa-book"></i> Ver Diário
            </a>
        </div>
    </div>
</section>

        </main>

    <footer>
        <p>&copy; 2025 Calmamente. Todos os direitos reservados. Feito com carinho para você!</p>
        <div class="links">
            <a href="#">Privacidade</a>
            <a href="#">Termos</a>
            <a href="#">Ajuda</a>
        </div>
    </footer>

    <script>
        // Smooth scroll para o botão "Começar Sua Aventura!"
        document.querySelector('.hero-world .btn-explorar').addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                window.scrollTo({
                    top: targetElement.offsetTop - document.querySelector('header').offsetHeight, // Ajusta para o header fixo
                    behavior: 'smooth'
                });
            }
        });
    </script>

</body>
</html>