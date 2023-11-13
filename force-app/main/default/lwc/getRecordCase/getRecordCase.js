/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-20-2022
 * @last modified by  : Huseyin
**/
import { getRecord } from 'lightning/uiRecordApi';
import { api, LightningElement,wire } from 'lwc';

export default class GetRecordCase extends LightningElement {
    
    //@api recordId;
    recordId='5008c00001KLdNaAAL';
    caseNumber;
    priority;
    status;
    subject;

    @wire(getRecord,{recordId:'$recordId',layoutTypes:['Full'],modes:['Edit']})
    caseHandler({data,error}){
        if(data){
            console.log(data);
            this.caseNumber=data.fields.CaseNumber.value;
            this.priority=data.fields.Priority.value;
            this.status=data.fields.Status.value;
            this.subject=data.fields.Subject.value;
          
        }
        if(error){
            console.log(error);
        }
    }

}