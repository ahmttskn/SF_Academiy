import { LightningElement, track, wire } from 'lwc';
import SFAcademy from '@salesforce/messageChannel/SFAcademy__c';
import getAccountsType from '@salesforce/apex/AccountCtrl.getAccountsType';
import {
    APPLICATION_SCOPE,
    createMessageContext,
    MessageContext,
    publish,
    releaseMessageContext,
    subscribe,
    unsubscribe,
} from 'lightning/messageService';


export default class Sf_LmsComponent1 extends LightningElement {

    @track selectedType;
    @track accounts;
    error;

    get options() {
        return [
            { label: 'Prospect', value: 'Prospect' },
            { label: 'Customer - Direct', value: 'Customer - Direct' },
            { label: 'Customer - Channel', value: 'Customer - Channel' },
            { label: 'Channel Partner / Reseller', value: 'Channel Partner / Reseller' },
            { label: 'Installation Partner', value: 'Installation Partner' },
            { label: 'Technology Partner', value: 'Technology Partner' },
            { label: 'Other', value: 'Other' }
        ];
    }
    
    @wire(MessageContext)
    messageContext;

    // @wire(getAccountsType, {type: this.selectedType})
    // accounts;
    
    handleChange(event){
        this.selectedType = event.target.value;
        getAccountsType({type: this.selectedType})
            .then(result => {
                this.accounts = result;
            })
            .catch(error => {
                this.error = error;
            })
            const payload = { lmsdata: this.accounts };
            publish(this.messageContext, SFAcademy, payload);
    }

    // const payload = this.accounts;
    //     publish(this.messageContext, lmsdata, recordSelected, payload);
}