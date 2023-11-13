import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import STAGE_NAME from '@salesforce/schema/Opportunity.StageName';
import OPP_OBJECT from '@salesforce/schema/Opportunity';
import getOppsByStage from '@salesforce/apex/OpportunityCtrl.getOppsByStage';

const COLUMNS = [
    {label: "Opportunity Name", fieldName: "Name", type: "text"},
    {label: "Opportunity Type", fieldName: "Type", type: "text"},
    {label: "Amount", fieldName: "Amount", type: "currency"},
    {label: "Stage", fieldName: "StageName", type: "text"},
    {label: "Close Date", fieldName: "CloseDate", type: "date"}
];

export default class Week3_Uc1 extends LightningElement {

    columns = COLUMNS;
    oppRtId;
    error;
    stageOptions = [];
    selectedStage;
    opps;

    @wire(getObjectInfo, {objectApiName: OPP_OBJECT})
    oppInfoHandler({data, error}) {
        if(data) {
            this.oppRtId = data.defaultRecordTypeId;
        }  
        if(error) {
            console.log(error);
            this.error = error;
        }
    }

    @wire(getPicklistValues, {fieldApiName: STAGE_NAME, recordTypeId: '$oppRtId'})
    stagePicklistHandler({data, error}) {
        if(data) {
            this.stageOptions = this.picklistGenerator(data);
        }
        if(error) {
            console.log(error);
            this.error = error;
        }
    }

    picklistGenerator(data) {
        return data.values.map(item => ({
            label: item.label,
            value: item.value
        }));
    }

    changeHandler(event) {
        this.selectedStage = event.target.value;
        getOppsByStage({stage: this.selectedStage})
            .then(result => {
                this.opps = result;
                console.log('result', result);
            })
            .catch(error => {
                this.error = error;
            })
    }
}