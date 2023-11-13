/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-12-2022
 * @last modified by  : Huseyin
**/
import { LightningElement, wire } from 'lwc';

import ACCOUNT_NAME_FIELD from '@salesforce/schema/Case.Account.Name';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import REASON_FIELD from '@salesforce/schema/Case.Reason';
import TYPE_FIELD from '@salesforce/schema/Case.Type';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import { getFieldValue, getRecord } from 'lightning/uiRecordApi';

const FIELDS = [
    ACCOUNT_NAME_FIELD,
    SUBJECT_FIELD,
    PRIORITY_FIELD,
    REASON_FIELD,
    TYPE_FIELD, 
    STATUS_FIELD
];

export default class GetCaseRecord extends LightningElement {
    recordId = "5008c00001KLdNaAAL";

    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    caseRecord;

    get accountName() {
        return getFieldValue(this.caseRecord.data, ACCOUNT_NAME_FIELD);
    }

    get subject() {
        return getFieldValue(this.caseRecord.data, SUBJECT_FIELD);
    }

    get priority() {
        return getFieldValue(this.caseRecord.data, PRIORITY_FIELD);
    }

    get reason() {
        return getFieldValue(this.caseRecord.data, REASON_FIELD);
    }

    get type() {
        return getFieldValue(this.caseRecord.data, TYPE_FIELD);
    }

    get status() {
        return getFieldValue(this.caseRecord.data, STATUS_FIELD);
    }
}