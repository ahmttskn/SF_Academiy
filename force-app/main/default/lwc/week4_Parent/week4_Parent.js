import { LightningElement, api, track } from 'lwc';
import searchContacts from '@salesforce/apex/ContactCtrl.searchContacts';

export default class Week4_Parent extends LightningElement {

    @track searchKey;
    @track contacts;
    @track error;
    recordId;
    showDetail =false;

    changeHandle(event){
        this.searchKey = event.target.value;
        if (this.searchKey.length > 0) {
            searchContacts({searchKey: this.searchKey /* '$searchValue'*/})
            .then(result => {
                if (result.length > 0) {
                    this.contacts = result;
                    this.error = undefined;
                } else {
                    this.contacts = undefined;
                    this.error = 'try another keyword';
                }
                console.error('this.contacts', result);
            })
            .catch(error => {
                this.error = error.body.message;
                this.contacts = undefined;
            })
        } else {
            this.contacts = undefined;
            this.error = 'Key should be at leats 3 characters';;
        }
    }

    selectHandler(event){
        this.recordId = event.detail;
        console.error("record id at destination: " + JSON.stringify(this.recordId));
        this.showDetail = true;
    }
    closeHandler() {
        this.showDetail = false;
    }
}