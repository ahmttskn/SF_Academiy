global class QuickbooksConnector_RefreshAccessToken implements Database.Batchable<sObject>, Schedulable, Database.AllowsCallouts {


    global void execute(SchedulableContext sc) {


        QuickbooksConnector_RefreshAccessToken batchJob = new QuickbooksConnector_RefreshAccessToken();
        Database.executeBatch(batchJob, 1); // İkinci parametre, aynı anda çalışacak işlem sayısını belirtir (isteğe bağlı)

        // System.schedule('Scheduled Job 1', '0 0 * * * ?', new ScheduledClass());
        // System.schedule('Scheduled Job 2', '0 15 * * * ?', new ScheduledClass());
        // System.schedule('Scheduled Job 3', '0 30 * * * ?', new ScheduledClass());
        // System.schedule('Scheduled Job 4', '0 45 * * * ?', new ScheduledClass())
        // String cronExp = '0 0 * * * ?'; // Her saat bir çalışacak cron ifadesi
        // System.schedule('QuickbooksConnector', cronExp, new QuickbooksConnector_RefreshAccessToken());

    }

    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id FROM QuickBookIntuit__c'; // QuickBookIntuit__c nesnemi seç
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<QuickBookIntuit__c> scope) {
        
        QuickbooksConnector QBConnect = new QuickbooksConnector();
        QBConnect.doRefreshAccessToken(); // Her QuickBookIntuit__c kaydı için doRefreshAccessToken metodunu çağır
        
    }

    global void finish(Database.BatchableContext BC) {
        // Batch işlemi tamamlandığında yapılacak işlemler (opsiyonel)
        Contact cnt = new Contact();
        cnt.LastName ='QuickbooksConnector';

        insert cnt;
    }

    // // Access Token yenileme metodunu buraya ekleyin
    // global void doRefreshAccessToken(QuickBookIntuit__c qb) {
    //     // Access Token yenileme işlemlerini burada gerçekleştirin
    // }
}
    