public class CreateTasksForOppsBatch implements Database.Batchable<sObject>, Schedulable, Database.Stateful {
    
    // https://help.salesforce.com/s/articleView?id=sf.reports_subscription_reporting_cron.htm&type=5

    // https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_scheduler.htm 

    

    public void execute(SchedulableContext sc){
        Database.executeBatch(new CreateTasksForOppsBatch(), 2);
    }
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        String queryString = '';
        if(Test.isRunningTest()){
            queryString = 'Select ID,OwnerId,CloseDate from Opportunity where (stagename != \'Closed Won\' OR stagename != \'Closed Lost\')';
        }else{
            queryString = 'Select ID,OwnerId,CloseDate from Opportunity where (stagename != \'Closed Won\' OR stagename != \'Closed Lost\') AND LastModifiedDate < LAST_N_DAYS:7';
        }		
        return Database.getQueryLocator(queryString);
    }
    
    public void execute(Database.BatchableContext bc, List<sObject> records){
        List<Opportunity> oppList =  (List<Opportunity>) records;
        List<Task> taskList = new List<Task>();
        for(Opportunity opp : OppList){
            Task tsk = new Task();
            tsk.Subject = 'Other';
            tsk.ActivityDate = opp.CloseDate - 2;
            tsk.WhatId = opp.id;
            tsk.OwnerId = opp.OwnerId;
            tsk.Status = 'In Progress';
            taskList.add(tsk);
        }
        system.debug('taskList'+taskList);
        if(!taskList.isEmpty()){
            insert taskList;
        }
    }
    
    public void finish(Database.BatchableContext bc){
       system.debug('Finished!'); 
    }

}