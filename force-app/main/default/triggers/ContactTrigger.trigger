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