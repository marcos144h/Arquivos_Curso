
const entrada = require('readline-sync');

console.log("CALCULADORA DE IMC");


const peso = entrada.questionFloat("Qual o seu peso (kg)? ");
const altura = entrada.questionFloat("Qual a sua altura (m)? ");


const imc = peso / (altura * 2);


console.log("\n--- RESULTADO ---");
console.log(`Seu IMC é: ${imc.toFixed(2)}`);