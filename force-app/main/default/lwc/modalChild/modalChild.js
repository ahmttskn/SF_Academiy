/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-23-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class ModalChild extends LightningElement {

    closeHandler(){
        console.log("Before creating and dispatching custom event");
        const closeEvent=new CustomEvent('close');
        this.dispatchEvent(closeEvent);
    }
}