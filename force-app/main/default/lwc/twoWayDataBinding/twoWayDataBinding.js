/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-05-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {
    fullName="Usain";
    title="Salesforce Developer";
    
    handleChange(event){ //event based language
       
        console.log("event.target.value :>>> " +  event.target.value);
        this.title=event.target.value; // this, refer to class level variables
    }
}