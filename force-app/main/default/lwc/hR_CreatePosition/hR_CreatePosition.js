import { LightningElement, track } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

import POSITION_OBJECT from '@salesforce/schema/Position__c';
import Name_F from '@salesforce/schema/Position__c.Position_Name__c';
import HR_Manager__c from '@salesforce/schema/Position__c.HR_Manager__c';
import Start_Date_Time__c from '@salesforce/schema/Position__c.Start_Date_Time__c';
import End_Date_Time__c from '@salesforce/schema/Position__c.End_Date_Time__c';
import Position_Type__c from '@salesforce/schema/Position__c.Position_Type__c';
import Location_HR__c from '@salesforce/schema/Position__c.Location_HR__c';
import Position_Detail__c from '@salesforce/schema/Position__c.Position_Detail__c';
import Status__c from '@salesforce/schema/Position__c.Status__c';

import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class HR_CreatePosition extends NavigationMixin(LightningElement) {

    @track positionRecord = {
        Position_Name__c: '',
        HR_Manager__c: '',
        Start_Date_Time__c: null,
        End_Date_Time__c: null,
        Position_Type__c: null,
        Location_HR__c: '',
        Position_Detail__c: ''
    }

    @track errors;

    handleChange(event) {
        let value = event.target.value;
        let name = event.target.name;
        this.positionRecord[name] = value;
    }

    handleLookup(event) {
        let selectedRecId = event.detail.selectedRecordId;
        let parentField = event.detail.parentfield;
        this.positionRecord[parentField] = selectedRecId;
    }

    handleClick() {
        const fields = {};
        fields[Name_F.fieldApiName] = this.positionRecord.Position_Name__c;
        fields[HR_Manager__c.fieldApiName] = this.positionRecord.HR_Manager__c;
        fields[Start_Date_Time__c.fieldApiName] = this.positionRecord.Start_Date_Time__c;
        fields[End_Date_Time__c.fieldApiName] = this.positionRecord.End_Date_Time__c;
        fields[Position_Type__c.fieldApiName] = this.positionRecord.Position_Type__c;
        fields[Location_HR__c.fieldApiName] = this.positionRecord.Location_HR__c;
        fields[Position_Detail__c.fieldApiName] = this.positionRecord.Position_Detail__c;
        fields[Status__c.fieldApiName] = 'In Progress';

        const positionRecord = {
            apiName: POSITION_OBJECT.objectApiName,
            fields
        };

        createRecord(positionRecord)
        .then((eventRec) => {
            this.dispatchEvent(new ShowToastEvent({
                title: 'Record Saved',
                message: 'Position Draft is Ready',
                variant: 'success'
            }));
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    actionName: "view",
                    recordId: eventRec.id
                }
            });
        }).catch((err) => {
            this.errors = JSON.stringify(err);
            this.dispatchEvent(new ShowToastEvent({
                title: 'Error Occured',
                message: this.errors,
                variant: 'error'
            }));
        });
    }

    handleCancel() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                actionName: "home",
                objectApiName: "Position__c"
            }
        });
    }

    get options() {
        return [
            { label: 'In Person', value: 'In Person' },
            { label: 'Hybrid', value: 'Hybrid' },
            { label: 'Remote', value: 'Remote' },
        ];
    }
}