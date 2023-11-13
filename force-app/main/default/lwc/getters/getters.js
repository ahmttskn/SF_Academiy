/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-07-2022
 * @last modified by  : Huseyin
**/

/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-07-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class Getters extends LightningElement {
        fruits=["Orange","Banana","Apple","Pineapple"];
        num1=10;
        num2=20;
        total=this.num1 + this.num2; //Why get ?
        
        birinci=fruits[0];
        
    get firstFruit(){
        return this.fruits[0];
    }
    get sumOfNums(){
        return this.num1 + this.num2;
    }
}