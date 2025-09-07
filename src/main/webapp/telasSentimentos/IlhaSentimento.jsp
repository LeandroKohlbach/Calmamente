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
        /* Estilos específicos da página IlhaSentimento */

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
            box-sizing: border-box;
            width: 100%;
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
            box-sizing: border-box;
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

        /* ESTILOS PARA O OVERLAY DE CARREGAMENTO */
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

        /* Responsividade para a seção de emoções */
        @media (max-width: 1024px) {
            .emotions-section h2 { font-size: 2.5rem; }
            .emotions-grid { grid-template-columns: repeat(2, 1fr); }
            .emotion-card .icon-emotion { font-size: 4rem; }
            .emotion-card p { font-size: 1.4rem; }
            /* Esconde as nuvens em telas pequenas */
            .cloud { display: none; }
        }

        @media (max-width: 768px) {
            main { padding: 1.5rem; }
            .emotions-section { padding: 2rem 1rem; }
            .emotions-section h2 { font-size: 2rem; margin-bottom: 2rem; }
            .emotions-grid { grid-template-columns: repeat(2, 1fr); gap: 1.5rem; }
            .emotion-card .icon-emotion { font-size: 3.5rem; }
            .emotion-card p { font-size: 1.2rem; }
        }

        @media (max-width: 480px) {
            .emotions-grid { grid-template-columns: 1fr; }
            .emotions-section h2 { font-size: 1.8rem; }
            .emotion-card .icon-emotion { font-size: 3rem; }
            .emotion-card p { font-size: 1.1rem; }
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

    <%-- Inclui o cabeçalho externo --%>
    <jsp:include page="../JSPs/headerLogadoPastas.jsp"/>

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

    <%-- Inclui o rodapé externo --%>
    <jsp:include page="../JSPs/footer.jsp"/>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const emotionCards = document.querySelectorAll('.emotion-card');
            const loadingOverlay = document.getElementById('loadingOverlay');
            
            // Recupera o ID do usuário da sessão e o passa para o JavaScript
            const userId = <%= session.getAttribute("userId") instanceof Integer ? session.getAttribute("userId") : "null" %>;

            emotionCards.forEach(card => {
                card.addEventListener('click', (event) => {
                    event.preventDefault();
                    const emotion = card.dataset.emotion.toLowerCase();
                    const page = emotion + ".jsp";

                    loadingOverlay.classList.add('show');

                    const dataToSend = new URLSearchParams();
                    dataToSend.append('tipoEmocao', emotion);
                    if (userId !== null) {
                        dataToSend.append('fkUsuarioId', userId);
                    } else {
                        console.warn('Usuário ID não encontrado na sessão. A emoção será registrada sem associação de usuário.');
                    }

                    fetch('../registrarEmocao.jsp', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: dataToSend.toString()
                    })
                    .then(response => {
                        if (!response.ok) {
                            console.error('Erro ao registrar emoção no servidor:', response.status, response.statusText);
                        }
                        return response.text();
                    })
                    .then(data => {
                        console.log("Resposta do servidor:", data);
                        setTimeout(() => {
                            window.location.href = page;
                        }, 1500);
                    })
                    .catch(error => {
                        console.error('Erro na requisição fetch:', error);
                        setTimeout(() => {
                            window.location.href = page;
                        }, 1500);
                    });
                });
            });
        });
    </script>
</body>
</html>