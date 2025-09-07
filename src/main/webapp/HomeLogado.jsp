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
         RESPONSIVIDADE GERAL 
        ===========
        */


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
                width: 80%;
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
            
             .hero-banner { 
           		 padding: 3rem 2%;
           		 margin-bottom: 2rem;
           		 border-bottom-left-radius: 20px;
           		 border-bottom-right-radius: 20px;}
            .hero-banner h1 { 
            	font-size: 2.5rem; }
            .hero-banner p { 
           		font-size: 1rem; margin-bottom: 2rem;}
            .hero-banner .cta-group { 
           		gap: 1rem; }
            .hero-banner .btn-primary, .hero-banner .btn-secondary { 
            	font-size: 1rem; padding: 0.8rem 1.5rem; width: 90%; }
            .welcome-section { 
            	padding: 2rem 2%; margin: 1rem auto 2rem auto; border-radius: 20px; }
            .welcome-section h2 { 
            	font-size: 2rem; }
            .welcome-section p { 
            	font-size: 0.95rem;
             }
            .content-highlights { 
            	width: 80%;
            	padding: 2.5rem 2%;
             	margin: 0 auto 2.5rem auto;
             	border-radius: 20px;
              }
            .content-highlights h2 { 
            font-size: 2.5rem;
             }
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
            width: 80%;
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
            .hero-banner h1 {
            font-size: 4rem; }
            .hero-banner p {
            font-size: 1.5rem; }
            .hero-banner .cta-group {
            flex-direction: column;
            width: 80%;
            margin-right:10%;
            margin-left:10%;
            gap: 1.5rem; }
            .hero-banner .btn-primary, .hero-banner .btn-secondary {
            width: 80%;
            max-width: 350px; }
            .welcome-section h2 {
            font-size: 3rem; }
            .welcome-section p {
            font-size: 1.2rem; }
            .content-highlights h2 {
            font-size: 3.5rem; }
        }

        @media (max-width: 768px) {
            .hero-banner { 
            padding: 4rem 3%; 
            margin-bottom: 3rem; 
            border-bottom-left-radius: 30px; 
            border-bottom-right-radius: 30px;}
            .hero-banner h1 { 
            font-size: 2.5rem; }
            .hero-banner p { 
            padding:5px;
            font-size: 1.3rem; }
            .hero-banner .btn-primary, .hero-banner .btn-secondary { 
            font-size: 1.2rem; 
            padding: 1rem 2rem; }
            .welcome-section { 
            padding: 3rem 3%; 
            margin: 1.5rem auto 3rem auto; 
            border-radius: 30px; }
            .welcome-section h2 { 
            font-size: 2.5rem; }
            .welcome-section p { 
            font-size: 1.1rem; }
            .content-highlights { 
            width:80%;
            padding: 3rem 3%;
            margin: 0 auto 3rem auto;
            border-radius: 30px; 
            }
            .content-highlights h2 { 
            font-size: 3rem; }
        }
     
    </style>
</head>
<body>
    <!-- Cabeçalho incluído -->
    <jsp:include page="./JSPs/headerLogado.jsp" />

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
                    <a href="SobreNosLogado.jsp" class="btn-explorar"><i class="fas fa-arrow-right"></i> Participar</a>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="./JSPs/footer.jsp"/>

   
</body>

</html>