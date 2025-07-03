<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Calmamente: Acalmando o Lumi</title>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        :root {
            /* PALETA DE CORES: "AMANHECER SERENO" */
            --cor-fundo-tenso: #2c3e50;
            --cor-texto-tenso: #E2E8F0;
            --cor-container-tenso: rgba(44, 62, 80, 0.6);
            --cor-lumi-raiva: #e53e3e;
            --cor-estrela: #f7fafc;
            --cor-fundo-calmo-1: #FFDAB9;
            --cor-fundo-calmo-2: #BEE3F8;
            --cor-container-calmo: #ffffff;
            --cor-texto-calmo: #2D3748;
            --cor-acento-calmo: #4FD1C5;
            --cor-grama-calma: #9AE6B4;
            --cor-lumi-corpo: #fdeec9;
            --cor-lumi-olhos: #4A5568;
            --cor-botao-fundo: #f7fafc;
            --cor-botao-borda: #E2E8F0;
            --cor-texto-claro: #FFFFFF;
            --fonte-titulo: 'Fredoka', sans-serif; 
            --fonte-corpo: 'Nunito', sans-serif;
        }

        body { 
            font-family: var(--fonte-corpo), sans-serif; 
            line-height: 1.6; 
            overflow-x: hidden; 
            min-height: 100vh; 
            display: flex; 
            flex-direction: column; 
            background-color: var(--cor-fundo-tenso); 
            transition: background-color 4s ease-in-out, background-image 4s ease-in-out; 
            position: relative;
        }
        body.is-calm { 
            background-color: var(--cor-fundo-calmo-2); 
            background-image: linear-gradient(to bottom, var(--cor-fundo-calmo-1), var(--cor-fundo-calmo-2)); 
        }

        .star { position: absolute; background-color: var(--cor-estrela); border-radius: 50%; box-shadow: 0 0 5px var(--cor-estrela); animation: twinkle 5s linear infinite; z-index: -1; transition: opacity 2s ease; }
        .is-calm .star { opacity: 0; }
        .s1 { width: 1px; height: 1px; top: 15%; left: 10%; animation-duration: 4s; }
        .s2 { width: 2px; height: 2px; top: 30%; left: 80%; animation-duration: 6s; }
        .s3 { width: 1px; height: 1px; top: 50%; left: 30%; animation-duration: 3s; }
        @keyframes twinkle { 0%, 100% { opacity: 0.5; } 50% { opacity: 1; } }

        main { flex-grow: 1; display: flex; justify-content: center; align-items: center; padding: 2rem; }
        header { padding: 1rem 5%; display: flex; justify-content: space-between; align-items: center; background-color: transparent; }
        .logo { font-family: var(--fonte-titulo); font-size: 2.2rem; font-weight: 700; color: var(--cor-texto-claro); text-decoration: none; text-shadow: 1px 1px 2px rgba(0,0,0,0.2); }
        
        .content-wrapper { 
            background-color: var(--cor-container-tenso); 
            backdrop-filter: blur(8px); 
            padding: 2.5rem 3rem; 
            border-radius: 30px; 
            box-shadow: 0 10px 40px rgba(0,0,0,0.2); 
            text-align: center; 
            max-width: 800px; 
            width: 100%;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: background-color 2s ease, color 2s ease, border-color 2s ease;
        }
        .is-calm .content-wrapper { background-color: var(--cor-container-calmo); border-color: transparent; box-shadow: 0 10px 30px rgba(45, 55, 72, 0.1); }
        
        .content-wrapper h1 { font-family: var(--fonte-titulo); font-size: 2.8rem; font-weight: 700; color: var(--cor-texto-tenso); margin-bottom: 1rem; transition: color 2s ease; }
        .is-calm .content-wrapper h1 { color: var(--cor-acento-calmo); }
        
        .content-wrapper p { font-size: 1.2rem; color: var(--cor-texto-tenso); margin-bottom: 1.5rem; max-width: 600px; margin: 0 auto 1.5rem; transition: color 2s ease; }
        .is-calm .content-wrapper p { color: var(--cor-texto-calmo); }
        
        .activity-area { margin: 0 auto 1.5rem; min-height: 250px; display: flex; justify-content: center; align-items: center; position: relative; }

        /* ... (CSS do Lumi e Animações - sem alterações) ... */
        .lumi-container { position: relative; transform-origin: bottom center; }
        .lumi-container.is-angry { animation: shake 0.5s infinite; }
        .lumi-container.is-calmed { animation: float 6s ease-in-out infinite; }
        .lumi-body { width: 180px; height: 160px; background-color: var(--cor-lumi-corpo); border-radius: 50% 50% 45% 45%; position: relative; }
        .lumi-anger-overlay { position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: var(--cor-lumi-raiva); border-radius: inherit; opacity: 1; transition: opacity 1.5s ease-out; pointer-events: none; animation: pulse-red 2s infinite; }
        @keyframes pulse-red { 50% { box-shadow: 0 0 35px 5px var(--cor-lumi-raiva); } }
        .lumi-eyes, .eyebrows, .lumi-mouth { --cor-lumi-olhos: #4A5568; }
        .is-calm .lumi-eyes, .is-calm .eyebrows, .is-calm .lumi-mouth { --cor-lumi-olhos: #2D3748; }
        .lumi-eyes { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -60%); display: flex; gap: 30px; }
        .lumi-eye { width: 15px; height: 20px; background-color: var(--cor-lumi-olhos); border-radius: 50%; transition: background-color 2s ease; }
        .lumi-mouth { position: absolute; bottom: 25%; left: 50%; transform: translateX(-50%); width: 40px; height: 20px; border: 3px solid var(--cor-lumi-olhos); border-color: transparent transparent var(--cor-lumi-olhos) transparent; border-radius: 0 0 20px 20px; transition: all 0.5s ease; }
        .eyebrows { position: absolute; top: 35%; left: 50%; transform: translateX(-50%); width: 100px; height: 20px; transition: opacity 0.5s ease, background-color 2s ease; }
        .eyebrow { position: absolute; width: 35px; height: 5px; background-color: var(--cor-lumi-olhos); border-radius: 5px; }
        .eyebrow.left { left: 0; transform: rotate(15deg); } .eyebrow.right { right: 0; transform: rotate(-15deg); }
        .is-calmed .eyebrows { opacity: 0; }
        .is-calmed .lumi-mouth { border-radius: 0 0 40px 40px; height: 25px; bottom: 20%; }
        @keyframes shake { 0%, 100% { transform: translateX(0); } 25% { transform: translateX(-5px); } 75% { transform: translateX(5px); } }
        @keyframes float { 0% { transform: translateY(0px); } 50% { transform: translateY(-15px); } 100% { transform: translateY(0px); } }
        .lumi-container.is-breathing { animation: breathe-body 3s ease-in-out; }
        @keyframes breathe-body { 50% { transform: scale(1.15); } }
        .lumi-container.is-stomping { animation: stomp 0.8s ease-in-out; }
        @keyframes stomp { 25% { transform: translateY(-20px); } 50% { transform: translateY(0); } 75% { transform: translateY(-20px); } 100% { transform: translateY(0); } }
        .lumi-container.is-rocking { animation: gentle-rock 2.5s ease-in-out; }
        @keyframes gentle-rock { 0%, 100% { transform: rotate(0deg); } 25% { transform: rotate(-8deg); } 75% { transform: rotate(8deg); } }

        #calming-choices { margin-top: 1.5rem; border-top: 2px dashed var(--cor-texto-tenso); padding-top: 1.5rem; display: flex; justify-content: center; gap: 1rem; flex-wrap: wrap; transition: border-color 2s ease; }
        .is-calm #calming-choices { border-top-color: #CBD5E0; }
        .choice-button { display: flex; flex-direction: column; align-items: center; gap: 8px; border: 2px solid var(--cor-botao-borda); background-color: var(--cor-botao-fundo); padding: 1rem; border-radius: 20px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); cursor: pointer; transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.3s ease, background-color 0.3s ease; min-width: 120px; }
        .is-calm .choice-button { background-color: #fff; border-color: #E2E8F0; }
        .choice-button:hover { transform: translateY(-5px); border-color: var(--cor-acento-calmo); box-shadow: 0 8px 20px rgba(79,209,197,0.2); }
        .choice-button i { font-size: 2.5rem; color: var(--cor-texto-calmo); transition: color 0.3s ease; }
        .choice-button:hover i { color: var(--cor-acento-calmo); }
        .choice-button span { font-family: var(--fonte-titulo); font-size: 1rem; font-weight: 500; color: #4A5568; }
        .choice-button.is-disabled { opacity: 0.5; cursor: not-allowed; pointer-events: none; }
        .is-calm .choice-button.is-disabled { background-color: #F7FAFC; }

        /* --- CSS DO DROPDOWN DO PERFIL (REINSERIDO E ESTILIZADO) --- */
        .nav-buttons { position: relative; z-index: 1000; }
        .user-profile-button { 
            background-color: rgba(255,255,255,0.2); 
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
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .is-calm .user-profile-button { background-color: var(--cor-acento-calmo); }
        .user-profile-button:hover { transform: translateY(-2px); }

        .dropdown-content { display: none; position: absolute; top: calc(100% + 10px); right: 0; background-color: #fff; min-width: 220px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2); border-radius: 15px; z-index: 1; overflow: hidden; animation: fadeInDropdown 0.3s ease-out; }
        @keyframes fadeInDropdown { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
        .dropdown-content.show { display: block; }
        .dropdown-content .user-info { padding: 1rem 1.5rem; font-family: var(--fonte-titulo); font-size: 1.2rem; color: #333; background-color: #f8f8f8; border-bottom: 1px solid #ddd; }
        .dropdown-content .user-info strong { color: var(--cor-acento-calmo); }
        .dropdown-content a { color: #555; padding: 1rem 1.5rem; text-decoration: none; display: flex; align-items: center; gap: 10px; font-size: 1.1rem; transition: background-color 0.2s ease; }
        .dropdown-content a:hover { background-color: #f1f1f1; }
        .dropdown-content a i { font-size: 1.2rem; width: 20px; text-align: center; }

        footer { background-color: transparent; color: var(--cor-texto-tenso); text-align: center; padding: 2.5rem 5%; font-size: 1rem; transition: all 2s ease-in-out; }
        body.is-calm footer { background-color: var(--cor-grama-calma); color: var(--cor-texto-calmo); }
    </style>
</head>
<body>
    <div class="star s1"></div><div class="star s2"></div><div class="star s3"></div>

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
                        if (userName == null || userName.isEmpty()) { userName = "Usuário"; }
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
        <div class="content-wrapper">
            <h1 id="main-title">O Lumi parece muito zangado.</h1>
            <p id="main-text">Seu corpo está tenso e quente. O que podemos fazer para ajudá-lo a se sentir melhor? Escolha uma ação.</p>
            
            <div class="activity-area" id="activityArea">
                <div class="lumi-container is-angry" id="lumiContainer">
                    <div class="lumi-body">
                        <div class="lumi-anger-overlay" id="lumiAngerOverlay"></div>
                        <div class="eyebrows">
                            <div class="eyebrow left"></div>
                            <div class="eyebrow right"></div>
                        </div>
                        <div class="lumi-eyes">
                            <div class="lumi-eye"></div>
                            <div class="lumi-eye"></div>
                        </div>
                        <div class="lumi-mouth"></div>
                    </div>
                </div>
            </div>
            
            <div id="calming-choices">
                <button class="choice-button" id="choice-breath">
                    <i class="fas fa-wind"></i>
                    <span>Respirar Fundo</span>
                </button>
                <button class="choice-button" id="choice-rock">
                    <i class="fas fa-feather-alt"></i>
                    <span>Balançar Devagar</span>
                </button>
                <button class="choice-button" id="choice-stomp">
                    <i class="fas fa-shoe-prints"></i>
                    <span>Pisar Forte</span>
                </button>
            </div>

        </div>
    </main>

    <audio id="audio-calm-music" src="${pageContext.request.contextPath}/audios/calm-music.mp3" loop preload="auto"></audio>
    
    <footer>
        <p>&copy; 2025 Calmamente. Todos os direitos reservados.</p>
    </footer>

    <script>
        const lumiContainer = document.getElementById('lumiContainer');
        const lumiAngerOverlay = document.getElementById('lumiAngerOverlay');
        const mainTitle = document.getElementById('main-title');
        const mainText = document.getElementById('main-text');
        const audioCalmMusic = document.getElementById('audio-calm-music');
        const choiceButtons = document.querySelectorAll('.choice-button');

        let actionsTaken = 0;
        const actionsNeeded = 4;
        let isCalmed = false;
        let isAnimating = false;

        choiceButtons.forEach(button => {
            button.addEventListener('click', () => {
                if (isCalmed || isAnimating) return;
                isAnimating = true;
                handleCareAction(button.id);
            });
        });

        function handleCareAction(actionId) {
            actionsTaken++;
            
            switch(actionId) {
                case 'choice-breath':
                    lumiContainer.classList.add('is-breathing');
                    setTimeout(() => lumiContainer.classList.remove('is-breathing'), 3000);
                    break;
                case 'choice-rock':
                    lumiContainer.classList.add('is-rocking');
                    setTimeout(() => lumiContainer.classList.remove('is-rocking'), 2500);
                    break;
                case 'choice-stomp':
                    lumiContainer.classList.add('is-stomping');
                    setTimeout(() => lumiContainer.classList.remove('is-stomping'), 800);
                    break;
            }

            const newOpacity = 1 - (actionsTaken / actionsNeeded);
            lumiAngerOverlay.style.opacity = newOpacity;

            if (actionsTaken >= actionsNeeded) {
                isCalmed = true;
                choiceButtons.forEach(b => b.classList.add('is-disabled'));
                setTimeout(startCalmingSequence, 2000);
            } else {
                setTimeout(() => isAnimating = false, 2500);
            }
        }

        function startCalmingSequence() {
            lumiContainer.classList.remove('is-angry');
            lumiContainer.classList.add('is-calmed');
            document.body.classList.add('is-calm');

            mainTitle.textContent = "O Lumi está calmo agora!";
            mainText.innerHTML = "Uau! Fazer essas coisas ajudou o Lumi a se sentir melhor.<br>Bom trabalho em equipe!";
            
            if (audioCalmMusic) {
                audioCalmMusic.volume = 0.5;
                audioCalmMusic.play();
            }
        }

        // --- SCRIPT DO MENU DROPDOWN (REINSERIDO) ---
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