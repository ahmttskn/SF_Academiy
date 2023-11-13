public with sharing class contactTriggerHandler {


    public static void contactInsert(List<Contact> triggerNew) {

        Set<Id> cntAccIds = new Set<Id>();
        for (Contact eachCnt : triggerNew) {
            if (eachCnt.AccountId != null) {
                cntAccIds.add(eachCnt.AccountId);
            }
        }

        List<Account> accList = [SELECT Id, Total_Contacts__c, 
                                    (SELECT Id, LastName
                                    FROM Contacts)
                                FROM Account
                                WHERE Id IN :cntAccIds];
        
        for (Account acc : accList) {
            acc.Total_Contacts__c  = acc.Contacts.size();
        }

        update accList;
        
    }


    public static void contactUpdte(List<Contact> triggerNew,
                                    List<Contact> triggerOld,
                                    Map<Id,Contact> triggerNewMap,
                                    Map<Id,Contact> triggerOldMap) {
        System.debug('test');
        Set<Id> cntAccIds = new Set<Id>();
        for (Contact cnt : triggerNew) {
            cntAccIds.add(cnt.AccountId);
            cntAccIds.add(triggerOldMap.get(cnt.id).AccountId);
        }

        List<Account> accList = [SELECT Id, Total_Contacts__c, 
                                    (SELECT Id, LastName
                                    FROM Contacts)
                                FROM Account
                                WHERE Id IN :cntAccIds];
        
        for (Account acc : accList) {
            acc.Total_Contacts__c  = acc.Contacts.size();
        }

        update accList;


    }


    public static void contactDelete(List<Contact> triggerOld,
                                    Map<Id,Contact> triggerOldMap) {
       System.debug('test');
       Set<Id> cntAccIds = new Set<Id>();
        for (Contact eachCnt : triggerOld) {
            if (eachCnt.AccountId != null) {
                cntAccIds.add(eachCnt.AccountId);
            }
        }

        List<Account> accList = [SELECT Id, Total_Contacts__c, 
                                    (SELECT Id, LastName
                                    FROM Contacts)
                                FROM Account
                                WHERE Id IN :cntAccIds];
        
        for (Account acc : accList) {
            acc.Total_Contacts__c  = acc.Contacts.size();
        }

        update accList;
    }

    public static void contactUndelete(List<Contact> triggerNew,
                                        Map<Id,Contact> triggerNewMap) {
        Set<Id> cntAccIds = new Set<Id>();
        for (Contact eachCnt : triggerNew) {
            if (eachCnt.AccountId != null) {
                cntAccIds.add(eachCnt.AccountId);
            }
        }

        List<Account> accList = [SELECT Id, Total_Contacts__c, 
                                    (SELECT Id, LastName
                                    FROM Contacts)
                                FROM Account
                                WHERE Id IN :cntAccIds];
        
        for (Account acc : accList) {
            acc.Total_Contacts__c  = acc.Contacts.size();
        }

        update accList;
    }

   

    public static void contactInfoInsert(
                        List<contact> triggerNew,
                        List<contact> triggerOld
    ) {

        for (contact cnt : triggerNew) {
            System.debug('new contact '+cnt.LastName + ' => '+ cnt.Description);
        }

            System.debug('old contact'+triggerOld);
        
    }

    public static void contactInfoUpdate(
                        List<contact> triggerNew,
                        List<contact> triggerOld,
                        Map<Id,contact> triggerNewMap,
                        Map<Id,contact> triggerOldMap
    ) {

        for (contact cnt : triggerNew) {
             System.debug('yeni contact '+ cnt.LastName);
             System.debug('eski contact '+ triggerOldMap.get(cnt.Id).LastName);
        }
        
        for (Id eachId : triggerNewMap.keySet()) {
            System.debug('yeni map contact '+ triggerNewMap.get(eachId).LastName);
            System.debug('eski map contact '+  triggerOldMap.get(eachId).LastName);
        }

        for (contact cnt : triggerOld) {
            System.debug('new '+ triggerNewMap.get(cnt.Id).LastName);
            System.debug('new '+ triggerOldMap.get(cnt.Id).LastName);
        }
    }
}