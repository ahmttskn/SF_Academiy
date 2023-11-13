import { LightningElement, api } from 'lwc';
import CONTACT_OBJ from '@salesforce/schema/Contact.Name';

export default class Week4_displayResults extends LightningElement {

    @api recordId;
    objectApiName = CONTACT_OBJ;

    closeHandler() {
        const closeEvent = new CustomEvent('close');
        this.dispatchEvent(closeEvent);
    }
}