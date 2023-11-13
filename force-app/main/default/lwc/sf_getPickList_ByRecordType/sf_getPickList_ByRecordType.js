import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import OPP_OBJ from '@salesforce/schema/Opportunity';

export default class Sf_getPickList_ByRecordType extends LightningElement {

    stageNameOptions = [];
    leadSourceOptions = [];

    stageNameValue;
    leadSourceValue;

    vendorsRtId;

    @wire(getObjectInfo, {objectApiName: OPP_OBJ})
    accountInfos({data, error}){
        if (data) {
            console.log('Sf_getPickList_ByRecordType data', data);
            const rtIds = data.recordTypeInfos;
            this.vendorsRtId = Object.keys(rtIds).find(rtId => rtIds[rtId].name === 'vendors');

        }
        if (error) {
            console.error(error);
        }
    };

    @wire(getPicklistValuesByRecordType, {objectApiName: OPP_OBJ, recordTypeId: '$vendorsRtId'})
    opportunityPicklistHandler({data, error}){
        if (data) {
            console.log('opportunityPicklistHandler ', data);
            this.stageNameOptions = this.generatePickList(data.picklistFieldValues.StageName);
            this.leadSourceOptions = this.generatePickList(data.picklistFieldValues.LeadSource);

        }
        if (error) {
            console.error('OUTPUT: ', error);
        }
    }
    generatePickList(infos){
        return infos.values.map(item => ({
                label: item.label,
                value: item.value
            }));
    }

    handleChange(event){
        if (event.target.label === "Opportunity StagaName") {
            this.stageNameValue = event.target.value;
        }
        if (event.target.label === "Opportunity LeadSource") {
            this.leadSourceValue = event.target.value;
        }
    }
}