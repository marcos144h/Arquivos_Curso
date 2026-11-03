


const entrada = require("readline-sync");
const fs = require("fs");

const ferramentas = [];
const quantidade = entrada.questionInt("Quantas ferramentas serão registradas? ");

for (let i = 0; i < quantidade; i++) {
  console.log(`\nFerramenta ${i + 1}:`);

  const nome = entrada.question("Nome: ");
  const quantidadeFerramentas = entrada.questionInt("Quantidade: ");
  const custoUnitario = entrada.questionFloat("Custo unitário: ");
  ferramentas.push({ nome,quantidade: quantidadeFerramentas,
    custoUnitario
  });
}

fs.writeFileSync(
  "ferramentas.json",
  JSON.stringify(ferramentas, null, 2),
);

console.log(`\nDados salvos! ${ferramentas.length} ferramenta registrada.`);
