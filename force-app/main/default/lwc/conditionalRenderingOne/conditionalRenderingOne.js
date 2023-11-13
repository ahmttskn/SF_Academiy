/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-07-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class ConditionalRenderingOne extends LightningElement {
    showContent=true;
    clickHandler(){
        this.showContent=!this.showContent;
    }
}