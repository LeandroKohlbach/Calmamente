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
    <link rel="stylesheet" href="./CSS/headerLogado.css">
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

    <jsp:include page="./JSPs/headerLogado.jsp"/>

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
		<jsp:include page="./JSPs/footer.jsp"/>
	</body>
</html>