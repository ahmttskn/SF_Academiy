/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-24-2022
 * @last modified by  : Huseyin
**/
import ThirdSic from '@salesforce/schema/DandBCompany.ThirdSic';
import { LightningElement } from 'lwc';

export default class ModalParent2 extends LightningElement {

    showModal=false;
    info;
    con;
    modalHandler(){
        this.showModal=true;
    }
    
    closeHandlerParent(event){
        console.log(event);
        console.log(event.detail);
        this.info=event.detail;

        this.showModal=false;
    }
    closeHandlerWithData(event){
        console.log("Event =>",event);
        console.log("Event detail => ", event.detail);
        console.log("Event detail JSON.stringify => ", JSON.stringify(event.detail));
       
        this.con=event.detail;
    }
}