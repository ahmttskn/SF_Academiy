public with sharing class JSON {
    
    
    // /*1) JSON Format of sObjects*/
    // /*Account - Name, Type, Rating, AnnualRevenue*/
    // {
    //     "Name" : "Edge Communications",
    //     "Type" : "Prospect",
    //     "Rating" : "Hot",
    //     "AnnualRevenue" : 139000000
    // }

    // /*Contact - FirstName, LastName, Email*/
    // {
    //     "FirstName" :  "Andy",
    //     "LastName" : "Young",
    //     "Email" : "a_young@dickenson.com"
    // }

    // /*Opportunity - Name, StageName, Amount, CloseDate -7/24/2022*/
    // {
    //     "Name" : "Edge Emergency Generator",
    //     "StageName" : "Closed Won",
    //     "Amount" : 45000000
    //     "CloseDate" : "8/2/2022"
    // }

    // /*2) SOQL and convert sObject records to JSON format*/
    // //JSON.serialize(object)

    // //Single Record - Account
    // Account acc = [Select Id,Name, Type,Rating,AnnualRevenue from Account Limit 1];
    // String jsonStringAccount = JSON.serialize(acc);
    // system.debug('JSON Account : '+jsonStringAccount);

    // //Single Record - Contact
    // Contact con = [Select FirstName,LastName,Email from Contact Limit 1];
    // String jsonStringContact = JSON.serialize(con);
    // system.debug('JSON Contact : '+jsonStringContact);

    // //Single Record - Opportunity
    // Opportunity opp = [Select Name,StageName,Amount,CloseDate from Opportunity Limit 1];
    // String jsonStringOpp = JSON.serialize(opp);
    // system.debug('JSON Opportunity : '+jsonStringOpp);

    // //Multiple Records
    // List<Account> acc = [Select Id,Name, Type,Rating,AnnualRevenue from Account Limit 10];
    // String jsonStringAccount = JSON.serialize(acc);
    // system.debug('JSON Account Multiple : '+jsonStringAccount);



    // /*3) JSON to sObject Records*/
    // //JSON.deserialize(jsonString, apexType)/production-standard-emoji-assets/14.0/apple-medium/1f91e@2x.png

    // //One Record - Deserialize
    // Account acc = [Select Id,Name, Type,Rating,AnnualRevenue from Account Limit 1];
    // String jsonStringAccount = JSON.serialize(acc);
    // Account accRecord = (Account)JSON.deserialize(jsonStringAccount, Account.class);
    // system.debug('Account Single Record : '+accRecord);

    // //Multiple Records - Deserialize
    // List<Account> acc = [Select Id,Name, Type,Rating,AnnualRevenue from Account Limit 10];
    // String jsonStringAccount = JSON.serialize(acc);
    // List<Account> accList = (List<Account>)JSON.deserialize(jsonStringAccount, List<Account>.class);
    // system.debug('Account Multiple Records : '+accList);

    // /*4)XML sObject Records*/

    // <Account>
    //     <Name>Edge Communications</Name>
    //     <Type>Prospect</Type>
    //     <Rating>Hot</Rating>
    //     <AnnualRevenue>139000000</AnnualRevenue>
    // </Account>

    // {"attributes":{"type":"Account","url":"/services/data/v55.0/sobjects/Account/0015i000006P0QTAA0"},"Id":"0015i000006P0QTAA0","Name":"TestGeo","Type":"Channel Partner / Reseller","Rating":"Hot","AnnualRevenue":1234560000}

	public static void deserialize(String jsonString, System.Type t){
	} 
}