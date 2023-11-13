import { LightningElement, wire } from 'lwc';
import CAR_OBJECT from '@salesforce/schema/Car__c';
import CATEGORY_FIELD from '@salesforce/schema/Car__c.Category__c';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';

import {
    subscribe,
    unsubscribe,
    publish,
    APPLICATION_SCOPE,
    MessageContext
} from 'lightning/messageService';
import carChannel from '@salesforce/messageChannel/CarChannel__c';

export default class CarFilter extends LightningElement {

    selectedCategory = 'All';
    categoryOptions;
    carRtId;
    error;

    @wire(MessageContext)
    messageContext;

    @wire(getObjectInfo, {objectApiName: CAR_OBJECT})
    carInfoHandler({data, error}) {
        if(data) {
            this.carRtId = data.defaultRecordTypeId;
        }  
        if(error) {
            console.log(error);
            this.error = error;
        }
    }

    @wire(getPicklistValues, {fieldApiName: CATEGORY_FIELD, recordTypeId: '$carRtId'})
    categoryPicklistHandler({data, error}) {
        if(data) {
            this.categoryOptions = this.picklistGenerator(data);
            this.categoryOptions.push({label: 'All', value: 'All'});
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

    handleChange(event){
        this.selectedCategory = event.target.value;

        const payload = { carType: this.selectedCategory };
        publish(this.messageContext, carChannel, payload);
    }



    
}