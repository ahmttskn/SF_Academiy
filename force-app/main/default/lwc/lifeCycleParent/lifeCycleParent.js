/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-28-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class LifeCycleParent extends LightningElement {

    constructor(){
        super();
        console.log("Parent - Constructor");
    }
    //waiting--
    connectedCallback(){
        console.log("Parent - ConnectedCallBack");
    }

    renderedCallback(){
        console.log("Parent - renderedCallback");
    }

}