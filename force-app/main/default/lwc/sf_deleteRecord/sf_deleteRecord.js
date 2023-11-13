import { LightningElement } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Sf_deleteRecord extends LightningElement {

    recordId = "a00Do000007d4JtIAI";

    changeHandler(event){
        this.recordId = event.target.value;
    }

    deleteHandler(){
        deleteRecord(this.recordId)
            .then(result => {
                console.log('deleteRecord RESULT ', result);
                this.createToastEvent('Success', 'Record deleted', 'success');
            })
            .catch(error => {
                console.log('deleteRecord ERROR ', error);
                this.createToastEvent('Error deleting record', error.body.message, 'error');
            })
    }

    createToastEvent(title, message, variant){
        const event = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(event);
    }
}