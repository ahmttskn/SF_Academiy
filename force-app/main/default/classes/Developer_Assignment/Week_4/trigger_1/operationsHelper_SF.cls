public with sharing class operationsHelper_SF {
    //1.a
    public decimal largestOutOfTwoNumbers(decimal a, decimal b){
        if(a > b){
            return a;
        }
        return b;
    }
    //1.b
    public decimal smallestOutOfThreeNumbers(decimal a, decimal b, decimal c){
        if(a < b && a < c){
            return a;
        }
        else if(b < a && b< c){
            return b;
        }
        else{
            return c;
        }
        
    }
    //1.c
    public Integer sumofPositiveIntegers(Integer n){
        Integer sum;
        if(n<0){
            sum = null;
            system.debug('We are not calculating the sum for negative numbers');
        } else {
            sum = 0;
            for(Integer i = 1; i <= n; i++){
                sum = sum + i;
            }
        }
        return sum;
    }

    // Part 5.1.a Sum
    public static decimal sumOfValues(List<decimal> values){
        Decimal sum;
        if(values != null && !values.isEmpty()){
            sum = 0;
            for(Decimal val : values){
                sum = sum + val;
            }
        } else {
            system.debug('Please provide values to do the operation');
            return null;
        }
        return sum;
     }


    // Part 5.1.b Average 
    public static decimal averageOfValues(List<decimal> params){
        decimal average;
        if(params != null && !params.isEmpty()){
            decimal sum = sumOfValues(params);
            integer size = params.size();
            average = sum/size;
        } else {
            system.debug('Please provide values to do the operation');
            return null;
        }
        return average;
     }

    // Part 5.1.c Highest
    public static Decimal highestOfValue(List<Decimal> elements){
        
        /*
        elements.sort();
        elements.get(0);
        */
        
        Decimal highest;
        if(elements != null && !elements.isEmpty()){
            highest = elements[0];
            for(decimal el : elements){
                if(el > highest){
                    highest = el;
                }
            }
        } else {
            system.debug('Please provide values to do the operation');
            return null;
        }
        return highest;
     }


   // Part 5.1.d Lowest
   public static Decimal lowestOfValue(List<Decimal> listem){
    /*
        elements.sort();
        elements.get(elements.size() - 1);
        */
    
    Decimal lowest;
        if(listem != null && !listem.isEmpty()){
            lowest = listem[0];
            for(decimal lis : listem){
                if(lis < lowest){
                    lowest = lis;
                }
            }
        } else {
            system.debug('Please provide values to do the operation');
            return null;
        }
        return lowest;
   }
  
    // Part 5.2 reverse
    public static void reverseMethod(List<Decimal> reversePrint){
        if(reversePrint != null && !reversePrint.isEmpty()){
            for(integer i=reversePrint.size()-1; i>=0; i--){
                system.debug('Reverse' +reversePrint[i]);
            }
        } 
    }
}