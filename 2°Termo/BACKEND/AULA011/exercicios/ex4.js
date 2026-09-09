const entrada= require('readline-sync');

function converterparafhrenheit(celsius){
    let fahrenheit = (celsius * 9/5) + 32;
    return fahrenheit;
}
 const tempC= entrada.questionFloat("digite a temperatura em celsius:");

 const tempF = converterparafhrenheit(tempC)
 console.log(` a temperatura convertida e: ${tempf.tofixed(1)}°F`)