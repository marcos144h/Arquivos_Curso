const produto ={
    nome: "teclado mecanico",
    preco: 150.00 ,
    estoque:25,
    emOferta: true
};
console.log(`produto: ${produto.nome}`);
console.log(`preço: rs ${produto.preco.toFixed(2)}`);
console.log(`produto: ${produto.nome} | ${produto.preco}| $
    {produto.estoque} | ${produto.emOferta}`);
    