public with sharing class PositionDetailsService {
   
    @AuraEnabled
    public static List<Position__c> upcomingPositions(){
        return [SELECT Id, Name, Position_Name__c, Position_Type__c, Position_Detail__c, Location_HR__c, Location_HR__r.Name,
                       HR_Manager__c, Start_Date_Time__c, HR_Manager__r.Name
                FROM Position__c /*
                WHERE Start_Date_Time__c >= TODAY
                AND Live__c = true */
                WITH SECURITY_ENFORCED
               ];
    }
    
    @AuraEnabled
    public static List<Position__c> searchByKeyword(String name){
        String nameLike = '%' + name + '%';

        return [SELECT Id, Name, Position_Name__c, Position_Type__c, Position_Detail__c, Location_HR__c, Location_HR__r.Name,
                       HR_Manager__c, Start_Date_Time__c, HR_Manager__r.Name
                FROM Position__c
                WHERE /*Start_Date_Time__c >= TODAY
                AND Live__c = true
                AND */Position_Name__c LIKE :nameLike
                WITH SECURITY_ENFORCED
               ];
    }
}