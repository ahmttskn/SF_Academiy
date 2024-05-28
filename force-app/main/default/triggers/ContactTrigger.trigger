trigger ContactTrigger on Contact (before insert, before update, before delete,
                                after insert, after update, after delete, after undelete) {

   
    if (Trigger.isBefore) {
        if (Trigger.isDelete) {
            contactTriggerHandler.contactDelete(Trigger.old, Trigger.oldMap);
        } 
    }

    if (trigger.isAfter) {

        if (Trigger.isInsert) {
            contactTriggerHandler.contactInsert(Trigger.new);
        }
        if (Trigger.isUpdate) {
            contactTriggerHandler.contactUpdte(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
        }
        
        if (Trigger.isUndelete) {
            contactTriggerHandler.contactUndelete(Trigger.new, Trigger.newMap);
        }
        
        
        /*
        List<Opportunity> oppList = [Select Id, (Select id from OpportunityContactRoles) from Opportunity where AccountId IN :Trigger.new];
        List<OpportunityContactRole> oppCRList = new List<OpportunityContactRole>();
        
        if (oppList.size() > 0) {
            for (Opportunity opp : oppList){
                if (opp.OpportunityContactRoles.size() == 0) {
                    OpportunityContactRole oppCR = new OpportunityContactRole();
                    oppCR.ContactId = Trigger.new[0].Id;
                    oppCR.OpportunityId = opp.Id;

                    oppCRList.add(oppCR);
                }
            }
            try {
                insert oppCRList;

                try {
                    List<Contact> emailList = [Select email from Contact where id in :Trigger.new];
                    List<String> emailAddresses = new List<String>();
                    for (String e : emailList) {
                        if (e.email != null) {
                            emailAddresses.add(e.email);
                        }
                    }
                    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                    email.setSubject('Daily Purge Event Job Has Run');
                    email.setHtmlBody('Hello, <br/><br/>Daily email job has finished.<br/>');
                    email.setToAddresses();
            
                   // try {
                        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{emailAddresses});
                       
                } catch (Exception ex) {
                    
                }
            } catch (Exception ex) {
                ErrorLog__c el = new ErrorLog__c();
                el.Name = 'Contact - Opportunity Contact Role';
                el.LogDetails__c = ex.getMessage();

                insert el;
            }
        }


        if (oppList.size() > 0) {
            for (Integer i = 0; i < oppList.size(); i++) {
                if (opp.OpportunityContactRoles.size() == 0) {
                    OpportunityContactRole oppCR = new OpportunityContactRole();
                    oppCR.ContactId = Trigger.new[i].Id;
                    oppCR.OpportunityId = opp.Id;
                }
            }
        }

        if (oppList.size() > 0) {
            
        }
        */
        


    }

    




















    // if (Trigger.isBefore) {
    //     if (Trigger.isInsert ) {
    //         contactTriggerHandler.contactInfoInsert(Trigger.new, Trigger.old);
    //     }
    //     if (Trigger.isUpdate) {
    //         contactTriggerHandler.contactInfoUpdate(Trigger.new, Trigger.old,
    //                                          Trigger.newMap, Trigger.oldMap);
    //     }
    // }


}