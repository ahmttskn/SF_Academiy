/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-23-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class P2cCallingChildMedhodParent1 extends LightningElement {

    clickHandler(){
        this.template.querySelector('c-slider-component').resetSlider();
    }
}