/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-24-2022
 * @last modified by  : Huseyin
**/
import { api, LightningElement } from 'lwc';

export default class SliderComponent extends LightningElement {
    @api value;

    @api resetSlider(){
        console.log("I was called by parent!");
        this.value=50;
    }

    changeHandler(event){
        this.value=event.target.value;
    }
}