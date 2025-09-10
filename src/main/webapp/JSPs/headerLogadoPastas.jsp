<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="modelos.Usuario"%>
<link rel="stylesheet" href="../CSS/headerLogado.css">
<style>
img{
	width: 80px;
	height: auto;
	margin-right: 20px;
	}
 @media(max-width:768px){
 	img {
		width: 40px;
		height: auto;
		margin-right: 0px;
	}
 }
	
</style>
<header>
    <img src="../imagens/logo.png" alt="Logo Calmamente">
    <h1 class="logo">Calmamente</h1>

    <!-- Botão hamburguer (só aparece no mobile) -->
    <button class="menu-toggle" id="menu-toggle">☰</button>
    <div class="overlay" id="menu-overlay"></div>
    <nav class="nav-links-container" id="nav-links">
        <a href="../HomeLogado.jsp" class="nav-link" id="homeButton">Home</a>
        <a href="../SobreNosLogado.jsp" class="nav-link" id="aboutUsLink">Sobre Nós</a>
        <a href="../AtividadesERecursos.jsp" class="nav-link" id="activitiesResourcesButton">Atividades & Recursos</a>
        <a href="../Historico/historicov1.jsp" class="nav-link" id="contactButton">Relatório</a>    
    </nav>

    <div class="user-nav">
        <button class="user-profile-button" id="userProfileBtn">
            <i class="fas fa-user-circle"></i>
        </button>
        <div class="dropdown-content" id="userDropdown">
            <div class="user-info">
                Olá, <strong><%
                    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioObjeto");
                	if (usuarioLogado == null) {
                    	response.sendRedirect("../telasHome/Login.html");
                    	return;
                	}
                    String userName = usuarioLogado.getNome();
                    out.print(userName.trim());
                %></strong>!
            </div>
            <a href="../EditarPerfil.jsp"><i class="fas fa-pencil-alt"></i> Editar Perfil</a>
            <a href="../telasHome/Home.html">
                <i class="fas fa-sign-out-alt"></i> Sair
            </a>
        </div>
    </div>
</header>

<script>
/* SCRIPT PARA MENU DE USUÁRIO */
const userProfileBtn = document.getElementById('userProfileBtn');
const userDropdown = document.getElementById('userDropdown');

userProfileBtn.addEventListener('click', () => {
    userDropdown.classList.toggle('show');
});

window.addEventListener('click', (event) => {
    if (!userProfileBtn.contains(event.target) && !userDropdown.contains(event.target)) {
        userDropdown.classList.remove('show');
    }
});

/* SCRIPT PARA MENU HAMBURGUER */
const menuToggle = document.getElementById('menu-toggle');
const navLinksContainer = document.getElementById('nav-links');
const menuOverlay = document.getElementById('menu-overlay');

menuToggle.addEventListener('click', () => {
    navLinksContainer.classList.toggle('active');
    menuOverlay.classList.toggle('active');
});

// Fechar o menu e o overlay clicando no overlay
menuOverlay.addEventListener('click', () => {
    navLinksContainer.classList.remove('active');
    menuOverlay.classList.remove('active');
});
</script>
