const entrada = require("readline-sync");
const peca = entrada.question("qual o nome da peça:");
const quantidade= entrada.questionInt("qual a quantidade comprada:");
const precounitario= entrada.questionFloat("qual o preço unitário:");
const valortotal= precounitario*quantidade;

console.log(` o nome da peça : ${peca}`);
console.log(`quantidade comprada:${quantidade}`);
console.log(`preço unitário foi é ${precounitario} e o total  foi de: ${valortotal}`);