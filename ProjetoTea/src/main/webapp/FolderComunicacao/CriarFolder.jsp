<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="modelos.Usuario" %>
<%
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioObjeto");
    if (usuarioLogado == null) {
        response.sendRedirect(request.getContextPath() + "/telasHome/login.jsp");
        return;
    }
    String userName = usuarioLogado.getNome();
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Calmamente: Criar Novo Folder</title>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        :root {
            --cor-fundo-principal: #E0F7FA;
            --cor-grama-escura: #A8D8B9;
            --cor-secundaria-acao: #FFD700;
            --cor-texto-claro: #FFFFFF;
            --cor-principal-calma: #76D7C4;
            --cor-acento-calma: #A3D9B1;
            --cor-sombra-suave: rgba(118, 215, 196, 0.2);
            --cor-texto-suave: #4A5568;
            --fonte-titulo: 'Fredoka', sans-serif;
            --fonte-corpo: 'Nunito', sans-serif;
            --cor-fundo-detalhes: #FFFFFF;
            --cor-nuvem: #FFFFFF;
            --cor-texto-escuro: #333;
            --cor-borda-elements: #ddd;
            --cor-roxo-divertido: #8A2BE2;
        }
        body, h1, h2, h3, p, button, input, textarea { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: var(--fonte-corpo), sans-serif; background-color: var(--cor-fundo-principal); color: var(--cor-texto-suave); line-height: 1.6; background-image: linear-gradient(to bottom, #E0F7FA, #CCEEFF); min-height: 100vh; display: flex; flex-direction: column; }
        main { flex-grow: 1; display: flex; flex-direction: column; align-items: center; padding: 2rem; position: relative; z-index: 1; }
        header { background-color: #66CCFF; padding: 1rem 5%; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); border-bottom-left-radius: 25px; border-bottom-right-radius: 25px; position: relative; z-index: 1000; }
        .logo { font-family: var(--fonte-titulo); font-size: 2.2rem; font-weight: 700; color: var(--cor-texto-claro); text-decoration: none; text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1); }
        .nav-buttons { position: relative; }
        .user-profile-button { background-color: var(--cor-roxo-divertido); color: var(--cor-texto-claro); border: none; border-radius: 50%; width: 50px; height: 50px; font-size: 1.8rem; cursor: pointer; display: flex; justify-content: center; align-items: center; box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2); transition: all 0.3s ease; }
        .user-profile-button:hover { background-color: #9966FF; transform: translateY(-2px); }
        .dropdown-content { display: none; position: absolute; top: calc(100% + 10px); right: 0; background-color: var(--cor-nuvem); min-width: 220px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2); border-radius: 15px; z-index: 1; overflow: hidden; }
        .dropdown-content.show { display: block; }
        .dropdown-content .user-info { padding: 1rem 1.5rem; font-family: var(--fonte-titulo); font-size: 1.2rem; color: var(--cor-texto-escuro); background-color: #f8f8f8; border-bottom: 1px solid var(--cor-borda-elements); }
        .dropdown-content .user-info strong { color: var(--cor-roxo-divertido); }
        .dropdown-content a { color: #555; padding: 1rem 1.5rem; text-decoration: none; display: flex; align-items: center; gap: 10px; font-size: 1.1rem; transition: background-color 0.2s ease; }
        .dropdown-content a:hover { background-color: #f1f1f1; }
        .dropdown-content a i { font-size: 1.2rem; width: 20px; text-align: center; }
        .form-container { background-color: var(--cor-fundo-detalhes); border: 1px solid var(--cor-borda-elements); border-radius: 20px; box-shadow: 0 8px 20px var(--cor-sombra-suave); padding: 2.5rem; width: 90%; max-width: 700px; display: flex; flex-direction: column; gap: 1.5rem; }
        .form-container h1 { font-family: var(--fonte-titulo); font-size: 2.5rem; color: var(--cor-principal-calma); text-align: center; margin-bottom: 0.5rem; }
        .form-group { display: flex; flex-direction: column; }
        .form-group label { font-size: 1.2rem; color: var(--cor-texto-suave); margin-bottom: 0.8rem; font-weight: 600; }
        .form-group input[type="text"], .form-group textarea { width: 100%; padding: 12px 15px; border: 1px solid var(--cor-borda-elements); border-radius: 8px; font-size: 1.1rem; font-family: var(--fonte-corpo); color: var(--cor-texto-escuro); transition: all 0.3s ease; }
        .form-group textarea { resize: vertical; min-height: 100px; }
        .form-group input[type="text"]:focus, .form-group textarea:focus { outline: none; border-color: var(--cor-principal-calma); box-shadow: 0 0 0 3px rgba(118, 215, 196, 0.3); }
        .form-group input[type="file"] { font-size: 1rem; border: 1px dashed var(--cor-borda-elements); padding: 1rem; border-radius: 8px; background-color: #f9f9f9; cursor: pointer; }
        .form-group input[type="file"]::file-selector-button { margin-right: 1rem; border: none; background: var(--cor-principal-calma); padding: 10px 20px; border-radius: 8px; color: #fff; cursor: pointer; transition: background-color .2s ease-in-out; }
        .form-group input[type="file"]::file-selector-button:hover { background: var(--cor-acento-calma); }
        .form-actions { display: flex; justify-content: center; gap: 1rem; margin-top: 1rem; }
        .form-actions button, .form-actions a { border: none; border-radius: 10px; padding: 0.8rem 1.8rem; font-size: 1.2rem; font-weight: 700; cursor: pointer; text-decoration: none; text-align: center; transition: all 0.2s ease; }
        .form-actions .btn-submit { background-color: var(--cor-principal-calma); color: var(--cor-texto-claro); box-shadow: 0 4px 8px var(--cor-sombra-suave); }
        .form-actions .btn-submit:hover { background-color: var(--cor-acento-calma); transform: translateY(-2px); }
        .form-actions .btn-cancel { background-color: #f1f1f1; color: var(--cor-texto-suave); border: 1px solid var(--cor-borda-elements); }
        .form-actions .btn-cancel:hover { background-color: #e2e2e2; transform: translateY(-2px); }
        .error-message { background-color: #ffebee; color: #c62828; border: 1px solid #ef9a9a; padding: 1rem; border-radius: 8px; text-align: center; margin-bottom: 1rem; }
        footer { background-color: var(--cor-grama-escura); color: var(--cor-texto-claro); text-align: center; padding: 2.5rem 5%; font-size: 1rem; box-shadow: inset 0 5px 10px rgba(0, 0, 0, 0.1); border-top-left-radius: 25px; border-top-right-radius: 25px; position: relative; z-index: 1000; margin-top: auto; }
        footer .links { margin-top: 1.5rem; display: flex; justify-content: center; gap: 1.5rem; }
        footer .links a { color: var(--cor-texto-claro); text-decoration: none; transition: all 0.3s ease; padding: 0.5rem 0; font-weight: 600; }
        footer .links a:hover { color: var(--cor-secundaria-acao); transform: translateY(-2px); }
    </style>
</head>
<body>
    <header>
        <a href="../HomeLogado.jsp" class="logo">Calmamente</a>
        <nav class="nav-buttons">
            <button class="user-profile-button" id="userProfileBtn">
                <i class="fas fa-user-circle"></i>
            </button>
            <div class="dropdown-content" id="userDropdownMenu">
                <div class="user-info">
                    Olá, <strong> <%= userName %> </strong>
                </div>
                <a href="../EditarPerfil.jsp"> <i class="fas fa-pencil-alt"></i> Editar Perfil </a>
                <a href="../telasHome/Home.html"> <i class="fas fa-sign-out-alt"></i> Sair </a>
            </div>
        </nav>
    </header>

    <main>
        <form class="form-container" action="<%=request.getContextPath()%>/criar-folder" method="post" enctype="multipart/form-data">
            <h1><i class="fas fa-folder-plus"></i> Criar Novo Folder</h1>
            <%-- Mensagem de erro, se houver --%>
            <%
                String mensagemErro = (String) session.getAttribute("mensagemErro");
                if (mensagemErro != null && !mensagemErro.isEmpty()) {
            %>
                <div class="error-message"><%= mensagemErro %></div>
            <%
                    session.removeAttribute("mensagemErro");
                }
            %>
            <div class="form-group">
                <label for="titulo">Título do Folder</label>
                <input type="text" id="titulo" name="titulo" placeholder="Ex: Meus Sentimentos" required>
            </div>
            <div class="form-group">
                <label for="frase">Frase para Áudio</label>
                <textarea id="frase" name="frase" placeholder="Digite a frase que será convertida em voz. Ex: 'Eu estou feliz'" required></textarea>
            </div>
            <div class="form-group">
                <label for="imagem">Imagem do Folder</label>
                <input type="file" id="imagem" name="imagem" accept="image/*" required>
            </div>
            <div class="form-actions">
                <a href="<%= request.getContextPath() %>/FolderComunicacao/foldersComunicacao.jsp" class="btn-cancel">Cancelar</a>
                <button type="submit" class="btn-submit">Criar Folder</button>
            </div>
        </form>
    </main>

    <footer>
        <p>&copy; 2025 Calmamente. Todos os direitos reservados. Feito com carinho para você!</p>
        <div class="links">
            <a href="#">Privacidade</a><a href="#">Termos</a><a href="#">Ajuda</a>
        </div>
    </footer>

    <script>
        // Script para o menu dropdown
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
