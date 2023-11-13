import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import ACC_OBJ from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class Sf_getPickListValues_ACC extends LightningElement {

    customRtId;
    standardRtId;

    customIndustryValue;
    standardIndustryValue;

    customIndustry = [];
    standardIndustry = [];


    @wire(getObjectInfo, {objectApiName: ACC_OBJ})
    accountInfoHandler({data, error}){
        if (data) {
            console.log('accountInfoHandler : ',data);
            const rtIds = data.recordTypeInfos;
            this.customRtId = Object.keys(rtIds).find(rtId => rtIds[rtId].name === 'custom');
            this.standardRtId = Object.keys(rtIds).find(rtId => rtIds[rtId].name === 'standard');
        }
        if (error) {
            console.error(error);
        }
    }

    @wire(getPicklistValues, {fieldApiName: INDUSTRY_FIELD, recordTypeId: '$standardRtId'})
    standardIndustryPicklistHandler({data, error}){
        if (data) {
            console.log('standardIndustryPicklistHandler : ',data);
            this.standardIndustry = this.picklistGenarete(data.values);
        }
        if (error) {
            console.error(error);
        }
    }

    @wire(getPicklistValues, {fieldApiName: INDUSTRY_FIELD, recordTypeId: '$customRtId'})
    customIndustryPicklistHandler({data, error}){
        if (data) {
            console.log('customIndustryPicklistHandler : ',data);
            this.customIndustry = this.picklistGenarete(data.values);
        }
        if (error) {
            console.error(error);
        }
    }

    picklistGenarete(info){
        return info.map(item => ({
                label: item.label,
                value: item.value
            }));
    }

    handleChange(event){
        const name = event.target.name;
        if (name === "standardRtId") {
            this.standardIndustryValue = event.target.value;
        } else if (name === "customRtId") {
            this.customIndustryValue = event.target.value;
        }
    }
}