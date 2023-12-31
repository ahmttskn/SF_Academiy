import { LightningElement, track } from 'lwc';

import upcomingPositions from "@salesforce/apex/PositionDetailsService.upcomingPositions";
import searchByKeyword from "@salesforce/apex/PositionDetailsService.searchByKeyword";

const COLUMNS = [
    {
        label: "View",
        fieldName: "detailsPage",
        type: "url",
        wrapText: "true",
        typeAttributes: {
            label: {
                fieldName: "Position_Name__c"
            },
            target: "_self"
        }
    },
    {
        label: "Name",
        fieldName: "Position_Name__c",
        wrapText: "true",
        cellAttributes: {
            iconName: "standard:event",
            iconPosition: "left"
        }
    },
    {
        label: "HR Manager",
        fieldName: "manager",
        wrapText: "true",
        cellAttributes: {
            iconName: "standard:user",
            iconPosition: "left"
        }
    },
    {
        label: "Position Type",
        fieldName: "Position_Type__c",
        wrapText: "true",
        type: "text",
        cellAttributes: {
            iconName: "custom:custom112",
            iconPosition: "left"
        }
    },
    {
        label: "Location",
        fieldName: "Location",
        wrapText: "true",
        type: "text",
        cellAttributes: {
            iconName: "utility:location",
            iconPosition: "left"
        }
    },

];
export default class HR_UpcomingPositionList extends LightningElement {

    columnsList = COLUMNS;
    error;

    startDateTime;

    @track result;
    @track recordsToDisplay;

    connectedCallback() {
        this.upcomingEventsFromApex();
    }

    upcomingEventsFromApex() {
        upcomingPositions()
        .then((data) => {
            console.log("data:" + JSON.stringify(data));

            data.forEach((record) => {
                record.detailsPage = "https://" + window.location.host + "/" + record.Id;
                record.manager = record.HR_Manager__r.Name;

                if (record.Location_HR__c) {
                    record.Location = record.Location_HR__r.Name;
                } else {
                    record.Location = "This is Virtual Interview";
                }
            });

            this.result = data;
            this.recordsToDisplay = data;
            this.error = undefined;
        })
        .catch((err) => {
            console.log('ERR:' + JSON.stringify(err));
            this.error = JSON.stringify(err);
            this.result = undefined;
        });
    }

    handleSearch(event) {
        let keyword = event.detail.value;
        console.log(keyword);
        searchByKeyword({
            name : keyword
        })
        .then((data) => {
            console.log("Apexten dönen data:" + JSON.stringify(data));

            data.forEach((record) => {
                record.detailsPage = "https://" + window.location.host + "/" + record.Id;
                record.manager = record.HR_Manager__r.Name;
                record.Location = record.Location_HR__c ? record.Location_HR__r.Name : "This is Virtual Interview";
            });

            this.result = data;
            this.recordsToDisplay = data;
            this.error = undefined;
        })
        .catch((err) => {
            console.log('ERR:' + JSON.stringify(err));
            this.error = JSON.stringify(err);
            this.result = undefined;
        });
    }

    handleStartDate(event) {
        let valuedatetime = event.target.value;
        console.log("selectedDate:" + valuedatetime);
        
        let filteredEvents = this.result.filter((record, index, arrayobject) => {
            return record.Start_Date_Time__c >= valuedatetime;
        });

        this.recordsToDisplay = filteredEvents;
    }

    handleLocationSearch(event) {
        let keyword = event.detail.value;

        let filteredEvents = this.result.filter((record, index, arrayobject) => {
            return record.Location.toLowerCase().includes(keyword.toLowerCase());
        });

        if(keyword && keyword.length >= 2) {
            this.recordsToDisplay = filteredEvents;
        } else {
            this.recordsToDisplay = this.result;
        }
    }
}