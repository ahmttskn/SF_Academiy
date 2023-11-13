public with sharing class AccountTriggerHandler {

    public static void accRating(List<Account> triggerNew) {

        for (account acc : triggerNew) {
            if (acc.Industry == 'Banking' || acc.Industry ==  'Healthcare') {
                acc.Rating = 'Hot';
            }
        }
    }


    public static void desUpdte(
        List<Account> triggerNew, Map<Id,Account> triggerNewMap,
        List<Account> triggerOld, Map<Id,Account> triggerOldMap
    ) {
        
        //String Id = triggerNew[0].Id;

        List<Id> Ids = new List<Id>();
        for (account  acc  : triggerNew) {
            Ids.add(acc.Id);
        }

        List<Account> accList = [select Description from account Where Id IN :Ids];
        for (account acc : accList) {
            acc.Description = 'bu bir hsndler denemedir';
        }

        update accList;
            
    }

}