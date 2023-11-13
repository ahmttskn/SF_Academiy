public with sharing class java_week_6 {
    public java_week_6() {

        // CHALLENGE#1
        // Given two arrays, which represent two sandwiches, return whether both sandwiches use the same type of bread. The bread will always be found at the start and end of the array.


        // SOLUTION#1
        // function hasSameBread(arr1, arr2) {
        // 	if (arr1[0] == arr2[0] && arr1[arr1.length-1] == arr2[arr2.length-1]) {
        // 		return true;
        // 	} else {
        // 		return false;
        // 	}
        // }

        // console.log(hasSameBread(
        //     ["brown bread", "lettuce", "brown bread"],
        //     ["white bread", "tomato", "white bread"]
        //   ))

        // ////////////////////////////////////////////////////////////////////////

        // CHALLENGE#2
        // Create a function that takes an array and returns the types of values (data types) in a new array.

        // SOLUTION#2
        // function arrayValuesTypes(arr) {
        // 	var mynewarr=[]
        // 	for (i=0;i<arr.length;i++) {
        // 		mynewarr.push(typeof(arr[i]))
        // 	}
        // 	return mynewarr
        // }

        // console.log(arrayValuesTypes(['hi',25,true]))

        // 2) let a = [1,"test",true];
        // const typeFinder = (arr) => {
        //     let newAray= [];
        //     arr.forEach(element => {
        //         newAray.push(typeof element);
        //     });
        //     return newAray;
        // }

        // console.log(typeFinder(a));

        // ////////////////////////////////////////////////////////////////////////
        // CHALLENGE#3
        // You work for a manufacturer, and have been asked to calculate the total profit made on the sales of a product. You are given an object containing the cost price per unit (in dollars), sell price per unit (in dollars), and the starting inventory. Return the total profit made, rounded to the nearest dollar.

        // SOLUTION#3
        // function calculateProfit(info) {
        // 	let gross = (info.sellPrice - info.costPrice) * info.inventory;
        // 	return Math.round(gross);
        // }
        // let infoObject={
        //     costPrice: 32.67,
        //     sellPrice: 45.00,
        //     inventory: 1200
        //   }
        // console.log(calculateProfit(infoObject))

        // ////////////////////////////////////////////////////////////////////////
        // CHALLENGE#4
        // Given an array of scrabble tiles, create a function that outputs the maximum possible score a player can achieve by summing up the total number of points for all the tiles in their hand. Each hand contains 7 scrabble tiles.

        // SOLUTION#4
        // function maximumScore(tileHand) {
        //     let sum=0;
        //     for (let index = 0; index < tileHand.length; index++) {
        //     sum+= tileHand[index].score;
        //     }
        // return sum;
        // }
        // let tileScores = [
        //     { tile: "N", score: 1 },
        //     { tile: "K", score: 5 },
        //     { tile: "Z", score: 10 },
        //     { tile: "X", score: 8 },
        //     { tile: "D", score: 2 },
        //     { tile: "A", score: 1 },
        //     { tile: "E", score: 1 }
        //   ]
        // console.log(maximumScore(tileScores))


    }
}