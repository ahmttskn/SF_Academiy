import { createRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';

import OPP_OBJ from '@salesforce/schema/Opportunity';
import StageName from '@salesforce/schema/Opportunity.StageName';

export default class Sf_createRecord extends LightningElement {

    inputsOpp = {};
    stageOptions;
    oppRtId;

    @wire(getObjectInfo, {objectApiName: OPP_OBJ})
    oppInfoHandler({data, error}) {
        if(data) {
            this.oppRtId = data.defaultRecordTypeId;
        }  
        if(error) {
            console.log(error);
            this.error = error;
        }
    }

    @wire(getPicklistValues, { fieldApiName: StageName, recordTypeId: '$oppRtId'})
    stageNameHandler({data, error}){
        if(data) {
            this.stageOptions = this.picklistGenerator(data.values);
        }  
        if(error) {
            console.log(error);
            this.error = error;
        }
    }

    picklistGenerator(values){
        return values.map(item => ({
            label: item.label,
            value: item.value
        }));
    }

    changeHandler(event){
        const {name, value} = event.target;
        this.inputsOpp[name] = value;
    }

    createOpportunity(){
        const recordInput = {
            apiName : OPP_OBJ.objectApiName,
            fields   : this.inputsOpp
        };
        createRecord(recordInput)
            .then(result => {
                console.log('createRecord THEN OUTPUT : ', result);
                const successEvent = new ShowToastEvent({
                    title: 'Success!',
                    message: 'Opportunity Record Created! ',
                    variant: 'success'
                });
                this.dispatchEvent(successEvent);
                this.template.querySelector("form.createRecord").reset();
                this.inputsOpp = {};
            })
            .catch(error => {
                console.error('createRecord ERROR OUTPUT : ', error);
                const errorEvent = new ShowToastEvent({
                    title: 'Error!',
                    message: 'error! ',
                    variant: 'error'
                });
                this.dispatchEvent(errorEvent);
            })
    }

    resetHandler(){
        this.template.querySelector("form.createRecord").reset();
        this.inputsOpp = {};
    }

    
}