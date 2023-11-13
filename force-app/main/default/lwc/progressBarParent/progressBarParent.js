/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-23-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class ProgressBarParent extends LightningElement {
    value = 10;
    changeHandler(event) {
        this.value = event.target.value;
    }
    resetprogressBar() {
        //this.value = 50;
        this.template.querySelector('c-progress-bar').resetProgress();
    }
}