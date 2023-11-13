import { LightningElement } from 'lwc';

export default class Sf_getters extends LightningElement {

    fruits = ["Apple","Orange","Grapes","Pineapple"];

    num1 = 10;
    num2 = 2000;
    result = this.num1 + this.num2;

    // get firstFruits(event){
    //     this.total = event.target.value
    // }
    get firstFruits(){
        return this.fruits[0];
    }

    get lastFruits(){
        return this.fruits[this.fruits.length-1];
    }

    get multiOfNums(){
        return this.num1 * this.num2;
    }

    showContent =true;
    label = "Click";
    label1="Click Me";
    label2= "UnClick Me";

    get showNumber (){
        let total = this.num1 * this.num2;
        if (total > 1000) {
            return true;
        }
        return false;
    }

    clickHandler(event){
        this.showContent = !this.showContent;
        if (event.target.label == "Click Me") {
            this.label = this.label2;
        } else {
            this.label = this.label1;
        }
    }
}