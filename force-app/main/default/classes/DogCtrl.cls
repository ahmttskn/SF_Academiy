public with sharing class DogCtrl {
    
    @AuraEnabled(cacheable=true)
    public static List<Dog_Dashboard__c> dogsInfos(){
        try {
            return [SELECT Breed__c, Height_Inches__c, Weight_Lb__c, 
                            Life_Span_Years__c,Image__c, Description__c, More_Info__c
                    FROM Dog_Dashboard__c];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}