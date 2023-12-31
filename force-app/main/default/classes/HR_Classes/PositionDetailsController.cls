public with sharing class PositionDetailsController {
    
    @AuraEnabled
    public static List<Position_Interviewer__c> getInterviewers(String positionId) {
        return [SELECT Id, Name, Position__c, Interviewer__r.Name, Interviewer__r.Phone__c, Interviewer__r.Email__c,
                       Interviewer__r.Company__c, Interviewer__r.Picture__c, Interviewer__r.About_Me__c
                FROM Position_Interviewer__c
                WHERE Position__c = :positionId
                WITH SECURITY_ENFORCED
               ];
    }

    @AuraEnabled
    public static Position__c getLocationDetails(String positionId) {
        return [SELECT Id, Position_Name__c, Location_HR__c, Location_HR__r.Name, Location_HR__r.City__c, Location_HR__r.Country__c,
                       Location_HR__r.Land_Mark__c, Location_HR__r.Postal_Code__c, Location_HR__r.State__c, Location_HR__r.Street__c
                FROM Position__c
                WHERE Id = :positionId
                WITH SECURITY_ENFORCED
               ];
    }

    @AuraEnabled
    public static List<Position_Candidate__c> getCandidates(String positionId) {
        return [SELECT Id, Name, Candidate__c, Candidate__r.Name, Candidate__r.Email__c, Candidate__r.Current_Company_Name__c,
                       Candidate__r.Location_HR__c, Candidate__r.Location_HR__r.Name
                FROM Position_Candidate__c
                WHERE Position__c = :positionId
                WITH SECURITY_ENFORCED
               ];
    }
}