<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="modelos.Usuario" %>
<%@ page import="modelos.FolderComunicacao" %>
<%@ page import="Dao.DaoFolderComunicacao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %> <%-- Importa a biblioteca Gson para JSON --%>

<%!
    int idUsuario = -1;
%>

<%
    // --- Lógica de Autenticação e Obtenção do ID do Usuário ---
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioObjeto");
    String userName = "Usuário";
    if (usuarioLogado != null) {
        userName = usuarioLogado.getNome();
        if (userName == null || userName.isEmpty()) {
            userName = "Usuário";
        }
        idUsuario = usuarioLogado.getId(); // Atualiza a variável de instância
    } else {
        // Se o usuário não estiver logado, redirecionar para a página de login
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return; // Importante para parar a execução do JSP aqui
    }

    // --- Lógica para processar a criação de um novo folder (Requisição POST) ---
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String folderTitulo = request.getParameter("titulo");
        System.out.println("DEBUG JSP SERVER: Requisição POST recebida. Título: " + folderTitulo + ", ID do Usuário: " + idUsuario);
        
        // Define o Content-Type como JSON aqui, pois enviaremos uma resposta JSON
        response.setHeader("Content-Type", "application/json");
        Gson gson = new Gson(); // Cria uma instância do Gson

        try {
            if (folderTitulo != null && !folderTitulo.trim().isEmpty()) {
                if (idUsuario != -1) {
                    DaoFolderComunicacao daoFolder = new DaoFolderComunicacao();
                    FolderComunicacao novoFolder = new FolderComunicacao();
                    novoFolder.setTitulo(folderTitulo.trim());
                    novoFolder.setFrase(""); 
                    novoFolder.setImgUrl(""); 
                    novoFolder.setAudioUrl(""); 
                    novoFolder.setFkUsuarioId(idUsuario);

                    System.out.println("DEBUG JSP SERVER: Tentando cadastrar folder para fk_usuario_id: " + novoFolder.getFkUsuarioId());

                    boolean sucesso = daoFolder.cadastrar(novoFolder);
                    System.out.println("DEBUG JSP SERVER: Resultado do cadastro do folder no DAO: " + sucesso); 
                    
                    if (sucesso) {
                        // Se o cadastro foi bem-sucedido, precisamos do ID gerado pelo banco de dados.
                        // A melhor prática é que o método cadastrar no DAO retorne o ID do item inserido.
                        // Por enquanto, vamos listar novamente para obter o ID do folder recém-criado.
                        List<FolderComunicacao> foldersAtualizados = daoFolder.listarFoldersPorUsuario(idUsuario);
                        FolderComunicacao folderRecemCriado = null;
                        if (!foldersAtualizados.isEmpty()) {
                            // Assumindo que o último folder adicionado é o que acabamos de criar.
                            folderRecemCriado = foldersAtualizados.get(foldersAtualizados.size() - 1);
                        }

                        if (folderRecemCriado != null) {
                            String jsonResponse = gson.toJson(new ApiResponse(true, "Folder criado com sucesso!", folderRecemCriado));
                            response.getWriter().write(jsonResponse);
                        } else {
                            String jsonResponse = gson.toJson(new ApiResponse(false, "Folder criado, mas não foi possível recuperar os detalhes."));
                            response.getWriter().write(jsonResponse);
                        }
                    } else {
                        String jsonResponse = gson.toJson(new ApiResponse(false, "Erro ao criar o folder no banco de dados. Verifique os logs do servidor."));
                        response.getWriter().write(jsonResponse);
                    }
                } else {
                    System.err.println("DEBUG JSP SERVER: ID do usuário inválido (-1). Não é possível cadastrar o folder.");
                    String jsonResponse = gson.toJson(new ApiResponse(false, "Erro: Usuário não identificado para criar o folder."));
                    response.getWriter().write(jsonResponse);
                }
            } else {
                System.out.println("DEBUG JSP SERVER: Título do folder vazio ou nulo na requisição POST.");
                String jsonResponse = gson.toJson(new ApiResponse(false, "O título do folder não pode ser vazio."));
                response.getWriter().write(jsonResponse);
            }
        } catch (Exception e) {
            System.err.println("DEBUG JSP SERVER: Erro inesperado durante o processamento do POST para criar folder: " + e.getMessage());
            e.printStackTrace();
            String jsonResponse = gson.toJson(new ApiResponse(false, "Erro inesperado ao criar o folder. Detalhes no console do servidor."));
            response.getWriter().write(jsonResponse);
        }
        return; // Retorna após enviar a resposta JSON
    }

    // --- Lógica para listar os folders (Requisição GET ou após POST) ---
    DaoFolderComunicacao daoFolder = new DaoFolderComunicacao();
    List<FolderComunicacao> foldersDoUsuario = new ArrayList<>();
    try {
        // Verifica se o ID do usuário é válido antes de tentar listar
        if (idUsuario != -1) {
            foldersDoUsuario = daoFolder.listarFoldersPorUsuario(idUsuario);
            System.out.println("DEBUG JSP SERVER: " + foldersDoUsuario.size() + " folders encontrados para o usuário " + idUsuario);
        } else {
            System.err.println("DEBUG JSP SERVER: ID do usuário inválido (-1). Não é possível listar os folders.");
        }
    } catch (Exception e) {
        System.err.println("DEBUG JSP SERVER: Erro ao listar folders: " + e.getMessage());
        e.printStackTrace();
        session.setAttribute("mensagemErro", "Erro ao carregar seus folders de comunicação.");
    }
%>

<%!
// Classe auxiliar para formatar a resposta JSON
class ApiResponse {
    boolean success;
    String message;
    FolderComunicacao folder; // Pode ser nulo em caso de erro

    public ApiResponse(boolean success, String message) {
        this.success = success;
        this.message = message;
    }

    public ApiResponse(boolean success, String message, FolderComunicacao folder) {
        this.success = success;
        this.message = message;
        this.folder = folder;
    }
}
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Calmamente: Comunicação</title>
<link
    href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap"
    rel="stylesheet" />
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<style>
/* Variáveis CSS */
:root {
    --cor-fundo-principal: #E0F7FA;
    --cor-grama-escura: #A8D8B9;
    --cor-secundaria-acao: #FFD700; /* Amarelo */
    --cor-texto-claro: #FFFFFF;
    --cor-fundo-ansiedade: #F0F8FF;
    --cor-principal-calma: #76D7C4; /* Verde Água */
    --cor-acento-calma: #A3D9B1; /* Verde Pastel */
    --cor-sombra-suave: rgba(118, 215, 196, 0.2);
    --cor-texto-suave: #4A5568;
    --cor-botao-tocando: #FFB74D; /* Laranja */
    --fonte-titulo: 'Fredoka', sans-serif;
    --fonte-corpo: 'Nunito', sans-serif;
    --cor-header-calendario: #66CCFF; /* Azul Claro */
    --cor-dias-semana: #4A5568;
    --cor-dia-comum: #F8F8F8;
    --cor-dia-hoje: #FFD700;
    --cor-dia-selecionado: #76D7C4;
    --cor-borda-calendario: #A3D9B1;
    --cor-fundo-detalhes: #FFFFFF;
    --cor-nuvem: #FFFFFF;
    --cor-texto-escuro: #333;
    --cor-borda-elements: #ddd;
    --cor-roxo-divertido: #8A2BE2; /* Roxo */
    --cor-terciaria-acao: #FF6347; /* Vermelho-laranja */

    /* Novas variáveis para a página de comunicação */
    --cor-fundo-folder: #e0f0f0; /* Fundo suave para folders */
    --cor-borda-folder: #c0e0e0;
    --cor-texto-folder-titulo: #2a6f7b; /* Azul escuro para títulos de folder */
    --cor-fundo-item: #f5f5f5; /* Fundo suave para itens */
    --cor-borda-item: #e0e0e0;
    --cor-botao-add: #28a745; /* Verde para adicionar */
    --cor-botao-edit: #007bff; /* Azul para editar */
    --cor-botao-delete: #dc3545; /* Vermelho para deletar */
}

/* Reset básico e estilos gerais */
body, h1, h2, h3, p, ul, li, button {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: var(--fonte-corpo), sans-serif;
    background-color: var(--cor-fundo-principal);
    color: var(--cor-texto-suave);
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
    flex-direction: column; /* Coluna para organizar conteúdo verticalmente */
    align-items: center; /* Centraliza horizontalmente */
    padding: 2rem;
    position: relative;
    z-index: 1;
    gap: 2rem; /* Espaçamento entre os principais blocos */
}

/* Nuvens (mantidas) */
.cloud {
    position: absolute;
    background: #FFFFFF;
    border-radius: 50%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
    animation: moveCloud 40s linear infinite;
    z-index: 0;
    opacity: 0.8;
}

.cloud.small { width: 80px; height: 50px; }
.cloud.medium { width: 120px; height: 70px; }
.cloud.large { width: 150px; height: 90px; }

.cloud:nth-child(1) { top: 10%; left: 5%; animation-duration: 35s; }
.cloud:nth-child(2) { top: 20%; left: 40%; animation-duration: 45s; animation-delay: -10s; }
.cloud:nth-child(3) { top: 15%; right: 5%; animation-duration: 50s; animation-delay: -20s; }

@keyframes moveCloud {
    from { transform: translateX(-150px); }
    to { transform: translateX(100vw); }
}

/* Header (mantido) */
header {
    background-color: #66CCFF;
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
    font-family: var(--fonte-titulo);
    font-size: 2.2rem;
    font-weight: 700;
    color: var(--cor-texto-claro);
    text-decoration: none;
    text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
}

/* Dropdown de Usuário (mantido) */
.nav-buttons { position: relative; }

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
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
}
.user-profile-button:hover {
    background-color: #9966FF;
    transform: translateY(-2px);
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.25);
}

.dropdown-content {
    display: none;
    position: absolute;
    top: calc(100% + 10px);
    right: 0;
    background-color: var(--cor-nuvem);
    min-width: 220px;
    box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
    border-radius: 15px;
    z-index: 1;
    overflow: hidden;
    animation: fadeIn 0.3s ease-out;
}
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}
.dropdown-content.show { display: block; }
.dropdown-content .user-info {
    padding: 1rem 1.5rem;
    font-family: var(--fonte-titulo);
    font-size: 1.2rem;
    color: var(--cor-texto-escuro);
    background-color: #f8f8f8;
    border-bottom: 1px solid var(--cor-borda-elements);
}
.dropdown-content .user-info strong { color: var(--cor-roxo-divertido); }
.dropdown-content a {
    color: var(--cor-texto-medio, #555);
    padding: 1rem 1.5rem;
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 1.1rem;
    transition: background-color 0.2s ease;
}
.dropdown-content a:hover { background-color: #f1f1f1; }
.dropdown-content a i {
    font-size: 1.2rem;
    width: 20px;
    text-align: center;
}
.dropdown-content a .fa-pencil-alt { color: var(--cor-secundaria-acao); }
.dropdown-content a .fa-sign-out-alt { color: var(--cor-terciaria-acao); }

/* Seção de Título da Página */
.page-title-container {
    background-color: var(--cor-fundo-detalhes);
    border: 1px solid var(--cor-borda-elements);
    border-radius: 20px;
    box-shadow: 0 8px 20px var(--cor-sombra-suave);
    padding: 1.5rem 2.5rem;
    text-align: center;
    margin-top: 1rem;
    width: 90%;
    max-width: 800px;
}

.page-title-container h1 {
    font-family: var(--fonte-titulo);
    font-size: 2.5rem;
    color: var(--cor-principal-calma);
    margin-bottom: 0.5rem;
}

.page-title-container p {
    font-size: 1.1rem;
    color: var(--cor-texto-suave);
}

/* Contêiner de Folders */
.folders-container {
    display: grid; /* Grid para organizar os folders */
    grid-template-columns: repeat(auto-fill, minmax(180px, 1fr)); /* Colunas flexíveis */
    gap: 1.5rem; /* Espaçamento entre os cards */
    width: 100%;
    max-width: 1000px; /* Largura máxima para a grade */
    padding: 1rem;
    background-color: var(--cor-fundo-detalhes);
    border-radius: 20px;
    box-shadow: 0 8px 20px var(--cor-sombra-suave);
    min-height: 250px;
    justify-content: center; /* Centraliza folders na grade */
}

/* Card de Folder Individual */
.folder-card {
    background-color: var(--cor-fundo-folder);
    border: 1px solid var(--cor-borda-folder);
    border-radius: 15px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 1.5rem;
    text-align: center;
    cursor: pointer;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
    min-height: 150px; /* Altura mínima para o card */
}

.folder-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
}

.folder-card i {
    font-size: 3rem; /* Tamanho grande para o ícone de pasta */
    color: var(--cor-texto-folder-titulo);
    margin-bottom: 0.8rem;
}

.folder-card h3 {
    font-family: var(--fonte-titulo);
    font-size: 1.5rem;
    color: var(--cor-texto-folder-titulo);
    word-break: break-word; /* Quebra palavras longas */
}

/* Botão para Adicionar Novo Folder */
.add-folder-button {
    background-color: var(--cor-botao-add);
    color: var(--cor-texto-claro);
    border: none;
    border-radius: 50%; /* Botão redondo */
    width: 70px;
    height: 70px;
    font-size: 2.5rem;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
    margin-top: 1rem; /* Espaço acima do botão */
    flex-shrink: 0; /* Não encolher em telas pequenas */
}

.add-folder-button:hover {
    background-color: #218838; /* Tom mais escuro de verde */
    transform: translateY(-3px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.25);
}

.add-folder-button:active {
    background-color: var(--cor-botao-add);
    transform: translateY(0);
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

/* Estilos para o Modal (escondido por padrão) */
.modal {
    display: none; /* Escondido por padrão */
    position: fixed; /* Posição fixa na tela */
    z-index: 1001; /* Acima de outros elementos */
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto; /* Habilita scroll se conteúdo for grande */
    background-color: rgba(0,0,0,0.4); /* Fundo semi-transparente */
    display: flex;
    align-items: center;
    justify-content: center;
    animation: fadeInModal 0.3s ease-out;
}

@keyframes fadeInModal {
    from { opacity: 0; }
    to { opacity: 1; }
}

.modal-content {
    background-color: var(--cor-fundo-detalhes);
    margin: auto;
    padding: 2.5rem;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.25);
    width: 90%;
    max-width: 500px;
    text-align: center;
    position: relative;
    animation: slideInModal 0.3s ease-out;
    border: 1px solid var(--cor-borda-elements);
}

@keyframes slideInModal {
    from { transform: translateY(-50px); opacity: 0; }
    to { transform: translateY(0); opacity: 1; }
}

.close-button {
    color: #aaa;
    position: absolute;
    top: 15px;
    right: 25px;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
    transition: color 0.3s ease;
}

.close-button:hover,
.close-button:focus {
    color: var(--cor-terciaria-acao);
    text-decoration: none;
    cursor: pointer;
}

.modal-content h2 {
    font-family: var(--fonte-titulo);
    color: var(--cor-principal-calma);
    font-size: 2rem;
    margin-bottom: 1.5rem;
}

.modal-content label {
    display: block;
    font-size: 1.2rem;
    color: var(--cor-texto-suave);
    margin-bottom: 0.8rem;
    text-align: left;
}

.modal-content input[type="text"] {
    width: calc(100% - 20px); /* Ajuste para padding */
    padding: 12px 10px;
    margin-bottom: 1.5rem;
    border: 1px solid var(--cor-borda-elements);
    border-radius: 8px;
    font-size: 1.1rem;
    font-family: var(--fonte-corpo);
    color: var(--cor-texto-escuro);
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.modal-content input[type="text"]:focus {
    outline: none;
    border-color: var(--cor-principal-calma);
    box-shadow: 0 0 0 3px rgba(118, 215, 196, 0.3);
}

.modal-content button {
    background-color: var(--cor-principal-calma);
    color: var(--cor-texto-claro);
    border: none;
    border-radius: 10px;
    padding: 0.8rem 1.8rem;
    font-size: 1.2rem;
    font-weight: 700;
    cursor: pointer;
    box-shadow: 0 4px 8px var(--cor-sombra-suave);
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
}

.modal-content button:hover {
    background-color: var(--cor-acento-calma);
    transform: translateY(-2px);
    box-shadow: 0 6px 12px rgba(118, 215, 196, 0.3);
}

.modal-content button:active {
    background-color: var(--cor-principal-calma);
    transform: translateY(0);
    box-shadow: 0 2px 4px var(--cor-sombra-suave);
}


/* Rodapé (mantido) */
footer {
    background-color: var(--cor-grama-escura);
    color: var(--cor-texto-claro);
    text-align: center;
    padding: 2.5rem 5%;
    font-size: 1rem;
    box-shadow: inset 0 5px 10px rgba(0, 0, 0, 0.1);
    border-top-left-radius: 25px;
    border-top-right-radius: 25px;
    position: relative;
    z-index: 1000;
    margin-top: auto; /* Empurra o rodapé para baixo */
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
@media (max-width: 768px) {
    main {
        padding: 1.5rem;
        gap: 1.5rem;
    }
    .page-title-container {
        padding: 1rem 1.5rem;
    }
    .page-title-container h1 {
        font-size: 2rem;
    }
    .folders-container {
        grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
        gap: 1rem;
        padding: 0.8rem;
    }
    .folder-card {
        padding: 1rem;
        min-height: 120px;
    }
    .folder-card i {
        font-size: 2.5rem;
    }
    .folder-card h3 {
        font-size: 1.3rem;
    }
    .add-folder-button {
        width: 60px;
        height: 60px;
        font-size: 2rem;
    }
    .modal-content {
        padding: 1.5rem;
    }
}

@media (max-width: 480px) {
    header, footer {
        padding: 1rem 3%;
    }
    .logo {
        font-size: 1.8rem;
    }
    .user-profile-button {
        width: 45px;
        height: 45px;
        font-size: 1.5rem;
    }
    .page-title-container h1 {
        font-size: 1.8rem;
    }
    .page-title-container p {
        font-size: 1rem;
    }
    .folders-container {
        grid-template-columns: 1fr; /* Uma coluna em telas muito pequenas */
        gap: 0.8rem;
        padding: 0.5rem;
    }
    .folder-card h3 {
        font-size: 1.2rem;
    }
}
</style>
</head>
<body>
    <div class="cloud small"></div>
    <div class="cloud medium"></div>
    <div class="cloud large"></div>

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
        <div class="page-title-container">
            <h1>Seus Folders de Comunicação</h1>
            <p>Clique em um folder para ver e adicionar itens, ou crie um novo!</p>
        </div>

        <div class="folders-container" id="foldersContainer">
            <%-- A mensagem será sempre incluída no HTML, mas sua visibilidade será controlada via JavaScript --%>
            <p class="no-records" id="noFoldersMessage">Nenhum folder criado ainda. Clique no botão '+' para começar!</p>
            <%
                // Renderiza os folders existentes
                for (FolderComunicacao folder : foldersDoUsuario) {
            %>
                        <div class="folder-card" data-folder-id="<%= folder.getId() %>">
                            <i class="fas fa-folder"></i>
                            <h3><%= folder.getTitulo() %></h3>
                        </div>
            <%
                }
            %>
        </div>

        <button class="add-folder-button" id="addFolderBtn" title="Adicionar Novo Folder">
            <i class="fas fa-plus"></i>
        </button>

        <div id="folderModal" class="modal">
            <div class="modal-content">
                <span class="close-button">&times;</span>
                <h2 id="modalTitle">Criar Novo Folder</h2>
                <label for="folderNameInput">Nome do Folder:</label>
                <input type="text" id="folderNameInput" placeholder="Ex: Sentimentos, Comida, Atividades" />
                <button id="saveFolderBtn">Salvar Folder</button>
            </div>
        </div>
    </main>

    <footer>
        <p>&copy; 2025 Calmamente. Todos os direitos reservados. Feito com
            carinho para você!</p>
        <div class="links">
            <a href="#">Privacidade</a><a href="#">Termos</a><a href="#">Ajuda</a>
        </div>
    </footer>

    <script>
        // === SCRIPT PARA O MENU DROPDOWN ===
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

        // === SCRIPT PARA O MODAL DE FOLDER E FUNCIONALIDADE ===
        const addFolderBtn = document.getElementById('addFolderBtn');
        const folderModal = document.getElementById('folderModal');
        const closeButton = document.querySelector('.modal .close-button');
        const saveFolderBtn = document.getElementById('saveFolderBtn');
        const folderNameInput = document.getElementById('folderNameInput');
        const modalTitle = document.getElementById('modalTitle');
        const foldersContainer = document.getElementById('foldersContainer');
        const noFoldersMessage = document.getElementById('noFoldersMessage');

        // Adiciona o contextPath globalmente no JavaScript
        const contextPath = "<%= request.getContextPath() %>";
        console.log("DEBUG JS CLIENT: Context Path:", contextPath);


        // Exibir modal para adicionar folder
        addFolderBtn.addEventListener('click', () => {
            modalTitle.textContent = 'Criar Novo Folder';
            folderNameInput.value = ''; // Limpa o input
            folderModal.style.display = 'flex'; // Exibe o modal
            folderNameInput.focus(); // Foca no input
        });

        // Fechar modal
        closeButton.addEventListener('click', () => {
            folderModal.style.display = 'none';
        });

        // Clicar fora do modal também o fecha
        window.addEventListener('click', (event) => {
            if (event.target == folderModal) {
                folderModal.style.display = 'none';
            }
        });

        // Lógica para salvar folder (via AJAX POST)
        saveFolderBtn.addEventListener('click', async () => {
            const folderName = folderNameInput.value.trim();
            if (folderName) {
                try {
                    const requestBody = new URLSearchParams({
                        titulo: folderName
                    }).toString();

                    const fetchUrl = contextPath + "/FolderComunicacao/foldersComunicacao.jsp"; 
                    console.log("DEBUG JS CLIENT: Enviando requisição POST para:", fetchUrl, "com corpo:", requestBody);

                    const response = await fetch(fetchUrl, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: requestBody
                    });

                    console.log("DEBUG JS CLIENT: Resposta do servidor recebida. Status:", response.status, "OK:", response.ok);

                    const result = await response.json(); // Espera uma resposta JSON
                    console.log("DEBUG JS CLIENT: Conteúdo da resposta do servidor (JSON):", result);

                    if (result.success) {
                        alert('Folder criado com sucesso!'); // Exibe o alerta de sucesso
                        window.location.reload(); // Força a recarga da página para exibir o novo folder
                    } else {
                        // Se houver um erro, exibe a mensagem do servidor
                        alert('Erro ao salvar folder: ' + result.message);
                        console.error('DEBUG JS CLIENT: Erro do servidor:', result.message);
                    }
                } catch (error) {
                    console.error('DEBUG JS CLIENT ERROR: Erro na requisição fetch ou ao processar JSON:', error);
                    alert('Não foi possível conectar ao servidor ou processar a resposta. Verifique sua conexão ou o console do navegador para mais detalhes.');
                } finally {
                    folderModal.style.display = 'none'; // Fecha o modal de qualquer forma
                }
            } else {
                alert('Por favor, digite um nome para o folder.');
            }
        });

        // Lógica para clicar em um folder (redirecionar para a página de itens do folder)
        foldersContainer.addEventListener('click', (event) => {
            const folderCard = event.target.closest('.folder-card');
            if (folderCard) {
                const folderId = folderCard.dataset.folderId;
                if (folderId) {
                    window.location.href = `${contextPath}/itensComunicacao.jsp?folderId=\${folderId}`;
                    console.log(`DEBUG JS CLIENT: Clicou no folder com ID: \${folderId}. Redirecionando para itensComunicacao.jsp`);
                }
            }
        });

        // === NOVO: Controla a visibilidade da mensagem "Nenhum folder criado" ===
        // Adiciona um estilo para esconder a mensagem por padrão no CSS
        // e a exibe apenas se não houver folders.
        document.addEventListener('DOMContentLoaded', () => {
            // Conta quantos cards de folder existem
            const folderCards = Array.from(foldersContainer.children).filter(child => 
                child.classList.contains('folder-card')
            );

            if (folderCards.length === 0) {
                // Se não houver folders, mostra a mensagem
                if (noFoldersMessage) {
                    noFoldersMessage.style.display = 'block';
                }
            } else {
                // Se houver folders, esconde a mensagem
                if (noFoldersMessage) {
                    noFoldersMessage.style.display = 'none';
                }
            }

            // A lógica de status na URL é menos relevante agora que a página recarrega via JS,
            // mas pode ser mantida para outros fluxos ou depuração.
            const urlParams = new URLSearchParams(window.location.search);
            const status = urlParams.get('status');
            const mensagemErroSessao = "<%= session.getAttribute("mensagemErro") != null ? session.getAttribute("mensagemErro") : "" %>";
            
            if (status === 'error') {
                if (mensagemErroSessao) {
                    alert('Erro ao criar folder: ' + mensagemErroSessao);
                } else {
                    alert('Erro ao criar folder. Por favor, tente novamente.');
                }
                history.replaceState(null, '', window.location.pathname); // Limpa o parâmetro da URL
            }
            // Limpa a mensagem de erro da sessão após exibi-la
            <% session.removeAttribute("mensagemErro"); %>
        });
    </script>
</body>
</html>
