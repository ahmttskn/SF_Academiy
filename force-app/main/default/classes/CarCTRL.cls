public with sharing class CarCTRL {
    
    @AuraEnabled(cacheable=true)
    public static List<Car__c> getCarRecordWithType(string carCategory){
        try {
            if (carCategory == 'All') {
                return [SELECT Id, Name, Category__c, Control__c, Make__c, Seating_Capacity__c,
                                Description__c, Fuel_Type__c, Picture_URL__c, Price__c
                    FROM Car__c 
                    WITH SECURITY_ENFORCED];
            } else {
                return [SELECT Id, Name, Category__c, Control__c, Make__c, Seating_Capacity__c,
                                Description__c, Fuel_Type__c, Picture_URL__c, Price__c
                    FROM Car__c 
                    WHERE Category__c = :carCategory
                    WITH SECURITY_ENFORCED]; 
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}