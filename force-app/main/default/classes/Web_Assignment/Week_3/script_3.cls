public with sharing class script_3 {
    public  void script_3() {

        // // CHALLENGE#1 
        // // 1- Create a variable to store the time in minutes. 
        // // 2- Create a variables to store the time in seconds. Calculate this value using the right operator and make sure it converts the time in minutes into time in seconds.
        // // 3- Print the time in seconds in the console.
        
        // //SOLUTION#1
        // var timeInMinutes = 40;
        // var timeInSeconds ;
        // console.log(timeInSeconds);
        // console.log();

        // /////////////////////////////////////////////////////////////////////

        // // CHALLENGE#2
        // // 1- You are counting points for a basketball game.
        // // 2- Store the 2-pointers scored and 3-pointers scored in two different variables.
        // // 3- Find the final points for the team and print that value to console.

        // //SOLUTION#2
        // var twoPointers=4;
        // var threePointers=6;
        // var finalPoints = (twoPointers * 2) + (threePointers * 3);
        // console.log(finalPoints);

        // /////////////////////////////////////////////////////////////////////

        // // CHALLENGE#3
        // // I'd like to calculate how long on average I've lived in a single house.
        // // Given a person's "age" and the number of times they've moved house as "moves", print the average number of years that they've spent living in the same house in the console.

        // //SOLUTION#3
        // var age=46;
        // var moves=4;
        // var yearsInOneHouse= Math.round(age / (moves + 1));
        // console.log(yearsInOneHouse);

        // /////////////////////////////////////////////////////////////////////

        // // CHALLENGE#4
        // // Use string concatenation to join the three provided strings ( first , second , and third ) and assign the resulting string to a variable called welcomeStatement . The value of welcomeStatement should be "Welcome to SF Academy, guest!"

        // //SOLUTION#4
        // var first = "Welcome";
        // var second = "to SF Academy,";
        // var third = " guest!";
        // var welcomeStatement = first + second + third;
        // console.log(welcomeStatement);

        // /////////////////////////////////////////////////////////////////////

        // // CHALLENGE#5
        // // Take the scenario in challenge#4,but instead of storing everything in a variable use string interpolation to create a welcome statement that takes only the guest name as a variable and print the whole sentence to console as "Welcome to SF Academy, John". 

        // //SOLUTION#5
        // var guest = 'John'
        // var welcomeStatement=`Welcome to SF Academy, ${guest}!`;
        // console.log(welcomeStatement);

        // /////////////////////////////////////////////////////////////////////

        // // CHALLENGE#6
        // // Find the number of letters in each of the strings below and print to console.

        // var myName ="John Doe";
        // var myCity = "London";
        // var myAge ='25';

        // //SOLUTION#6
        // console.log(myName.length);
        // console.log(myCity.length);
        // console.log(myAge.length);

        // /////////////////////////////////////////////////////////////////////

        // // CHALLENGE#7
        // // 1. Create 3 variables to store item prices.
        // //   but four of the last item. 
        // // 3. Tell the customer what the total price is before discount.
        // // 4. Inform the customer what the average price of items is before discount.
        // // 5. Inform them the final price after saving 5 dollars with promo code: 
        // // 6. Print the total finalPrice, average price and final price to console.

        // // SOLUTION#7
        // var itemOnePrice = 5;
        // var itemTwoPrice = 2;
        // var itemThreePrice = 8;

        // var totalPrice = itemOnePrice + itemTwoPrice + (itemThreePrice * 4);

        // var averagePrice = totalPrice / 6;

        // var finalPrice = totalPrice - 5;

        // console.log(totalPrice, averagePrice, finalPrice);

        System.debug('test');


    }
}