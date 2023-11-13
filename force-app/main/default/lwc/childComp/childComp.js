/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-28-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class ChildComp extends LightningElement {
    clickHandler(){
        console.log("Child Comp: Show event gets originated");

        const showEvent=new CustomEvent('show',{bubbles:true,composed:true});
        this.dispatchEvent(showEvent);
    }
}