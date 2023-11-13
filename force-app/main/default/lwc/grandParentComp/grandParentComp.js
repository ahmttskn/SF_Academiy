/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-28-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class GrandParentComp extends LightningElement {

    grandShowHandler(event){
        console.log("Grand Comp: onshow event in c-parent-comp");
        console.log(event.target.nodeName);
        console.log(event.currentTarget.nodeName);
    }
}