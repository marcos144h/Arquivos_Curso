const entrada = require("readline-sync");
let Tempos = 0;

for (let registro = 1; registro <= 6; registro++) {
	const tempo = entrada.questionFloat(`Informe o tempo ${registro}: `);
	somaTempos += tempo;
}

const media = somaTempos / 6;

console.log(`Soma dos tempos: ${somaTempos}`);
console.log(`Média final: ${media}`);


