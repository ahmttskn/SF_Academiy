import { LightningElement, api, wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import carhub_logo from '@salesforce/resourceUrl/carhub_logo'


import CAR_OBJ from '@salesforce/schema/Car__c';
import Name from '@salesforce/schema/Car__c.Name';
import Control__c from '@salesforce/schema/Car__c.Control__c';
import Category__c from '@salesforce/schema/Car__c.Category__c';
import Make__c from '@salesforce/schema/Car__c.Make__c';
import Seating_Capacity__c from '@salesforce/schema/Car__c.Seating_Capacity__c';
import Description__c from '@salesforce/schema/Car__c.Description__c';
import Fuel_Type__c from '@salesforce/schema/Car__c.Fuel_Type__c';
import Picture_URL__c from '@salesforce/schema/Car__c.Picture_URL__c';
import Price__c from '@salesforce/schema/Car__c.Price__c';

import {
    subscribe,
    unsubscribe,
    publish,
    APPLICATION_SCOPE,
    MessageContext
} from 'lightning/messageService';
import carChannel from '@salesforce/messageChannel/CarChannel__c';


export default class CarCard extends LightningElement {

    @api recordId;
    @api objectApiName = CAR_OBJ;

    carName;
    carURL;
    carhub_logo = carhub_logo;

    @wire(getObjectInfo, { objectApiName: CAR_OBJ })
    propertyOrFunction;

    fields = {
        control : Control__c,
        category : Category__c,
        make: Make__c,
        seating_Capacity: Seating_Capacity__c,
        description : Description__c,
        fuel_Type : Fuel_Type__c,
        price : Price__c,

    }

    handleRecordLoaded(event){
        const recordDetail = event.detail.records;
        this.carName = recordDetail[this.recordId].fields.Name.value;
        this.carURL = recordDetail[this.recordId].fields.Picture_URL__c.value;
    }

    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        this.subscribeToMessageChannel();
    }

    subscribeToMessageChannel() {
        this.subscription = subscribe(
            this.messageContext,
            carChannel,
            (message) => this.handleMessage(message),
            { scope: APPLICATION_SCOPE }
        );
    }

    handleMessage(message) {
        this.recordId = message.carRecordId;
    }
}