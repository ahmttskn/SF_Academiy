import { LightningElement } from 'lwc';

export default class Sf_twoWayDataBinding extends LightningElement {

    name;
    lastName;

    changeHandler(param){

        if (param.target.label == "Name" ) {
            this.name = param.target.value;
        } else if(param.target.label == "Last Name" ){
            this.lastName = param.target.value;
        }
        
    }



}