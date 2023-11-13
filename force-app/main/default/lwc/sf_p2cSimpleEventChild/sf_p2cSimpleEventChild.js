import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Sf_p2cSimpleEventChild extends LightningElement {

    closeHandler(){
        const closeEvent = new CustomEvent('close', {detail: 'Modal is closed Successfully'});
        this.dispatchEvent(closeEvent);
        const event = new ShowToastEvent({
            title: 'Success!',
            variant: 'success',
            message: 'Modal is Closed!!!'
        });
        this.dispatchEvent(event);
    }

    saveHandler(){
        const closeEvent = new CustomEvent('close', {detail: 'Modal is closed Successfully'});
        this.dispatchEvent(closeEvent);
        const event = new ShowToastEvent({
            title: 'Success!',
            variant: 'warning',
            message: 'There is no Record. This is just Plain Modal!'
        });
        this.dispatchEvent(event);
    }

}