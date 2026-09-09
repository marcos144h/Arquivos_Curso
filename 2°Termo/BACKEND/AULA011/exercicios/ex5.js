const entrada=require(`readline_sync`);
function calculardesconto(precoOriginal){
    return precoOriginal * 0.85; //retorna 85% do valor (ou seja , 15% de desconto)
}
const produtos = ["monitor","teclado","mouse"];
const preco = [800,150.80];
console.log("==TABELA DE PRECOS COM DESCONTO(15%)===");

for (let i =0; i < produtos.length; i++) {
let precoComdesconto= calcularDesconto(precos[i]);

console.log(`${produtos[i]}: de R${precos[1]} por R$ ${precoComdesconto.tofixed}`)
}