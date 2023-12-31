import { LightningElement, api, track, wire } from 'lwc';

import { getRecord } from "lightning/uiRecordApi";
import { NavigationMixin } from "lightning/navigation";
import { encodeDefaultFieldValues } from "lightning/pageReferenceUtils";

import getInterviewers from "@salesforce/apex/PositionDetailsController.getInterviewers";
import getLocationDetails from "@salesforce/apex/PositionDetailsController.getLocationDetails";
import getCandidates from "@salesforce/apex/PositionDetailsController.getCandidates";

import id from "@salesforce/user/Id";
import profile from "@salesforce/schema/User.Profile.Name";

const COLUMNS = [
    {
        label: "Name",
        fieldName: "Name",
        cellAttributes: {
            iconName: "standard:user",
            iconPosition: "left"
        }
    },
    {
        label: "Email",
        fieldName: "Email",
        type: "email"
    },
    {
        label: "Current Company Name",
        fieldName: "CompanyName"
    },
    {
        label: "Location",
        fieldName: "Location",
        cellAttributes: {
            iconName: "utility:location",
            iconPosition: "left"
        }
    }
];

export default class HR_PositionDetails extends NavigationMixin(LightningElement) {

    @api recordId;

    @track interviewerList;
    @track candidateList;
    @track PositionRec;
    @track isAdmin = false;

    errors;
    userId = id;

    columnsList = COLUMNS;

    @wire(getRecord, { recordId: '$userId', fields: [profile] })
    wiredMethod({ error, data }) {
        if(data){
            let userProfileName = data.fields.Profile.displayValue;
            this.isAdmin = userProfileName === "System Administrator";
        }

        if(error){
            console.log("Error Occurred ", JSON.stringify(error));
        }
    }

    createInterviewer(){
        const defaultValues = encodeDefaultFieldValues({
            Position__c: this.recordId
        });
        console.log('createInterviewer ', defaultValues);
        this[NavigationMixin.Navigate]({
            type: "standard__objectPage",
            attributes: {
                objectApiName: "Position_Interviewer__c",
                actionName: "new"
            },
            state: {
                //gelen ekranı doldurur
                defaultFieldValues: defaultValues
            }
        });
    }

    handleInterviewerActive(){
        getInterviewers({
            positionId: this.recordId
        })
        .then((result) => {
            console.log(result);
            result.forEach((interviewerRecieved) => {
                interviewerRecieved.Name = interviewerRecieved.Interviewer__r.Name;
                interviewerRecieved.Email = "*********@gmail.com";
                interviewerRecieved.Phone = interviewerRecieved.Interviewer__r.Phone__c;
                interviewerRecieved.Picture__c = interviewerRecieved.Interviewer__r.Picture__c;
                interviewerRecieved.About_Me__c = interviewerRecieved.Interviewer__r.About_Me__c;
                interviewerRecieved.CompanyName = interviewerRecieved.Interviewer__r.Company__c;
            });
        
            this.interviewerList = result;

            this.errors = undefined;
        })
        .catch((err) => {
            this.errors = err;
            this.interviewerList = undefined;
            window.console.log("ERR:", this.errors);
        });
    }

    handleLocatioDetails(){
        getLocationDetails({
            positionId: this.recordId
        })
        .then((result) => {
            if(result.Location_HR__c){
                this.PositionRec = result;
            } else {
                this.PositionRec = undefined;
            }

            this.errors = undefined;
        })
        .catch((err) => {
            this.errors = err;
            this.interviewerList = undefined;
        });
    }

    handlePositionCandidate(){
        getCandidates({
            positionId: this.recordId
        })
        .then((result) => {
            result.forEach((att) => {
                att.Name = att.Candidate__r.Name;
                att.Email = "*********@gmail.com";
                att.CompanyName = att.Candidate__r.Current_Company_Name__c;

                if (att.Candidate__r.Location_HR__c) {
                    att.Location = att.Candidate__r.Location_HR__r.Name;
                } else {
                    att.Location = "Preferred Not to Say";
                }
            });

            this.candidateList = result;
            this.errors = undefined;
        })
        .catch((err) => {
            this.errors = err;
            this.interviewerList = undefined;
        });
    }

    createCandidate(){
        const defaultValues = encodeDefaultFieldValues({
            Position__c: this.recordId
        });
        console.log('createCandidate ', defaultValues);
        this[NavigationMixin.Navigate]({
            type: "standard__objectPage",
            attributes: {
                objectApiName: "Position_Candidate__c",
                actionName: "new"
            },
            state: {
                defaultFieldValues: defaultValues
            }
        });
    }

}