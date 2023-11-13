import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import OPP_OBJ from '@salesforce/schema/Opportunity';

export default class Sf_Opp_getPicklistValues extends LightningElement {

    oppPickListValues = [];
    stageNameValue;

    @wire(getObjectInfo, {objectApiName: OPP_OBJ})
    opportunityInfo;

    @wire(getPicklistValues, {fieldApiName: STAGE_FIELD, recordTypeId: '$opportunityInfo.data.defaultRecordTypeId' })
    oppPicklistHandler({data, error}){
        if (data) {
            console.log(data);
            this.oppPickListValues = this.oppPickLitGenerate(data.values);
        }
        if (error) {
            console.error(error);
        }
    }

    oppPickLitGenerate(values){
        return values.map(item => ({
                label: item.label,
                value: item.value
            }));
    }
    handleChange(event){
        this.stageNameValue = event.target.value;
    }
}