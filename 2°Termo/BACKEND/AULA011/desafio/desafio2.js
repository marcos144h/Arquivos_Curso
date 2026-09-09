const entrada = require('readline-sync');


function calcularDesconto(precoOriginal) {
    return precoOriginal * 0.90;
}

console.log("=== RESTAURANTE COM DESCONTO (10%) ===");


let valorConta = entrada.questionFloat("Digite o valor total da conta: R$ ");


if (valorConta > 100) {
    let valorComDesconto = calcularDesconto(valorConta);
    console.log(`Parabéns! Você ganhou 10% de desconto.`);
    console.log(`Valor final a pagar: R$ ${valorComDesconto.toFixed(2)}`);
} else {
    console.log(`Valor abaixo de R$ 100.00 não recebe desconto.`);
    console.log(`Valor final a pagar: R$ ${valorConta.toFixed(2)}`);
}