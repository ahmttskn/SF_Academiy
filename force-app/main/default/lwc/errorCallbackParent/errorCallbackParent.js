/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-28-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class ErrorCallbackParent extends LightningElement {
    
    errorCallback(error,stack){
        console.log("Parent - ErrorCallback");
        console.log(error.message);
        console.log(stack);
    }
}