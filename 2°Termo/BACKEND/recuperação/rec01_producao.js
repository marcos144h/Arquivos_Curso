const entrada = require('readline-sync');

const caixas = 75;
const horas = 8;
const producaototal= horas * caixas;
 
console.log(`---RELATORIO DE PRODUÇÃO----`)
console.log(`caixas produzidas em por hora é ${caixas} `)
console.log(`quantidade de horas trabalhadas é ${horas}`)
console.log(` o total  produzido foi de ${producaototal}`)