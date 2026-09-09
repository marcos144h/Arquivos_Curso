const entrada = require('readline-sync')

// 1 função para validar status (aprovado/reprovado)
function verificarstatus(nota){
    return nota >=7 ? " aprovado ": "reprovado";

}
const turma = [];
// 2. loop para cadastrar objetos no array
for (let i = 0; i < 3; i++){
    console.log(`\n--cadastro do aluno${i+1}---`);
    let nomeAluno = entrada.question("nome:");
    let notaAluno = entrada.questionFloat("nota:");

    // criando objeto e guardando no array
const novoAluno= {
    nomeAluno,
    notaAluno,
    status: verificarstatus(notaAluno)// usando a função aqui!
    };
turma.push(novoAluno)   

}



///3. exibindo o relatorio final
console.log("\n===relatorio final====");
for(let i = 0; i < turma.lenght; i++){
    console.log(`${turma[i].nome}- nota: ${turma[i].nota}| statu: ${turma[1].status}`);

}
