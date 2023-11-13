/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-05-2022
 * @last modified by  : Huseyin
**/


import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import ACCOUNT_FIELD from '@salesforce/schema/Contact.AccountId';
import DEP_FIELD from '@salesforce/schema/Contact.Department';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';

 
export default class RecordEditFormContact extends LightningElement {
    recordId="0038c00002oBrTrAAK";
    objectName=CONTACT_OBJECT;
    
    fields = {
        firstname: FIRSTNAME_FIELD,
        lastname: LASTNAME_FIELD,
        title: TITLE_FIELD,
        account: ACCOUNT_FIELD,
        department: DEP_FIELD,
        email: EMAIL_FIELD
    };

    successHandler(){
        const successToast=new ShowToastEvent({
            title:"Success",
            message:"Information has been saved succesfully",
            variant:"success"
        });
        this.dispatchEvent(successToast);
    }
}