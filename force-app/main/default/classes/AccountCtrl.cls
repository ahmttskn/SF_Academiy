public with sharing class AccountCtrl {


    @AuraEnabled(cacheable=true)
    public static Lİst<Account> getRelatedAccounts(){
        // nameParam = '%' + nameParam + '%';
        try {
            return [SELECT Id, Name, Type, Industry 
                    FROM Account 
                    // WHERE Name LIKE :nameParam
                    ORDER BY CreatedDate DESC LIMIT 5 ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsType(string type){
        return [SELECT Id, Name, Type, Industry, AnnualRevenue, Phone
                FROM Account
                WHERE Type = :type ];
    }

    @AuraEnabled
    public static decimal calculateOppAmount(string accId) {
        Decimal resultOpp = 0;
        List<Opportunity> oppList = [SELECT Id, Amount
                                FROM Opportunity
                                WHERE AccountId = :accId /*AND Amount != null*/
                                WITH SECURITY_ENFORCED];
        if (oppList.size()>0) {
            for (Opportunity Opp : oppList) {
                if (opp.Amount != null) {
                    resultOpp += opp.Amount;
                }
            }
        }
        else if (oppList.size()==0) {
            resultOpp = -1;
        }
        return resultOpp;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getTopAccounts(string accId) {
        return [SELECT Name, Type, Industry, AnnualRevenue
                FROM Account
                WHERE AnnualRevenue != null
                WITH SECURITY_ENFORCED
                ORDER BY AnnualRevenue DESC
                LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByIndustry(String industry) {
        return [SELECT Name, Type, Industry, AnnualRevenue
                FROM Account
                WHERE Industry = :industry
                WITH SECURITY_ENFORCED
                LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getCountContacts(String searchKey) {
        return [SELECT Name, Title, Email, Phone
                FROM Contact
                WHERE FirstName LIKE :searchKey
                OR LastName LIKE :searchKey
                WITH SECURITY_ENFORCED
                LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAllAccounts() {
        return [SELECT Id, Name, Type, Industry, AnnualRevenue
                FROM Account
                //WHERE Industry = :industry
                WITH SECURITY_ENFORCED
                ];
    }
    

    @AuraEnabled(cacheable=true)
    public static List<Account> searchAccounts() {
        return [SELECT Name, Type, Industry, AnnualRevenue
                FROM Account
                //WHERE Industry = :industry
                WITH SECURITY_ENFORCED
                LIMIT 10];
    }

}