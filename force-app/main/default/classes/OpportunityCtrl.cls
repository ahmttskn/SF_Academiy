public with sharing class OpportunityCtrl {

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOppsByStage(String stage) {
        return [SELECT Name, Type, Amount, StageName, CloseDate
                FROM Opportunity
                //WHERE FirstName LIKE :searchKey
                WHERE StageName LIKE :stage
                WITH SECURITY_ENFORCED
                /*LIMIT 10*/];
    }

    
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getTopOpportunities() {
        return [SELECT Name
                FROM Opportunity
                //WHERE FirstName LIKE :searchKey
                WITH SECURITY_ENFORCED
                /*LIMIT 10*/];
    }
}