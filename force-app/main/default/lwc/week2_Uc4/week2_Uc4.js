import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNT_FIELD from '@salesforce/schema/Case.Account.Name';
import CASENUMBER_FIELD from '@salesforce/schema/Case.CaseNumber';
import CONTACTID_FIELD from '@salesforce/schema/Case.ContactId';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import REASON_FIELD from '@salesforce/schema/Case.Reason';
import TYPE_FIELD from '@salesforce/schema/Case.Type';
import STATUS_FIELD from '@salesforce/schema/Case.Status';

const FIELDS = [ACCOUNT_FIELD,CASENUMBER_FIELD,CONTACTID_FIELD, SUBJECT_FIELD, PRIORITY_FIELD, REASON_FIELD, TYPE_FIELD, STATUS_FIELD];

export default class Week2_Uc4 extends LightningElement {

    recordId = '500Do000001f43lIAA';    // Case Id
    account;
    caseNumber;
    contactName;
    subject;
    reason;
    priority;
    type;
    status;

    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    recordHandler({data, error}) {
        if(data) {
            console.log(data);
            this.account = data.fields.Account.displayValue;
            this.caseNumber = data.fields.CaseNumber.value;
            this.contactName = data.fields.ContactId.value;
            this.subject = data.fields.Subject.value;
            this.priority = data.fields.Priority.value;
            this.reason = data.fields.Reason.value;
            this.type = data.fields.Type.value;
            this.status = data.fields.Status.value;
        }
        if(error) {
            console.error(error);
        }
    }
}