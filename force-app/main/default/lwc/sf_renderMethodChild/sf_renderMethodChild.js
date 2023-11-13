import { LightningElement } from 'lwc';
import signinTemplate from './signinTemplate.html';
import signupTemplate from './signupTemplate.html';
import renderTemplate from './sf_renderMethodChild.html';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Sf_renderMethodChild extends LightningElement {

    showTemplate ='';
    
    clickHandler(event){
        this.showTemplate = event.target.label;
    }
    render(){
        return this.showTemplate === "Sign in" ? signinTemplate 
            : this.showTemplate === "Sign up" ? signupTemplate
            : renderTemplate;
    }
    
    cancelHandler(){
        this.showTemplate = '';
        this.dispatchEvent(new ShowToastEvent({
            title: 'Success!',
            message: 'Page is Closed',
            variant: 'info'
        }));
    }

    saveHandler(){
        this.showTemplate = '';
        this.dispatchEvent(new ShowToastEvent({
            title: 'Success!',
            message: 'Page is Saved',
            variant: 'success'
        }));
    }
    
}