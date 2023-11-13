/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-25-2022
 * @last modified by  : Huseyin
**/
import { api, LightningElement } from 'lwc';

export default class DisconnectedCallbackChild extends LightningElement {
    
    @api name;

    disconnectedCallback(){
        console.log("Child - DisconnectedCallback");
    }
}