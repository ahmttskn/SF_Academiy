import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNT_OBJ from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class Sf_getPicklistValues extends LightningElement {

    industryPicklistValues = [];
    selectedIndustry;

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJ})
    accountInfo;

    @wire(getPicklistValues, {fieldApiName: INDUSTRY_FIELD, recordTypeId: '$accountInfo.data.defaultRecordTypeId'})
    accIndustryHandler({data, error}){
        if (data) {
            console.log('accIndustryHandler OUTPUT : ', data);
            this.industryPicklistValues = this.getIndusrtyPickList(data.values);
            //console.log('industryPicklistValues', industryPicklistValues);
        }
        if (error) {
            console.error('accIndustryHandler OUTPUT : ', error);
        }
    };
    
    getIndusrtyPickList(values){
        return values.map(item => ({
                    label: item.label,
                    value: item.value
            }));
    }
 
    handleChange(event){
        this.selectedIndustry = event.target.value;
    }
    



}