public with sharing class SOQLPractice {

    // PART III – SOQL In Apex
    
    //1. Write a method to fetch and return all the accounts.
    //Include account name, annual revenue, type, and source of account.
    public static List<Account> practiceUC1(){
         List<Account> accList = [Select Id, Name, Annualrevenue, Type, AccountSource from Account];
         return accList;
    }
    //2. Prepare a method which will return the List of Accounts (fetch any 3 fields)
    //for a particular Type. Type should be sent as a parameter in the method.
    public static List<Account> practiceUC2(String accType){
         List<Account> accList = [Select Id, Name, Annualrevenue, AccountSource from Account where Type =: accType];
         return accList;
    }
    //3. Print all the opportunities (fetch Amount, Name and Account Name fields) with Stage as 'Closed Won' and make it dynamic so that it should work for other stages as well.
    public static List<Opportunity> practiceUC3(String oppStage){
         List<Opportunity> oppList = [Select Id, Amount, Name, Account.Name from Opportunity where StageName =: oppStage];
         return oppList;
    }
    //4. Find all the opportunities which has Lead Source as 'Web' and Stage as 'Closed Lost'. Make it dynamic so that it works for other stages and Lead sources as well.
    public static List<Opportunity> practiceUC4(String leadSource, String stageName){
         List<Opportunity> oppList = [Select Id, Name from Opportunity where LeadSource =: leadSource AND StageName =: stageName];
         return oppList;
    }
    //5. Prepare a method which returns the sum of all the opportunities Amount present in the org.
    public static Decimal practiceUC5(){
         List<Opportunity> oppList = [Select Id, Amount from Opportunity where Amount != NULL];
         Decimal sum=0;
         for(Opportunity opp: oppList){
             // sum = sum + opp.Amount
             sum += opp.Amount;
         }       
         return sum;
    }
    //6. Prepare a method which will return all the Accounts for which at least a closed Won Opportunity is present. Make it dynamic if we want to bring account for other opportunity stageNames.
    public static List<Account> practiceUC6(String oppStageName){
         //Approach 1
         List<Account> accList1 = [Select Id,Name,
                (Select Id,Name from Opportunities where StageName =:oppStageName) from Account];
         List<Account> accWithOppsList = new List<Account>();
         for(Account acc : accList1){
             if(acc.Opportunities.size() > 0)
             accWithOppsList.add(acc);
         }
         //Approach 2
         List<Account> accList2 = [Select Id, Name from Account where Id IN
                          (Select AccountId from Opportunity where StageName =:oppStageName)];
         if(!accList2.isEmpty())
         accWithOppsList.addAll(accList2);
         return accWithOppsList;
    }  
    //7. Prepare a method which will return all the Accounts for which at least a contact is present
    public static List<Account> practiceUC7(){
         //Approach 1 - Get all AccountIds from all Contacts in Org and compare Ids present in Account object
         List<Contact> conList = [Select AccountId from Contact where AccountId !=null];
         Set<Id> accIdsSet = new Set<Id>();
         for(Contact con : conList){
             accIdsSet.add(con.AccountId);
         }
         List<Account> accList1 = [Select Id,Name from Account where Id IN: accIdsSet];
         List<Account> returnAccList = new List<Account>();
         returnAccList.addAll(accList1);
         //Approach 2
         List<Account> accList2 = [Select Id,Name from Account where Id IN (Select Accountid from Contact)];
         if(!accList2.isEmpty())
         returnAccList.addAll(accList2);
         return returnAccList;
    }
     //8. Print the Annual revenue and name of all the accounts of type 'Customer - Direct' and print the Opportunity Name and Amount for the respective 'Closed Won' opportunities. Printing should be done one by one in different lines.
    public static void practiceUC8(){
         List<Account> accOppsList =[Select Name, AnnualRevenue,
                (Select Name, Amount from Opportunities where StageName = 'Closed Won')
                from Account where type = 'Customer - Direct'];
         for(Account acc : accOppsList){
             System.debug('Account Name : '+acc.Name+' & Annual Revenue : '+acc.AnnualRevenue);
             for(Opportunity opp : acc.Opportunities){
                 System.debug('Opportuntiy Name : '+opp.Name+' & Amount : '+opp.Amount);
             }
         }
    }
  

  /*
  //APEX:
  //Debug of all the SOQL Practice
  //UC1
  List<Account> accListUC1 = SOQLPractice.practiceUC1();
  System.debug('practiceUC1 => '+accListUC1);
  //UC2
  List<Account> accListUC2 = SOQLPractice.practiceUC2('Prospect');
  System.debug('practiceUC2 => '+accListUC2);
  //UC3
  List<Opportunity> oppListUC3 = SOQLPractice.practiceUC3('Closed Won');
  System.debug('practiceUC3 => '+oppListUC3);
  //UC4
  List<Opportunity> oppListUC4 = SOQLPractice.practiceUC4('Web','Closed Lost');
  System.debug('practiceUC4 => '+oppListUC4);
  //UC5
  Decimal oppsSum = SOQLPractice.practiceUC5();
  System.debug('practiceUC5 => '+oppsSum);
  //UC6
  List<Account> accListUC6 = SOQLPractice.practiceUC6('Closed Won');
  System.debug('practiceUC6 => '+accListUC6);
  //UC7
  List<Account> accListUC7 = SOQLPractice.practiceUC7();
  System.debug('practiceUC7 => '+accListUC7);
  //UC8 - Debug present in the method
  SOQLPractice.practiceUC8();
  ******************************************
  4
  *******************************************

  */



          // PART IV – SOQL In Apex and DML
          //******************************************

          //1. Write a method which should return the account instance after adding a new Account in salesforce org.
          //Take Name, Annual Revenue, Type as input parameters and populate the values in account record.
          //If Name is not provided, then do not create the account and show a message like ‘Account without name cannot be created’.
          public static Account practiceSOQL_DML_UC1(String accName, Decimal annualRevenue, String accType){
               //&& - AND
               //|| - OR
               if(accName == null || accName == ''){
               system.debug('Account without name cannot be created');
               return null;
               }else{
               Account acc = new Account();
               acc.Name = accName;
               acc.AnnualRevenue = annualRevenue;
               acc.Type = accType;
               insert acc;
               return acc;
               
               }
          }

          //2. Take account Id as input parameter and create a new contact for the provided account’s Id.
          //   Populate Contact last name as same as Account’s Name.
          public static void practiceSOQL_DML_UC2(Id accId){
               Account acc = [Select Id, Name from Account where Id =: accId];
               Contact con = new Contact(LastName = acc.Name, AccountId = acc.id);
               insert con;
          }

          //3. Update the description field of top 10 opportunities as "This is one of the top 10 opportunity. Please work on this properly “.
          public static void practiceSOQL_DML_UC3(){
               List<Opportunity> oppList = [Select Id, Name, Amount, Description from Opportunity Order by Amount desc Limit 10];
               for(Opportunity opp : oppList){
               opp.Description = 'This is one of the top 10 opportunity. Please work on this properly ';
               }
               update oppList;
          }
          
          //4. Delete all the opportunities which have amount less than 20000 and status as closed lost
          public static void practiceSOQL_DML_UC4(){
               List<Opportunity> oppList = [Select Id from Opportunity where Amount < 20000 AND StageName = 'Closed Lost'];
               Delete oppList;
          }
          //5. Delete all the contacts which have no accounts attached to them
          public static void practiceSOQL_DML_UC5(){
               List<Contact> conList = [Select Id from Contact where AccountId = NULL];
               Delete conList;
          }
          //6. Find out all the Account which have no contacts attached to them. Add a contact for each one of them and update the last Name of contact with the Name field of account.
          public static void practiceSOQL_DML_UC6(){
               List<Account> accList = [Select ID, Name, (Select Id from Contacts) from Account];
               List<Contact> conList = new List<Contact>();
               for(Account acc : accList){           
               if(acc.Contacts.size() == 0){               
                    Contact con = new Contact();
                    con.LastName = acc.Name;
                    con.AccountId = acc.id;
                    conList.add(con);
               }
               }
               if(!conList.isEmpty()){           
               insert conList;
               }
          }
          //7.Write a logic to create and return n number of opportunities for a particular AccountId.
          //AccountId and n will be passed as parameters in the method. Populate opportunity fields as follows: Close date as 3 years from today Stage name as Prospecting Opportunity amount as Account’s annual revenue divided by n and Opportunity name same as Account name
          //For Ex: if n=2, Then two new opportunities If n=0, Print the message as “Please tell us how many opportunities needs to be created
          public static List<Opportunity> practiceSOQL_DML_UC7(Id accId, Integer N){
               Account acc = [Select Id, Name, AnnualRevenue from Account where Id =: accId];
               List<Opportunity> oppList = new List<Opportunity>();
               if(N == 0){
               system.debug('Please tell us how many opportunities needs to be created');
               }else{       
               for(Integer i=1;i<=N;i++){
                    Opportunity opp = new Opportunity();
                    opp.Name = acc.Name;
                    opp.AccountId = acc.id;
                    opp.StageName = 'Prospecting';
                    if(acc.AnnualRevenue != 0){
                         opp.Amount = acc.AnnualRevenue / N;
                    }
                    opp.CloseDate =  Date.Today().addYears(3);
                    oppList.add(opp);
               }
               }
               insert oppList;
               return oppList;
          }
          /******************************
           * 
          APEX:
          //Debug of all UseCases
          //UC1
          Account acc = SOQL_DML_practice.practiceSOQL_DML_UC1('Batch10', 25000, 'Customer - Direct');
          system.debug('practiceSOQL_DML_UC1 => '+acc);
          //UC2
          SOQL_DML_practice.practiceSOQL_DML_UC2('0015i00000OyBvVAAV');
          //UC3
          SOQL_DML_practice.practiceSOQL_DML_UC3();
          //UC4
          SOQL_DML_practice.practiceSOQL_DML_UC4();
          //UC5
          SOQL_DML_practice.practiceSOQL_DML_UC5();
          //UC6
          SOQL_DML_practice.practiceSOQL_DML_UC6();
          //UC7
          List<Opportunity> oppList = SOQL_DML_practice.practiceSOQL_DML_UC7('0015i00000OyBjjAAF', 3);
          system.debug('practiceSOQL_DML_UC7 => '+oppList);

          ********************************* */

 

 }