// Pega os itens salvos no navegador ou começa com lista vazia
let carrinho = JSON.parse(localStorage.getItem('carrinho')) || [];

function atualizarContador() {
    const total = carrinho.length;
    const contador = document.getElementById('cart-count');
    if (contador) contador.innerText = total;
}

function adicionar(nome, preco) {
    carrinho.push({ nome, preco });
    localStorage.setItem('carrinho', JSON.stringify(carrinho));
    atualizarContador();
    alert(nome + ' foi adicionado ao carrinho!');
}

function carregarCarrinho() {
    const lista = document.getElementById('lista-carrinho');
    if (!lista) return;

    if (carrinho.length === 0) {
        lista.innerHTML = '<p>O carrinho está vazio.</p>';
        return;
    }

    let html = '<ul>';
    let total = 0;

    carrinho.forEach(item => {
        html += `<li>${item.nome} - R$ ${item.preco.toFixed(2)}</li>`;
        total += item.preco;
    });

    html += `</ul><p><strong>Total: R$ ${total.toFixed(2)}</strong></p>`;
    lista.innerHTML = html;
}

function limparCarrinho() {
    carrinho = [];
    localStorage.removeItem('carrinho');
    atualizarContador();
    carregarCarrinho();
}

function enviarMensagem(e) {
    e.preventDefault();
    alert('Mensagem enviada com sucesso!');
}

// Executa ao abrir qualquer página
atualizarContador();
carregarCarrinho();