/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-24-2022
 * @last modified by  : Huseyin
**/

/**Steps:
1.) Parent component will have input search which takes record ID
2.) Parent component will also have a button.
3.) Child component is a lightning record form in a modal window.
4.) On clicking the button, recordId should be passed to a child 
component and child modal window should be displayed.

Tips:
Prepare a parent component: Host a lightning input. onchange => 
get the entered account id into a local property. send the local property value to child component.
When click on the "Show" button => bring the modal component to foreground
modal Component: have a public property to receive record id. 
Using that record id the modal should display lightning record form in the body. 
When user clicks on close button on the modal, the modal should be hidden 
*/
import { LightningElement,wire } from 'lwc';
import getAllAccounts from '@salesforce/apex/AccountCtrl.getAllAccounts';
import LightningAlert from 'lightning/alert';

export default class MixUseCaseHomework extends LightningElement {
    selectedaccount;
    accountOptions = []; 
    info;  
    @wire(getAllAccounts)
    accountHandler({data,error}){
        if(data){
            console.log(data);
            this.accountOptions = this.picklistGenerator(data);
            console.log(this.accountOptions);
        }
        if(error){
            console.error(error);
        }
    }
    picklistGenerator(data){
        return data.map(item => ({
            label: item.Name,
            value: item.Id
        }))
    }
    /*THIS CAN BE DIRECTLY CALLED FROM COMBOBOX
    changeHandler(event){
        this.selectedAccount = event.target.value;        
    }*/
    changeHandler(event){
        var selected=this.template.querySelector("lightning-combobox");
        this.selectedaccount=selected.value;
    }
    messageHandler(event){ 
        console.log(event.detail);
        this.info = event.detail;
        LightningAlert.open({
            message: this.info,
            theme: 'success', // a red theme intended for success states
            label: 'Success!', // this is the header text
        });
        //Alert has been closed           
    }
}