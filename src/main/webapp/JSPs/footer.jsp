<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;700&family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<style>
	/* Variáveis de Cores e Fontes - Mais VIBRANTES e LÚDICAS */
        :root {
            --cor-fundo-principal: #F8F8F8;
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
/* ===========
         SCROLLBAR 
        ===========
        */
        ::-webkit-scrollbar {
            width: 12px;
            height: 12px;
        }

        ::-webkit-scrollbar-track {
            background: var(--cor-fundo-principal);
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb {
            background: var(--cor-primaria-acao);
            border-radius: 10px;
            border: 3px solid var(--cor-fundo-principal);
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #33AADD;
        }

        ::-webkit-scrollbar-corner {
            background: transparent;
        }
        /* FIM DOS ESTILOS PARA O SCROLLBAR */


/*ESTILO PARA O FOOTER COMPLETO*/

/* ===========
          FOOTER 
        ===========
        */
        footer {
            background-color: var(--cor-grama-escura);
            color: var(--cor-texto-claro);
            text-align: center;
            padding: 3rem 5%;
            font-size: 1.1rem;
            box-shadow: inset 0 6px 12px rgba(0,0,0,0.15);
            border-top-left-radius: 35px;
            border-top-right-radius: 35px;
            position: relative;
            margin-top: 2rem;
            font-family: var(--fonte-corpo);
        }

        footer p {
            margin-bottom: 1rem;
        }

        footer .links {
            margin-top: 1.5rem;
            display: flex;
            justify-content: center;
            gap: 2rem;
        }

        footer .links a {
            color: var(--cor-texto-claro);
            text-decoration: none;
            transition: color 0.3s ease, transform 0.2s ease;
            padding: 0.8rem 1rem;
            font-weight: 700;
            border-radius: 15px;
            background-color: rgba(255,255,255,0.1);
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        footer .links a:hover {
            color: var(--cor-secundaria-acao);
            transform: translateY(-3px) scale(1.05);
            background-color: rgba(255,255,255,0.2);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        /*===========
         MODAIS (TERMOS, PRIVACIDADE E AJUDA) 
        ===========
        */
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: 1001;
            justify-content: center;
            align-items: center;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .modal-overlay.active {
            display: flex;
            opacity: 1;
        }

            .modal-content {
            background-color: var(--cor-nuvem);
            border-top-left-radius: 30px;
            border-bottom-left-radius: 30px;
            border-bottom-right-radius: 12px;
            border-top-right-radius: 12px;
            padding: 3.5rem;
            max-width: 700px;
            width: 90%;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            position: relative;
            transform: translateY(20px);
            opacity: 0;
            transition: transform 0.3s ease, opacity 0.3s ease;
            max-height: 80vh;
            overflow-y: auto;
            text-align: left;
            padding-right: 20px;
        }

        .modal-overlay.active .modal-content {
            transform: translateY(0);
            opacity: 1;
        }

        .modal-content h2 {
            font-family: var(--fonte-titulo);
            font-size: 2.8rem;
            color: var(--cor-roxo-divertido);
            margin-bottom: 1.5rem;
            text-align: center;
            text-shadow: 2px 2px 0px rgba(0,0,0,0.05);
        }

        .modal-content h3 {
            font-family: var(--fonte-titulo);
            font-size: 1.8rem;
            color: var(--cor-primaria-acao);
            margin-top: 1.5rem;
            margin-bottom: 0.8rem;
            border-bottom: 1px solid var(--cor-borda-elementos);
            padding-bottom: 0.5rem;
        }

        .modal-content p {
            font-family: var(--fonte-corpo);
            font-size: 1rem;
            color: var(--cor-texto-escuro);
            margin-bottom: 0.8rem;
            line-height: 1.7;
        }

        .close-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background: none;
            border: none;
            font-size: 2rem;
            color: var(--cor-texto-medio);
            cursor: pointer;
            transition: color 0.2s ease, transform 0.2s ease;
            z-index: 10;
        }

        .close-button:hover {
            color: var(--cor-terciaria-acao);
            transform: rotate(90deg);
        }

       /*===================
  		 RESPONSIVIDADE GERAL
   		 ==================== */
        @media (max-width: 768px) {
            /* Estilos para tablets e celulares */

            /* FOOTER */
            footer {
                padding: 2rem 3%;
                border-top-left-radius: 25px;
                border-top-right-radius: 25px;
            }

            footer p {
                font-size: 0.9rem;
            }

            footer .links {
                flex-direction: column;
                gap: 1rem;
                margin-top: 1rem;
            }

            footer .links a {
                padding: 0.7rem 0.8rem;
                font-size: 0.9rem;
                width: 80%;
                max-width: 250px;
                margin: 0 auto; /* Centraliza horizontalmente */
            }

            /* MODAIS */
            .modal-content {
                width: 95%;
                padding: 1.5rem; /* Padding reduzido para todos os lados */
                max-height: 90vh;
            }

            .modal-content h2 {
                font-size: 1.8rem; /* Fonte reduzida */
            }

            .modal-content h3 {
                font-size: 1.3rem; /* Fonte reduzida */
            }

            .modal-content p {
                font-size: 0.85rem; /* Fonte reduzida */
            }
            
            .close-button {
                top: 15px;
                right: 15px;
                font-size: 1.5rem;
            }
        }

        @media (max-width: 480px) {
            /* Estilos adicionais para telas de smartphones menores */
            footer .links a {
                width: 90%;
            }
            .modal-content h2 {
                font-size: 1.6rem;
            }
            .modal-content h3 {
                font-size: 1.2rem;
            }
            .modal-content p {
                font-size: 0.8rem;
            }
        }
		
</style>
<body>

	<footer>
		<p>&copy;
2025 Calmamente. Todos os direitos reservados.</p>
		<div class="links">
			<a href="#" id="termsLink">Termos de Serviço</a> <a href="#"
				id="privacyLink">Política de Privacidade</a> <a href="#"
				id="helpLink">Ajuda</a>
		</div>
	</footer>

	<div class="modal-overlay" id="termsModal">
		<div class="modal-content">
			<button class="close-button">&times;</button>
			<h2>Termos de Uso</h2>
			<h3>1.
Aceitação dos Termos</h3>
			<p>Ao acessar e utilizar o site Calmamente, você concorda em
				cumprir e estar vinculado a estes Termos de Uso.
Se você não
				concorda com qualquer parte destes termos, por favor, não utilize
				nosso site.</p>
			<h3>2.
Uso do Conteúdo</h3>
			<p>Todo o conteúdo fornecido neste site é apenas para fins
				informativos e educacionais.
Não se destina a substituir
				aconselhamento profissional, diagnóstico ou tratamento. Sempre
				procure o conselho de um profissional de saúde qualificado para
				quaisquer perguntas que você possa ter sobre uma condição médica.</p>
			<h3>3.
Propriedade Intelectual</h3>
			<p>Todo o conteúdo, design, gráficos, logotipos e outros
				materiais neste site são propriedade do Calmamente ou de seus
				licenciadores e são protegidos por leis de direitos autorais e
				marcas registradas.
Você não pode reproduzir, distribuir, modificar
				ou criar trabalhos derivados de qualquer conteúdo sem permissão
				prévia por escrito.</p>
			<h3>4.
Conduta do Usuário</h3>
			<p>Você concorda em usar o site de forma responsável e
				respeitosa.
Não é permitido postar ou transmitir qualquer material
				que seja ilegal, difamatório, obsceno, ameaçador, invasivo da
				privacidade de terceiros, ou que possa constituir ou encorajar uma
				ofensa criminal, violar os direitos de qualquer parte ou que de
				outra forma dê origem a responsabilidade ou viole qualquer lei.</p>
			<h3>5.
Limitação de Responsabilidade</h3>
			<p>O Calmamente não será responsável por quaisquer danos diretos,
				indiretos, incidentais, consequenciais ou punitivos decorrentes do
				seu acesso ou uso do site.</p>
			<h3>6.
Modificações dos Termos</h3>
			<p>Reservamo-nos o direito de modificar estes Termos de Uso a
				qualquer momento.
Quaisquer alterações serão efetivas imediatamente
				após a publicação no site. Seu uso continuado do site após a
				publicação de quaisquer alterações constitui sua aceitação dessas
				alterações.</p>
			<h3>7.
Lei Aplicável</h3>
			<p>Estes Termos de Uso serão regidos e interpretados de acordo
				com as leis do Brasil.</p>
		</div>
	</div>

	<div class="modal-overlay" id="privacyModal">
		<div class="modal-content">
			<button class="close-button">&times;</button>
			<h2>Política de Privacidade</h2>
			<h3>1.
Coleta de Informações</h3>
			<p>Coletamos informações que você nos fornece diretamente, como
				nome, endereço de e-mail e outras informações de contato quando você
				se registra, preenche um formulário ou interage com nossos serviços.
Também podemos coletar automaticamente certas informações sobre seu
				dispositivo e uso do site, como endereço IP, tipo de navegador e
				páginas visitadas, por meio de cookies e tecnologias semelhantes.</p>
			<h3>2.
Uso das Informações</h3>
			<p>Utilizamos as informações coletadas para: fornecer e melhorar
				nossos serviços; personalizar sua experiência no site;
comunicar-nos
				com você sobre atualizações, promoções e informações relevantes;
analisar o uso do site para otimizar o conteúdo e a funcionalidade;
e garantir a segurança e a integridade de nossa plataforma.</p>
			<h3>3.
Compartilhamento de Informações</h3>
			<p>Não vendemos, alugamos ou compartilhamos suas informações
				pessoais com terceiros, exceto nas seguintes circunstâncias: com seu
				consentimento explícito;
para cumprir obrigações legais; para
				proteger nossos direitos, privacidade, segurança ou propriedade;
ou
				com provedores de serviços que nos auxiliam na operação do site,
				desde que eles concordem em manter a confidencialidade de suas
				informações.</p>
			<h3>4.
Segurança dos Dados</h3>
			<p>Implementamos medidas de segurança razoáveis para proteger
				suas informações contra acesso não autorizado, alteração, divulgação
				ou destruição.
No entanto, nenhum método de transmissão pela
				internet ou armazenamento eletrônico é 100% seguro, e não podemos
				garantir segurança absoluta.</p>
			<h3>5.
Seus Direitos</h3>
			<p>Você tem o direito de acessar, corrigir, atualizar ou
				solicitar a exclusão de suas informações pessoais a qualquer
				momento.
Para exercer esses direitos, entre em contato conosco
				através dos canais fornecidos em nossa página de Contato.</p>
			<h3>6.
Cookies</h3>
			<p>Nosso site utiliza cookies para melhorar sua experiência de
				navegação. Você pode configurar seu navegador para recusar todos ou
				alguns cookies, ou para alertá-lo quando os sites definirem ou
				acessarem cookies.
No entanto, se você desativar ou recusar cookies,
				algumas partes do site podem se tornar inacessíveis ou não funcionar
				corretamente.</p>
			<h3>7.
Links para Terceiros</h3>
			<p>Nosso site pode conter links para sites de terceiros.
Não
				somos responsáveis pelas práticas de privacidade ou pelo conteúdo
				desses sites.
Recomendamos que você revise as políticas de
				privacidade de qualquer site de terceiros que visitar.</p>
			<h3>8.
Alterações a Esta Política</h3>
			<p>Podemos atualizar nossa Política de Privacidade
				periodicamente. Publicaremos quaisquer alterações nesta página e, se
				as alterações forem significativas, forneceremos um aviso mais
				proeminente.
Recomendamos que você revise esta política regularmente
				para se manter informado sobre como protegemos suas informações.</p>
		</div>
	</div>

	<div class="modal-overlay" id="helpModal">
		<div class="modal-content">
			<button class="close-button">&times;</button>
			<h2>Ajuda e Suporte</h2>
			<h3>1.
Como me Registro?</h3>
			<p>Para se registrar, clique no ícone de perfil no canto superior
				direito do cabeçalho e siga as instruções para criar sua conta.
É
				rápido e fácil!</p>
			<h3>2. Onde Encontro as Atividades?</h3>
			<p>Todas as nossas atividades e recursos estão na seção
				"Atividades & Recursos" no menu principal.
Lá você encontrará
				ferramentas como o registro de emoções, artigos e muito mais.</p>
			<h3>3.
Como Posso Contribuir?</h3>
			<p>Se você tem sugestões, ideias ou deseja colaborar, por favor,
				entre em contato conosco através da página "Contato".
Adoramos
				receber feedback e novas parcerias!</p>
			<h3>4. Problemas Técnicos?</h3>
			<p>Se estiver enfrentando algum problema técnico com o site, por
				favor, descreva o ocorrido em detalhes na nossa página de "Contato"
				ou envie um e-mail para suporte@calmamente.com.br.
Nossa equipe fará
				o possível para ajudar.</p>
			<h3>5. Como Funciona o Fórum?</h3>
			<p>Nosso fórum é um espaço seguro para compartilhar experiências,
				fazer perguntas e oferecer apoio.
Para participar, basta se
				registrar e seguir as regras da comunidade. Você pode criar novos
				tópicos ou responder aos existentes.</p>
			<h3>6.
Posso Usar o Site no Celular?</h3>
			<p>Sim! O site Calmamente é totalmente responsivo e foi projetado
				para funcionar perfeitamente em dispositivos móveis, tablets e
				computadores.</p>
			<h3>7.
Esqueci Minha Senha. O Que Faço?</h3>
			<p>Na tela de login, clique em "Esqueci minha senha" e siga as
				instruções para redefinir.
Um link será enviado para o seu e-mail
				cadastrado.</p>
		</div>
	</div>
	
</body>
<script>

//--- SCRIPT PARA OS MODAIS (TERMOS, PRIVACIDADE E AJUDA) ---

// Modal de Termos de Uso
const openTermsModalBtn = document.getElementById('termsLink');
const termsModalOverlay = document.getElementById('termsModal');

if (openTermsModalBtn) {
    openTermsModalBtn.addEventListener('click', (event) => {
        event.preventDefault();
        termsModalOverlay.classList.add('active');
        document.body.style.overflow = 'hidden';
    });
}

// Modal de Política de Privacidade
const openPrivacyModalBtn = document.getElementById('privacyLink');
const privacyModalOverlay = document.getElementById('privacyModal');

if (openPrivacyModalBtn) {
    openPrivacyModalBtn.addEventListener('click', (event) => {
        event.preventDefault();
        privacyModalOverlay.classList.add('active');
        document.body.style.overflow = 'hidden';
    });
}

// Modal de Ajuda
const openHelpModalBtn = document.getElementById('helpLink');
const helpModalOverlay = document.getElementById('helpModal');

if (openHelpModalBtn) {
    openHelpModalBtn.addEventListener('click', (event) => {
        event.preventDefault();
        helpModalOverlay.classList.add('active');
        document.body.style.overflow = 'hidden';
    });
}

// --- Botão Genérico de Fechar e Clique no Overlay para todos os Modais ---
// Seleciona todos os botões de fechar
const closeButtons = document.querySelectorAll('.modal-content .close-button');
closeButtons.forEach(button => {
    button.addEventListener('click', (event) => {
        event.target.closest('.modal-overlay').classList.remove('active');
        document.body.style.overflow = '';
    });
});
// Seleciona todos os overlays de modais para fechar ao clicar fora do conteúdo
const modalOverlays = document.querySelectorAll('.modal-overlay');
modalOverlays.forEach(overlay => {
    overlay.addEventListener('click', (event) => {
        if (event.target === overlay) {
            overlay.classList.remove('active');
            document.body.style.overflow = '';
        }
    });
});
// Fechar qualquer modal com a tecla ESC
document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape') {
        modalOverlays.forEach(overlay => {
            if (overlay.classList.contains('active')) {
                overlay.classList.remove('active');
                document.body.style.overflow = '';
            }
        });
    }
});

</script>
</html>