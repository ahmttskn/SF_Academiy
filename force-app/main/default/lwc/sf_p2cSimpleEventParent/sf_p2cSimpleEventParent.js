import { LightningElement } from 'lwc';

export default class Sf_p2cSimpleEventParent extends LightningElement {

    showDetail = false;
    message;

    clikHandler(){
        this.showDetail = true;
    }

    closeHandler(event){
        this.showDetail = false;
        this.message = event.detail;
    }

}