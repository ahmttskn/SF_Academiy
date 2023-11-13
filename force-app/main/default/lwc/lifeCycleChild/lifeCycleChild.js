/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-25-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class LifeCycleChild extends LightningElement {

    constructor(){
        super();
        console.log("Child - Constructor");
    }

    connectedCallback(){
        console.log("Child - ConnectedCallBack");
    }

    renderedCallback(){
        console.log("Child - renderedCallback");
    }
}