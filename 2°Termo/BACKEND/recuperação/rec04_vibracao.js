const entrada = require("readline-sync");
const vibracaoInformada = entrada.question("Informe o valor da vibração em mm/s: ");
const vibracao = Number(vibracaoInformada.replace(",", "."));

console.log(`Vibração informada: ${vibracaoInformada} mm/s`);

if (vibracao <= 3) {
    console.log("ESTÁVEL");
} else if (vibracao <= 6) {
    console.log("ATENÇÃO");
} else {
    console.log("CRÍTICA");
}