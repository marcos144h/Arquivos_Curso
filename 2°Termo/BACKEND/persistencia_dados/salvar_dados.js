const fs = require('fs')

console.log('---SISTEMA DE REGISTRO DE PRODUÇÃO----');

const maquinasindustrial =[
{id:101, nome: 'torno resolver', "setor": "usinagem", operacional:true},
{id:102, nome: 'furadeira de bancada', "setor": "manutenção", operacional:false},
{id:103, nome: 'prensa hidraulica 40t', "setor": "estampararia", operacional:true},
];
const dadosparagravar = JSON.stringify(maquinasindustrial, null, 2);

const nomedoarquivo = 'maquinasindustrial.json';
fs.writeFileSync(nomedoarquivo, dadosparagravar);

console.log(`Arquivo  gravado com sucesso!`);
console.log(`Verifique o arquivo ${nomedoarquivo} gerado`);