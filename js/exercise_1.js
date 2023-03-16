displayToday = function(){
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    const date = new Date();
    console.log("Today is:", convertDateToWeek(date.getDay()));
    console.log(`Current time is ${convertTime(date.getHours(), date.getMinutes(), date.getSeconds())}`);
}

convertDateToWeek = function(number){
    switch(number){
        case 1:
            return "Sunday";
        case 2:
            return "Monday";
        case 3:
            return "Tuesday";
        case 4:
            return "Wednesday";
        case 5:
            return "Thusday";
        case 6:
            return "Friday";
        case 7:
            return "Saturday";
    }
}

convertTime = function(hours, minutes, seconds){
    const prepand = (hours >= 12)? "PM":"AM";
    hours = (hours >= 12)? hours - 12: hours;
    return `${hours} ${prepand} : ${minutes} : ${seconds}`;
}

displayToday();