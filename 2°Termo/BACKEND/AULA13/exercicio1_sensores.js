const fs = require('fs')

console.log('===SISTEMA DE MONITORAMENTO===')

const sensores=[
 {codigo:1001, tipo : "temperatura",leituraAtusl:45.5,status:
  "operando"} ,
 {codigo:1002, tipo : "temperatura",leituraAtusl:4,status:
  "operando"} ,
 {codigo:1003, tipo : "temperatura",leituraAtusl:145.5,status:
  "alerta"} 
];
const valoresgravados = JSON.stringify(sensores, null,2);
fs.writeFileSync('sensore.json', valoresgravados);

console.log(`\nvalores gravados com sucesso`)