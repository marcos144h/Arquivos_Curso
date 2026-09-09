// criando 'maquina de' calcular media
const readline = require('readline-sync');
function calcularMedia(n1, n2){
    return(n1 + n2)/ 2;
}
//usando a maquina
const numero1 = entrada.questionInt("qual sua nota 1?")
const numero2 = entrada.questionInt("qual sua nota 2?")
const resultado = calcularMedia(numero1, numero2)
console.log(` A media calculada foi ${resultado}`);