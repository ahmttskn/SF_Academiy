public with sharing class Opportunity_Trigger {
    public static void Opportunity_Trigger_Method() {

        /*
        trigger OpportunityTrigger on Opportunity (before update, after update) {
        if(trigger.isBefore){
            if(trigger.isUpdate){
                Map<Id, Opportunity> oppOldMap = trigger.oldMap;
                for(Opportunity oppNew : trigger.new){
                    //Id is same for Old & New 
                    Opportunity oppOld = oppOldMap.get(oppNew.id);
                    //1.1 Old and New Amount Values
                    system.debug('Old Amount : '+oppOld.Amount+' & New Amount : '+oppNew.Amount);
                    //1.2 Old and New Close Date Values
                    system.debug('Old Close Date : '+oppOld.CloseDate+' & New Close Date : '+oppNew.CloseDate);

                    //2. If stage name is updated - is the Old/New values are changes then it is updated
                    if(oppNew.StageName != oppOld.StageName){
                        //Print Opp Name and Description
                        system.debug('Print Opportunity Name : '+oppNew.Name);
                        system.debug('Print Opportunity Description : '+oppNew.Description);                    
                    }
                    //Part II - Create Validations
                    //Old Version - Closed Won  or Closed Lost : Don't allow to update
                    if(oppNew.StageName != oppOld.StageName){
                        if(oppOld.StageName == 'Closed Won'){
                            oppNew.addError('Stage cannot be changed from Closed/won!');
                        }
                        if(oppOld.StageName == 'Closed Lost'){
                            oppNew.addError('Stage cannot be changed from Closed/Lost');
                        }
                    }                   
                }
            }
        }

        if(trigger.isAfter){
            if(trigger.isUpdate){
                Map<Id, Opportunity> oppOldMap = trigger.oldMap;
                List<Task> taskList = new List<Task>();
                for(Opportunity oppNew : trigger.new){
                    Opportunity oppOld = oppOldMap.get(oppNew.id);
                    if((oppNew.StageName != oppOld.StageName) &&
                    (oppNew.StageName == 'Closed Won') && 
                    (oppNew.Amount > 10000)){
                        Task tsk = new Task();
                        tsk.Subject = 'Opportunity Closed';
                        tsk.WhatId = oppNew.id;
                        tsk.OwnerId = oppNew.OwnerId;
                        tsk.Status = 'New';
                        tsk.CallType = 'Call';
                        //insert tsk; - Don't do it inside the For Loop (Always Bulkify)
                        taskList.add(tsk);
                    }
                }
                if(!taskList.isEmpty()){
                    insert taskList;
                }
            }
        }
        
    }
    */
    }
}