<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="modelos.Usuario" %>
<%@ page import="modelos.FolderComunicacao" %>
<%@ page import="Dao.DaoFolderComunicacao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    // --- Lógica de Autenticação ---
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioObjeto");
    if (usuarioLogado == null) {
        response.sendRedirect(request.getContextPath() + "/telasHome/Login.jsp");
        return;
    }
    int idUsuario = usuarioLogado.getId();

    // --- Lógica para listar os folders ---
    DaoFolderComunicacao daoFolder = new DaoFolderComunicacao();
    List<FolderComunicacao> foldersDoUsuario = daoFolder.listarFoldersPorUsuario(idUsuario);
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Calmamente: Comunicação</title>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        :root {
            --cor-primaria-acao: #66CCFF; --cor-fundo-principal: #E0F7FA; --cor-texto-claro: #FFFFFF;
            --cor-principal-calma: #76D7C4; --cor-texto-suave: #4A5568; --fonte-titulo: 'Fredoka', sans-serif;
            --fonte-corpo: 'Nunito', sans-serif; --cor-fundo-detalhes: #FFFFFF; --cor-roxo-divertido: #8A2BE2;
            --cor-fundo-folder: #e0f0f0; --cor-borda-folder: #c0e0e0; --cor-texto-folder-titulo: #2a6f7b;
            --cor-botao-add: #28a745; --cor-botao-delete: #dc3545;
        }
        body, h1, h2, h3, p, button { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: var(--fonte-corpo), sans-serif; background-color: var(--cor-fundo-principal); color: var(--cor-texto-suave); min-height: 100vh; display: flex; flex-direction: column; }
        main { flex-grow: 1; display: flex; flex-direction: column; align-items: center; padding: 2rem; gap: 1.5rem; }
        header { background-color: var(--cor-primaria-acao); padding: 1rem 5%; display: flex; justify-content: space-between; align-items: center; z-index: 1000; max-height: 65px; }
        .logo { font-family: var(--fonte-titulo); font-size: 2.5rem; font-weight: 700; color: var(--cor-texto-claro); text-decoration: none; }
        .page-title-container { text-align: center; max-width: 800px; }
        .page-title-container h1 { font-family: var(--fonte-titulo); font-size: 2.5rem; color: var(--cor-principal-calma); }
        .folders-container { display: grid; grid-template-columns: repeat(auto-fill, minmax(180px, 1fr)); gap: 1.5rem; width: 100%; max-width: 1050px; padding: 1.5rem; background-color: var(--cor-fundo-detalhes); border-radius: 20px; min-height: 250px; position: relative; }
        .no-records { display: none; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); }
        .folder-card { background-color: var(--cor-fundo-folder); border: 2px solid var(--cor-borda-folder); border-radius: 15px; display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 1.5rem; text-align: center; cursor: pointer; min-height: 150px; position: relative; overflow: hidden; transition: all 0.2s ease; }
        .folder-card:hover { transform: translateY(-5px); box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15); }
        .folder-card .folder-image { width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0; z-index: 1; opacity: 0.3; }
        .folder-card i { font-size: 3rem; color: var(--cor-texto-folder-titulo); margin-bottom: 0.8rem; z-index: 2; }
        .folder-card h3 { font-family: var(--fonte-titulo); font-size: 1.5rem; color: var(--cor-texto-folder-titulo); z-index: 2; }
        .action-buttons-container { display: flex; gap: 1rem; align-items: center; margin-top: 1rem; }
        .add-folder-button, .delete-folder-button { border: none; border-radius: 50%; width: 70px; height: 70px; font-size: 2.2rem; display: flex; justify-content: center; align-items: center; cursor: pointer; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); transition: all 0.3s ease; color: white; text-decoration: none; }
        .add-folder-button { background-color: var(--cor-botao-add); }
        .delete-folder-button { background-color: var(--cor-botao-delete); }
        .delete-folder-button.active { background-color: #ffc107; color: #333; transform: scale(1.1); }
        body.delete-mode .folder-card { border-color: var(--cor-botao-delete); animation: pulse-red 1.5s infinite; cursor: crosshair !important; }
        body.delete-mode .folder-card:hover { background-color: #ffebee; transform: scale(1.03); }
        @keyframes pulse-red { 0% { box-shadow: 0 0 0 0 rgba(220, 53, 69, 0.4); } 70% { box-shadow: 0 0 0 10px rgba(220, 53, 69, 0); } 100% { box-shadow: 0 0 0 0 rgba(220, 53, 69, 0); } }
    </style>
</head>
<body>
    <header>
        <a href="<%= request.getContextPath() %>/HomeLogado.jsp" class="logo">Calmamente</a>
    </header>

    <main>
        <div class="page-title-container">
            <h1>Seus Folders de Comunicação</h1>
            <p>Clique em um folder para ouvir. Para excluir, ative o modo de exclusão (🗑️).</p>
        </div>

        <div class="folders-container" id="foldersContainer">
            <p class="no-records" id="noFoldersMessage">Nenhum folder criado.</p>
            <% for (FolderComunicacao folder : foldersDoUsuario) { %>
                <div class="folder-card" 
                     data-folder-id="<%= folder.getId() %>" 
                     data-frase="<%= (folder.getFrase() == null) ? "" : folder.getFrase().replace("\"", "&quot;") %>">
                    <% if (folder.getImgUrl() != null && !folder.getImgUrl().isEmpty()) { %>
                        <img src="<%= request.getContextPath() %>/<%= folder.getImgUrl() %>" alt="Imagem do Folder" class="folder-image">
                    <% } else { %>
                        <i class="fas fa-folder"></i>
                    <% } %>
                    <h3><%= folder.getTitulo() %></h3>
                </div>
            <% } %>
        </div> 

        <div class="action-buttons-container">
            <a href="<%= request.getContextPath() %>/FolderComunicacao/CriarFolder.jsp" class="add-folder-button" title="Adicionar Novo Folder"><i class="fas fa-plus"></i></a>
            <button id="deleteFolderBtn" class="delete-folder-button" title="Ativar modo de exclusão"><i class="fas fa-trash-alt"></i></button>
        </div>
    </main>

    <footer><p>&copy; 2025 Calmamente. Todos os direitos reservados.</p></footer>

    <script>
        const speech = new SpeechSynthesisUtterance();
        function play(frase) {
            if (!frase || frase.trim() === "") return;
            speech.rate = 1.4; speech.pitch = 1.2; speech.lang = "pt-BR"; speech.text = frase;
            window.speechSynthesis.cancel(); window.speechSynthesis.speak(speech);
        }

        const contextPath = "<%= request.getContextPath() %>";
        const foldersContainer = document.getElementById('foldersContainer');
        const deleteBtn = document.getElementById('deleteFolderBtn');
        let modoExclusaoAtivo = false;

        function ativarModoExclusao() {
            modoExclusaoAtivo = true; document.body.classList.add('delete-mode');
            deleteBtn.classList.add('active'); deleteBtn.title = "Cancelar modo de exclusão";
        }
        function desativarModoExclusao() {
            modoExclusaoAtivo = false; document.body.classList.remove('delete-mode');
            deleteBtn.classList.remove('active'); deleteBtn.title = "Ativar modo de exclusão";
        }

        deleteBtn.addEventListener('click', () => modoExclusaoAtivo ? desativarModoExclusao() : ativarModoExclusao());
        document.addEventListener('keydown', (e) => e.key === 'Escape' && modoExclusaoAtivo && desativarModoExclusao());

        foldersContainer.addEventListener('click', (event) => {
            const folderCard = event.target.closest('.folder-card');
            if (!folderCard) return;

            if (modoExclusaoAtivo) {
             
                if (confirm(`Tem certeza que deseja excluir o folder "${folderCard.querySelector('h3').textContent}"? A ação não pode ser desfeita.`)) {
                    
                    
                    const folderId = folderCard.dataset.folderId;

                 // ---- ADICIONE ESTAS DUAS LINHAS PARA DEPURAR ----
                 console.log("Elemento do card clicado:", folderCard);
                 console.log("ID lido do atributo data-folder-id:", folderId);
                   
                 const params = new URLSearchParams();
                 params.append('id', folderId);

                 fetch(`/Projeto_TEA/excluir-folder`, {
                     method: 'POST',
                     headers: {
                         'Content-Type': 'application/x-www-form-urlencoded'
                     },
                     body: params
                 })
                 .then(response => {
                     if (response.ok) {
                         folderCard.remove();
                         alert("Folder excluído com sucesso!");
                         desativarModoExclusao();
                     } else {
                         alert("Erro no servidor ao tentar excluir o folder. Verifique o console do servidor para mais detalhes.");
                     }
                 })
                 .catch(error => {
                     console.error('Erro de Fetch:', error);
                     alert("Ocorreu um erro de conexão. Verifique o console do navegador (F12).");
                 });
                }
            } else {
                play(folderCard.dataset.frase);
            }
        });

        document.addEventListener('DOMContentLoaded', () => {
            if (foldersContainer.querySelectorAll('.folder-card').length === 0) {
                document.getElementById('noFoldersMessage').style.display = 'block';
            }
        });
    </script>
</body>
</html>