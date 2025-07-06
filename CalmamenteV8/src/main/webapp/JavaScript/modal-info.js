class ModalInfo extends HTMLElement {
  connectedCallback() {
    const tipo = this.getAttribute("tipo");
    const titulo = this.getAttribute("titulo") || "";
    const conteudoOriginal = this.innerHTML;

    this.innerHTML = `
      <style>
        .modal-overlay {
          display: none;
          position: fixed;
          top: 0; left: 0;
          width: 100%; height: 100%;
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
          background-color: #fff;
          border-radius: 30px;
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
        }

        .modal-overlay.active .modal-content {
          transform: translateY(0);
          opacity: 1;
        }

        .close-button {
          position: absolute;
          top: 20px;
          right: 20px;
          background: none;
          border: none;
          font-size: 2rem;
          color: #555;
          cursor: pointer;
          z-index: 10;
        }

        .close-button:hover {
          color: #FF99CC;
          transform: rotate(90deg);
        }
      </style>

      <div class="modal-overlay" id="${tipo}Modal">
        <div class="modal-content">
          <button class="close-button" id="close${tipo}Btn">&times;</button>
          <h2>${titulo}</h2>
          ${conteudoOriginal}
        </div>
      </div>
    `;

    const modalOverlay = this.querySelector('.modal-overlay');
    const closeBtn = this.querySelector(`#close${tipo}Btn`);
	const openBtn = document.getElementById(`open${capitalize(tipo)}`);
	
    if (openBtn) {
      openBtn.addEventListener('click', () => {
        modalOverlay.classList.add('active');
        document.body.style.overflow = 'hidden';
      });
    }

    if (closeBtn) {
      closeBtn.addEventListener('click', () => {
        modalOverlay.classList.remove('active');
        document.body.style.overflow = '';
      });
    }

    modalOverlay.addEventListener('click', (e) => {
      if (e.target === modalOverlay) {
        modalOverlay.classList.remove('active');
        document.body.style.overflow = '';
      }
    });

    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape' && modalOverlay.classList.contains('active')) {
        modalOverlay.classList.remove('active');
        document.body.style.overflow = '';
      }
    });
  }
}

function capitalize(str) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}

customElements.define('modal-info', ModalInfo);
