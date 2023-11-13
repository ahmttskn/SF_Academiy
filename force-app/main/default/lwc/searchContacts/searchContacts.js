import { LightningElement } from 'lwc';
import searchContacts from '@salesforce/apex/ContactCtrl.searchContacts';

export default class SearchContacts extends LightningElement {
    input;
    error;
    contacts;
    recordId;
    showDetail = false;

    searchHandler(event) {
        this.input = event.target.value;
        if(this.input.length > 0) {
            searchContacts({searchKey: this.input})
                .then(result => {
                    console.log(result);
                    this.contacts = result;
                })
                .catch(error => {
                    console.error(error);
                    this.error = error;
                })
        }
    }

    selectHandler(event) {
        this.recordId = event.detail;
        console.log("record id at destination: " + this.recordId);
        this.showDetail = true;
    }

    closeHandler() {
        this.showDetail = false;
    }
}