public with sharing class Account_Trigger {
    public static void Account_Trigger_Method() {
        /*
        trigger AccountTrigger on Account (before update, after update) {

            if(trigger.isBefore){
                if(trigger.isUpdate){
                    Map<Id, Account> accOldMap = trigger.oldMap;
                    for(Account accNew : trigger.new){
                        Account accOld = accOldMap.get(accNew.id);
                        if(accNew.AnnualRevenue != accOld.AnnualRevenue){
                            //Difference between old and new value
                            Decimal diffAnnualRevenue = accNew.AnnualRevenue - accOld.AnnualRevenue;
                            system.debug('Difference of Annual Revenue Old and New : '+diffAnnualRevenue); 
                            //Show error on the condition
                            //10000 < 12000
                            if(accNew.AnnualRevenue < accOld.AnnualRevenue){                        
                                accNew.AnnualRevenue.addError('Annual revenue cannot be reduced');
                            }
                        }
                    }
                }
            }
        
            if(trigger.isAfter){
                if(trigger.isUpdate){
                    //Approach 1 - Retrieve in the Inner Query in the Account
                    //Approach 2 - Retrieve the related record directly giving condition of the respective Account            
                    List<Opportunity> oppList = [Select StageName from Opportunity where AccountId IN : trigger.new AND
                                                CreatedDate < LAST_N_DAYS:30 AND StageName != 'Closed Won'];
                    if(!oppList.isEmpty()){
                        for(Opportunity opp : oppList){
                            opp.StageName = 'Closed Lost';
                        }
                        update oppList;
                    }                       
                }
            }
        }
        */
    }
}