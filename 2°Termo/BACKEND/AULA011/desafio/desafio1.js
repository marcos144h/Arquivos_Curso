const entrada = require('readline-sync');


function verificarVoto(idade) {
    return idade >= 16 ? "Pode Votar" : "Não Pode Votar";
}

const eleitores = [];


for (let i = 0; i < 3; i++) {
    console.log(`\n--- Eleitor ${i + 1} ---`);
    let nome = entrada.question("Nome: ");
    let ano = entrada.questionInt("Ano de nascimento: ");
    let idade = 2026 - ano;

    let eleitor = {
        nome: nome,
        idade: idade,
        status: verificarVoto(idade)
    };

    eleitores.push(eleitor);
}


console.log("\n=== RELATÓRIO FINAL ===");
for (let i = 0; i < eleitores.length; i++) {
    console.log(`${eleitores[i].nome} - Idade: ${eleitores[i].idade} | Status: ${eleitores[i].status}`);
}