@isTest
public class CreateTasksForOppsBatchTest {

    @isTest
    public static void testMethod1(){
        List<Opportunity> oppsList = new List<Opportunity>();
        for(Integer i=1;i<=100;i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'Batch'+i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = Date.today() + 5;
            opp.OwnerId = Userinfo.getUserId();            
            oppsList.add(opp);
        }
       
        insert oppsList;
        
        Test.startTest();
        //Batch test
        Database.executeBatch(new CreateTasksForOppsBatch(),100);
        //Scehdule it
        string cronExp = '0 0 1 ? * MON *';
        system.schedule('CreateTasksBatch', cronExp, new CreateTasksForOppsBatchScheduler());
        Test.stopTest();
        
        //Validation
        List<Task> taskList = [Select id,WhatId from Task where WhatId IN :oppsList];
        system.debug('taskList.size()'+taskList.size());
        system.assert(taskList.size() == 100);
        List<AsyncApexJob> jobsScheduled = [select Id, ApexClass.Name, Status, JobType from AsyncApexJob where JobType = 'ScheduledApex'];
        System.assertEquals(1, jobsScheduled.size());
        System.assertEquals('CreateTasksForOppsBatchScheduler', jobsScheduled.get(0).ApexClass.Name);
    
    }
}