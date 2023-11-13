/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-24-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class ModelComponent1 extends LightningElement {

    closeHandlerChild(){
        const closeEvent=new CustomEvent('close',{detail:"Model was closed"});
        this.dispatchEvent(closeEvent);

        const con={
            FirstName:"Kari",
            LastName:"Pichai",
            Title:"Developer"
        }

        const closeEventWithData=new CustomEvent('closewithdata',{detail:con});
        this.dispatchEvent(closeEventWithData);

    }
}