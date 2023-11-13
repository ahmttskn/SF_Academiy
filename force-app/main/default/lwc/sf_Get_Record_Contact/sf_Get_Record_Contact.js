import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

import Salutation_FIELD from '@salesforce/schema/Contact.Salutation';
import FirstName_FIELD from '@salesforce/schema/Contact.FirstName';
import LastName_FIELD from '@salesforce/schema/Contact.LastName';
import Phone_FIELD from '@salesforce/schema/Contact.Phone';
import Email_FIELD from '@salesforce/schema/Contact.Email';
import LeadSource_FIELD from '@salesforce/schema/Contact.LeadSource';
//import CreatedBy_FIELD from '@salesforce/schema/Contact.CreatedBy';

const FIELDS = [Salutation_FIELD,FirstName_FIELD, LastName_FIELD, Phone_FIELD, Email_FIELD, LeadSource_FIELD];

export default class Sf_Get_Record_Contact extends LightningElement {

    name;
    phone;
    email;
    leadSource;

    recordId = '003Do000002UgwkIAC';

    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    contactInfoHandler({data, error}){
        if (data) {
            console.log('contactInfoHandler' ,data);
            this.name = data.fields.Salutation.value + ' ' + 
                        data.fields.FirstName.value + ' ' + 
                        data.fields.LastName.value;
            this.phone = data.fields.Phone.value;
            this.email = data.fields.Email.value;
            this.leadSource = data.fields.LeadSource.value;
        }
        if (error) {
            console.log('contactInfoHandler' ,error);
        }
    }
}