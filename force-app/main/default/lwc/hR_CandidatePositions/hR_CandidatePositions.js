import { LightningElement, api } from 'lwc';

import upcomingPositions from "@salesforce/apex/CandidatePositionsService.upcomingPositions";
import pastPositions from "@salesforce/apex/CandidatePositionsService.pastPositions";

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
        fieldName: "PSMANG",
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

export default class HR_CandidatePositions extends LightningElement {

    @api recordId;
    selectedPositions;
    upcomingPositions;
    pastPositions;

    columnsList = COLUMNS;
    errors;
    retrievedRecordId = false;

    renderedCallback(){
        console.log("renderedCallback");
        if (!this.retrievedRecordId && this.recordId) {
            // Escape case from recursion
            this.retrievedRecordId = true;

            console.log("found recordId:" + this.recordId);

            this.upcomingEventsFromApex();
            this.pastEventsFromApex();
        }
    }

    upcomingEventsFromApex(){
        upcomingPositions({
            candidateId: this.recordId
        })
        .then((result) => {
            console.log("result:" + JSON.stringify(result));

            this.upcomingPositions = [];
            this.selectedPositions = [];
            result.forEach((record) => {
                let obj = new Object();
                obj.id = record.positionId;
                obj.Name = record.position.Position_Name__c;
                obj.detailsPage = "https://" + window.location.host + "/" + record.position.Id;
                obj.PSMANG = record.position.HR_Manager__r.Name;
                obj.StartDateTime = record.position.Start_Date_Time__c;
                
                if (record.position.Location_HR__c) {
                    obj.Location = record.position.Location_HR__r.Name;
                } else {
                    obj.Location = "This is a Remote Position";
                }

                this.upcomingPositions.push(obj);

                if(record.isMember) this.selectedPositions.push(obj.id);
            });

            this.errors = undefined;
        })
        .catch((error) => {
            this.upcomingPositions = undefined;
            this.errors = JSON.stringify(error.message);
        });
    }

    pastEventsFromApex(){
        pastPositions({
            candidateId: this.recordId
        })
        .then((result) => {
            this.pastPositions = [];
            result.forEach((record) => {
                let pastEvent = {
                    Name : record.Position__r.Position_Name__c,
                    detailsPage : "https://" + window.location.host + "/" + record.Position__c,
                    PSMANG : record.Position__r.HR_Manager__r.Name,
                    StartDateTime : record.Position__r.Start_Date_Time__c,
                    Location : (record.Position__r.Location_HR__c ? record.Position__r.Location_HR__r.Name : "This is a Remote Position")
                }

                this.pastPositions.push(pastEvent);
            });
            
            this.errors = undefined;
        })
        .catch((error) => {
            this.pastPositions = undefined;
            this.errors = JSON.stringify(error);
        });
    }
}