@RestResource(urlMapping = '/fetchAccountsAndChilds/*')
global with sharing class AccountsAndChildData {

    //    /services/apexrest/fetchAccountsAndChilds/  
    //    /services/apexrest/Account/?Type=Customer%20-%20Direct
    //    /services/apexrest/fetchAccountsAndChilds/?Type=Customer%20-%20Channel&Industry=Biotechnology

    // USE CASE 1A ***************************************************************
    @HTTPGet    
    global static List<Account> getAccounts() {
        RestRequest req = RestContext.request;
        Map<String, String> paramMap = req.params;

        String accountType = paramMap.get('Type');
        String accountIndustry = paramMap.get('Industry');
        
        //Single Query
        String accountQuery = 'SELECT Id, Name, Phone, Type, Industry,'
        + '(SELECT Id, Status, Origin FROM Cases), '
        + '(SELECT Id, Name, CloseDate FROM Opportunities) FROM Account' ;

        //Dynamic Query
        if(String.isNotBlank(accountType) && String.isNotBlank(accountIndustry)) {
            accountQuery += ' WHERE Type = :accountType AND Industry = : accountIndustry';
        }else if (!String.isNotBlank(accountType) && String.isNotBlank(accountIndustry)){
            accountQuery += ' WHERE Industry = : accountIndustry';
        }else if (String.isNotBlank(accountType) && !String.isNotBlank(accountIndustry)){
            accountQuery += ' WHERE Type = :accountType';
        }

        return Database.query(accountQuery);
    }

    // USE CASE 1B ***************************************************************
    
    @HTTPPost
    global static Map<String, String> createAccountAndChilds() {

        Map<String, String> accountAndChildIdMap = new Map<String, String>();
        RestRequest req = RestContext.request;
        String jsonInput = req.requestBody.toString();
        AccountAndChildWrapper wrapperInstance =
        (AccountAndChildWrapper)JSON.deserialize(jsonInput, AccountAndChildWrapper.class);
        if(wrapperInstance != null) {
            if(wrapperInstance.account != null) {
                Account accountInstance = new Account(
                                            Name = wrapperInstance.account.name,
                                            Type = wrapperInstance.account.type,
                                            Phone = wrapperInstance.account.phone
                                            );
                insert accountInstance;               
                //Just for return purpose - accountId => xxxxxxxxxx
                accountAndChildIdMap.put('accountId', accountInstance.Id);

                //Insert case records
                if(wrapperInstance.cases != null) {
                    List<Case> caseList = new List<Case>();
                    for(CaseWrapper caseWrp : wrapperInstance.cases){
                        Case caseInstance = new Case(
                                                Status = caseWrp.status,
                                                Origin = caseWrp.origin,
                                                AccountId = accountInstance.Id
                                                );

                        caseList.add(caseInstance);
                    }
                    insert caseList;
                }

                //Insert Opportunity records
                if(wrapperInstance.opportunities != null) {
                    List<Opportunity> oppList = new List<Opportunity>();
                    for(OpportunityWrapper oppWrp : wrapperInstance.opportunities){
                        Opportunity oppInstance = new Opportunity(
                                                Name = oppWrp.name,
                                                Amount = oppWrp.amount,
                                                StageName = oppWrp.stageName,
                                                CloseDate = oppWrp.closeDate,
                                                AccountId = accountInstance.Id
                                            );
                        oppList.add(oppInstance);
                    }
                    insert oppList;
                }
            }
            
        }
        
        return accountAndChildIdMap;
    }
    


//---------Wrapper Classes---------

    public class AccountAndChildWrapper {
        public AccountWrapper account;
        public List<CaseWrapper> cases;
        public list<OpportunityWrapper> opportunities;
    }

    public class AccountWrapper {
        public String name;
        public String type;
        public String phone;
    }

    public class CaseWrapper {
        //public String id;
        public String status;
        public String origin;
    }

    public class OpportunityWrapper {
        public String name;
        public Decimal amount;
        public String stageName;
        public Date closeDate;
    }





    /*

    {
        "account" : {
               "name" : "Test From Post Man-1",
               "type" : "Prospecting",
               "phone" : "(767) 546-5768"
           },
           "cases" :[
               {
                   "status" : "New",
                   "origin" : "Web"
               },
               {
                   "status" : "New",
                   "origin" : "Web"
               }
           ],
           
           "opportunities" :[
               {
                   "name" : "Test Opp From Workbench-opp1",
                   "amount" : 123.45,
                   "stageName" : "Prospecting",
                   "closeDate" : "2022-05-29"
               },
               {
                   "name" : "Test Opp From Workbench-opp1",
                   "amount" : 123.45,
                   "stageName" : "Prospecting",
                   "closeDate" : "2022-05-29"
               }
           ]
       }

       */
           

}