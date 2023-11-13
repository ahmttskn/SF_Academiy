public with sharing class SOQL_DML_practice {

    //select id, username from user where id in (select userId from userLogin where isPasswordLocked=true)

/*
    List<Opportunity> oppList = [SELECT Name, Amount, StageName
                                 FROM Opportunity
                                 WHERE StageName NOT IN ('Closed Won' , 'Closed Lost')
                                 ORDER BY Amount ASC LIMIT 20];
    System.debug(oppList);

    SELECT ID, name FROM Opportunity WHERE stagename LIKE '%Won%' OR (NOT stagename LIKE '%Closed%')
*/

/*
    PART I – SOQL – Basic Select Queries 
***************************
//Write the SOQL query for the following requirements:
//1. Fetch AccountName, Account Number and Record Id for all the accounts present in your org.
Select Id, Name, AccountNumber from Account

//2. Fetch Account Id, Contact First Name, Contact Last Name 
//and Email Address for all the contacts present in your org.
Select AccountId, lastName, FirstName, Email from contact

//3. Fetch all the account records (include any number of fields)
// and order them based on the Account Name in the ascending order.
Select Id, Name from Account Order by Name ASC

//4. Fetch all the accounts which have no Phone number populated.
Select Id, Name, Phone from Account Where Phone = null

//5. Find all contacts which have no account attached to them.
Select Id, Name from Contact Where AccountId = null

//6. Find out the count of all opportunities present in the Org.
Select Count() from Opportunity
******************************************

    PART II → SOQL – Medium  

*********************************************
//Write the SOQL query for the following requirements:
//1. Fetch all the opportunities 
//which have stage as Closed Won and Amount more than or equal to 35000.
Select Id, Name, Amount from Opportunity Where StageName = 'Closed Won' and Amount >= 35000 

//2. Fetch all the contacts and order them by their last name in descending order.
Select Id, Name from Contact Order by LastName desc

//3. Find the count of opportunities which have Amount less than 5000.
Select Count() from Opportunity Where Amount < 5000

//4. Find the Top 10 opportunities based on Amount value.
Select Id, Name, Amount from Opportunity Where Amount != null Order by Amount desc Limit 10

//5. Find lower 20 opportunities based on
// Amount value which are not set to Closed won and Closed Lost.
Select Id, Name, Amount from Opportunity Where StageName!= 'Closed Won' AND StageName!= 'Closed Lost' Order by Amount Limit 20
******************************************

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
     

    public static void name() {
        
    }
 }