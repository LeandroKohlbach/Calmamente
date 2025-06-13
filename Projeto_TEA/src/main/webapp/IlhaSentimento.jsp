<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calmamente: Ilha dos Sentimentos</title>
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
            font-family: 'Nunito', sans-serif;
            background-color: #E0F7FA; /* Azul Céu Bem Leve */
            color: #333333;
            line-height: 1.6;
            overflow-x: hidden;
            /* Degradê suave de azul céu muito claro para um tom levemente mais azul */
            background-image: linear-gradient(to bottom, #E0F7FA, #CCEEFF); /* Azul Céu muito claro para um tom levemente mais azul */
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
        }
 
        /* Estilo para as nuvens (elementos decorativos) */
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
        .cloud:nth-child(5) { top: 25%; right: 20%; animation-duration: 38s; animation-delay: -15s;}
 
        @keyframes moveCloud {
            0% { transform: translateX(-100vw); }
            100% { transform: translateX(200vw); }
        }
 
        /* Cabeçalho - Mais Lúdico */
        header {
            background-color: #66CCFF; /* Azul Brilhante */
            padding: 1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-bottom-left-radius: 25px;
            border-bottom-right-radius: 25px;
            position: relative;
            z-index: 1000;
        }
 
        .logo {
            font-family: 'Fredoka', sans-serif;
            font-size: 2.2rem;
            font-weight: 700;
            color: #FFFFFF;
            text-decoration: none;
            text-shadow: 2px 2px 0 rgba(0,0,0,0.1);
            transition: transform 0.2s ease;
        }
        .logo:hover {
            transform: scale(1.05);
        }
        .nav-buttons .user-display {
            font-family: 'Nunito', sans-serif;
            font-size: 1.1rem; /* Tamanho original */
            font-weight: 700;
            color: #FFFFFF;
            padding: 0.5rem 1rem; /* Padding original */
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            display: flex;
            align-items: center;
            gap: 8px;
            transition: transform 0.2s ease-out, background-color 0.2s ease-out;
        }
 
        /* Seção Emoções */
        .emotions-section {
            background-color: #FFFFFF;
            padding: 3rem 2rem;
            border-radius: 30px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 810px;
            width: 100%;
            border: 2px solid rgba(0, 0, 0, 0.15);
        }
 
        .emotions-section h2 {
            font-family: 'Fredoka', sans-serif;
            font-size: 3rem;
            color: #B388FF; /* Roxo Claro */
            margin-bottom: 2.5rem;
            text-shadow: 1px 1px 0px rgba(0,0,0,0.05);
        }
 
        .emotions-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 2rem;
            /* ALINHAMENTO PARA CENTRALIZAR OS CARDS - MANTIDO */
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
            background-color: #E0F7FA; /* Azul Céu Bem Leve (original do card) */
            border-radius: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
            border: 1px solid rgba(0, 0, 0, 0.15);
        }
 
        .emotion-card:hover {
            transform: translateY(-8px) scale(1.03);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            background-color: #F0F8FF; /* Azul muito claro, quase branco (AliceBlue) para o hover */
        }
 
        .emotion-card .icon-emotion {
            font-size: 5rem;
            color: #66CCFF; /* Azul Brilhante para os ícones */
            margin-bottom: 0.5rem;
            transition: transform 0.3s ease;
        }
 
        .emotion-card:hover .icon-emotion {
            transform: scale(1.1) rotate(5deg);
        }
 
        /* Cores dos ícones baseadas na imagem de inspiração */
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
 
        /* Rodapé - Base do Mundo */
        footer {
            max-height: 60px;
            background-color: var(--cor-grama-escura); /* Azul mais suave para o footer */
            color: #FFFFFF; /* Texto branco para o contraste com o azul */
            text-align: center;
            padding: 2.5rem 5%;
            font-size: 1rem;
            box-shadow: inset 0 5px 10px rgba(0, 0, 0, 0.1);
            border-top-left-radius: 25px;
            border-top-right-radius: 25px;
            position: relative;
            z-index: 1000;
        }
 
        footer .links {
            margin-top: 1.5rem;
            display: flex;
            justify-content: center;
            gap: 1.5rem;
        }
 
        footer .links a {
            color: #FFFFFF; /* Links brancos no footer */
            text-decoration: none;
            transition: color 0.3s ease, transform 0.2s ease;
            padding: 0.5rem 0;
            font-weight: 600;
        }
 
        footer .links a:hover {
            color: #FFD700; /* Amarelo Sol no hover dos links do footer */
            transform: translateY(-2px);
        }
 
        /* --- Estilos do Modal --- */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6); /* Fundo semi-transparente */
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 10000; /* Acima de tudo */
            opacity: 0; /* Inicia invisível */
            visibility: hidden; /* Inicia não interativo */
            transition: opacity 0.3s ease, visibility 0.3s ease;
        }
 
        .modal-overlay.active {
            opacity: 1;
            visibility: visible;
        }
 
        .modal-content {
            background-color: #FFFFFF;
            padding: 2.5rem;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 500px;
            width: 90%;
            position: relative;
            transform: translateY(-20px); /* Inicia um pouco acima */
            transition: transform 0.3s ease;
            border: 2px solid var(--cor-roxo-divertido);
        }
        .modal-overlay.active .modal-content {
            transform: translateY(0); /* Desliza para a posição */
        }
 
        .modal-content h3 {
            font-family: 'Fredoka', sans-serif;
            font-size: 2.2rem;
            color: var(--cor-roxo-divertido);
            margin-bottom: 1.5rem;
        }
 
        .modal-content p {
            font-family: 'Nunito', sans-serif;
            font-size: 1.3rem;
            line-height: 1.8;
            color: var(--cor-texto-escuro);
            margin-bottom: 2rem;
        }
 
        .modal-close-btn {
            position: absolute;
            top: 15px;
            right: 15px;
            background: none;
            border: none;
            font-size: 1.8rem;
            color: var(--cor-texto-medio);
            cursor: pointer;
            transition: color 0.2s ease, transform 0.2s ease;
        }
        .modal-close-btn:hover {
            color: var(--cor-bravo); /* Cor mais forte para o hover */
            transform: scale(1.1);
        }
        /* --- Fim dos Estilos do Modal --- */
 
        /* Responsividade */
        @media (max-width: 1024px) {
            .emotions-section h2 {
                font-size: 2.5rem;
            }
            .emotions-grid {
                grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            }
            .emotion-card .icon-emotion {
                font-size: 4rem;
            }
            .emotion-card p {
                font-size: 1.4rem;
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
                display: flex;
                justify-content: space-around;
            }
            /* REMOVIDO: Linhas que diminuíam o botão user-display */
            /* .nav-buttons .user-display {
                font-size: 0.95rem;
                padding: 0.4rem 0.8rem;
                margin: 0;
            } */
 
            main {
                padding: 1.5rem;
            }
            .emotions-section {
                padding: 2rem 1rem;
            }
            .emotions-section h2 {
                font-size: 2rem;
                margin-bottom: 2rem;
            }
            .emotions-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 1.5rem;
            }
            .emotion-card .icon-emotion {
                font-size: 3.5rem;
            }
            .emotion-card p {
                font-size: 1.2rem;
            }
 
            footer {
                padding: 2rem 3%;
                font-size: 0.9rem;
            }
            footer .links {
                flex-direction: column;
                gap: 0.5rem;
            }
            .modal-content {
                padding: 1.8rem;
            }
            .modal-content h3 {
                font-size: 1.8rem;
            }
            .modal-content p {
                font-size: 1.1rem;
            }
        }
 
        @media (max-width: 480px) {
            .emotions-grid {
                grid-template-columns: 1fr;
            }
            .emotions-section h2 {
                font-size: 1.8rem;
            }
            .emotion-card .icon-emotion {
                font-size: 3rem;
            }
            .emotion-card p {
                font-size: 1.1rem;
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
        <a href="HomeLogado.jsp" class="logo">Calmamente</a> <%-- Link para o HomeLogado.jsp --%>
        <nav class="nav-buttons">
            <span class="user-display">
                <i class="fas fa-user-circle"></i> Olá, <strong>
                <%
                    // Acessa o nome do usuário da sessão, usando o mesmo atributo "usuarioLogado"
                    String userName = (String) session.getAttribute("usuarioLogado");
                    if (userName == null || userName.isEmpty()) {
                        userName = "Usuário"; // Nome padrão se não estiver na sessão
                    }
                    out.print(userName);
                %>
                </strong>
            </span>
        </nav>
    </header>
 
    <main>
        <section class="emotions-section">
            <h2>Descubra o Mundo das Emoções!</h2>
            <div class="emotions-grid">
                <div class="emotion-card ansioso" data-emotion="Ansioso">
                    <i class="far fa-frown-open icon-emotion"></i>
                    <p>Ansioso</p>
                </div>
                <div class="emotion-card medo" data-emotion="Medo">
                    <i class="far fa-grimace icon-emotion"></i>
                    <p>Medo</p>
                </div>
                <div class="emotion-card bravo" data-emotion="Bravo">
                    <i class="far fa-angry icon-emotion"></i>
                    <p>Bravo</p>
                </div>
                <div class="emotion-card triste" data-emotion="Triste">
                    <i class="far fa-sad-tear icon-emotion"></i>
                    <p>Triste</p>
                </div>
                <div class="emotion-card feliz" data-emotion="Feliz">
                    <i class="far fa-smile icon-emotion"></i>
                    <p>Feliz</p>
                </div>
                <div class="emotion-card calmo" data-emotion="Calmo">
                    <i class="far fa-meh icon-emotion"></i>
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
 
    <div id="emotionModal" class="modal-overlay">
        <div class="modal-content">
            <button class="modal-close-btn">&times;</button>
            <h3 id="modalEmotionTitle"></h3>
            <p id="modalEmotionTip"></p>
        </div>
    </div>
 
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const emotionCards = document.querySelectorAll('.emotion-card');
            const modal = document.getElementById('emotionModal');
            const modalCloseBtn = document.querySelector('.modal-close-btn');
            const modalEmotionTitle = document.getElementById('modalEmotionTitle');
            const modalEmotionTip = document.getElementById('modalEmotionTip');
 
            // Objeto com as dicas para cada emoção
            const emotionTips = {
                "Ansioso": "Respire fundo. Inspire por 4 segundos, segure por 4, expire por 4. Repita 3 vezes. Ouça uma música calma ou faça uma atividade que você goste.",
                "Medo": "Converse sobre o que te assusta com alguém de confiança. Lembre-se de que é normal sentir medo e que ele vai passar. Procure um lugar seguro e acolhedor.",
                "Bravo": "Conte até 10 antes de reagir. Tente desviar o foco para algo que te acalme, como desenhar ou amassar um papel. Se precisar, peça ajuda a um adulto.",
                "Triste": "Permita-se sentir a tristeza, mas procure fazer algo que te dê um pequeno prazer, como ler um livro, ver um desenho animado ou abraçar um brinquedo favorito. Converse com alguém sobre como você se sente.",
                "Feliz": "Compartilhe sua alegria com as pessoas que você ama! Anote o que te faz feliz para lembrar desses momentos especiais. Celebre suas conquistas, por menores que sejam.",
                "Calmo": "Continue praticando atividades que te deixam tranquilo. Ouça músicas relaxantes, faça exercícios de respiração e aproveite esse momento de paz. Compartilhe sua calma com os outros."
            };
 
            // Adiciona evento de clique a cada cartão de emoção
            emotionCards.forEach(card => {
                card.addEventListener('click', () => {
                    const emotion = card.dataset.emotion;
                    modalEmotionTitle.textContent = emotion;
                    modalEmotionTip.textContent = emotionTips[emotion];
                    modal.classList.add('active'); // Mostra o modal
                });
            });
 
            // Fecha o modal ao clicar no botão de fechar
            modalCloseBtn.addEventListener('click', () => {
                modal.classList.remove('active');
            });
 
            // Fecha o modal ao clicar fora do conteúdo do modal
            modal.addEventListener('click', (event) => {
                if (event.target === modal) {
                    modal.classList.remove('active');
                }
            });
        });
    </script>
 
</body>
</html>