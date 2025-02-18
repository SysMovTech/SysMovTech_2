// Referencias a los elementos del DOM
const btnResuelta = document.getElementById('btnResuelta');
const modalSecundario = document.getElementById('modalSecundario');
const iframeModal = document.getElementById('iframeModal');
const cerrarModalSecundario = document.getElementById('cerrarModalSecundario');

// Abrir el modal secundario
btnResuelta.addEventListener('click', () => {
    iframeModal.src = 'pages/confirmar_resuelta.jsp'; // Ruta relativa
    modalSecundario.classList.remove('hidden');
});

// Cerrar el modal secundario
cerrarModalSecundario.addEventListener('click', () => {
    modalSecundario.classList.add('hidden');
    iframeModal.src = ''; // Limpiar el contenido del iframe
});
