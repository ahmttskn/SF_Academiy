import { MessageContext, publish } from 'lightning/messageService';
import { LightningElement, wire } from 'lwc';
import SI_LMC from '@salesforce/messageChannel/SF_Academy__c';

export default class LmsComponentX extends LightningElement {
    selectedValue;

    @wire(MessageContext)
    context;

    get options() {
        return [
            {label: "High", value: "High"},
            {label: "Medium", value: "Medium"},
            {label: "Low", value: "Low"}
        ];
    }

    changeHandler(event) {
        this.selectedValue = event.target.value;
        //prepare message
        const message = {
            lmsdata: {
                value: this.selectedValue
            }
        };

        //publish message
        publish(this.context, SI_LMC, message);
    }
/*

    <types>
        <members>*</members>
        <name>LightningMessageChannel</name>
    </types>



    <?xml version="1.0" encoding="UTF-8"?>
    <LightningMessageChannel xmlns="http://soap.sforce.com/2006/04/metadata">
        <masterLabel>SoftInnovas</masterLabel>
        <description>This channel is used for communication purposes between lmsCompA and lmsCompB</description>
        <isExposed>true</isExposed>
        <lightningMessageFields>
            <description>This field is used to pass data</description>
            <fieldName>lmsdata</fieldName>
        </lightningMessageFields>
    </LightningMessageChannel>



        handleMessage(message) {
        //  *
        if(message.lmsdata.value) {
            this.receivedMessage = message.lmsdata.value;
        } else {
            this.receivedMessage = "Didnt get any message published yet!";
        }  // *
        this.receivedMessage = message.lmsdata.value ? message.lmsdata.value : "Didnt get any message published yet!";
    }


    <?xml version="1.0" encoding="UTF-8"?>
    <LightningMessageChannel xmlns="http://soap.sforce.com/2006/04/metadata">
        <masterLabel>SoftInnovas</masterLabel>
        <description>This channel is used for communication purposes between lmsCompA and lmsCompB</description>
        <isExposed>true</isExposed>
        <lightningMessageFields>
            <description>This field is used to pass data</description>
            <fieldName>lmsdata</fieldName>
        </lightningMessageFields>
    </LightningMessageChannel>

    
*/


}