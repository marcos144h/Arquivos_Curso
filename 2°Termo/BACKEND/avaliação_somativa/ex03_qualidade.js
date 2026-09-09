const readline = require('readline');

const entrada = readline.createInterface({
	input: process.stdin,
	output: process.stdout
});

entrada.question('INFORME O PESO DA PECA EM GRAMAS: ', (resposta) => {
	const peso = Number(resposta.replace(',', '.'));

	console.log(`PESO INFORMADO: ${peso} g`);

	if (peso >= 95 && peso <= 105) {
		console.log('PECA APROVADA');
	} else {
		console.log('PECA REPROVADA');
	}

	entrada.close();
});