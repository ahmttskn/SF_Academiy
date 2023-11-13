import { api, LightningElement } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';

export default class DisplayContact extends LightningElement {
    @api recordId;
    objectName = CONTACT_OBJECT;

    closeHandler() {
        const closeEvent = new CustomEvent('close');
        this.dispatchEvent(closeEvent);
    }
}