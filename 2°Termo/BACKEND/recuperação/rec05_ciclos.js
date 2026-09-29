const entrada = require("readline-sync");
const produtosPorCiclo = entrada.questionInt("Quantos produtos são produzidos por ciclo ");
let producaoAcumulada = 0;

for (let ciclo = 1; ciclo <= 12; ciclo++) {
	producaoAcumulada += produtosPorCiclo;
	console.log(`Ciclo ${ciclo}: produção acumulada = ${producaoAcumulada} produtos`);
}
