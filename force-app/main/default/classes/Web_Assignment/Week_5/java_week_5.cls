public with sharing class java_week_5 {
    
    

        //CHALLENGE#1
        //Create a function that returns the square of the number it takes as an argument.

        //SOLUTION#1

        // function calcSquare (number){
        //    return number*number;
        // }

        // console.log(calcSquare(7));



        //CHALLENGE#2
        // Create a function that changes specific words into emoticons. Given a sentence as a string, replace the words smile, grin, sad and mad with their corresponding emoticons.


        // WORD	   EMOTICON
        // smile	:D
        // grin	    :)
        // sad  	:(
        // mad	    :P


        //SOLUTION#2
        // function emotify(str) {
        // 	switch(str){
        // 		case "Make me smile":
        // 			return "Make me :D"
        // 			break;
        // 		case "Make me grin":
        // 			return "Make me :)"
        // 			break;
        // 		case "Make me sad":
        // 			return "Make me :("
        // 			break;
        // 		case "Make me mad":
        // 			return "Make me :P"
        // 			break;
        // 	}
        // }

        // console.log(emotify("Make me grin"))

        /////////////////////////////////////////////////////////////





        //CHALLENGE#3
        // Create a function that takes damage and speed (attacks per second) and returns the amount of damage after a given time.


        //SOLUTION#3
        // function damage(damage, speed, time) {
        // 	if (damage < 0 || speed < 0) {
        // 		return "invalid"
        // 	} else if (time === "second") {
        // 		return damage * speed
        // 	}else if (time === "minute") {
        // 		return damage * speed * 60
        // 	} else if (time === "hour") {
        // 		return damage * speed * 3600
        // 	}
        // }

        // console.log(damage(20,10,'second'))





        /////////////////////////////////////////////////////////////

        // CHALLENGE#4
        // A student learning JavaScript was trying to make a function. His code should concatenate a passed string name with string "Innovas" and store it in a variable called result. Use arrow functions and string interpolation to answer this question

        //SOLUTION#4

        // const nameString=(name)=>{
        //     return `${name}Innovas`
        // }

        // console.log(nameString('Soft'))








        /////////////////////////////////////////////////////////////


        //CHALLENGE#5
        // Write a function that returns true if a year is a leap, otherwise return false.

        // A year is a "leap year" if it lasts 366 days, instead of 365 in a typical year. That extra day is added to the end of the shortest month, creating February 29.

        // A leap year occurs every four years, and will take place if the year is a multiple of four. The exception to this is a year at the beginning of a century (for example, 1900 or 2000), where the year must be divisible by 400 to be a leap year.


        //SOLUTION#5
        // function leapYear(year){
        //     if(year%4==0 && year%100!=0 && year%400!=0){
        //           return true;
        //       }
        //       return false;
        // }

        // console.log(leapYear(2028));




        // function isLeapYear(year) {
        //         if ((year % 4 === 0 && year % 100 !== 0) || year % 400 === 0) {
        //             return true; // Artık yıl
        //         } else {
        //             return false; // Artık yıl değil
        //         }
        //     }
            
        //     // Örnek kullanım:
        //     var year = 2024;
        //     if (isLeapYear(year)) {
        //         console.log(year + " bir artık yıldır.");
        //     } else {
        //         console.log(year + " bir artık yıl değildir.");
        //     }
            

        
}