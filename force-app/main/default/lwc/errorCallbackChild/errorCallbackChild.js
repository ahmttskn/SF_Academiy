/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-28-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class ErrorCallbackChild extends LightningElement {
    
    connectedCallback(){
        console.log("Child - connectedCallback");
        throw new Error("Error occured while fetching the data from database");
    }
}