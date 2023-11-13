import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import OPP_OBJECT from '@salesforce/schema/Opportunity';

export default class OppInfo extends LightningElement {

    oppRtId;
    stageOptions = [];
    typeOptions = [];
    oppName;
    selectedStage;
    selectedType;

    @wire(getObjectInfo, {objectApiName: OPP_OBJECT})
    oppObjectInfoHandler({data, error}) {
        if(data) {
            this.oppRtId = data.defaultRecordTypeId;
        }
    }

    @wire(getPicklistValuesByRecordType, {objectApiName: OPP_OBJECT, recordTypeId: '$oppRtId'})
    picklistHandler({data, error}) {
        if(data) {
            console.log(data);
            this.stageOptions = data.picklistFieldValues.StageName.values;
            this.typeOptions = data.picklistFieldValues.Type.values;
        }
    }

    changeHandler(event) {
        if(event.target.name === "Opportunity Name") {
            this.oppName = event.target.value;
        } else if(event.target.name === "Stage Name") {
            this.selectedStage = event.target.value;
        } else {
            this.selectedType = event.target.value;
        }
    }
}