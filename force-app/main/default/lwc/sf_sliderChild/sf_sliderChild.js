import { LightningElement, api } from 'lwc';

export default class Sf_sliderChild extends LightningElement {

    @api size;
    @api val= 25;

    @api resetSlider(){
        this.val = 50;
    }

    changeHandler(event){
        this.val = event.target.value;
    }
}