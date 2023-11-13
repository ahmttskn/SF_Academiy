import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CASE_OBJECT from '@salesforce/schema/Case';
import ACCOUNT_FIELD from '@salesforce/schema/Case.AccountId';
import CONTACT_FIELD from '@salesforce/schema/Case.ContactId';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import DESC_FIELD from '@salesforce/schema/Case.Description';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';

export default class Week2_Uc2 extends LightningElement {

    // account  Id    001Do000003N3kDIAS
    // case   Id   500Do000001f43lIAA
    recordId = '500Do000001f43lIAA';
    objectName = CASE_OBJECT;
    fields = {
        account : ACCOUNT_FIELD,
        contact : CONTACT_FIELD,
        subject : SUBJECT_FIELD,
        priority : PRIORITY_FIELD,
        status : STATUS_FIELD,
        description : DESC_FIELD,
        origin : ORIGIN_FIELD
    };
    successHandler() {
        const successMsg = new ShowToastEvent({
            title : "Success",
            message : "Case record has been saved successfully!",
            variant : "success"
        });
        this.dispatchEvent(successMsg);
    }
}