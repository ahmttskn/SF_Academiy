public with sharing class ContactCtrl2 {
    @AuraEnabled(cacheable=true)
    public static List<Contact> searchContacts(String searchKey) {
        searchKey = '%' + searchKey + '%';
        return [SELECT Id, FirstName, LastName, Title, Department
                FROM Contact
                WHERE FirstName LIKE :searchKey
                OR LastName LIKE :searchKey
                WITH SECURITY_ENFORCED];
    }
}