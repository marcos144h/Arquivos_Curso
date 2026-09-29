const entrada = require("readline-sync");
const vibracaoInformada = entrada.quest

console.log(`Vibração informada: ${vibracaoInformada} mm/s`);

if (vibracao <= 3) {
    console.log("ESTÁVEL");
} else if (vibracao <= 6) {
    console.log("ATENÇÃO");
} else {
    console.log("CRITICA");
}