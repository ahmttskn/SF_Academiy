/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-23-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class ModalParent extends LightningElement {
    showModal=false;

    modalHandler(){
        this.showModal=true;
        console.log(this.showModal);
    }
    closeHandler(){
        this.showModal=false;

    }
}