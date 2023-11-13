import { LightningElement, track, wire } from 'lwc';
import getCarRecordWithType from '@salesforce/apex/CarCTRL.getCarRecordWithType';
import {
    subscribe,
    unsubscribe,
    publish,
    APPLICATION_SCOPE,
    MessageContext
} from 'lightning/messageService';
import carChannel from '@salesforce/messageChannel/CarChannel__c';

export default class CarTileList extends LightningElement {

    category = 'All';
    @track recordId;

    @wire(getCarRecordWithType, {carCategory: '$category'})
    cars;

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
        this.category = message.carType;
    }

    selectHandler(event){
        this.recordId = event.detail;
        console.log(JSON.stringify(this.recordId));

        const payload = { carRecordId: this.recordId };
        publish(this.messageContext, carChannel, payload);
    }
}