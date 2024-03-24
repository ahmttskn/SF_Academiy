import { LightningElement, api } from 'lwc';
import ACCOUNT_OBJ from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import AnnualRevenue_FIELD from '@salesforce/schema/Account.AnnualRevenue';

export default class Bilge_RecordForm extends LightningElement {

    fields = [NAME_FIELD, AnnualRevenue_FIELD ];

    // Flexipage provides recordId and objectApiName
    @api recordId;
    @api objectApiName = ACCOUNT_OBJ;
}