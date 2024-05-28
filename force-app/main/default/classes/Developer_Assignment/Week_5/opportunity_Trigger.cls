public with sharing class opportunity_Trigger {

    /*
        
        1
    *************************************
    public with sharing class OpportunityTriggerHandler {
        public static void createTask(List<Opportunity> newList, Map<Id, Opportunity> newMap, Map<Id, Opportunity> oldMap){
            List<Task> newTasksList = new List<Task>();
            for(Opportunity newOpp : newList){
                Opportunity oldOpp = oldMap.get(newOpp.Id);
                if(newOpp.StageName != oldOpp.StageName){
                    if(newOpp.StageName == 'Closed Won' && newOpp.Amount > 10000){
                        Task newTask = new Task();
                        newTask.WhatId = newOpp.Id;
                        newTask.OwnerId = newOpp.OwnerId;
                        newTask.Status = 'New';
                        newTask.Type = 'Call';
                        newTask.Subject = newOpp.Name + 'Opportunity Closed';
                        newTasksList.add(newTask);
                    }
                }
            }
            System.debug('newTasksList  '+newTasksList);
            if(!newTasksList.isEmpty()){
                Insert newTasksList;
            }
        }
        @Future
        public static void updateHighestAmountOppName(Set<Id> accountIdsSet){
            List<Account> accListWithOpps = new List<Account>();
            //Fetching accounts and their related opportunitites ordering them based on amount field value
            accListWithOpps = [Select Id, Target_Amount__c, Highest_Amount_Opportunity_Name__c, 
                                (Select Name, Amount from Opportunities where Amount != null Order by Amount Desc) 
                                from Account Where Id IN :accountIdsSet];
            for(Account acc : accListWithOpps){
                if(acc.Opportunities.size()>0){//Condition to avoid null-pointer exception
                    acc.Highest_Amount_Opportunity_Name__c = acc.Opportunities[0].Name;
                } else {
                    acc.Highest_Amount_Opportunity_Name__c = null;
                }            
            }
            Update accListWithOpps;
        }
        @Future
        public static void updateTargetAmountAchievedOppName(Set<Id> accountIdsSet){
            List<Account> accListWithOpps = new List<Account>();
            //Fetching accounts and their related opportunitites ordering them based on amount field value
            accListWithOpps = [Select Id, Target_Amount__c, Target_Amount_Achieved_Opportunity_Name__c, 
                            (Select Name, Amount from Opportunities Where StageName = 'Closed Won' And Amount != null Order by Amount Desc)
                            from Account Where Id IN :accountIdsSet];
            for(Account acc : accListWithOpps){
                System.debug('accListWithOpps   '+acc.Opportunities);
                if(acc.Opportunities.size()>0){//Condition to avoid null-pointer exception
                    if(acc.Opportunities[0].Amount >= acc.Target_Amount__c){
                        acc.Target_Amount_Achieved_Opportunity_Name__c = acc.Opportunities[0].Name;
                    } else {
                        acc.Target_Amount_Achieved_Opportunity_Name__c = null;
                    }
                }
            }
            Update accListWithOpps;
        }   
        @Future
        public static void updateTotalAmountGenerated(Set<Id> accountIdsSet){
            List<Account> accListWithOpps = new List<Account>();
            //Fetching accounts and their related opportunitites ordering them based on amount field value
            accListWithOpps = [Select Id, Target_Amount__c, Total_Amount_Generated__c, 
                            (Select Amount from Opportunities Where StageName = 'Closed Won and Amount != null')
                            from Account Where Id = :accountIdsSet];
            for(Account acc : accListWithOpps){
                Decimal totalAmount = 0;//PlaceHolder to store the total amount with each iteration
                for(Opportunity opp : acc.Opportunities){
                    totalAmount = totalAmount + opp.Amount;
                }
                acc.Total_Amount_Generated__c = totalAmount;
            }
            Update accListWithOpps;
        }
    }

    *************************************************

    
    trigger OpportunityTrigger on Opportunity (before Update, before Insert, after Update, after Insert, before Delete, after Delete, after Undelete) {
        Set<Id> accIdsSet = new Set<Id>();
        if(Trigger.isAfter){
            if(Trigger.isInsert){
                //Collect all AccountIds from the related opportunites for which Amount field is not null
                for(Opportunity opp : Trigger.New){
                    if(opp.Amount != null && opp.AccountId != null){
                        accIdsSet.add(opp.AccountId);
                    }
                }
            }
            else if(Trigger.isUpdate){
                for(Opportunity opp : Trigger.New){
                    //Collect all AccountIds from the related opportunites for which Amount field is not null
                    if(opp.Amount != Trigger.oldMap.get(Opp.Id).Amount ||
                    opp.AccountId != Trigger.oldMap.get(Opp.Id).AccountId ||
                    opp.StageName != Trigger.oldMap.get(Opp.Id).StageName){
                        accIdsSet.add(opp.AccountId);
                        accIdsSet.add(Trigger.oldMap.get(Opp.Id).AccountId);//Adding Old AccountId
                    }
                }
            }
            else if(Trigger.isUndelete){
                for(Opportunity opp : Trigger.new){ // newMap is only available in after trigger
                    //Collect all AccountIds from the related opportunites for which Amount field is not null
                    if(opp.Amount != null && opp.AccountId != null){
                        accIdsSet.add(opp.AccountId);
                    };
                }
            }
        }
        else if(Trigger.isBefore && Trigger.isDelete){
            for(Opportunity opp : Trigger.New){
                accIdsSet.add(opp.AccountId);
            }
        }

        if(!accIdsSet.isEmpty()){
            OpportunityTriggerHandler.updateHighestAmountOppName(accountIdsSet);
            OpportunityTriggerHandler.updateTargetAmountAchievedOppName(accountIdsSet);
            OpportunityTriggerHandler.updateTotalAmountGenerated(accountIdsSet);
        }
    }
    */
}