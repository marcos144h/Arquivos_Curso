const entrada = require('readline-sync');
const oficina = require('./funcoesOficina'); // Ajuste o nome se no seu computador estiver 'funcoesOficinia'

console.log("---- SISTEMA DE GESTÃO DE OFICINA 1.0 -----");


const peca = entrada.questionFloat("Preco da peca: R$ ");
const horas = entrada.questionInt("HORAS DE SERVICO: ");
const tempouso = entrada.questionInt("MESES DESDE O ULTIMO CONSERTO: ");

const total = oficina.calcularOrcamento(peca, horas);
const garantia = oficina.verificarGarantia(tempouso);


console.log("\n--- RELATÓRIO DE SERVIÇO ---");
console.log(`Orçamento: R$ ${total.toFixed(2)}`);
console.log(`Status garantia: ${garantia}`);
console.log("-----------------------------------");