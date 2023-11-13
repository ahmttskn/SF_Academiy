/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-28-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class RenderedCallbackDemo extends LightningElement {

    name="World!";
    showChild=false;

    changeHandler(e){
        this.name=e.target.value;
    }

    renderedCallback(){
        //this.name +=" test"; //infinite loop
        console.log("RenderedCallback has been called!");
    }

    showHandler(){
        this.showChild=!this.showChild;
    }
}