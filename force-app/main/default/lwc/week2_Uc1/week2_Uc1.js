import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import ACCNUMBER_FIELD from '@salesforce/schema/Account.AccountNumber';
import RATING_FIELD from '@salesforce/schema/Account.Rating';

export default class Week2_Uc1 extends LightningElement {

    recordId = '001Do000003N3kDIAS';
    objectName = ACCOUNT_OBJECT;
    fields = [NAME_FIELD, TYPE_FIELD, INDUSTRY_FIELD, REVENUE_FIELD, ACCNUMBER_FIELD, RATING_FIELD];
    
    successHandler() {
        const successMsg = new ShowToastEvent({
            title : "Success",
            message : "Account record has been saved successfully!",
            variant : "success"
        });
        this.dispatchEvent(successMsg);
    }

}