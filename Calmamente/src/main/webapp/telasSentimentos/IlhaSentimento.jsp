<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Calmamente: Ilha dos Sentimentos</title>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        /* Variáveis de Cores e Fontes */
        :root {
            --cor-fundo-principal: #E0F7FA; --cor-nuvem: #FFFFFF; --cor-grama-clara: #DCE8CC; --cor-grama-escura: #A8D8B9;
            --cor-primaria-acao: #66CCFF; --cor-secundaria-acao: #FFD700; --cor-terciaria-acao: #FF99CC; --cor-roxo-divertido: #B388FF;
            --cor-texto-escuro: #333333; --cor-texto-medio: #555555; --cor-texto-claro: #FFFFFF;
            --cor-sombra-leve: rgba(0, 0, 0, 0.1); --cor-borda-elementos: rgba(0, 0, 0, 0.15);
            --fonte-titulo: 'Fredoka', sans-serif; --fonte-corpo: 'Nunito', sans-serif;
        }
            
        /* Reset Básico */
        body, h1, h2, h3, p, ul, li, button { margin: 0; padding: 0; box-sizing: border-box; }
 
        body {
            font-family: 'Nunito', sans-serif; background-color: #E0F7FA; color: #333333; line-height: 1.6; overflow-x: hidden;
            background-image: linear-gradient(to bottom, #E0F7FA, #CCEEFF); min-height: 100vh; display: flex; flex-direction: column;
        }
 
        main { flex-grow: 1; display: flex; justify-content: center; align-items: center; padding: 2rem; position: relative; z-index: 1; }
 
        /* Estilo para as nuvens */
        .cloud { position: absolute; background: #FFFFFF; border-radius: 50%; box-shadow: 0 4px 8px rgba(0,0,0,0.05); animation: moveCloud 30s linear infinite; z-index: 0; }
        .cloud.small { width: 80px; height: 50px; } .cloud.medium { width: 120px; height: 70px; } .cloud.large { width: 150px; height: 90px; }
        .cloud:nth-child(1) { top: 10%; left: 5%; animation-duration: 25s; } .cloud:nth-child(2) { top: 20%; left: 40%; animation-duration: 35s; animation-delay: -10s; }
        .cloud:nth-child(3) { top: 15%; right: 5%; animation-duration: 40s; animation-delay: -20s; } .cloud:nth-child(4) { top: 30%; left: 15%; animation-duration: 30s; animation-delay: -5s; }
        .cloud:nth-child(5) { top: 25%; right: 20%; animation-duration: 38s; animation-delay: -15s; }
 
        @keyframes moveCloud { 0% { transform: translateX(-100vw); } 100% { transform: translateX(200vw); } }
 
        /* Cabeçalho */
        header {
            background-color: #66CCFF; padding: 1rem 5%; display: flex; justify-content: space-between; align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); border-bottom-left-radius: 25px; border-bottom-right-radius: 25px; position: relative; z-index: 1000;
        }
 
        .logo { font-family: 'Fredoka', sans-serif; font-size: 2.2rem; font-weight: 700; color: #FFFFFF; text-decoration: none; text-shadow: 2px 2px 0 rgba(0,0,0,0.1); transition: transform 0.2s ease; }
        .logo:hover { transform: scale(1.05); }

        /* === INÍCIO: ESTILOS PARA O MENU DE USUÁRIO (COPIADO DA HOME LOGADO) === */
        .nav-buttons {
            position: relative; /* Necessário para posicionar o dropdown */
        }

        .user-profile-button {
            background-color: var(--cor-roxo-divertido);
            color: var(--cor-texto-claro);
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            font-size: 1.8rem;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 3px 6px rgba(0,0,0,0.2);
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
        }

        .user-profile-button:hover {
            background-color: #9966FF; /* Roxo um pouco mais escuro */
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0,0,0,0.25);
        }

        .dropdown-content {
            display: none; /* Escondido por padrão */
            position: absolute;
            top: calc(100% + 10px); /* Posição abaixo do botão */
            right: 0;
            background-color: var(--cor-nuvem);
            min-width: 220px;
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            border-radius: 15px;
            z-index: 1;
            overflow: hidden; /* Garante que os filhos respeitem o border-radius */
            animation: fadeIn 0.3s ease-out;
        }

        /* Classe 'show' que será adicionada via JavaScript para exibir o menu */
        .dropdown-content.show {
            display: block;
        }

        .dropdown-content .user-info {
            padding: 1rem 1.5rem;
            font-family: var(--fonte-titulo);
            font-size: 1.2rem;
            color: var(--cor-texto-escuro);
            background-color: #f8f8f8;
            border-bottom: 1px solid var(--cor-borda-elementos);
        }

        .dropdown-content .user-info strong {
            color: var(--cor-roxo-divertido);
        }

        .dropdown-content a {
            color: var(--cor-texto-medio);
            padding: 1rem 1.5rem;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 1.1rem;
            transition: background-color 0.2s ease;
        }

        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        .dropdown-content a i {
            font-size: 1.2rem;
            width: 20px; /* Alinha o texto */
            text-align: center;
        }
        
        /* Cor específica para o ícone de editar e sair */
        .dropdown-content a .fa-pencil-alt { color: var(--cor-secundaria-acao); }
        .dropdown-content a .fa-sign-out-alt { color: var(--cor-terciaria-acao); }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        /* === FIM: ESTILOS PARA O MENU DE USUÁRIO === */


        /* Seção Emoções */
        .emotions-section {
            background-color: #FFFFFF; padding: 3rem 4rem; border-radius: 30px; box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center; max-width: 600px; width: 100%; border: 2px solid rgba(0, 0, 0, 0.15);
        }
 
        .emotions-section h2 {
            font-family: 'Fredoka', sans-serif; font-size: 3rem; color: #B388FF; margin-bottom: 2.5rem; text-shadow: 1px 1px 0px rgba(0,0,0,0.05);
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
            width: 170px; display: flex; flex-direction: column; align-items: center; gap: 1rem; padding: 1.5rem 1rem;
            background-color: #E0F7FA; border-radius: 20px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease; border: 1px solid rgba(0, 0, 0, 0.15);
        }
 
        .emotion-card:hover { transform: translateY(-8px) scale(1.03); box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15); background-color: #F0F8FF; }
 
        .emotion-card .icon-emotion { font-size: 5rem; color: #66CCFF; margin-bottom: 0.5rem; transition: transform 0.3s ease; }
 
        .emotion-card:hover .icon-emotion { transform: scale(1.1) rotate(5deg); }
 
        /* Cores dos ícones */
        .emotion-card.ansioso .icon-emotion { color: #FFB800; }
        .emotion-card.medo .icon-emotion { color: #8A2BE2; }
        .emotion-card.bravo .icon-emotion { color: #FF4500; }
        .emotion-card.triste .icon-emotion { color: #3366FF; }
        .emotion-card.feliz .icon-emotion { color: #00CC66; }
        .emotion-card.calmo .icon-emotion { color: #66CCFF; }
 
        .emotion-card p { font-family: 'Fredoka', sans-serif; font-size: 1.6rem; font-weight: 700; color: #333333; }
 
        /* Rodapé */
        footer {
            max-height: 60px; background-color: var(--cor-grama-escura); color: #FFFFFF; text-align: center;
            padding: 2.5rem 5%; font-size: 1rem; box-shadow: inset 0 5px 10px rgba(0, 0, 0, 0.1);
            border-top-left-radius: 25px; border-top-right-radius: 25px; position: relative; z-index: 1000;
        }
 
        footer .links { margin-top: 1.5rem; display: flex; justify-content: center; gap: 1.5rem; }
 
        footer .links a {
            color: #FFFFFF; text-decoration: none; transition: color 0.3s ease, transform 0.2s ease;
            padding: 0.5rem 0; font-weight: 600;
        }
 
        footer .links a:hover { color: #FFD700; transform: translateY(-2px); }
 
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
        <a href="../HomeLogado.jsp" class="logo">Calmamente</a> 
        <nav class="nav-buttons">
            <%-- Ícone do Perfil do Usuário com Dropdown --%>
            <button class="user-profile-button" id="userProfileBtn">
                <i class="fas fa-user-circle"></i>
            </button>
            
            <div class="dropdown-content" id="userDropdownMenu">
                <div class="user-info">
                    Olá, <strong>
                    <%
                        String userName = (String) session.getAttribute("usuarioLogado");
                        if (userName == null || userName == "") { // Corrigido para comparação segura com String vazia
                            userName = "Usuário";
                        }
                        out.print(userName);
                    %>
                    </strong>
                </div>
                <a href="../EditarPerfil.jsp">
                    <i class="fas fa-pencil-alt"></i> Editar Perfil
                </a>
                <a href="../telasHome/Home.html"> <%-- Assumindo que 'telasHome/Home.html' é sua página de logout --%>
                    <i class="fas fa-sign-out-alt"></i> Sair
                </a>
            </div>
        </nav>
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
                <div class="emotion-card feliz" data-emotion="feliz">
                    <i class="far fa-smile-beam icon-emotion"></i>
                    <p>Feliz</p>
                </div>
                <div class="emotion-card calmo" data-emotion="calmo">
                    <i class="far fa-laugh-squint icon-emotion"></i>
                    <p>Calmo</p>
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