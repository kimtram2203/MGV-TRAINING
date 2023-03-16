heronCalculator = function(a,b,c){
    const p = (a+b+c)/2;
    return Math.sqrt(p*((p-a)*(p-b)*(p-c)));
}

console.log("Triangle area: ", heronCalculator(5, 6, 7))