<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Calmamente: Cuidando do Lumi</title>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        :root {
            /* ... (Variáveis de Cor - sem alterações) ... */
            --cor-fundo-noite-1: #2c3e50; --cor-fundo-noite-2: #465a70; --cor-fundo-container: #ffffff;
            --cor-titulo-calmo: #e5a963; --cor-texto-conforto: #5c6b7a; --cor-botao-calmo: #f0c48a;
            --cor-botao-tocando: #e5a963; --cor-sombra-sonho: rgba(229, 169, 99, 0.15);
            --cor-lumi-corpo: #fdeec9; --cor-lumi-olhos: #5c6b7a; --cor-lumi-sombra: rgba(44, 62, 80, 0.2);
            --cor-lumi-brilho: #fff; --cor-estrela-luz: #fff;
            --fonte-titulo: 'Fredoka', sans-serif; --fonte-corpo: 'Nunito', sans-serif;
        }

        body, h1, h2, h3, p, ul, li, button { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: var(--fonte-corpo), sans-serif; color: var(--cor-texto-conforto); line-height: 1.6; overflow-x: hidden; background-image: linear-gradient(to bottom, var(--cor-fundo-noite-1), var(--cor-fundo-noite-2)); min-height: 100vh; display: flex; flex-direction: column; position: relative; }
        main { flex-grow: 1; display: flex; justify-content: center; align-items: center; padding: 2rem; position: relative; z-index: 1; }
        
        /* CSS das Estrelas (REINTRODUZIDO) */
        .star { position: absolute; background-color: var(--cor-estrela-luz); border-radius: 50%; box-shadow: 0 0 5px var(--cor-estrela-luz), 0 0 10px var(--cor-estrela-luz); animation: twinkle 5s linear infinite; z-index: 0; cursor: pointer; }
        .star.s1 { width: 2px; height: 2px; top: 15%; left: 10%; animation-duration: 4s; }
        .star.s2 { width: 3px; height: 3px; top: 30%; left: 80%; animation-duration: 6s; }
        .star.s3 { width: 2px; height: 2px; top: 50%; left: 30%; animation-duration: 3s; }
        .star.s4 { width: 1px; height: 1px; top: 70%; left: 90%; animation-duration: 5s; }
        .star.s5 { width: 2px; height: 2px; top: 80%; left: 20%; animation-duration: 7s; }
        @keyframes twinkle { 0% { opacity: 0.6; } 50% { opacity: 1; } 100% { opacity: 0.6; } }

        /* CSS da Luz da Estrela (REINTRODUZIDO) */
        .star-light { position: fixed; background-color: var(--cor-estrela-luz); width: 5px; height: 5px; border-radius: 50%; opacity: 1; box-shadow: 0 0 10px var(--cor-estrela-luz); z-index: 10; transition: transform 0.8s ease-in, opacity 0.8s ease-in; pointer-events: none; }

        header { background-color: rgba(0,0,0,0.1); padding: 1rem 5%; display: flex; justify-content: space-between; align-items: center; border-bottom-left-radius: 25px; border-bottom-right-radius: 25px; position: relative; z-index: 1000; }
        .logo { font-family: var(--fonte-titulo); font-size: 2.2rem; font-weight: 700; color: #fff; text-decoration: none; text-shadow: 2px 2px 0 rgba(0,0,0,0.1); }
        .content-wrapper { background-color: var(--cor-fundo-container); padding: 2.5rem 3rem; border-radius: 30px; box-shadow: 0 10px 40px var(--cor-sombra-sonho); text-align: center; max-width: 800px; width: 100%; border: 1px solid var(--cor-botao-calmo); }
        .content-wrapper h1 { font-family: var(--fonte-titulo); font-size: 3rem; font-weight: 700; color: var(--cor-titulo-calmo); margin-bottom: 1.5rem; }
        .content-wrapper .intro-text { font-size: 1.2rem; color: var(--cor-texto-conforto); margin-bottom: 2.5rem; max-width: 600px; margin-left: auto; margin-right: auto; }
        .activity-area { margin-bottom: 2.5rem; padding: 1.5rem; border-radius: 20px; min-height: 250px; display:flex; justify-content:center; align-items:center; position: relative; }

        /* --- CSS DO LUMI (Com todas as animações) --- */
        .lumi-container { position: relative; animation: float 6s ease-in-out infinite; cursor: pointer; }
        .lumi-body { width: 180px; height: 160px; background: radial-gradient(circle at 50% 100%, #fff, var(--cor-lumi-corpo) 70%); border-radius: 50% 50% 45% 45%; position: relative; animation: gentleBreathe 5s ease-in-out infinite; box-shadow: inset 0 -10px 20px rgba(0,0,0,0.05); }
        .lumi-body.is-fed { animation: gentleBreathe 5s ease-in-out infinite, lumiFeed 0.5s ease-out; }
        .lumi-container.is-tickled { animation: tickleAnimation 1s ease-in-out; }
        .lumi-eyes { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -60%); display: flex; gap: 30px; }
        .lumi-eye { width: 15px; height: 20px; background-color: var(--cor-lumi-olhos); border-radius: 50%; animation: blink 7s ease-in-out infinite; transition: all 0.2s ease; }
        .lumi-container.is-tickled .lumi-eye { height: 5px; transform: translateY(7px); }
        .lumi-mouth { position: absolute; bottom: 25%; left: 50%; width: 30px; height: 10px; background-color: transparent; border: 2px solid var(--cor-lumi-olhos); border-color: transparent transparent var(--cor-lumi-olhos) transparent; border-radius: 0 0 15px 15px; transform: translateX(-50%); opacity: 0.7; transition: all 0.2s ease; }
        .lumi-container.is-tickled .lumi-mouth { width: 40px; height: 20px; border-radius: 0 0 20px 20px; }
        .lumi-shadow { width: 120px; height: 20px; background-color: var(--cor-lumi-sombra); border-radius: 50%; margin: 20px auto 0; filter: blur(8px); opacity: 0.7; animation: shadowBreathe 5s ease-in-out infinite; }
        
        @keyframes float { 0% { transform: translateY(0px); } 50% { transform: translateY(-15px); } 100% { transform: translateY(0px); } }
        @keyframes gentleBreathe { 0% { transform: scale(1); } 50% { transform: scale(1.05); } 100% { transform: scale(1); } }
        @keyframes shadowBreathe { 0% { transform: scale(1); opacity: 0.7; } 50% { transform: scale(0.95); opacity: 0.5; } 100% { transform: scale(1); opacity: 0.7; } }
        @keyframes blink { 0%, 90%, 100% { transform: scaleY(1); } 95% { transform: scaleY(0.1); } }
        @keyframes lumiFeed { 0% { transform: scale(1.05); } 50% { transform: scale(1.15); box-shadow: 0 0 25px var(--cor-lumi-brilho); } 100% { transform: scale(1.05); } }
        @keyframes tickleAnimation { 0% { transform: translateX(0) rotate(0); } 15% { transform: translateX(-8px) rotate(-4deg); } 30% { transform: translateX(8px) rotate(4deg); } 45% { transform: translateX(-8px) rotate(-4deg); } 60% { transform: translateX(8px) rotate(4deg); } 75% { transform: translateX(-5px) rotate(-2deg); } 90% { transform: translateX(5px) rotate(2deg); } 100% { transform: translateX(0) rotate(0); } }
        
        /* ... (Restante do CSS sem alterações) ... */
        .action-box h3 { font-family: var(--fonte-titulo); font-size: 1.8rem; margin-bottom: 1rem; color: var(--cor-texto-conforto); }
        .action-box p { font-size: 1.1rem; margin-bottom: 1.5rem; }
        .audio-button { font-family: var(--fonte-titulo); font-size: 1.2rem; padding: 0.8rem 1.8rem; border: none; border-radius: 50px; cursor: pointer; transition: transform 0.2s ease, box-shadow 0.2s ease, background-color 0.3s ease; background-color: var(--cor-botao-calmo); color: var(--cor-texto-conforto); font-weight: 500; display: inline-flex; align-items: center; gap: 10px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        .audio-button:hover { transform: translateY(-3px); box-shadow: 0 6px 15px rgba(0,0,0,0.15); }
        .audio-button.playing { background-color: var(--cor-botao-tocando); }
        footer { background-color: rgba(0,0,0,0.2); color: #fff; text-align: center; padding: 2.5rem 5%; font-size: 1rem; border-top-left-radius: 25px; border-top-right-radius: 25px; position: relative; z-index: 1000; }
        .nav-buttons { position: relative; }
        .user-profile-button { background-color: rgba(255,255,255,0.2); color: #fff; border: none; border-radius: 50%; width: 50px; height: 50px; font-size: 1.8rem; cursor: pointer; display: flex; justify-content: center; align-items: center; transition: background-color 0.3s ease; }
        .dropdown-content { display: none; position: absolute; top: calc(100% + 10px); right: 0; background-color: #fff; min-width: 220px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2); border-radius: 15px; z-index: 1; overflow: hidden; animation: fadeIn 0.3s ease-out; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
        .dropdown-content.show { display: block; }
        .dropdown-content .user-info { padding: 1rem 1.5rem; font-family: var(--fonte-titulo); font-size: 1.2rem; color: #333; background-color: #f8f8f8; border-bottom: 1px solid #ddd; }
        .dropdown-content .user-info strong { color: var(--cor-titulo-calmo); }
        .dropdown-content a { color: #555; padding: 1rem 1.5rem; text-decoration: none; display: flex; align-items: center; gap: 10px; font-size: 1.1rem; transition: background-color 0.2s ease; }
        .dropdown-content a i { font-size: 1.2rem; width: 20px; text-align: center; }
    </style>
</head>
<body>
    <div class="star s1"></div><div class="star s2"></div><div class="star s3"></div><div class="star s4"></div><div class="star s5"></div>

    <header>
        <a href="IlhaSentimento.jsp" class="logo">Calmamente</a>
        <nav class="nav-buttons">
            <button class="user-profile-button" id="userProfileBtn">
                <i class="fas fa-user-circle"></i>
            </button>
            <div class="dropdown-content" id="userDropdownMenu">
                <div class="user-info">
                    Olá, <strong>
                    <%
                        String userName = (String) session.getAttribute("usuarioLogado");
                        if (userName == null || userName.isEmpty()) {
                            userName = "Usuário";
                        }
                        out.print(userName);
                    %>
                    </strong>
                </div>
                <a href="../EditarPerfil.jsp"><i class="fas fa-pencil-alt"></i> Editar Perfil</a>
                <a href="../telasHome/Home.html"><i class="fas fa-sign-out-alt"></i> Sair</a>
            </div>
        </nav>
    </header>

    <main>
        <div class="content-wrapper medo">
            <h1>Um Amigo para se Divertir</h1>
            <p class="intro-text">Às vezes, um pouco de diversão é a melhor forma de esquecer o medo. Que tal fazer cócegas no seu amigo Lumi?</p>
            
            <div class="activity-area">
                <div class="lumi-container" id="lumiContainer">
                    <div class="lumi-body" id="lumiBody">
                        <div class="lumi-eyes">
                            <div class="lumi-eye"></div>
                            <div class="lumi-eye"></div>
                        </div>
                        <div class="lumi-mouth" id="lumiMouth"></div>
                    </div>
                    <div class="lumi-shadow"></div>
                </div>
            </div>

            <div class="action-box">
                <h3>Cuide e divirta-se com o Lumi</h3>
                <p>Clique nas estrelas para alimentá-lo ou clique diretamente nele para fazer cócegas!</p>

                <button id="play-pause-button-medo" class="audio-button">
                    <i class="fas fa-headphones-alt"></i> Tocar Música Calma
                </button>
                
                <audio id="audio-conforto" src="${pageContext.request.contextPath}/audios/audio-medo.mp3" loop preload="auto"></audio>
                <audio id="audio-giggle" src="${pageContext.request.contextPath}/audios/audio-risada.mp3" preload="auto"></audio>
            </div>
        </div>
    </main>

    <footer>
        <p>&copy; 2025 Calmamente. Todos os direitos reservados. Feito com carinho para você!</p>
        <div class="links"><a href="#">Privacidade</a><a href="#">Termos</a><a href="#">Ajuda</a></div>
    </footer>

    <script>
        const stars = document.querySelectorAll('.star');
        const lumiContainer = document.getElementById('lumiContainer');
        const lumiBody = document.getElementById('lumiBody');
        const audioGiggle = document.getElementById('audio-giggle');

        // --- Interação 1: Alimentar com Estrelas (REINTEGRADA) ---
        stars.forEach(star => {
            star.addEventListener('click', function(event) {
                event.stopPropagation(); // ESSENCIAL: Impede que o clique na estrela acione a cócega.

                const starRect = star.getBoundingClientRect();
                const startX = starRect.left + starRect.width / 2;
                const startY = starRect.top + starRect.height / 2;

                const light = document.createElement('div');
                light.classList.add('star-light');
                document.body.appendChild(light);
                
                light.style.left = `${startX}px`;
                light.style.top = `${startY}px`;

                window.requestAnimationFrame(() => {
                    const lumiRect = lumiBody.getBoundingClientRect();
                    const endX = lumiRect.left + lumiRect.width / 2;
                    const endY = lumiRect.top + lumiRect.height / 2;

                    light.style.transform = `translate(${endX - startX}px, ${endY - startY}px)`;
                    light.style.opacity = '0';

                    light.addEventListener('transitionend', () => {
                        light.remove();
                        lumiBody.classList.add('is-fed');
                        setTimeout(() => {
                            lumiBody.classList.remove('is-fed');
                        }, 500);
                    }, { once: true });
                });
            });
        });

        // --- Interação 2: Cócegas ao Clicar no Lumi ---
        if (lumiContainer) {
            lumiContainer.addEventListener('click', function() {
                if (!lumiContainer.classList.contains('is-tickled')) {
                    if (audioGiggle) {
                        audioGiggle.currentTime = 0;
                        audioGiggle.play();
                    }
                    lumiContainer.classList.add('is-tickled');
                    setTimeout(() => {
                        lumiContainer.classList.remove('is-tickled');
                    }, 1000);
                }
            });
        }

        // --- SCRIPT PARA CONTROLAR O ÁUDIO DE FUNDO ---
        const playButtonMedo = document.getElementById('play-pause-button-medo');
        const audioConforto = document.getElementById('audio-conforto');
        // ... (resto do script de áudio e dropdown permanece igual)
        const playContentMedo = '<i class="fas fa-headphones-alt"></i> Tocar Música Calma';
        const pauseContentMedo = '<i class="fas fa-pause"></i> Pausar Música';

        if (playButtonMedo && audioConforto) {
            playButtonMedo.addEventListener('click', () => {
                if (audioConforto.paused) {
                    audioConforto.play();
                    playButtonMedo.innerHTML = pauseContentMedo;
                    playButtonMedo.classList.add('playing');
                } else {
                    audioConforto.pause();
                    playButtonMedo.innerHTML = playContentMedo;
                    playButtonMedo.classList.remove('playing');
                }
            });
        }
        
        // --- SCRIPT PARA MENU DROPDOWN ---
        const userProfileBtn = document.getElementById('userProfileBtn');
        const userDropdownMenu = document.getElementById('userDropdownMenu');

        if (userProfileBtn && userDropdownMenu) {
            userProfileBtn.addEventListener('click', function(event) {
                event.stopPropagation(); 
                userDropdownMenu.classList.toggle('show');
            });

            window.addEventListener('click', function(event) {
                if (userDropdownMenu.classList.contains('show')) {
                    if (!userProfileBtn.contains(event.target) && !userDropdownMenu.contains(event.target)) {
                        userDropdownMenu.classList.remove('show');
                    }
                }
            });
        }
    </script>
</body>
</html>