import { LightningElement } from 'lwc';

import LEAD_OBJECT from '@salesforce/schema/Lead';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateLeadRecord extends LightningElement {
    formdata = {};

    changeHandler(event) {
        const {name, value} = event.target;
        this.formdata[name] = value;
    }

    saveLead() {
        const recordInput = {
            apiName: LEAD_OBJECT.objectApiName,
            fields: this.formdata
        };

        createRecord(recordInput)
            .then(result => {
                console.log(result);
                this.createToast("Success", "Lead has been created successfully", "success");
                this.template.querySelector('form.leadform').reset();
                this.formdata = {};
            })
            .catch(error => {
                console.error(error);
                this.createToast("Error", "Error occurred while creating lead", "error");
            })
    }

    createToast(title, message, variant) {
        const showToast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(showToast);
    }
}