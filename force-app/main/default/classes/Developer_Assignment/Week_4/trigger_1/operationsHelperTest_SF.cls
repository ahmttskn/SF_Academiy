public with sharing class operationsHelperTest_SF {
    public void operationsHelperTest_SF_Methos() {
        
        //@isTest
        //public with sharing class operationsHelperTest {
            
            //@isTest 
            //public static void testEntire(){
                operationsHelper_SF demo = new operationsHelper_SF();
                //Validate - Actual vs Expected
                //Method - largestOutOfTwoNumbers
                Decimal result1 = demo.largestOutOfTwoNumbers(10.5, 23.5);
                system.assertEquals(23.5, result1);
                //Method - smallestOutOfThreeNumbers
                Decimal result2 = demo.smallestOutOfThreeNumbers(10.3, 8.5, 3.2);
                system.assertEquals(3.2, result2);
                //Method - sumofPositiveIntegers
                Integer result3 = demo.sumofPositiveIntegers(5);
                system.assertEquals(15, result3);
                /*InputList*/
                List<Decimal> inputList = new List<Decimal>{10.5,20.5,30.5};
                //Method - sumOfValues
                Decimal result4 = operationsHelper.sumOfValues(inputList);
                system.assertEquals(61.5, result4);
                //Method - averageOfValues
                Decimal result5 = operationsHelper.averageOfValues(inputList);
                system.assertEquals(20.5, result5);
                //Method - highestOfValue
                Decimal result6 = operationsHelper.highestOfValue(inputList);
                system.assertEquals(30.5, result6);
                //Method - lowestOfValue
                Decimal result7 = operationsHelper.lowestOfValue(inputList);
                system.assertEquals(10.5, result7);
                //Method -reverseMethod
                operationsHelper_SF.reverseMethod(inputList);
            }

        //}
    //}
}