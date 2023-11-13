/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-10-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CONTACT_OBJECT from '@salesforce/schema/Contact'; // Contact metadata
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';

export default class RecordForm extends LightningElement {
    recordId = '0038c00002oBrToAAK';// api ile dinamik yapıcaz
    objectName = CONTACT_OBJECT;
    fields = [FIRSTNAME_FIELD,LASTNAME_FIELD];
    
    successHandler(){
        const successEvent = new ShowToastEvent({
            title : "Success",
            message : "Record is saved successfully",
            variant : "success"
        });
        this.dispatchEvent(successEvent);
    }
    errorHandler(){
        const errorEvent = new ShowToastEvent({
            title : "Error",
            message : "Record is not saved successfully",
            variant : "error"
        });
        this.dispatchEvent(errorEvent);
    }
}

/***
 *         const inputFields = this.template.querySelectorAll( 'lightning-input-field' );
        if ( inputFields ) {
            inputFields.forEach( field => {
                field.reset();
            } );
        }
 */