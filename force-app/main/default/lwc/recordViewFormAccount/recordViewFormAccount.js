/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-05-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import ACCNUM_FIELD from '@salesforce/schema/Account.AccountNumber'; 
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

export default class RecordViewFormAccount extends LightningElement {
    recordId="0018c00002SI2MUAA1";
    objectName=ACCOUNT_OBJECT;
    fields={
        name:NAME_FIELD,
        accountNumber:ACCNUM_FIELD,
        type:TYPE_FIELD,
        industry:INDUSTRY_FIELD,
        revenue:REVENUE_FIELD,
        phone:PHONE_FIELD
    };
    
}