import { LightningElement } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Sf_updateRecord extends LightningElement {

        // isDisabled = false;
        inputCase = {};
        recordId = '500Do000001f43mIAA';
    
        changeHandler(event){
            const {name, value} = event.target;
            this.inputCase[name] = value;
            this.inputCase['Id'] = this.recordId;
        }
    
        resetHandler(){
            this.template.querySelector("form.updateRecord").reset();
            this.inputCase = {};
        }
    
        updateHandler(){
            const recordInput = {fields: this.inputCase};
            updateRecord(recordInput)
            .then(result => {
                console.log('updateRecord RESULT OUTPUT : ', result);
                this.cretaeToastEvent('Success!', 'Case Record Updated! ', 'success');
                this.template.querySelector("form.updateRecord").reset();
                this.inputCase = {};
            })
            .catch(error => {
                console.error('updateRecord ERROR OUTPUT : ', error);
                this.cretaeToastEvent('Error!', 'Error Error ', 'error');
            })
        }
    
        cretaeToastEvent(title, message, variant){
            const event = new ShowToastEvent( {title, message, variant} );
            this.dispatchEvent(event);
        }
    
        get priorityOptions () {
            return  [
                {label: 'High', value: 'High'},
                {label: 'Medium', value: 'Medium'},
                {label: 'Low', value: 'Low'}
            ]
        } 
    
        get statusOptions () {
            return  [
                {label: 'New', value: 'New'},
                {label: 'Working', value: 'Working'},
                {label: 'Escalated', value: 'Escalated'}
            ]
        } 
}