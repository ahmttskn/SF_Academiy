/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-28-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';
import loginTemplatebla from './loginTemplate.html';
import signupTemplate from './signupTemplate.html';
import renderTemplate from './renderMethod.html';

export default class RenderMethod extends LightningElement {
    selectedOption;

    clickHandler(event){
        this.selectedOption=event.target.label;
    }

    render(){
        return this.selectedOption==="Login" ? loginTemplatebla
                : this.selectedOption ==="Signup" ? signupTemplate
                : renderTemplate;
    }
}