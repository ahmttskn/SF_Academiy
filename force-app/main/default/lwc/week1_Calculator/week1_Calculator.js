import { LightningElement } from 'lwc';

export default class Week1_Calculator extends LightningElement {

    num1 = 0;
    num2 = 0;
    total = 0;

    // changeHandler(event) {
    //     var comp = event.target.name;
    //     if(comp === "input1") {
    //         this.num1 = event.target.value;
    //     } else {
    //         this.num2 = event.target.value;
    //     }
    //     this.total = Number(this.num1) + Number(this.num2);
    // }

    changeHandler(event) {
        //var comp = event.target.name;
        if(event.target.label == "Input 1") {
            this.num1 = event.target.value;
        } else if (event.target.label == "Input 2"){
            this.num2 = event.target.value;
        }
        this.total = Number(this.num1) + Number(this.num2);
    }
    
}