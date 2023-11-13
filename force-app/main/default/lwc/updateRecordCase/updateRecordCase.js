/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-17-2022
 * @last modified by  : Huseyin
**/
import { updateRecord,getRecord } from 'lightning/uiRecordApi';
import { api, LightningElement,wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//import { reduceErrors } from 'c/ldsUtils';

export default class UpdateRecordCase extends LightningElement {
    recordId="5008c00001KLdNaAAL";
    //@api recordId;
    formdata={};

    description;
    subject;

    @wire(getRecord,{recordId:'$recordId',layoutTypes:['Full'],modes:['Edit']})
    caseHandler({data,error}){
        if(data){
            console.log(data);
            this.description=data.fields.Description.value;
            this.subject=data.fields.Subject.value;
          
        }
        if(error){
            console.log(error);
        }
    }
    //prepare an object of inputted data
    changeHandler(event){
        // JS destructuring
        const{name,value}=event.target;
        // key,value 
        this.formdata[name]=value;
        //this.formdata['Id']=this.recordId;

    }
    //reset the form and create form data
    cancelCode(){
        this.template.querySelector('form.case').reset();
        this.formdata={};
    }

    updateCase(){
        this.formdata["Id"]=this.recordId;
        const recordInput={fields:this.formdata};
        updateRecord(recordInput)
            .then(result=>{
                console.log("result=>>>>",result);
                this.createToast("Success","Lead has been created successfully", "success");

            })
            .catch(error =>{
                console.error(error);
                //this.createToast("Error", "Error occurred while updating lead", "error");
                this.createToast("Error",reduceErrors(error).join(', '),"error");
            })
    }

    createToast(title, message, variant) {
        const showToast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(showToast);
    }
}