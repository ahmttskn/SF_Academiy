public with sharing class AccountQueableHandler implements Queueable{
    private List<Account> customObjectName;
    
    public AccountQueableHandler(List<Account> triggerNew){
       this.customObjectName = triggerNew;
        System.debug('triggerNew' + triggerNew);
        System.enqueueJob(new AccountQueableHandler(Trigger.new));
    }

   public void execute(QueueableContext context) {
        System.debug('context' + context);
        //List<Account> accList = (List<Account>) context;
        //System.debug('accList' + accList);
        List<Contact> conList = new List<Contact>();
        for (Account acc : this.customObjectName) {
            if (acc.Industry == 'Telecommunications') {
                Contact con = new Contact();
                con.LastName = acc.Name;
                con.AccountId = acc.Id;
                conList.add(con);
            }
        }
        insert conList;
    }
}