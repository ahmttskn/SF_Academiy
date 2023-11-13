public with sharing class ContactCtrl {

    
    @AuraEnabled(cacheable=true)
    public static List<Contact> searchContacts(String searchKey) {
        searchKey = '%' + searchKey + '%';
        return [SELECT Id, FirstName, LastName, Title, Department, Phone, Email
                FROM Contact
                WHERE FirstName LIKE :searchKey
                OR LastName LIKE :searchKey
                WITH SECURITY_ENFORCED];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> searchContactswithId(String Id) {

        return [SELECT Id, FirstName, LastName, Title, Department, Phone, Email
                FROM Contact
                WHERE Id = :Id
                WITH SECURITY_ENFORCED];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getAllContacs() {

        return [SELECT Id, FirstName, LastName, Title, Department, Phone, Email
                FROM Contact
                WITH SECURITY_ENFORCED];
    }
    
    public static void test(){
        FutureMethodTest.name();
        FutureMethodTest.name2();
        FutureMethodTest.name3();
    }
    
    public static void test2(){
        FutureMethodTest.name2();
    }
    
    public static void test3(){
        FutureMethodTest.name3();
    }
	
	
    
}