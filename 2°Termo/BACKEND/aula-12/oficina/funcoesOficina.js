function calcularOrcamento(horasTrabalhadas) { 
    const valorHora = 85.0; 
    const totalMaoDeObra = horasTrabalhadas * valorHora; 
  
   
    
    return totalMaoDeObra; 
} 

function verificarGarantia(meses) { 
    if (meses <= 3) { 
        return 'dentro da garantia'; 
    } else { 
        return 'garantia expirada'; 
    } 

    function calcularDesconto(valortotal) {
        return valortotal * 0.8;
    }
} 

module.exports = { calcularOrcamento, verificarGarantia, calcularDesconto };
