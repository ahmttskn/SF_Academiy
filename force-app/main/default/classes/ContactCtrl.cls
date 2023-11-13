public with sharing class ContactCtrl {

    
    @AuraEnabled
    public static List<Contact> searchContacts(String searchKey) {
        searchKey = '%' + searchKey + '%';
        return [SELECT FirstName, LastName, Title, Email, Phone, Department
                FROM Contact
                WHERE FirstName LIKE :searchKey
                OR LastName LIKE :searchKey
                /*WITH SECURITY_ENFORCED*/];
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