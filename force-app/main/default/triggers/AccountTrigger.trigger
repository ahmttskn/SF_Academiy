trigger AccountTrigger on Account (before insert, before update, after insert, after update ) {


    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            AccountTriggerHandler.accRating(Trigger.New);
        }
    }

    
    /*
    System.debug(Trigger.new);
    System.debug(Trigger.old);
    System.debug(Trigger.newMap);
    System.debug(Trigger.oldMap);
   */

    /*
    System.debug('Trigger calisti');

    if (Trigger.isBefore ) {

        System.debug('Before Trigger');
        
        if (Trigger.isInsert) {
            System.debug('Before insert ');
            if (Trigger.new[0].Rating == 'Hot') {
                Trigger.new[0].Type = 'Prospect';
            }  
        }
        if (Trigger.isUpdate) {
            
        }
        if (Trigger.isDelete) {
            
        }  
        
    }

    if (Trigger.isAfter) {
        System.debug('Before Trigger');

        if(Trigger.isInsert){
            System.debug('Before Trigger');

            AccountTriggerHandler.desUpdte(
                Trigger.new, Trigger.newMap, Trigger.old, Trigger.oldMap);
        }

        


        
        System.debug('After Trigger');
            if (Trigger.isInsert) {
                System.debug('Before insert ');
                if (Trigger.new[0].Rating == 'Hot') {
                    Trigger.new[0].Type = 'Prospect';
                }  
            }
            */
            /*
        System.debug('After Trigger');
            if (Trigger.isUpdate) {
                System.debug('Before insert ');
                if (Trigger.new[0].Rating == 'Hot') {
                    Trigger.new[0].Type = 'Prospect';
                }  
            }
            
    }*/


    


}