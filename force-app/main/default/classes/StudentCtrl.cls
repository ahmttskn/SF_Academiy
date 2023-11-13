public with sharing class StudentCtrl {
    @AuraEnabled 
    public static List<Student__c> searchStudentsByPostalCode(String code) {
        code = '%' + code + '%';
        return [SELECT Student_Name__c, Class__c, Mobile__c, Email__c, Postal_Code__c
                FROM Student__c
                WHERE Postal_Code__c LIKE :code
                WITH SECURITY_ENFORCED];
    }
}