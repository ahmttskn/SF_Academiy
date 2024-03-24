import { LightningElement } from 'lwc';

export default class Week1_Calculator_BONUS extends LightningElement {

    num1;
    num2;

    total;
    //subtruction;
    //multiplication;
    //division;

    
    changeHandler(event) {
        if (event.target.label === 'Number 1') {
            
            this.num1 = Number(event.target.value);            
        } else {
            this.num2 = Number(event.target.value);
        }

        if (this.num1 === undefined) {
            this.num1 = 0;            
        }
        if (this.num2 === undefined) {
            this.num2 = 0;            
        }

        this.total = this.num1 + this.num2;

    }

    get sum () {
        if (this.num1 === undefined) {
            this.num1 = 0;            
        }
        if (this.num2 === undefined) {
            this.num2 = 0;            
        }
        return this.num1 + this.num2;
    }
}