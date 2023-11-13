public with sharing class SpoonacularMetadataHandler {
    
    public static Map<String,String> getSpoonacularDetails() {
        Map<String,String> details = new Map<String,String>();
        for(Spoonacular_Detail__mdt spoon : [SELECT Label, Value__c FROM Spoonacular_Detail__mdt]) {
            details.put(spoon.Label, spoon.Value__c);
        }
        return details;
    }
}