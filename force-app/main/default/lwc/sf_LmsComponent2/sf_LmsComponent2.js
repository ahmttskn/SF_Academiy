import { LightningElement, track, wire } from 'lwc';
import SFAcademy from '@salesforce/messageChannel/SFAcademy__c';
import {
    APPLICATION_SCOPE,
    createMessageContext,
    MessageContext,
    publish,
    releaseMessageContext,
    subscribe,
    unsubscribe,
} from 'lightning/messageService';

const COLUMNS = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Account Name', fieldName: 'Name', type: 'text' },
    { label: 'Phone', fieldName: 'phone', type: 'phone' },
    { label: 'Type', fieldName: 'Type', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' },
    { label: 'AnnualRevenue', fieldName: 'AnnualRevenue', type: 'currency' },
];

export default class Sf_LmsComponent2 extends LightningElement {

    @track accounts;

    columns = COLUMNS;
    
    @wire(MessageContext)
    messageContext;


    connectedCallback() {
        subscribe(
            this.messageContext,
            SFAcademy,
            (message) => this.handleMessage(message),
            { scope: APPLICATION_SCOPE }
        );
    }

    handleMessage(message) {
        console.log('lmsdata', message.lmsdata);
        this.accounts = message.lmsdata;
    }
}