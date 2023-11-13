/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-12-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

import CASE_OBJECT from '@salesforce/schema/Case';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateRecordCase extends LightningElement {
    formdata = {};

    //prepare an object alike structure so that we can use the same
    //to prepare recordInput
    changeHandler(event) {
        const {name, value} = event.target;
        this.formdata[name] = value;
    }

    //erase or reset the form
    cancelCase() {
        this.template.querySelector('form.case').reset();
        this.formdata = {};
    }

    //prepare recordInput and pass the same to createRecord function
    //show appropriate success and error toasts
    saveCase() {
        const recordInput = {
            apiName: CASE_OBJECT.objectApiName,
            fields: this.formdata
        };
        createRecord(recordInput)
            .then(result => {
                console.log(result);
                this.createToast("Success", "Case has been logged successfully!", "success");
                this.cancelCase();
            })
            .catch(error => {
                console.error(error);
                this.createToast("Error", "Error occurred while logging the case", "error");
            })
    }

    createToast(title, message, variant) {
        const toast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(toast);
    }
}