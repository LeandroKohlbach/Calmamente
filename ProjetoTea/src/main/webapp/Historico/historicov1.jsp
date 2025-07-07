<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Dao.DaoHistorico"%>
<%@ page import="modelos.Historico"%>
<%@ page import="modelos.Usuario"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.format.DateTimeParseException"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.stream.Collectors"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Comparator"%>

<%!
    // idUsuario é uma variável de instância JSP, segura para ser usada em scriptlets
    // dentro da mesma página para manter o estado do usuário logado.
    // Será preenchida no bloco de verificação de sessão.
    int idUsuario = -1;
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Calmamente: Histórico de Sentimentos</title>
<link
	href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<style>
/* Seus estilos CSS existentes aqui (mantidos e ajustados) */
:root {
	--cor-fundo-principal: #E0F7FA;
	--cor-grama-escura: #A8D8B9;
	--cor-secundaria-acao: #FFD700;
	--cor-texto-claro: #FFFFFF;
	--cor-fundo-ansiedade: #F0F8FF;
	--cor-principal-calma: #76D7C4;
	--cor-acento-calma: #A3D9B1;
	--cor-sombra-suave: rgba(118, 215, 196, 0.2);
	--cor-texto-suave: #4A5568;
	--cor-botao-tocando: #FFB74D;
	--fonte-titulo: 'Fredoka', sans-serif;
	--fonte-corpo: 'Nunito', sans-serif;
	--cor-header-calendario: #66CCFF;
	--cor-dias-semana: #4A5568;
	--cor-dia-comum: #F8F8F8;
	--cor-dia-hoje: #FFD700;
	--cor-dia-selecionado: #76D7C4;
	--cor-borda-calendario: #A3D9B1;
	--cor-fundo-detalhes: #FFFFFF;
    --cor-nuvem: #FFFFFF;
    --cor-texto-escuro: #333;
    --cor-borda-elementos: #ddd;
    --cor-roxo-divertido: #8A2BE2;
    --cor-terciaria-acao: #FF6347;
}

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
	justify-content: center;
	align-items: flex-start;
	padding: 2rem;
	position: relative;
	z-index: 1;
	flex-wrap: wrap;
	gap: 2rem; /* Espaçamento entre os dois containers */
}

.cloud {
	position: absolute;
	background: #FFFFFF;
	border-radius: 50%;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
	animation: moveCloud 40s linear infinite;
	z-index: 0;
	opacity: 0.8;
}

.cloud.small {
	width: 80px;
	height: 50px;
}

.cloud.medium {
	width: 120px;
	height: 70px;
}

.cloud.large {
	width: 150px;
	height: 90px;
}

.cloud:nth-child(1) {
	top: 10%;
	left: 5%;
	animation-duration: 35s;
}

.cloud:nth-child(2) {
	top: 20%;
	left: 40%;
	animation-duration: 45s;
	animation-delay: -10s;
}

.cloud:nth-child(3) {
	top: 15%;
	right: 5%;
	animation-duration: 50s;
	animation-delay: -20s;
}

@keyframes moveCloud {
	from { transform: translateX(-150px); }
	to { transform: translateX(100vw); }
}

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

.nav-buttons {
	position: relative;
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
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
	transition: background-color 0.3s ease, transform 0.2s ease, box-shadow
		0.2s ease;
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
	color: var(--cor-texto-medio, #555);
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
	width: 20px;
	text-align: center;
}

.dropdown-content a .fa-pencil-alt {
	color: var(--cor-secundaria-acao);
}

.dropdown-content a .fa-sign-out-alt {
	color: var(--cor-terciaria-acao);
}

/* Detalhes do Histórico e Campo de Data */
.date-input-container {
    background-color: var(--cor-fundo-detalhes);
    border: 1px solid var(--cor-borda-elementos);
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    padding: 1.5rem;
    margin-bottom: 2rem;
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    max-width: 400px; /* Largura para o container de input */
    gap: 1rem; /* Espaçamento entre os elementos */
}

/* Estilos para o campo de input da data */
.date-input-container label {
    font-family: var(--fonte-titulo); /* Usa a fonte de título para o label */
    font-size: 1.3rem;
    color: var(--cor-texto-escuro);
    margin-bottom: 0.5rem; /* Espaçamento entre o label e o input */
}

.date-input {
    width: calc(100% - 2rem); /* Ocupa quase toda a largura do container, considerando padding */
    padding: 0.8rem 1rem;
    border: 1px solid var(--cor-borda-elementos);
    border-radius: 10px; /* Bordas arredondadas */
    font-size: 1.1rem;
    font-family: var(--fonte-corpo);
    color: var(--cor-texto-suave);
    background-color: var(--cor-fundo-ansiedade); /* Um fundo suave */
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.08); /* Sombra interna para profundidade */
    transition: all 0.3s ease; /* Transição suave para foco */
    text-align: center; /* Centraliza o texto */
    cursor: pointer; /* Indica que é clicável */
}

.date-input:focus {
    outline: none; /* Remove o contorno padrão ao focar */
    border-color: var(--cor-principal-calma); /* Muda a cor da borda ao focar */
    box-shadow: 0 0 0 3px rgba(118, 215, 196, 0.4); /* Sombra mais visível ao focar */
    background-color: var(--cor-nuvem); /* Fundo branco ao focar */
}

.date-input::placeholder {
    color: #999;
    font-style: italic;
}

/* Estilo para o botão "Mostrar Todos" */
.filter-button {
    background-color: var(--cor-principal-calma); /* Cor principal do tema */
    color: var(--cor-texto-claro);
    border: none;
    border-radius: 15px;
    padding: 0.7rem 1.2rem;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    box-shadow: 0 4px 8px var(--cor-sombra-suave);
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
}

.filter-button:hover {
    background-color: var(--cor-acento-calma);
    transform: translateY(-2px);
    box-shadow: 0 6px 12px rgba(118, 215, 196, 0.3);
}

.filter-button:active {
    background-color: var(--cor-principal-calma);
    transform: translateY(0);
    box-shadow: 0 2px 4px var(--cor-sombra-suave);
}


/* Flatpickr overrides for better styling */
.flatpickr-calendar {
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    border-radius: 15px;
    border: 1px solid var(--cor-borda-calendario);
    font-family: var(--fonte-corpo);
    color: var(--cor-texto-suave);
}

.flatpickr-months .flatpickr-prev-month,
.flatpickr-months .flatpickr-next-month {
    color: var(--cor-principal-calma);
    fill: var(--cor-principal-calma);
}

.flatpickr-current-month .flatpickr-month,
.flatpickr-current-month .flatpickr-numInputWrapper {
    color: var(--cor-principal-calma);
}

.flatpickr-weekday {
    color: var(--cor-dias-semana);
    font-weight: 600;
}

.dayContainer {
    justify-content: center; /* Center days in the grid */
}

.flatpickr-day {
    color: var(--cor-texto-suave);
    border-radius: 8px; /* Slightly rounded days */
}

.flatpickr-day.today {
    border-color: var(--cor-dia-hoje);
    background-color: var(--cor-dia-hoje);
    color: var(--cor-texto-claro);
}

.flatpickr-day.selected,
.flatpickr-day.startRange,
.flatpickr-day.endRange,
.flatpickr-day.selected.inRange,
.flatpickr-day.startRange.inRange,
.flatpickr-day.endRange.inRange,
.flatpickr-day.selected:focus,
.flatpickr-day.startRange:focus,
.flatpickr-day.endRange:focus,
.flatpickr-day.selected:hover,
.flatpickr-day.startRange:hover,
.flatpickr-day.endRange:hover,
.flatpickr-day.selected.prevMonthDay,
.flatpickr-day.selected.nextMonthDay,
.flatpickr-day.startRange.prevMonthDay,
.flatpickr-day.startRange.nextMonthDay,
.flatpickr-day.endRange.prevMonthDay,
.flatpickr-day.endRange.nextMonthDay {
    background-color: var(--cor-principal-calma);
    border-color: var(--cor-principal-calma);
    color: var(--cor-texto-claro);
}

.flatpickr-day:hover {
    background-color: var(--cor-acento-calma);
    color: var(--cor-texto-claro);
}

.flatpickr-innerContainer {
    padding: 0.5rem; /* Add some padding inside the calendar */
}

.history-details-container {
	background-color: var(--cor-fundo-detalhes);
	border: 1px solid var(--cor-borda-calendario);
	border-radius: 20px;
	box-shadow: 0 10px 30px var(--cor-sombra-suave);
	padding: 2rem;
	width: 100%;
    max-width: 600px; /* Largura para o container de detalhes */
	min-height: 300px;
	display: flex;
	flex-direction: column;
}

.history-details-container h2 {
	font-family: var(--fonte-titulo);
	font-size: 2rem;
	color: var(--cor-principal-calma);
	margin-bottom: 1.5rem;
	text-align: center;
}

.history-list {
	list-style: none;
	padding: 0;
}

.history-item {
	background-color: #F0F8FF;
	border: 1px solid var(--cor-acento-calma);
	border-radius: 10px;
	padding: 1rem 1.5rem;
	margin-bottom: 1rem;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 1.1rem;
	color: var(--cor-texto-suave);
	flex-wrap: wrap; /* Permite quebrar linha em telas pequenas */
	gap: 0.5rem; /* Espaçamento entre os spans */
}

.history-item span:first-child {
	flex-grow: 1; /* Permite que o primeiro span ocupe o espaço disponível */
}

.no-records {
	text-align: center;
	font-style: italic;
	color: #777;
	margin-top: 1rem;
}

/* Responsividade */
@media (max-width: 992px) {
    main {
        flex-direction: column;
        align-items: center;
        padding: 1.5rem;
    }
    .date-input-container, .history-details-container {
        max-width: 90%;
        margin-bottom: 2rem; /* Adiciona margem inferior para espaçar quando empilhado */
        padding: 1.5rem;
    }
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
}

@media (max-width: 576px) {
    main {
        padding: 1rem;
    }
    .date-input-container, .history-details-container {
        max-width: 95%;
        padding: 1rem;
    }
    .history-item {
        flex-direction: column;
        align-items: flex-start;
    }
    .history-item span {
        width: 100%;
        text-align: left;
    }
    .date-input-group {
        flex-direction: column; /* Empilha input e botão em telas pequenas */
        gap: 0.5rem;
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
					Olá, <strong> <%
                        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioObjeto");
                        String userName = "Usuário";
                        // A variável idUsuario é a variável de instância declarada no topo do JSP
                        // e será atualizada aqui.
                        if (usuarioLogado != null) {
                            userName = usuarioLogado.getNome();
                            if (userName == null || userName.isEmpty()) {
                                userName = "Usuário";
                            }
                            idUsuario = usuarioLogado.getId(); // Atualiza a variável de instância
                        } else {
                            // Se o usuário não estiver logado, redirecionar
                            response.sendRedirect(request.getContextPath() + "/login.jsp");
                            return; // Importante para parar a execução do JSP aqui
                        }
                        out.print(userName);
                    %>
					</strong>
				</div>
				<a href="../EditarPerfil.jsp"> <i class="fas fa-pencil-alt"></i>
					Editar Perfil
				</a> <a href="../telasHome/Home.html"> <i
					class="fas fa-sign-out-alt"></i> Sair
				</a>
			</div>
		</nav>
	</header>
	<main>
        <div class="date-input-container">
            <label for="calendarInput">Selecione uma Data:</label>
            <input type="text" id="calendarInput" class="date-input" placeholder="Clique para selecionar a data">
            </div>

		<div class="history-details-container">
			<h2>Seu Histórico de Sentimentos</h2>
			<div id="selectedDateDisplay"
				style="text-align: center; margin-bottom: 1rem; font-weight: bold; color: var(--cor-principal-calma);">
				<%
                    // Lógica para exibição inicial e processamento de requisições AJAX
                    DaoHistorico daoHistorico = new DaoHistorico();

                    String displayDateText = "Todos os registros";
                    String dataParam = request.getParameter("data"); // Parâmetro 'data' vindo da URL ou AJAX

                    // DEBUG: Log para ver o que está sendo recebido no parâmetro 'data'
                    System.out.println("DEBUG JSP: Request received. Parameter 'data': " + dataParam);

                    if (dataParam != null && !dataParam.trim().isEmpty()) {
                        try {
                            // Tenta fazer o parse da data. O input type="date" envia no formatoYYYY-MM-DD,
                            // que é o formato padrão do LocalDate.parse()
                            LocalDate parsedDate = LocalDate.parse(dataParam.trim());
                            displayDateText = "Registros para: " + parsedDate.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                            System.out.println("DEBUG JSP: Successfully parsed date for display: " + parsedDate);
                        } catch (DateTimeParseException e) {
                            displayDateText = "Erro no formato da data, mostrando todos os registros.";
                            System.err.println("DEBUG JSP ERROR: Failed to parse date parameter '" + dataParam + "': " + e.getMessage());
                        }
                    } else {
                        System.out.println("DEBUG JSP: No date parameter or empty. Displaying all records.");
                    }
                    out.print(displayDateText);
                %>
			</div>
			<ul id="historyList" class="history-list">
				<%
                    List<Historico> historicosDoUsuario = new ArrayList<>();

                    try {
                        if (dataParam != null && !dataParam.trim().isEmpty()) {
                            try {
                                LocalDate dataFiltro = LocalDate.parse(dataParam.trim());
                                System.out.println("DEBUG JSP: Filtering records for date: " + dataFiltro);
                                historicosDoUsuario = daoHistorico.listarHistoricosPorDataEUsuario(idUsuario, dataFiltro);
                                System.out.println("DEBUG JSP: Number of records found for " + dataFiltro + ": " + historicosDoUsuario.size());
                            } catch (DateTimeParseException e) {
                                // Se a data for inválida, volta a listar todos os históricos
                                System.err.println("DEBUG JSP ERROR: Date parse error for filter. Listing all records for user. " + e.getMessage());
                                historicosDoUsuario = daoHistorico.listarHistoricosPorUsuario(idUsuario);
                                System.out.println("DEBUG JSP: Number of all records for user (after parse error): " + historicosDoUsuario.size());
                            }
                        } else {
                            // Se o parâmetro 'data' for nulo ou vazio, lista todos os históricos do usuário
                            System.out.println("DEBUG JSP: No date filter applied. Listing all records for user.");
                            historicosDoUsuario = daoHistorico.listarHistoricosPorUsuario(idUsuario);
                            System.out.println("DEBUG JSP: Number of all records for user: " + historicosDoUsuario.size());
                        }
                    } catch (Exception e) {
                        // Captura qualquer outra exceção (incluindo SQLException do DAO)
                        System.err.println("DEBUG JSP ERROR: General error fetching historicos: " + e.getMessage());
                        e.printStackTrace(); // IMPRIME A PILHA DE ERRO COMPLETA NO CONSOLE!
                        out.println("<p class=\"no-records\">Erro ao carregar registros do banco de dados.</p>");
                        historicosDoUsuario = new ArrayList<>(); // Garante que a lista esteja vazia em caso de erro
                    }

                    if (historicosDoUsuario.isEmpty()) {
                        System.out.println("DEBUG JSP: No records found for display after filter/fetch.");
                        out.println("<p class=\"no-records\">Nenhum registro de sentimento encontrado para esta data ou para o usuário.</p>");
                    } else {
                        System.out.println("DEBUG JSP: Displaying " + historicosDoUsuario.size() + " records.");
                        // Ordenar por data/hora mais recente primeiro, para melhor visualização
                        historicosDoUsuario.sort(Comparator.comparing(Historico::getDataHoraClique, Comparator.nullsLast(Comparator.reverseOrder())));

                        for (Historico h : historicosDoUsuario) {
                            String dataHoraFormatada = "Data/Hora Indisponível"; // Fallback para caso getDataHoraClique() retorne null
                            if (h.getDataHoraClique() != null) {
                                dataHoraFormatada = h.getDataHoraClique().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
                            }
                            out.println("<li class=\"history-item\">");
                            out.println("<span>Emoção: " + (h.getNomeSentimento() != null ? h.getNomeSentimento() : "N/A") + "</span>");
                            out.println("<span>Data/Hora: " + dataHoraFormatada + "</span>");
                            out.println("</li>");
                        }
                    }
                %>
			</ul>
		</div>
	</main>
	<footer>
		<p>&copy; 2025 Calmamente. Todos os direitos reservados. Feito com
			carinho para você!</p>
		<div class="links">
			<a href="#">Privacidade</a><a href="#">Termos</a><a href="#">Ajuda</a>
		</div>
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/pt.js"></script>
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

        // === SCRIPT PARA O CALENDÁRIO E FILTRAGEM ===
        const calendarInput = document.getElementById('calendarInput');
        const selectedDateDisplay = document.getElementById('selectedDateDisplay');
        const historyList = document.getElementById('historyList');

        // Função para buscar o histórico para uma data específica (ou todos os registros)
        function fetchHistoryForDate(dateString) {
            console.log("DEBUG JS: fetchHistoryForDate() called with date:", dateString);

            // Construa a URL com ou sem o parâmetro 'data'
            let fetchUrl = 'historicov1.jsp'; // Ensure this points to the current JSP
            if (dateString) {
                // FIX: Escapar o '$' para que o JSP não tente interpretar como EL
                fetchUrl += `?data=\${encodeURIComponent(dateString)}`;
            } else {
                // Se a data for vazia, queremos limpar o parâmetro da URL para mostrar todos
                fetchUrl = window.location.pathname; // Apenas o caminho, sem query parameters
            }
            console.log("DEBUG JS: Fetching URL:", fetchUrl);

            fetch(fetchUrl)
                .then(response => {
                    console.log("DEBUG JS: Fetch response received. Status:", response.status);
                    if (!response.ok) {
                        throw new Error(`HTTP error! Status: ${response.status} - ${response.statusText}`);
                    }
                    return response.text();
                })
                .then(html => {
                    const parser = new DOMParser();
                    const doc = parser.parseFromString(html, 'text/html');
                    const newHistoryList = doc.getElementById('historyList');
                    const newSelectedDateDisplay = doc.getElementById('selectedDateDisplay');

                    if (newHistoryList) {
                        console.log("DEBUG JS: Updating historyList. New content length:", newHistoryList.innerHTML.length);
                        historyList.innerHTML = newHistoryList.innerHTML;
                    } else {
                        console.error("DEBUG JS: newHistoryList not found in fetched HTML. This might be an error page.");
                    }
                    if (newSelectedDateDisplay) {
                        console.log("DEBUG JS: Updating selectedDateDisplay. New content:", newSelectedDateDisplay.textContent.trim());
                        selectedDateDisplay.textContent = newSelectedDateDisplay.textContent.trim();
                    } else {
                        console.error("DEBUG JS: newSelectedDateDisplay not found in fetched HTML. This might be an error page.");
                    }
                })
                .catch(error => {
                    console.error('DEBUG JS ERROR: Erro ao buscar histórico:', error);
                    historyList.innerHTML = '<p class="no-records">Não foi possível carregar os registros para esta data. Por favor, tente novamente.</p>';
                });
        }

        // Inicialização do Flatpickr
        document.addEventListener('DOMContentLoaded', () => {
            const urlParams = new URLSearchParams(window.location.search);
            const initialDateFromUrl = urlParams.get('data');

            const fp = flatpickr(calendarInput, {
                dateFormat: "Y-m-d", // Formato para o valor do input (YYYY-MM-DD)
                locale: "pt", // Define o idioma para português
                defaultDate: initialDateFromUrl || null, // Define a data inicial se presente na URL
                onChange: function(selectedDates, dateStr, instance) {
                    // Este evento é disparado quando uma data é selecionada no calendário
                    console.log("DEBUG JS: Flatpickr onChange. Selected date string:", dateStr);
                    fetchHistoryForDate(dateStr); // Filtra pela data selecionada

                    // Atualiza a URL sem recarregar a página
                    if (dateStr) {
                        // FIX: Escapar o '$' para que o JSP não tente interpretar como EL
                        history.pushState(null, '', `?data=\${encodeURIComponent(dateStr)}`);
                        console.log("DEBUG JS: URL updated to:", `?data=${dateStr}`);
                    } else {
                        history.pushState(null, '', window.location.pathname); // Limpa o parâmetro 'data' da URL
                        console.log("DEBUG JS: Date input cleared, URL reset.");
                    }
                },
                onReady: function(selectedDates, dateStr, instance) {
                    // Este evento é disparado quando o calendário é inicializado
                    // Se houver uma data inicial na URL, garanta que o filtro seja aplicado
                    if (initialDateFromUrl) {
                        fetchHistoryForDate(initialDateFromUrl);
                        console.log("DEBUG JS: Flatpickr onReady. Initial date from URL set and fetched:", initialDateFromUrl);
                    } else {
                        // Se não houver data na URL, buscar todos os registros na carga inicial
                        fetchHistoryForDate('');
                        console.log("DEBUG JS: Flatpickr onReady. No initial date in URL, fetching all records.");
                    }
                }
            });

            // Adicionar um botão ou funcionalidade para "Limpar Filtro" / "Mostrar Todos"
            const clearFilterButton = document.createElement('button');
            clearFilterButton.textContent = 'Mostrar Todos';
            clearFilterButton.classList.add('filter-button'); // Reutiliza o estilo do botão de filtro
            clearFilterButton.style.marginTop = '1rem'; // Adiciona margem
            clearFilterButton.addEventListener('click', () => {
                fp.clear(); // Limpa a data selecionada no Flatpickr
                fetchHistoryForDate(''); // Busca todos os registros
                history.pushState(null, '', window.location.pathname); // Limpa o parâmetro 'data' da URL
                console.log("DEBUG JS: Clear filter button clicked. Displaying all records.");
            });
            calendarInput.parentNode.appendChild(clearFilterButton); // Adiciona o botão abaixo do input
        });
    </script>
</body>
</html>