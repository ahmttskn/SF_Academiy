public with sharing class Payment_Trigger_Handler {
    /*
    public static void beforeInsert(List<Payment__c> paymentTriNew) {        
        calculateAmountToUSD(paymentTriNew);
    }

    public static void beforeUpdate(Map<Id,Payment__c> paymentNewMap, Map<Id,Payment__c> paymentOldMap) {
        List<Payment__c> paymentToCalculate = new List<Payment__c>();
        for(Payment__c pay : paymentNewMap.values()){
                Decimal oldAmount = paymentOldMap.get(pay.id).Amount_Incurred__c;
                String oldCurrency = paymentOldMap.get(pay.id).Currency_Incurred_In__c;
                if(pay.Amount_Incurred__c != oldAmount || pay.Currency_Incurred_In__c != oldCurrency){                
                    paymentToCalculate.add(pay);
                }    
        }
        if(!paymentToCalculate.isEmpty()){
            calculateAmountToUSD(paymentToCalculate);
        }
    }

  
    public static void calculateAmountToUSD(List<Payment__c> payments){
        for(Payment__c pay : payments){
            Decimal crossRate = CustomMetadataHelper.getCurrencyRate(pay.Currency_Incurred_In__c);
            if(crossRate != NULL){
                pay.Amount_Converted_to_USD__c = pay.Amount_Incurred__c/crossRate;
            }
        }
    }
    */
}