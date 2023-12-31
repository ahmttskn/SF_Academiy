import { LightningElement, api } from 'lwc';

import findPositions from "@salesforce/apex/EditMembershipService.findPositions";
import manageMembership from "@salesforce/apex/EditMembershipService.manageMembership";

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//import { CloseActionScreenEvent } from "lightning/actions";

const COLUMNS = [
    {
        label: "Position Name",
        fieldName: "detailsPage",
        type: "url",
        wrapText: "true",
        typeAttributes: {
            label: {
                fieldName: "Name"
            }
        }
    },
    {
        label: "HR Name",
        fieldName: "HRMNG",
        cellAttributes: {
            iconName: "standard:user",
            iconPosition: "left"
        }
    },
    {
        label: "Position Start Date",
        fieldName: "StartDateTime",
        type: "date",
        typeAttributes: {
            weekday: "long",
            year: "numeric",
            month: "long"
        }
    },
    {
        label: "Location",
        fieldName: "Location",
        type: "text",
        cellAttributes: {
            iconName: "utility:location",
            iconPosition: "left"
        }
    }
];

export default class HR_EditMembership extends LightningElement {

     // to be set by flow
     @api recordId;
     @api selection; // "add" or "clear" meaning insert or delete
 
     errors;
     positions;
     columnsList = COLUMNS;
 
     retrievedRecordId = false;
 
     renderedCallback() {
         if (!this.retrievedRecordId && this.recordId) {
             console.log("recordId:" + this.recordId);
             console.log("selection:" + this.selection);
 
             // Escape case from recursion
             this.retrievedRecordId = true;
 
             console.log("found recordId:" + this.recordId);
 
             this.workOnPositions();
         }
     }
 
     workOnPositions(){
        findPositions({
             candidateId: this.recordId,
             selection: this.selection
         })
         .then((result) => {
             this.positions = [];
             result.forEach((record) => {
                 let obj = new Object();
                 obj.id = record.positionId;
                 obj.Name = record.position.Position_Name__c;
                 obj.detailsPage = "https://" + window.location.host + "/" + record.position.Id;
                 obj.HRMNG = record.position.HR_Manager__r.Name;
                 obj.StartDateTime = record.position.Start_Date_Time__c;
                 
                 if (record.position.Location_HR__c) {
                     obj.Location = record.position.Location_HR__r.Name;
                 } else {
                     obj.Location = "This is a Remote Osition";
                 }
 
                 this.positions.push(obj);
             });
 
             this.errors = undefined;
         })
         .catch((error) => {
             this.positions = undefined;
             this.errors = error.message;
         });
     }
 
     handleClick(event){
         let selectedRecords = this.template.querySelector("lightning-datatable").getSelectedRows();  
         console.log('selectedRecords' + JSON.stringify(selectedRecords));
 
         let ids = [];
         selectedRecords.forEach((line) => {
             ids.push(line.id);
         });
 
         console.log('ids:' + ids);
 
         manageMembership({
             candidateId: this.recordId,
             positionIds: ids,
             selection: this.selection
         })
         .then((result) => {
             console.log('result:' + result);
 
             if(result){
                 this.showNotification('Successful Operation', 'That worked great', 'success');
                 this.pageRefresh();
                 
             }
             else{
                 this.showNotification('Error', 'Opppss', 'error');
             }
         })
         .catch((error) => {
             this.errors = error.message;
             this.showNotification('Error', error.message, 'error');
         });
     }
 
     showNotification(title, message, variant) {
         const evt = new ShowToastEvent({
             title: title,
             message: message,
             variant: variant
         });
         this.dispatchEvent(evt);
     }
 
   pageRefresh(){
         
         setTimeout(() => {
           window.location.href =  "https://" + window.location.host + "/" + this.recordId;
         }, "1000");
     }
}