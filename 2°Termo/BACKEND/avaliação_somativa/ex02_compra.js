const entrada = require('readline-sync');

const nomematerial= entrada.question("QUAL O NOME DO MATERIAL?:")
const quantidadecomprada= entrada.questionInt("QUAL A QUANTIDADE COMPRADA")
const precounitario= entrada.questionFloat("QUAL O VALOR UNITARIO")
const valortotal= (quantidadecomprada+precounitario)

 console.log(`o seu ${nomematerial} deu o total de ${valortotal}!! `)
