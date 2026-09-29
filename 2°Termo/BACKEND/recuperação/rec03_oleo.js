const entrada = require("readline-sync");
const nivelOleo = entrada.questionFloat("Informe o nível de óleo em porcentagem: ");

console.log(`Nível informado: ${nivelOleo}%`);

if (nivelOleo >= 40 && nivelOleo <= 80) {
    console.log("NÍVEL NORMAL");
} else {
    console.log("INSPEÇÃO NECESSÁRIA");
}