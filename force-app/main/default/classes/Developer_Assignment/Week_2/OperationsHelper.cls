public with sharing class OperationsHelper {
    public with sharing class operationsHelper_1 {   
        //1.a
        public decimal largestOutOfTwoNumbers(decimal a, decimal b){
            if(a > b){
                return a;
            }
            return b;
        }
        //1.b
        public decimal smallestOutOfTwoNumbers(decimal a, decimal b, decimal c){
            if(a <= b && a <= c){
                return a;
            }
            else if(b <= a && b<= c){
                return b;
            }
            return c;
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
    
        public Integer sumofPositiveIntegers(Integer n1, Integer n2){
            Integer sum=n1;
            for(Integer i = n1; i <= n2; i++){
                sum = sum + i;
            }
            return sum;
        }

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
             system.debug('Gelen liste ile ilgili bir problem var..');
         }
         return sum;
      }
 
 
    // Part 5.1.b Avarage = Aritmetik ortalama
      public static decimal averageOfValues(List<decimal> params){
         decimal average;
         if(params != null && !params.isEmpty()){
             decimal sum = sumOfValues(params);
             integer size = params.size();
             average = sum/size;
         } else {
             System.debug('Gelen liste ile ilgili bir problem var..');
         }
         return average;
      }
 
    // Part 5.1.c Highest
      public static Decimal highestOfValue(List<Decimal> elements){
         Decimal highest;
         if(elements != null && !elements.isEmpty()){
             highest = elements[0];
             for(decimal el : elements){
                 if(el > highest){
                     highest = el;
                 }
             }
         } else {
             System.debug('Gelen liste ile ilgili bir problem var..');
         }
         return highest;
      }
 
 
    // Part 5.1.d Lowest
    public static Decimal lowestOfValue(List<Decimal> listem){
     Decimal lowest;
         if(listem != null && !listem.isEmpty()){
             lowest = listem[0];
             for(decimal lis : listem){
                 if(lis < lowest){
                     lowest = lis;
                 }
             }
         } else {
             System.debug('Gelen liste ile ilgili bir problem var..');
         }
         return lowest;
    }
   
   // Part 5.2 reverse
  public void reverseMethod(List<Decimal> reversePrint){
         if(reversePrint != null && !reversePrint.isEmpty()){
             for(integer i=reversePrint.size()-1; i>=0; i--){
                 system.debug(reversePrint[i]);
             }
         } else {
             System.debug('Gelen liste ile ilgili bir problem var..');
         }
     
        }
    }