const fs = require("fs");
const path = require("path");

console.log("==== SISTEMA DE PERSISTENCIA : LEITURA DE MAQUINAS ====");

const nomedoarquivo = "maquinas.json";
const caminhoCompleto = path.join(__dirname, nomedoarquivo);

// 1. Verifica se o arquivo existe e encerra com process.exit() se não existir
if (!fs.existsSync(caminhoCompleto)) {
  console.error(`Erro: O arquivo '${nomedoarquivo}' não foi encontrado!`);
  process.exit(1); // Para a execução do script aqui
}

// 2. Lê o arquivo com segurança
const conteudotexto = fs.readFileSync(caminhoCompleto, "utf-8");
const maquinasrecuperadas = JSON.parse(conteudotexto);

console.log("Dados carregados com sucesso:\n");
console.table(maquinasrecuperadas);

console.log(`Total de máquinas recuperadas: ${maquinasrecuperadas.length}`);

// 3. Verifica se a lista tem pelo menos um item antes de acessar a posição [0]
if (maquinasrecuperadas.length > 0) {
  console.log(`Primeira máquina da lista: ${maquinasrecuperadas[0].nome}`);
} else {
  console.log("A lista de máquinas está vazia.");
}