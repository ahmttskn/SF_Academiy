public with sharing class java_4 {
    public java_4() {

        // CHALLENGE#1 
        // 1- Create two variables named 'firstName' and 'lastName'
        // 2- Create an if statement that prints a boolean value to console. 
        // 3- The if statement should print true only if the first name and last name has the same number of letters, otherwise prints false.

        // SOLUTION#1

        // var firstName ='John';
        // var lastName = 'Doe';

        // if(firstName.length===lastName.length){
        // console.log(true)
        // }else{
        //     console.log(false)
        // }

        /////////////////////////////////////////////////////////////////////

        // CHALLENGE#2
        // 1- Create a variable named 'myNumber'
        // 2- Create an if statement that prints a boolean value to console. 
        // 3- The if statement should print true only if the number is divisible by 7, otherwise prints false.

        //SOLUTION#2
        // var myNumber = 58;

        // if(myNumber%7===0){
        // console.log(true)
        // }else{
        //     console.log(false)
        // }

        /////////////////////////////////////////////////////////////////////

        // CHALLENGE#3
        // Write an if statement that checks whether a person can watch an MA15+ rated movie. One of the following two conditions is required for admittance:
        // - The person is at least 15 years old.
        // - They have parental supervision.
        // The if statement checks two variables, age and isSupervised. Prints a boolean.
        //Then write the same statement with ternary operator.

        // SOLUTION#3
        // var age =13;
        // isSupervised=true;
        // if (age>=15 || isSupervised){
        //    console.log(true)
        // } else {
        //    console.log(false)
        // }

        //SOLUTION WITH TERNARY OPERATOR
        // (age >= 15 || isSupervised) ? console.log(true) : console.log(false);

        /////////////////////////////////////////////////////////////////////

        // CHALLENGE#4
        // Code an if statement which checks two strings (player1 and player2) and prints a string to console stating the winner in a game of Rock, Paper, Scissors.

        // Each variable will contain a single string: "Rock", "Paper", or "Scissors". Return the winner according to the following rules:

        // Rock beats Scissors
        // Scissors beats Paper
        // Paper beats Rock
        // If player1 wins, return the string "The winner is player1". If player2 wins, return the string "The winner is p2" and if player1 and player2 are the same, return "It's a draw".



        //SOLUTION#4

        // var p1='Rock';
        // var p2='Paper';

        // if (p1 === "Rock" && p2 === "Scissors" || 
        // p1 === "Scissors" && p2 === "Paper" || 
        // p1 === "Paper" && p2 === "Rock") {
        //         console.log("The winner is p1") ;
        // }else if (p2 === "Rock" && p1 === "Scissors" ||
        //          p2 === "Scissors" && p1 === "Paper" || 
        //          p2 === "Paper" && p1 === "Rock") {
        // console.log("The winner is p2");
        // }else if (p1===p2){  
        // console.log("It's a draw");
        // }else{
        //     console.log('Check your spelling!')
        // }

        /////////////////////////////////////////////////////////////////////

        //CHALLENGE#5

        //Code a switch statement which checks the value of a variable called 'flower and prints a string to console based on the rules below.
        // If the flower is a rose it should print "Roses are red"
        // If the flower is a rose it should print "Violets are blue"
        // If the flower is a rose it should print "Sunflowers are yellow"
        // If the value is any other flower then it should print  "Please select another flower"

        //SOLUTION#5

        // var flower = "tulip";

        // switch (flower){
        //     case "rose":
        //         console.log("Roses are red");
        //         break;
        //     case "violet":
        //         console.log("Violets are blue");
        //         break;
        //     case "sunflower":
        //         console.log("Sunflowers are yellow");
        //         break;
        //     default:
        //         console.log("Please select another flower");
        // }





    }
}