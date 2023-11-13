public with sharing class currencyExchange {
    public currencyExchange() {

        //1. Store the currency exchange rate values in a Map named 'currISOCodeAndExchangeRateMap' 
    //for any 5 currency ISO codes. Like below:
    //AUD => 0.73 CAD => 0.78 EUR => 1.13 NZD => 0.68 INR => 0.013
    Map<String, Decimal> currISOCodeAndExchangeRateMap = new Map<String, Decimal>();
    Map<String, Decimal> currISOCodeAndExchangeRateMap2 = new Map<String, Decimal>{'abc' => 0.123};
    currISOCodeAndExchangeRateMap.put('AUD', 0.73);
    currISOCodeAndExchangeRateMap.put('CAD', 0.78);
    currISOCodeAndExchangeRateMap.put('EUR', 1.13);
    currISOCodeAndExchangeRateMap.put('NZD', 0.68);
    currISOCodeAndExchangeRateMap.put('INR', 0.013);
    System.debug(currISOCodeAndExchangeRateMap);

    //2. Fetch the currency conversion rate for any one currency ISO code and print it. 
    Decimal inrToUsdCnvrsnRate = currISOCodeAndExchangeRateMap.get('INR');
    System.debug('INR to USD Conersion Rate    '+inrToUsdCnvrsnRate);

    //3. Check if the above Map have conversion rate for SAD ISO code.
    Boolean isContainsSAD = currISOCodeAndExchangeRateMap.containsKey('SAD');
    System.debug('Is Conversion rate for SAD available    '+isContainsSAD);

    //4. collect all the curreny ISO codes from currISOCodeAndExchangeRateMap 
    //for which the conversion rate is >= 1 in one variable and other iso codes in other variable.
    //Expected Output:
    //EUR – In one variable
    //AUD, CAD, NZD and INR – In another variable.
    //Map--> {AUD=0.73, CAD=0.78, EUR=1.13, INR=0.013, NZD=0.68}
        
    Set<String> moreThanOrEqualUSDValueCodesSet = new Set<String>();
    Set<String> lessThanUSDValueCodesSet = new Set<String>();
    //currISOCodeAndExchangeRateMap.keySet()--> All keys AUD, CAD, NZD
    for(String isoCode : currISOCodeAndExchangeRateMap.keySet()){//AUD, CAD, NZD, EUR, INR)
        if(currISOCodeAndExchangeRateMap.get(isoCode) >= 1){
            moreThanOrEqualUSDValueCodesSet.add(isoCode);
        } else {
            lessThanUSDValueCodesSet.add(isoCode);
        }
    }
    System.debug('All currency ISO codes which have higher than or equal USD  '+moreThanOrEqualUSDValueCodesSet);
    System.debug('All currency ISO codes which have lower value than USD    '+lessThanUSDValueCodesSet);

        }
}