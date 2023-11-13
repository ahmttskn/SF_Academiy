/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-14-2022
 * @last modified by  : Huseyin
**/

import { LightningElement } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//import { reduceErrors } from 'c/ldsUtils';

export default class CreateRecordContact extends LightningElement {

    formdata={};

    changeHandler(event){
        // const name=event.target.name;
        // const value=event.target.value;
        
        // formdata={
        //     FirstName:"BAla",
        //     LastName:"try",
        //     Email:"test@gmail.com",
        //     Title:"Developer",
        //     Department:"Consulting"
        // }
        console.log(event.target);
        const{name,value}=event.target;
        this.formdata[name]=value;
        console.log("Form data: ",this.formdata);
    }

    cancelContact(){
        this.template.querySelector('form.contact').reset();
        this.formdata={};
    }

    saveContact(){
        console.log(CONTACT_OBJECT);

        const recordInput={
            apiName:CONTACT_OBJECT.objectApiName,
            fields:this.formdata
        };
    
        createRecord(recordInput)
            .then(result=>{
                console.log("Result=>",result);
                this.createToast("Success","Contact has been created successfully","success");
                this.cancelContact();
            })
            .catch(error=>{
                console.error(error);
                this.createToast("Error","Contact has not  been created successfully","error");
                //this.createToast("Error",reduceErrors(error).join(', '),"error");
                
            })
    }

    createToast(title,message,variant){
        const toast=new ShowToastEvent({title,message,variant});
        this.dispatchEvent(toast);
    }
    
}