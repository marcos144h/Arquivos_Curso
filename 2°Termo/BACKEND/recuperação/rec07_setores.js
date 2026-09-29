const entrada = require("readline-sync");
const setores = [];

while (setores.length < 6) {
	const nomeSetor = entrada.question(`Informe o nome do setor ${setores.length + 1}: `);
	setores.push(nomeSetor);
}

console.log("\nSetores cadastrados:");

for (let indice = 0; indice < setores.length; indice++) {
	console.log(`${indice + 1} - ${setores[indice]}`);
}
