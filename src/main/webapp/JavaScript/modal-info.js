
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

// Botões de fechar modal
const closeButtons = document.querySelectorAll('.modal-content .close-button');
closeButtons.forEach(button => {
    button.addEventListener('click', (event) => {
        event.target.closest('.modal-overlay').classList.remove('active');
        document.body.style.overflow = '';
    });
});

// Fecha modal ao clicar fora do conteúdo
const modalOverlays = document.querySelectorAll('.modal-overlay');
modalOverlays.forEach(overlay => {
    overlay.addEventListener('click', (event) => {
        if (event.target === overlay) {
            overlay.classList.remove('active');
            document.body.style.overflow = '';
        }
    });
});

// Fecha modal com tecla ESC
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
