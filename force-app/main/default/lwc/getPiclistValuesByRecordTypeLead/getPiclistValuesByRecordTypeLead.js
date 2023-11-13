/**
 * UC:
Get all the picklist field values from Lead Object 
and prepare combo boxes for Industry & LeadSource fields. 
Every time there is a change in the selection of options,
 get them displayed dynamically in a div element
 */

import { getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import Lead from '@salesforce/schema/Lead';

export default class GetPiclistValuesByRecordTypeLead extends LightningElement {

    @wire(getPicklistValuesByRecordType,{objectApiName: string, recordTypeId: string})
    account;
}